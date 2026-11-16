use jobs_ocr::lm::{NgramLM, beam_search};
use std::collections::BTreeMap;
use std::fs::File;
use std::io::Write;
use std::path::PathBuf;
use std::sync::atomic::{AtomicU64, Ordering};

static COUNTER: AtomicU64 = AtomicU64::new(0);

struct Fixture(PathBuf);

impl Drop for Fixture {
    fn drop(&mut self) {
        let _ = std::fs::remove_file(&self.0);
    }
}

fn npy(dtype: &str, count: usize, bytes: Vec<u8>) -> Vec<u8> {
    let mut header =
        format!("{{'descr': '{dtype}', 'fortran_order': False, 'shape': ({count},), }}");
    while (10 + header.len() + 1) % 64 != 0 {
        header.push(' ');
    }
    header.push('\n');
    let mut out = b"\x93NUMPY\x01\x00".to_vec();
    out.extend_from_slice(&(header.len() as u16).to_le_bytes());
    out.extend_from_slice(header.as_bytes());
    out.extend(bytes);
    out
}

fn key_array(values: &[u64]) -> Vec<u8> {
    npy(
        "<u8",
        values.len(),
        values.iter().flat_map(|v| v.to_le_bytes()).collect(),
    )
}

fn values_array(values: &[f64], dtype: &str) -> Vec<u8> {
    let data = values
        .iter()
        .flat_map(|&v| match dtype {
            "<f2" => half::f16::from_f64(v).to_bits().to_le_bytes().to_vec(),
            "<f4" => (v as f32).to_le_bytes().to_vec(),
            ">f8" => v.to_be_bytes().to_vec(),
            "<i4" => (v as i32).to_le_bytes().to_vec(),
            _ => v.to_le_bytes().to_vec(),
        })
        .collect();
    npy(dtype, values.len(), data)
}

fn fixture(
    unigrams: &[(u64, f64)],
    bigrams: &[(u64, f64)],
    histories: &[(u64, f64)],
    dtype: &str,
) -> Fixture {
    let file_name = format!(
        "jobs-ocr-lm-{}-{}.npz",
        std::process::id(),
        COUNTER.fetch_add(1, Ordering::Relaxed)
    );
    let path = std::env::temp_dir().join(file_name);
    let file = File::create(&path).unwrap();
    let mut zip = zip::ZipWriter::new(file);
    let options =
        zip::write::SimpleFileOptions::default().compression_method(zip::CompressionMethod::Stored);
    let mut put = |name: &str, bytes: Vec<u8>| {
        zip.start_file(format!("{name}.npy"), options).unwrap();
        zip.write_all(&bytes).unwrap();
    };
    put("order", npy(">u4", 1, 2_u32.to_be_bytes().to_vec()));
    put("vocab_size", npy("<i8", 1, 4_i64.to_le_bytes().to_vec()));
    put("bits", npy("<i4", 1, 4_i32.to_le_bytes().to_vec()));
    put(
        "k0",
        key_array(&unigrams.iter().map(|v| v.0).collect::<Vec<_>>()),
    );
    put(
        "v0",
        values_array(&unigrams.iter().map(|v| v.1).collect::<Vec<_>>(), dtype),
    );
    put("hk0", key_array(&[0]));
    put("hb0", values_array(&[0.0], dtype));
    put(
        "k1",
        key_array(&bigrams.iter().map(|v| v.0).collect::<Vec<_>>()),
    );
    put(
        "v1",
        values_array(&bigrams.iter().map(|v| v.1).collect::<Vec<_>>(), dtype),
    );
    put(
        "hk1",
        key_array(&histories.iter().map(|v| v.0).collect::<Vec<_>>()),
    );
    put(
        "hb1",
        values_array(&histories.iter().map(|v| v.1).collect::<Vec<_>>(), dtype),
    );
    zip.finish().unwrap();
    Fixture(path)
}

#[test]
fn npz_types_and_backoff_preserve_probabilities() {
    for dtype in ["<f2", "<f4", ">f8"] {
        let archive = fixture(&[(2, -1.0), (3, -2.0)], &[], &[(2, -0.25)], dtype);
        let lm = NgramLM::load(&archive.0).unwrap();
        assert_eq!(lm.order, 2);
        assert_eq!(lm.bits, 4);
        assert_eq!(lm.logp_key((2 << 4) | 3), -2.25);
        assert_eq!(lm.logp_key((3 << 4) | 3), -2.0);
        assert!((lm.logp_key(4) + 4_f64.ln()).abs() < 1e-12);
    }
    let archive = fixture(&[(2, -3.0), (3, -2.0)], &[], &[], "<i4");
    assert_eq!(NgramLM::load(&archive.0).unwrap().logp_key(2), -3.0);
}

#[test]
fn seen_bigram_overrides_unigram_and_backoff() {
    let archive = fixture(
        &[(2, -1.0), (3, -2.0)],
        &[(35, -0.125)],
        &[(2, -0.25)],
        "<f4",
    );
    let lm = NgramLM::load(&archive.0).unwrap();
    assert_eq!(lm.logp_key(35), -0.125);
}

#[test]
fn language_model_can_resolve_an_ambiguous_character() {
    let archive = fixture(&[(2, -3.0), (3, -0.01)], &[], &[], ">f8");
    let lm = NgramLM::load(&archive.0).unwrap();
    let (ids, emitted) = beam_search(
        &[-5.0],
        &[-0.1, -0.2],
        &[1, 2],
        1,
        2,
        &lm,
        1.0,
        0.0,
        8,
        0.001,
    )
    .unwrap();
    assert_eq!(ids, [2]);
    assert_eq!(emitted, [0]);
}

#[test]
fn repeated_ctc_character_requires_a_blank_to_emit_twice() {
    let archive = fixture(&[(2, -1.0)], &[], &[], "<f4");
    let lm = NgramLM::load(&archive.0).unwrap();
    let low = 0.0001_f32.ln();
    let high = 0.9999_f32.ln();
    let (ids, emitted) = beam_search(
        &[low, low, high, low],
        &[high, high, low, high],
        &[1, 1, 1, 1],
        4,
        1,
        &lm,
        0.0,
        0.0,
        8,
        0.001,
    )
    .unwrap();
    assert_eq!(ids, [1, 1]);
    assert_eq!(emitted, [0, 3]);
}

/// Independent oracle sums every alignment, then applies the CTC collapse rule.
fn exhaustive_ctc(probabilities: &[[f64; 3]]) -> Vec<i64> {
    let mut totals = BTreeMap::<Vec<i64>, f64>::new();
    for mut alignment in 0_usize..3_usize.pow(probabilities.len() as u32) {
        let mut prefix = Vec::new();
        let mut previous = 0;
        let mut probability = 1.0;
        for row in probabilities {
            let id = alignment % 3;
            alignment /= 3;
            probability *= row[id];
            if id != 0 && id != previous {
                prefix.push(id as i64);
            }
            previous = id;
        }
        *totals.entry(prefix).or_default() += probability;
    }
    totals
        .into_iter()
        .max_by(|a, b| a.1.total_cmp(&b.1))
        .unwrap()
        .0
}

#[test]
fn full_beam_agrees_with_exhaustive_ctc_alignment_sum() {
    let archive = fixture(&[(2, -1.0), (3, -1.0)], &[], &[], "<f4");
    let lm = NgramLM::load(&archive.0).unwrap();
    let cases = [
        [[0.4, 0.35, 0.25], [0.4, 0.35, 0.25], [0.3, 0.2, 0.5]],
        [[0.1, 0.8, 0.1], [0.8, 0.1, 0.1], [0.1, 0.8, 0.1]],
        [[0.7, 0.1, 0.2], [0.1, 0.2, 0.7], [0.1, 0.2, 0.7]],
    ];
    for probabilities in cases {
        let blank: Vec<f32> = probabilities
            .iter()
            .map(|row| (row[0] as f32).ln())
            .collect();
        let topv: Vec<f32> = probabilities
            .iter()
            .flatten()
            .map(|&p| (p as f32).ln())
            .collect();
        let (ids, _) = beam_search(
            &blank,
            &topv,
            &[0, 1, 2, 0, 1, 2, 0, 1, 2],
            3,
            3,
            &lm,
            0.0,
            0.0,
            64,
            0.001,
        )
        .unwrap();
        assert_eq!(ids, exhaustive_ctc(&probabilities));
    }
}

#[test]
fn invalid_tensors_and_archive_fail_without_panicking() {
    let archive = fixture(&[(2, -1.0)], &[], &[], "<f4");
    let lm = NgramLM::load(&archive.0).unwrap();
    assert!(beam_search(&[-1.0], &[], &[], 1, 1, &lm, 0.5, 1.5, 8, 0.001).is_err());
    assert!(beam_search(&[f32::NAN], &[-1.0], &[1], 1, 1, &lm, 0.5, 1.5, 8, 0.001).is_err());
    let path = std::env::temp_dir().join(format!("jobs-ocr-bad-{}.npz", std::process::id()));
    std::fs::write(&path, b"not a zip").unwrap();
    assert!(NgramLM::load(&path).is_err());
    let _ = std::fs::remove_file(path);
}
