//! Ink coverage checks for recognizers which silently omit part of a text line.

#[derive(Clone, Copy, Debug)]
pub(crate) struct Emission {
    /// Character centre in the unpadded, single-band input coordinate system.
    pub x: f32,
    /// The emitted character is Han, kana or Hangul, independently of model name.
    pub cjk: bool,
}

const MAX_REGIONS: usize = 3;

fn valid_shape(band: &[f32], width: usize, height: usize, stride: usize) -> bool {
    width > 0
        && width <= 4096
        && height > 0
        && height <= 512
        && stride >= width
        && (height - 1)
            .checked_mul(stride)
            .and_then(|v| v.checked_add(width))
            .is_some_and(|n| n <= band.len())
}

fn ink(value: f32) -> f32 {
    if value.is_finite() {
        value.clamp(0.0, 1.0)
    } else {
        0.0
    }
}

fn line_height(height: usize) -> f32 {
    // Gray::crop_line adds 0.2 line heights above and below the ink box.
    height as f32 / 1.4
}

fn covered_columns(width: usize, height: usize, emissions: &[Emission]) -> Vec<bool> {
    let mut covered = vec![false; width];
    let h = line_height(height);
    for emission in emissions {
        if !emission.x.is_finite() {
            continue;
        }
        let radius = h * if emission.cjk { 0.55 } else { 0.50 };
        let start = (emission.x - radius).floor().clamp(0.0, width as f32) as usize;
        let end = (emission.x + radius).ceil().clamp(0.0, width as f32) as usize;
        covered[start..end].fill(true);
    }
    covered
}

fn significant_region(
    band: &[f32],
    height: usize,
    stride: usize,
    region: (usize, usize),
) -> Option<f32> {
    let h = line_height(height);
    if ((region.1 - region.0) as f32) < (h * 0.55).max(3.0) {
        return None;
    }
    let mut rows = vec![0.0_f32; height];
    for y in 0..height {
        for x in region.0..region.1 {
            rows[y] += ink(band[y * stride + x]);
        }
    }
    let total: f32 = rows.iter().sum();
    if total < h * h * 0.10 {
        return None;
    }
    let first = rows.iter().position(|&mass| mass > 0.2)?;
    let last = rows.iter().rposition(|&mass| mass > 0.2)?;
    if ((last + 1 - first) as f32) < (h * 0.30).max(4.0) {
        return None;
    }
    let (mut highest, mut second) = (0.0_f32, 0.0_f32);
    for mass in rows {
        if mass >= highest {
            second = highest;
            highest = mass;
        } else if mass > second {
            second = mass;
        }
    }
    // A horizontal rule is concentrated in one or two rows, unlike text strokes.
    if highest + second > total * 0.80 {
        return None;
    }
    Some(total)
}

/// Significant uncovered ink spans, [start, end), in unpadded band pixels.
/// This diagnoses omissions; it cannot detect confidently hallucinated characters.
pub(crate) fn missing_regions(
    band: &[f32],
    width: usize,
    height: usize,
    stride: usize,
    emissions: &[Emission],
) -> Vec<(usize, usize)> {
    if !valid_shape(band, width, height, stride) {
        return Vec::new();
    }
    let covered = covered_columns(width, height, emissions);
    let mut visible = vec![false; width];
    for (x, active) in visible.iter_mut().enumerate() {
        let count = (0..height)
            .filter(|&y| ink(band[y * stride + x]) > 0.2)
            .count();
        *active = count >= 2 && !covered[x];
    }
    let max_gap = (line_height(height) * 0.50).round().max(1.0) as usize;
    let mut candidates = Vec::new();
    let mut x = 0;
    while x < width {
        if !visible[x] {
            x += 1;
            continue;
        }
        let start = x;
        let mut last = x;
        x += 1;
        while x < width && !covered[x] {
            if visible[x] {
                last = x;
            } else if x - last > max_gap {
                break;
            }
            x += 1;
        }
        let region = (start, last + 1);
        if let Some(mass) = significant_region(band, height, stride, region) {
            candidates.push((region, mass));
        }
    }
    candidates.sort_by(|a, b| b.1.total_cmp(&a.1).then_with(|| a.0.0.cmp(&b.0.0)));
    candidates.truncate(MAX_REGIONS);
    candidates.sort_by_key(|item| item.0.0);
    candidates.into_iter().map(|item| item.0).collect()
}

/// Fraction of region ink covered by emitted character envelopes, in [0, 1].
/// Empty paper scores 1; malformed shapes or empty regions score 0.
pub(crate) fn coverage(
    band: &[f32],
    width: usize,
    height: usize,
    stride: usize,
    emissions: &[Emission],
    region: (usize, usize),
) -> f32 {
    if !valid_shape(band, width, height, stride) {
        return 0.0;
    }
    let (start, end) = (region.0.min(width), region.1.min(width));
    if start >= end {
        return 0.0;
    }
    let covered = covered_columns(width, height, emissions);
    let (mut explained, mut total) = (0.0_f32, 0.0_f32);
    for y in 0..height {
        for x in start..end {
            let value = ink(band[y * stride + x]);
            total += value;
            if covered[x] {
                explained += value;
            }
        }
    }
    if total > 0.0 {
        (explained / total).clamp(0.0, 1.0)
    } else {
        1.0
    }
}

/// Add 0.3 line heights of local context, retaining height and normal right padding.
pub(crate) fn crop_probe(
    band: &[f32],
    width: usize,
    height: usize,
    stride: usize,
    region: (usize, usize),
) -> (usize, Vec<f32>) {
    if !valid_shape(band, width, height, stride) || region.0 >= region.1 {
        return (0, Vec::new());
    }
    let margin = (line_height(height) * 0.3).ceil() as usize;
    let start = region.0.min(width).saturating_sub(margin);
    let end = region.1.min(width).saturating_add(margin).min(width);
    if start >= end {
        return (0, Vec::new());
    }
    let probe_width = end - start;
    let padded = probe_width.max(32).div_ceil(8) * 8;
    let mut out = vec![0.0; padded * height];
    for y in 0..height {
        out[y * padded..y * padded + probe_width]
            .copy_from_slice(&band[y * stride + start..y * stride + end]);
    }
    (probe_width, out)
}

pub(crate) fn is_cjk(c: char) -> bool {
    matches!(c as u32,
        0x1100..=0x11ff | 0x2e80..=0x2eff | 0x2f00..=0x2fdf |
        0x3005 | 0x3007 | 0x303b | 0x3040..=0x30ff | 0x3130..=0x318f |
        0x31f0..=0x31ff | 0x3400..=0x4dbf | 0x4e00..=0x9fff |
        0xa960..=0xa97f | 0xac00..=0xd7ff | 0xf900..=0xfaff |
        0xff66..=0xff9f | 0x1b000..=0x1b16f | 0x20000..=0x2fa1f |
        0x30000..=0x3fffd)
}

#[cfg(test)]
mod tests {
    use super::*;

    const HEIGHT: usize = 32;
    const WIDTH: usize = 280;
    const STRIDE: usize = 288;

    fn band(centres: &[usize]) -> Vec<f32> {
        let mut image = vec![0.0; STRIDE * HEIGHT];
        for &centre in centres {
            // Glyph-like vertical strokes and a crossbar, with real gaps between glyphs.
            for y in 6..26 {
                for x in centre - 7..centre + 7 {
                    if x < centre - 5 || x >= centre + 5 || (15..17).contains(&y) {
                        image[y * STRIDE + x] = 1.0;
                    }
                }
            }
        }
        image
    }

    fn emissions(centres: &[usize]) -> Vec<Emission> {
        centres
            .iter()
            .map(|&x| Emission {
                x: x as f32,
                cjk: false,
            })
            .collect()
    }

    #[test]
    fn finds_unexplained_prefix_and_a_better_candidate_covers_it() {
        let image = band(&[20, 45, 70, 115, 140, 165]);
        let base = emissions(&[115, 140, 165]);
        let regions = missing_regions(&image, WIDTH, HEIGHT, STRIDE, &base);
        assert_eq!(regions.len(), 1);
        assert!(regions[0].0 <= 13 && regions[0].1 >= 77);
        assert_eq!(
            coverage(&image, WIDTH, HEIGHT, STRIDE, &base, regions[0]),
            0.0
        );
        let complete = emissions(&[20, 45, 70, 115, 140, 165]);
        assert!(coverage(&image, WIDTH, HEIGHT, STRIDE, &complete, regions[0]) > 0.99);
    }

    #[test]
    fn finds_unexplained_middle() {
        let image = band(&[20, 45, 70, 95, 120, 145, 170, 195]);
        let regions = missing_regions(
            &image,
            WIDTH,
            HEIGHT,
            STRIDE,
            &emissions(&[20, 45, 170, 195]),
        );
        assert_eq!(regions.len(), 1);
        assert!(regions[0].0 <= 63 && regions[0].1 >= 152);
    }

    #[test]
    fn finds_unexplained_suffix() {
        let image = band(&[20, 45, 70, 115, 140, 165]);
        let regions = missing_regions(&image, WIDTH, HEIGHT, STRIDE, &emissions(&[20, 45, 70]));
        assert_eq!(regions.len(), 1);
        assert!(regions[0].0 <= 108 && regions[0].1 >= 172);
    }

    #[test]
    fn complete_latin_like_emissions_do_not_trigger() {
        let centres = [20, 38, 56, 74, 92, 110, 128, 146];
        let mut image = band(&centres);
        for y in 0..HEIGHT {
            // Right padding must never be treated as visible page ink.
            image[y * STRIDE + WIDTH..(y + 1) * STRIDE].fill(1.0);
        }
        let predicted = emissions(&centres);
        assert!(missing_regions(&image, WIDTH, HEIGHT, STRIDE, &predicted).is_empty());
        assert!(coverage(&image, WIDTH, HEIGHT, STRIDE, &predicted, (0, WIDTH)) > 0.99);
    }

    #[test]
    fn ignores_isolated_noise_and_single_horizontal_rule() {
        let mut image = vec![0.0; HEIGHT * STRIDE];
        for x in 20..260 {
            image[15 * STRIDE + x] = 1.0;
            image[16 * STRIDE + x] = 1.0;
        }
        image[3 * STRIDE + 5] = 1.0;
        image[28 * STRIDE + 270] = 1.0;
        assert!(missing_regions(&image, WIDTH, HEIGHT, STRIDE, &[]).is_empty());
    }

    #[test]
    fn caps_regions_and_preserves_spatial_order() {
        let image = band(&[20, 90, 160, 230]);
        let regions = missing_regions(&image, WIDTH, HEIGHT, STRIDE, &[]);
        assert_eq!(regions.len(), 3);
        assert!(regions.windows(2).all(|pair| pair[0].1 < pair[1].0));
    }

    #[test]
    fn probe_retains_context_height_and_zero_padding() {
        let image = band(&[45, 65]);
        let (width, values) = crop_probe(&image, WIDTH, HEIGHT, STRIDE, (40, 70));
        assert_eq!(width, 44); // Region plus seven pixels of context on each side.
        let padded = width.max(32).div_ceil(8) * 8;
        assert_eq!(values.len(), HEIGHT * padded);
        for y in 0..HEIGHT {
            assert_eq!(
                &values[y * padded..y * padded + width],
                &image[y * STRIDE + 33..y * STRIDE + 77]
            );
            assert!(
                values[y * padded + width..(y + 1) * padded]
                    .iter()
                    .all(|&v| v == 0.0)
            );
        }
    }

    #[test]
    fn malformed_shapes_and_nonfinite_values_are_safe() {
        assert!(missing_regions(&[], 20, HEIGHT, 20, &[]).is_empty());
        assert!(missing_regions(&[], usize::MAX, HEIGHT, usize::MAX, &[]).is_empty());
        assert_eq!(crop_probe(&[], 0, 0, 0, (0, 0)), (0, Vec::new()));
        assert_eq!(coverage(&[], 20, HEIGHT, 20, &[], (0, 20)), 0.0);
        let image = vec![f32::NAN; HEIGHT * STRIDE];
        let invalid = [Emission {
            x: f32::NAN,
            cjk: false,
        }];
        assert!(missing_regions(&image, WIDTH, HEIGHT, STRIDE, &invalid).is_empty());
        assert_eq!(
            coverage(&image, WIDTH, HEIGHT, STRIDE, &invalid, (0, WIDTH)),
            1.0
        );
    }

    #[test]
    fn cjk_character_test_includes_extensions_kana_and_hangul() {
        for c in ['中', '𠮷', '𰀀', 'あ', 'カ', 'ｶ', '한', 'ㄱ', 'ᄀ'] {
            assert!(is_cjk(c), "{c}");
        }
        for c in ['A', 'é', 'ё', '१', '：', '∑'] {
            assert!(!is_cjk(c), "{c}");
        }
    }
}
