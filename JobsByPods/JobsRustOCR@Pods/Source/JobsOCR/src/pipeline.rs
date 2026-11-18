use crate::{
    Line, OcrResult, Options,
    pixels::Gray,
    routing::{self, Emission},
    runtime::{Model, Result},
};
use serde_json::Value;
use std::{
    collections::{HashMap, VecDeque},
    path::Path,
    sync::atomic::{AtomicU64, Ordering},
    time::Instant,
};
use unicode_normalization::UnicodeNormalization;

pub static CANCEL_GENERATION: AtomicU64 = AtomicU64::new(0);

struct LineInput<'a> {
    gray: &'a Gray,
    bbox: [f32; 4],
    band: &'a [f32],
    width: usize,
    height: usize,
    window: usize,
}

struct Candidate {
    line: Line,
    emissions: Vec<Emission>,
    uncertain: Vec<(usize, usize)>,
}

pub struct Engine {
    detector: Model,
    orientation: Option<Model>,
    classifier: Option<Model>,
    pub order: Option<Model>,
    recognizers: HashMap<String, Model>,
    vocabularies: HashMap<String, Vec<String>>,
    pub language_models: HashMap<String, crate::lm::NgramLM>,
    metadata: Value,
}

impl Engine {
    pub fn load(folder: &Path) -> Result<Self> {
        let metadata: Value = serde_json::from_slice(
            &std::fs::read(folder.join("meta.json")).map_err(|e| e.to_string())?,
        )
        .map_err(|e| e.to_string())?;
        let mut recognizers = HashMap::new();
        let mut vocabularies = HashMap::new();
        let mut language_models = HashMap::new();
        for group in ["base", "cjk", "rtl", "world"] {
            let file = if group == "base" {
                "rec.onnx".to_string()
            } else {
                format!("rec_{group}.onnx")
            };
            if !folder.join(&file).exists() {
                continue;
            }
            recognizers.insert(group.into(), Model::load(&folder.join(file))?);
            let key = if group == "base" {
                "vocab".to_string()
            } else {
                format!("vocab_{group}")
            };
            let value = &metadata[&key];
            let vocab: Value = if let Some(s) = value.as_str() {
                serde_json::from_str(s).map_err(|e| e.to_string())?
            } else {
                value.clone()
            };
            let chars = vocab["chars"]
                .as_array()
                .ok_or_else(|| format!("Missing vocabulary {key}"))?
                .iter()
                .map(|v| v.as_str().unwrap_or("").to_string())
                .collect();
            vocabularies.insert(group.into(), chars);
            let lm_name = if group == "base" {
                "lm.npz".to_string()
            } else {
                format!("lm_{group}.npz")
            };
            if folder.join(&lm_name).exists() {
                language_models.insert(
                    group.into(),
                    crate::lm::NgramLM::load(&folder.join(lm_name))?,
                );
            }
        }
        if !recognizers.contains_key("base") {
            return Err("Missing rec.onnx".into());
        }
        let optional = |name: &str| -> Result<Option<Model>> {
            let path = folder.join(name);
            if path.exists() {
                Ok(Some(Model::load(&path)?))
            } else {
                Ok(None)
            }
        };
        Ok(Self {
            detector: Model::load(&folder.join("det.onnx"))?,
            orientation: optional("orient.onnx")?,
            classifier: optional("script.onnx")?,
            order: optional("order.onnx")?,
            recognizers,
            vocabularies,
            language_models,
            metadata,
        })
    }

    fn check_cancel(generation: u64) -> Result<()> {
        if CANCEL_GENERATION.load(Ordering::Relaxed) != generation {
            Err("Recognition cancelled".into())
        } else {
            Ok(())
        }
    }

    pub fn recognize(&mut self, source: Gray, options: Options) -> Result<OcrResult> {
        let started = Instant::now();
        let generation = CANCEL_GENERATION.load(Ordering::Relaxed);
        let (original_w, original_h) = (source.width, source.height);
        let initial = source.thumbnail(options.max_side.clamp(512, 4096));
        let (initial_w, initial_h) = (initial.width, initial.height);
        let mut angle = if options.deskew {
            estimate_skew(&initial)
        } else {
            0.0
        };
        let preview = if angle.abs() >= 0.3 {
            initial.rotated(angle)
        } else {
            initial.clone()
        };
        let mut turn = 0;
        if options.orientation {
            if let Some(model) = &mut self.orientation {
                let out = model.float(vec![1, 1, 768, 768], preview.ink_square(768))?;
                if let Some((i, p)) = out[0]
                    .values
                    .iter()
                    .enumerate()
                    .max_by(|a, b| a.1.total_cmp(b.1))
                {
                    if *p > 0.95 {
                        turn = i;
                    }
                }
            }
        }
        let vertical = turn == 4;
        let quarters = if vertical { 3 } else { turn };
        let mut gray = initial.rotate_quarters(quarters);
        if quarters % 2 == 1 && options.deskew {
            angle = estimate_skew(&gray);
        }
        if angle.abs() >= 0.3 {
            gray = gray.rotated(angle);
        } else {
            angle = 0.0;
        }
        Self::check_cancel(generation)?;
        let det_side = self.metadata["det_long_side"].as_u64().unwrap_or(1024) as usize;
        let mut boxes = self.detect(&gray, det_side)?;
        if boxes.len() >= 8 {
            let mut heights: Vec<f32> = boxes.iter().map(|b| b[3] - b[1]).collect();
            heights.sort_by(f32::total_cmp);
            let median =
                heights[heights.len() / 2] * det_side as f32 / gray.width.max(gray.height) as f32;
            if median < 9.0 {
                let enlarged =
                    ((det_side as f32 * 12.0 / median.max(1.0)).min(2048.0) as usize) / 32 * 32;
                if enlarged > det_side {
                    boxes = self.detect(&gray, enlarged)?;
                }
            }
        }
        if boxes.len() > options.max_lines {
            return Err(format!(
                "Detected {} lines; limit is {}",
                boxes.len(),
                options.max_lines
            ));
        }
        let height = self.metadata["rec_height"].as_u64().unwrap_or(32) as usize;
        let window = self.metadata["rec_window"].as_u64().unwrap_or(1) as usize;
        let groups: Vec<String> = self.metadata["script_groups"]
            .as_array()
            .map(|v| {
                v.iter()
                    .map(|s| s.as_str().unwrap_or("base").into())
                    .collect()
            })
            .unwrap_or_else(|| vec!["base".into(), "cjk".into(), "rtl".into(), "world".into()]);
        let mut lines = Vec::new();
        for bbox in boxes {
            Self::check_cancel(generation)?;
            let (width, band) = gray.crop_line(bbox, height, 1);
            let padded = width.max(32).div_ceil(8) * 8;
            let mut candidates = vec!["base".to_string()];
            if vertical && self.recognizers.contains_key("cjk") {
                candidates = vec!["cjk".into()];
            } else if let Some(script) = &mut self.classifier {
                let probabilities =
                    script.classify(vec![1, 1, height, padded], band.clone(), width as i64)?;
                if let Some((index, probability)) = probabilities
                    .iter()
                    .enumerate()
                    .max_by(|a, b| a.1.total_cmp(b.1))
                {
                    let selected = groups.get(index).map(String::as_str).unwrap_or("base");
                    if self.recognizers.contains_key(selected) {
                        if *probability > 0.95 {
                            candidates = vec![selected.into()];
                        } else if selected != "base" {
                            candidates.push(selected.into());
                        }
                    }
                }
            }
            let input = LineInput {
                gray: &gray,
                bbox,
                band: &band,
                width,
                height,
                window,
            };
            let mut recognized = Vec::new();
            for group in candidates {
                Self::check_cancel(generation)?;
                recognized.push(self.recognize_candidate(&input, &group, &options)?);
            }
            let mut best = recognized
                .iter()
                .enumerate()
                .max_by(|a, b| a.1.line.confidence.total_cmp(&b.1.line.confidence))
                .map(|(i, _)| i)
                .ok_or("No recognition candidate")?;
            if recognized[best].line.script == "base"
                && self.recognizers.contains_key("cjk")
                && self.classifier.is_some()
            {
                let missing = routing::missing_regions(
                    &band,
                    width,
                    height,
                    padded,
                    &recognized[best].emissions,
                );
                let mut probes: Vec<_> = missing.into_iter().map(|r| (r, false)).collect();
                for &region in &recognized[best].uncertain {
                    if !probes
                        .iter()
                        .any(|&(r, _)| r.0 < region.1 && region.0 < r.1)
                    {
                        probes.push((region, true));
                    }
                }
                probes.truncate(3);
                let mut cjk_regions = Vec::new();
                for (region, uncertain) in probes {
                    Self::check_cancel(generation)?;
                    let (probe_width, probe) =
                        routing::crop_probe(&band, width, height, padded, region);
                    if probe_width == 0 {
                        continue;
                    }
                    let probe_padded = probe_width.max(32).div_ceil(8) * 8;
                    let probabilities = self.classifier.as_mut().unwrap().classify(
                        vec![1, 1, height, probe_padded],
                        probe,
                        probe_width as i64,
                    )?;
                    let probability = groups
                        .iter()
                        .position(|g| g == "cjk")
                        .and_then(|i| probabilities.get(i))
                        .copied()
                        .unwrap_or(0.0);
                    if probability >= 0.98 {
                        cjk_regions.push((region, uncertain, probability));
                    }
                }
                if !cjk_regions.is_empty() {
                    Self::check_cancel(generation)?;
                    let alternate = match recognized.iter().position(|c| c.line.script == "cjk") {
                        Some(i) => i,
                        None => {
                            recognized.push(self.recognize_candidate(&input, "cjk", &options)?);
                            recognized.len() - 1
                        }
                    };
                    let base = &recognized[best];
                    let cjk = &recognized[alternate];
                    // Average token confidence cannot penalize a silently omitted prefix.
                    // Require local script evidence plus recovered ink or a stronger uncertain span.
                    if cjk.line.confidence >= options.min_confidence.max(0.80)
                        && cjk.line.confidence >= base.line.confidence - 0.10
                        && cjk.line.text.chars().any(routing::is_cjk)
                        && cjk_regions.iter().any(|&(region, uncertain, probability)| {
                            let coverage = routing::coverage(
                                &band,
                                width,
                                height,
                                padded,
                                &cjk.emissions,
                                region,
                            );
                            let previous = routing::coverage(
                                &band,
                                width,
                                height,
                                padded,
                                &base.emissions,
                                region,
                            );
                            let replaces_uncertain = uncertain
                                && probability >= 0.995
                                && cjk.line.confidence >= base.line.confidence;
                            cjk.emissions
                                .iter()
                                .any(|e| e.cjk && e.x >= region.0 as f32 && e.x < region.1 as f32)
                                && coverage >= 0.70
                                && (coverage >= previous + 0.25 || replaces_uncertain)
                        })
                    {
                        best = alternate;
                    }
                }
            }
            lines.push(recognized.swap_remove(best).line);
        }
        Self::check_cancel(generation)?;
        let (mut lines, mut blocks, markdown) =
            crate::layout::arrange(lines, gray.width, gray.height, self.order.as_mut())?;
        let transform = |bbox: [f32; 4]| {
            map_box(
                bbox,
                angle,
                quarters,
                gray.width,
                gray.height,
                initial_w,
                initial_h,
                original_w,
                original_h,
            )
        };
        for line in &mut lines {
            line.bbox = transform(line.bbox);
        }
        for block in &mut blocks {
            block.bbox = transform(block.bbox);
        }
        let text = lines
            .iter()
            .filter(|l| !l.text.is_empty())
            .map(|l| l.text.as_str())
            .collect::<Vec<_>>()
            .join("\n");
        Ok(OcrResult {
            ok: true,
            engine: "jobs-rust-ocr/indra".into(),
            version: crate::VERSION.into(),
            text,
            markdown,
            lines,
            blocks,
            width: original_w,
            height: original_h,
            rotation: (quarters * 90) % 360,
            skew: angle,
            elapsed_ms: started.elapsed().as_secs_f64() * 1000.0,
            notes: vec![
                "Image OCR; PDF text-layer and optional math are not enabled in this build".into(),
            ],
        })
    }

    fn recognize_candidate(
        &mut self,
        input: &LineInput<'_>,
        group: &str,
        options: &Options,
    ) -> Result<Candidate> {
        let (rec_width, values) = if group == "base" && input.window > 1 {
            input.gray.crop_line(input.bbox, input.height, input.window)
        } else {
            (input.width, input.band.to_vec())
        };
        let rec_padded = rec_width.max(32).div_ceil(8) * 8;
        let rec_height = input.height * if group == "base" { input.window } else { 1 };
        let prediction = self
            .recognizers
            .get_mut(group)
            .ok_or("Missing recognizer")?
            .recognize(vec![1, 1, rec_height, rec_padded], values, rec_width as i64)?;
        let vocab = &self.vocabularies[group];
        let (mut ids, mut confidence) = (Vec::new(), 0.0);
        let mut previous = -1;
        let mut positions = Vec::new();
        let mut uncertain = Vec::new();
        for (step, (id, p)) in prediction
            .ids
            .iter()
            .zip(&prediction.confidence)
            .enumerate()
        {
            if *id != 0 && *id != previous {
                ids.push(*id);
                positions.push(step);
                confidence += p;
                if let Some(token) = id.checked_sub(1).and_then(|i| vocab.get(i as usize)) {
                    if !token.trim().is_empty() {
                        let x = (step as f32 + 0.5) * rec_padded as f32
                            / prediction.timesteps.max(1) as f32
                            * input.width as f32
                            / rec_width as f32;
                        if *p < 0.80 {
                            let radius = input.height as f32;
                            let region = (
                                (x - radius).max(0.0) as usize,
                                ((x + radius).ceil() as usize).min(input.width),
                            );
                            uncertain.push((*p, region));
                        }
                    }
                }
            }
            previous = *id;
        }
        confidence /= ids.len().max(1) as f32;
        if options.language_model && confidence >= 0.5 {
            if let Some(lm) = self.language_models.get(group) {
                let params = &self.metadata["lm_params"][group];
                let gate = params["gate"].as_f64().unwrap_or(0.9);
                if (confidence as f64) < gate {
                    if let (Some(blank), Some(topv), Some(topi)) = (
                        prediction.extra.get("blank"),
                        prediction.extra.get("topv"),
                        prediction.top_indices.as_ref(),
                    ) {
                        let steps = prediction.ids.len();
                        let k = *topv.shape.last().unwrap_or(&0);
                        (ids, positions) = crate::lm::beam_search(
                            &blank.values[..steps],
                            &topv.values[..steps * k],
                            &topi[..steps * k],
                            steps,
                            k,
                            lm,
                            params["alpha"].as_f64().unwrap_or(0.5),
                            params["beta"].as_f64().unwrap_or(1.5),
                            8,
                            0.003,
                        )?;
                    }
                }
            }
        }
        let text: String = ids
            .iter()
            .filter_map(|id| id.checked_sub(1).and_then(|i| vocab.get(i as usize)))
            .cloned()
            .collect();
        // Use the selected decoding's alignment, including LM insertions/substitutions.
        let scale = rec_padded as f32 / prediction.timesteps.max(1) as f32 * input.width as f32
            / rec_width as f32;
        let emissions = ids
            .iter()
            .zip(&positions)
            .filter_map(|(id, step)| {
                let token = id.checked_sub(1).and_then(|i| vocab.get(i as usize))?;
                (!token.trim().is_empty()).then_some(Emission {
                    x: (*step as f32 + 0.5) * scale,
                    cjk: token.chars().any(routing::is_cjk),
                })
            })
            .collect();
        Ok(Candidate {
            line: Line {
                text: if confidence >= options.min_confidence {
                    text.nfc().collect()
                } else {
                    String::new()
                },
                bbox: input.bbox,
                confidence,
                script: group.into(),
            },
            emissions,
            uncertain: {
                uncertain.sort_by(|a, b| a.0.total_cmp(&b.0));
                uncertain
                    .into_iter()
                    .take(3)
                    .map(|(_, region)| region)
                    .collect()
            },
        })
    }

    fn detect(&mut self, gray: &Gray, side: usize) -> Result<Vec<[f32; 4]>> {
        let (shape, input, scale) = gray.detector_input(side);
        let out = self.detector.float(shape, input)?;
        let tensor = out.first().ok_or("Detector returned no tensors")?;
        let (h, w) = (
            *tensor
                .shape
                .get(tensor.shape.len().saturating_sub(2))
                .ok_or("Bad detector shape")?,
            *tensor.shape.last().ok_or("Bad detector shape")?,
        );
        let size = h * w;
        if tensor.values.len() < size * 3 {
            return Err("Detector requires three channels".into());
        }
        let mut visited = vec![false; size];
        let mut boxes = Vec::new();
        for origin in 0..size {
            if visited[origin] || tensor.values[origin] <= 0.0 {
                continue;
            }
            let mut queue = VecDeque::from([origin]);
            visited[origin] = true;
            let (mut count, mut min_x, mut max_x, mut sum_top, mut sum_bottom) =
                (0, w, 0, 0.0, 0.0);
            while let Some(i) = queue.pop_front() {
                let (x, y) = (i % w, i / w);
                count += 1;
                min_x = min_x.min(x);
                max_x = max_x.max(x);
                let centre = (y as f32 + 0.5) * 2.0;
                sum_top += centre - tensor.values[size + i];
                sum_bottom += centre + tensor.values[size * 2 + i];
                let neighbours = [
                    if x > 0 { Some(i - 1) } else { None },
                    if x + 1 < w { Some(i + 1) } else { None },
                    if y > 0 { Some(i - w) } else { None },
                    if y + 1 < h { Some(i + w) } else { None },
                ];
                for next in neighbours.into_iter().flatten() {
                    if !visited[next] && tensor.values[next] > 0.0 {
                        visited[next] = true;
                        queue.push_back(next);
                    }
                }
            }
            if count < 2 {
                continue;
            }
            let (y0, y1) = (sum_top / count as f32, sum_bottom / count as f32);
            let expand = 0.15 * (y1 - y0).max(1.0);
            boxes.push([
                ((min_x as f32 * 2.0 - expand) / scale).clamp(0.0, gray.width as f32),
                (y0 / scale).clamp(0.0, gray.height as f32),
                (((max_x + 1) as f32 * 2.0 + expand) / scale).clamp(0.0, gray.width as f32),
                (y1 / scale).clamp(0.0, gray.height as f32),
            ]);
        }
        Ok(boxes)
    }
}

fn estimate_skew(gray: &Gray) -> f64 {
    let fine = gray.thumbnail(600);
    let coarse = fine.thumbnail(300);
    if fine.pixels.iter().map(|p| 255.0 - *p as f64).sum::<f64>() / (fine.pixels.len() as f64)
        < 0.765
    {
        return 0.0;
    }
    let score = |img: &Gray, a: f64| {
        let rotated = img.rotated(a);
        let sums: Vec<f64> = rotated
            .pixels
            .chunks(img.width)
            .map(|r| r.iter().map(|p| 255.0 - *p as f64).sum())
            .collect();
        sums.windows(2).map(|p| (p[1] - p[0]).powi(2)).sum::<f64>()
    };
    let mut candidates: Vec<(f64, f64)> = (-22..=22)
        .map(|i| {
            let a = i as f64 * 2.0;
            (a, score(&coarse, a))
        })
        .collect();
    candidates.sort_by(|a, b| b.1.total_cmp(&a.1));
    let mut best = (0.0, score(&fine, 0.0));
    for start in [0.0, candidates[0].0, candidates[1].0] {
        for i in -4..=4 {
            let a = start + i as f64 * 0.5;
            let s = score(&fine, a);
            if s > best.1 {
                best = (a, s);
            }
        }
    }
    let centre = best.0;
    for i in -5..=5 {
        let a = centre + i as f64 * 0.1;
        let s = score(&fine, a);
        if s > best.1 {
            best = (a, s);
        }
    }
    best.0
}

#[allow(clippy::too_many_arguments)]
fn map_box(
    b: [f32; 4],
    angle: f64,
    turn: usize,
    w: usize,
    h: usize,
    iw: usize,
    ih: usize,
    ow: usize,
    oh: usize,
) -> [f32; 4] {
    let mut result = [
        f32::INFINITY,
        f32::INFINITY,
        f32::NEG_INFINITY,
        f32::NEG_INFINITY,
    ];
    let (sin, cos) = angle.to_radians().sin_cos();
    for (x, y) in [(b[0], b[1]), (b[2], b[1]), (b[0], b[3]), (b[2], b[3])] {
        let (dx, dy) = (x as f64 - w as f64 / 2.0, y as f64 - h as f64 / 2.0);
        let (x, y) = (
            cos * dx - sin * dy + w as f64 / 2.0,
            sin * dx + cos * dy + h as f64 / 2.0,
        );
        let (x, y) = match turn % 4 {
            1 => (y, ih as f64 - x),
            2 => (iw as f64 - x, ih as f64 - y),
            3 => (iw as f64 - y, x),
            _ => (x, y),
        };
        let (x, y) = (
            (x * ow as f64 / iw as f64).clamp(0.0, ow as f64) as f32,
            (y * oh as f64 / ih as f64).clamp(0.0, oh as f64) as f32,
        );
        result[0] = result[0].min(x);
        result[1] = result[1].min(y);
        result[2] = result[2].max(x);
        result[3] = result[3].max(y);
    }
    result
}
