//! Bounded-memory n-gram tables and CTC prefix beam search for uncertain lines.
//! Algorithm semantics follow Indra's Apache-2.0 `lm.py`; no Python runtime is used.

use std::collections::HashMap;
use std::fs::File;
use std::io::Read;
use std::path::Path;
use std::sync::Mutex;

const DEFAULT_BITS: u32 = 11;
const TAG_SHIFT: u32 = 61;
const CACHE_CAPACITY: usize = 8_192;
const MAX_ARRAY_BYTES: u64 = 256 * 1024 * 1024;
const MAX_ARCHIVE_BYTES: u64 = 512 * 1024 * 1024;

#[derive(Debug)]
struct Level {
    keys: Vec<u64>,
    values: Vec<f64>,
    history_keys: Vec<u64>,
    backoff: Vec<f64>,
}

/// Keep one copy of each sorted NPZ table instead of Python's additional merged tables.
#[derive(Debug)]
pub struct NgramLM {
    pub order: usize,
    pub vocab_size: usize,
    pub bits: u32,
    levels: Vec<Level>,
    max_logp: f64,
    cache: Mutex<HashMap<u64, f64>>,
}

impl NgramLM {
    pub fn load(path: impl AsRef<Path>) -> Result<Self, String> {
        let file = File::open(path.as_ref()).map_err(|e| format!("open language model: {e}"))?;
        let mut archive = zip::ZipArchive::new(file).map_err(|e| format!("open NPZ: {e}"))?;
        let mut total = 0_u64;
        for i in 0..archive.len() {
            let entry = archive
                .by_index(i)
                .map_err(|e| format!("read NPZ directory: {e}"))?;
            total = total.checked_add(entry.size()).ok_or("NPZ size overflow")?;
            if entry.size() > MAX_ARRAY_BYTES || total > MAX_ARCHIVE_BYTES {
                return Err("language model exceeds the supported memory budget".into());
            }
        }
        let order = scalar(&mut archive, "order")?;
        let vocab_size = scalar(&mut archive, "vocab_size")?;
        let has_bits = archive.by_name("bits.npy").is_ok();
        let bits = if has_bits {
            u32::try_from(scalar(&mut archive, "bits")?).map_err(|_| "invalid LM token width")?
        } else {
            DEFAULT_BITS
        };
        if order == 0
            || vocab_size == 0
            || bits == 0
            || bits > TAG_SHIFT
            || (order as u64).saturating_mul(bits as u64) > TAG_SHIFT as u64
        {
            return Err("invalid language model order, vocabulary or token width".into());
        }
        let mut levels = Vec::with_capacity(order);
        let mut top = -(vocab_size as f64).ln();
        let mut positive_backoff = 0.0;
        let mut probability_count = 0;
        for n in 0..order {
            let keys = array(&mut archive, &format!("k{n}"))?.as_keys()?;
            let values = array(&mut archive, &format!("v{n}"))?.as_floats()?;
            let history_keys = array(&mut archive, &format!("hk{n}"))?.as_keys()?;
            let backoff = array(&mut archive, &format!("hb{n}"))?.as_floats()?;
            if keys.len() != values.len() || history_keys.len() != backoff.len() {
                return Err(format!("inconsistent n-gram table lengths at order {n}"));
            }
            if !keys.windows(2).all(|w| w[0] <= w[1])
                || !history_keys.windows(2).all(|w| w[0] <= w[1])
            {
                return Err(format!("unsorted n-gram keys at order {n}"));
            }
            if !values.iter().chain(backoff.iter()).all(|v| v.is_finite()) {
                return Err(format!("non-finite n-gram value at order {n}"));
            }
            for &value in &values {
                top = top.max(value);
            }
            positive_backoff += backoff.iter().copied().fold(0.0_f64, f64::max);
            probability_count += values.len();
            levels.push(Level {
                keys,
                values,
                history_keys,
                backoff,
            });
        }
        if probability_count == 0 {
            return Err("language model has no token probabilities".into());
        }
        Ok(Self {
            order,
            vocab_size,
            bits,
            levels,
            max_logp: top + positive_backoff,
            cache: Mutex::new(HashMap::new()),
        })
    }

    pub fn max_logp(&self) -> f64 {
        self.max_logp
    }

    /// `key` packs recent history then `token_id + 1`, with zero reserved for BOS.
    pub fn logp_key(&self, key: u64) -> f64 {
        if let Ok(cache) = self.cache.lock() {
            if let Some(&value) = cache.get(&key) {
                return value;
            }
        }
        let token = key & low_mask(self.bits);
        let history = key >> self.bits;
        let mut longest = 0;
        for n in 1..self.order {
            let hk = history & low_mask(self.bits * n as u32);
            if find(&self.levels[n].history_keys, hk).is_none() {
                break;
            }
            longest = n;
        }
        let mut accumulated = 0.0;
        let mut result = None;
        for n in (0..=longest).rev() {
            let hk = history & low_mask(self.bits * n as u32);
            let level = &self.levels[n];
            if let Some(i) = find(&level.keys, (hk << self.bits) | token) {
                result = Some(accumulated + level.values[i]);
                break;
            }
            if let Some(i) = find(&level.history_keys, hk) {
                accumulated += level.backoff[i];
            }
        }
        let value = result.unwrap_or(accumulated - (self.vocab_size as f64).ln());
        if let Ok(mut cache) = self.cache.lock() {
            if cache.len() < CACHE_CAPACITY {
                cache.insert(key, value);
            }
        }
        value
    }
}

fn low_mask(bits: u32) -> u64 {
    if bits == 0 { 0 } else { (1_u64 << bits) - 1 }
}

fn find(keys: &[u64], key: u64) -> Option<usize> {
    let i = keys.partition_point(|&value| value < key);
    (i < keys.len() && keys[i] == key).then_some(i)
}

fn log_add(a: f64, b: f64) -> f64 {
    if a == f64::NEG_INFINITY {
        return b;
    }
    if b == f64::NEG_INFINITY {
        return a;
    }
    let m = a.max(b);
    m + ((a - m).exp() + (b - m).exp()).ln()
}

#[derive(Clone, Debug)]
struct BeamState {
    blank: f64,
    non_blank: f64,
    lm_score: f64,
    steps: Vec<usize>,
    history: u64,
}

impl BeamState {
    fn score(&self) -> f64 {
        log_add(self.blank, self.non_blank) + self.lm_score
    }
}

/// Insertion order is retained to match Python's stable tie handling.
fn add(
    entries: &mut Vec<(Vec<i64>, BeamState)>,
    indices: &mut HashMap<Vec<i64>, usize>,
    prefix: &[i64],
    state: BeamState,
) {
    if let Some(&i) = indices.get(prefix) {
        entries[i].1.blank = log_add(entries[i].1.blank, state.blank);
        entries[i].1.non_blank = log_add(entries[i].1.non_blank, state.non_blank);
    } else {
        indices.insert(prefix.to_vec(), entries.len());
        entries.push((prefix.to_vec(), state));
    }
}

#[allow(clippy::too_many_arguments)]
pub fn beam_search(
    blank: &[f32],
    topv: &[f32],
    topi: &[i64],
    steps: usize,
    k: usize,
    lm: &NgramLM,
    alpha: f64,
    beta: f64,
    beam: usize,
    cand_floor: f64,
) -> Result<(Vec<i64>, Vec<usize>), String> {
    let size = steps.checked_mul(k).ok_or("CTC tensor size overflow")?;
    if blank.len() != steps
        || topv.len() != size
        || topi.len() != size
        || k == 0
        || beam == 0
        || beam > 1_024
        || !alpha.is_finite()
        || alpha < 0.0
        || !beta.is_finite()
        || !cand_floor.is_finite()
        || cand_floor <= 0.0
        || cand_floor > 1.0
    {
        return Err("invalid CTC beam inputs or parameters".into());
    }
    if blank
        .iter()
        .chain(topv)
        .any(|&v| v.is_nan() || v == f32::INFINITY)
        || topi
            .iter()
            .any(|&id| id < 0 || id as u64 >= low_mask(lm.bits))
    {
        return Err("invalid CTC probabilities or token IDs".into());
    }
    let history_mask = low_mask(lm.bits * (lm.order - 1) as u32);
    let mut beams = vec![(
        Vec::new(),
        BeamState {
            blank: 0.0,
            non_blank: f64::NEG_INFINITY,
            lm_score: 0.0,
            steps: Vec::new(),
            history: 0,
        },
    )];
    let log_skip = 0.999_f64.ln();
    let log_floor = cand_floor.ln();
    for t in 0..steps {
        let b0 = blank[t] as f64;
        if b0 > log_skip {
            for (_, entry) in &mut beams {
                entry.blank = log_add(entry.blank, entry.non_blank) + b0;
                entry.non_blank = f64::NEG_INFINITY;
            }
            continue;
        }
        let candidates: Vec<(i64, f64)> = (t * k..(t + 1) * k)
            .filter_map(|i| {
                let id = topi[i];
                let value = topv[i] as f64;
                (id != 0 && value >= log_floor).then_some((id, value))
            })
            .collect();
        let mut next = Vec::new();
        let mut indices = HashMap::new();
        for (prefix, entry) in &beams {
            let mut same = entry.clone();
            same.blank = log_add(entry.blank, entry.non_blank) + b0;
            same.non_blank = f64::NEG_INFINITY;
            add(&mut next, &mut indices, prefix, same);
            for &(id, value) in &candidates {
                if prefix.last() == Some(&id) {
                    let mut repeat = entry.clone();
                    repeat.blank = f64::NEG_INFINITY;
                    repeat.non_blank += value;
                    add(&mut next, &mut indices, prefix, repeat);
                }
            }
        }
        let floor = if beams.len() >= beam {
            next.iter()
                .map(|(_, e)| e.score())
                .fold(f64::INFINITY, f64::min)
        } else {
            f64::NEG_INFINITY
        };
        let reach = beta + alpha * lm.max_logp();
        let mut extensions = Vec::new();
        for (prefix, entry) in &beams {
            for &(id, value) in &candidates {
                let from = if prefix.last() == Some(&id) {
                    entry.blank + value
                } else {
                    log_add(entry.blank, entry.non_blank) + value
                };
                if from == f64::NEG_INFINITY {
                    continue;
                }
                let mut extended = prefix.clone();
                extended.push(id);
                if indices.contains_key(&extended) {
                    let mut state = entry.clone();
                    state.blank = f64::NEG_INFINITY;
                    state.non_blank = from;
                    add(&mut next, &mut indices, &extended, state);
                } else if from + entry.lm_score + reach >= floor - 1e-9 {
                    extensions.push((extended, entry.clone(), id, from));
                }
            }
        }
        for (prefix, entry, id, from) in extensions {
            let packed = (entry.history << lm.bits) | (id as u64 + 1);
            let mut emitted_steps = entry.steps;
            emitted_steps.push(t);
            let state = BeamState {
                blank: f64::NEG_INFINITY,
                non_blank: from,
                lm_score: entry.lm_score + alpha * lm.logp_key(packed) + beta,
                steps: emitted_steps,
                history: packed & history_mask,
            };
            add(&mut next, &mut indices, &prefix, state);
        }
        next.sort_by(|(_, a), (_, b)| b.score().total_cmp(&a.score()));
        next.truncate(beam);
        beams = next;
    }
    let mut best = beams.into_iter();
    let mut winner = best.next().ok_or("CTC beam became empty")?;
    for candidate in best {
        if candidate.1.score() > winner.1.score() {
            winner = candidate;
        }
    }
    Ok((winner.0, winner.1.steps))
}

struct Npy {
    descriptor: String,
    data: Vec<u8>,
    count: usize,
}

fn header_value<'a>(header: &'a str, key: &str) -> Result<&'a str, String> {
    let position = header
        .find(&format!("'{key}'"))
        .or_else(|| header.find(&format!("\"{key}\"")))
        .ok_or_else(|| format!("NPY header lacks {key}"))?;
    let tail = &header[position..];
    let colon = tail.find(':').ok_or("invalid NPY header")?;
    Ok(tail[colon + 1..].trim_start())
}

fn array(archive: &mut zip::ZipArchive<File>, name: &str) -> Result<Npy, String> {
    let mut entry = archive
        .by_name(&format!("{name}.npy"))
        .map_err(|e| format!("missing or invalid {name}.npy: {e}"))?;
    if entry.size() > MAX_ARRAY_BYTES {
        return Err("NPY array too large".into());
    }
    let mut bytes = Vec::new();
    entry
        .by_ref()
        .take(MAX_ARRAY_BYTES + 1)
        .read_to_end(&mut bytes)
        .map_err(|e| format!("read {name}.npy: {e}"))?;
    if bytes.len() as u64 > MAX_ARRAY_BYTES || bytes.len() < 10 || &bytes[..6] != b"\x93NUMPY" {
        return Err(format!("invalid NPY array: {name}"));
    }
    let (start, header_len): (usize, usize) = match bytes[6] {
        1 => (10, u16::from_le_bytes([bytes[8], bytes[9]]) as usize),
        2 | 3 if bytes.len() >= 12 => (
            12,
            u32::from_le_bytes(bytes[8..12].try_into().unwrap()) as usize,
        ),
        _ => return Err("unsupported NPY version".into()),
    };
    let end = start
        .checked_add(header_len)
        .filter(|&n| n <= bytes.len())
        .ok_or("truncated NPY header")?;
    let header =
        std::str::from_utf8(&bytes[start..end]).map_err(|_| "invalid NPY header encoding")?;
    let descriptor = header_value(header, "descr")?;
    let quote = descriptor
        .chars()
        .next()
        .filter(|&c| c == '\'' || c == '"')
        .ok_or("invalid NPY dtype")?;
    let descriptor = descriptor[1..]
        .split(quote)
        .next()
        .ok_or("invalid NPY dtype")?
        .to_owned();
    if !header_value(header, "fortran_order")?.starts_with("False") {
        return Err("Fortran-ordered NPY tables are unsupported".into());
    }
    let shape = header_value(header, "shape")?;
    if !shape.starts_with('(') {
        return Err("invalid NPY shape".into());
    }
    let close = shape.find(')').ok_or("invalid NPY shape")?;
    let mut count = 1_usize;
    for dimension in shape[1..close]
        .split(',')
        .map(str::trim)
        .filter(|v| !v.is_empty())
    {
        let n = dimension
            .parse::<usize>()
            .map_err(|_| "invalid NPY dimension")?;
        count = count.checked_mul(n).ok_or("NPY shape overflow")?;
    }
    let width = descriptor
        .get(2..)
        .and_then(|s| s.parse::<usize>().ok())
        .ok_or("invalid NPY dtype width")?;
    if !matches!(
        descriptor.as_bytes().first(),
        Some(b'<' | b'>' | b'=' | b'|')
    ) || !matches!(descriptor.as_bytes().get(1), Some(b'i' | b'u' | b'f'))
        || !matches!(width, 2 | 4 | 8)
        || count.checked_mul(width) != Some(bytes.len() - end)
    {
        return Err(format!(
            "unsupported or inconsistent NPY dtype {descriptor}"
        ));
    }
    Ok(Npy {
        descriptor,
        data: bytes.split_off(end),
        count,
    })
}

impl Npy {
    fn raw(&self, offset: usize) -> u64 {
        let width = self.descriptor[2..].parse::<usize>().unwrap();
        let source = &self.data[offset * width..(offset + 1) * width];
        let big = self.descriptor.starts_with('>')
            || (self.descriptor.starts_with('=') && cfg!(target_endian = "big"));
        if big {
            source.iter().fold(0, |n, &b| (n << 8) | b as u64)
        } else {
            source.iter().rev().fold(0, |n, &b| (n << 8) | b as u64)
        }
    }

    fn as_keys(&self) -> Result<Vec<u64>, String> {
        let kind = self.descriptor.as_bytes()[1];
        let width = self.descriptor[2..].parse::<usize>().unwrap();
        if kind != b'u' && kind != b'i' {
            return Err("n-gram keys must be integers".into());
        }
        (0..self.count)
            .map(|i| {
                let value = self.raw(i);
                if kind == b'i' && (value >> (width * 8 - 1)) != 0 {
                    Err("n-gram keys must be nonnegative".into())
                } else {
                    Ok(value)
                }
            })
            .collect()
    }

    fn as_floats(&self) -> Result<Vec<f64>, String> {
        let kind = self.descriptor.as_bytes()[1];
        let width = self.descriptor[2..].parse::<usize>().unwrap();
        if kind != b'f' {
            return Ok((0..self.count)
                .map(|i| {
                    let raw = self.raw(i);
                    if kind == b'i' {
                        let shift = 64 - width * 8;
                        (((raw << shift) as i64) >> shift) as f64
                    } else {
                        raw as f64
                    }
                })
                .collect());
        }
        (0..self.count)
            .map(|i| {
                let raw = self.raw(i);
                match width {
                    2 => Ok(half::f16::from_bits(raw as u16).to_f64()),
                    4 => Ok(f32::from_bits(raw as u32) as f64),
                    8 => Ok(f64::from_bits(raw)),
                    _ => Err("unsupported floating NPY dtype".into()),
                }
            })
            .collect()
    }
}

fn scalar(archive: &mut zip::ZipArchive<File>, name: &str) -> Result<usize, String> {
    let value = array(archive, name)?;
    if value.count != 1 {
        return Err(format!("{name} must be a scalar"));
    }
    let keys = value.as_keys()?;
    usize::try_from(keys[0]).map_err(|_| format!("{name} is too large"))
}
