//! Reading order and layout adapted from Indra's Apache-2.0 order_post/layout_post.
//! Learned table row/column/cell heads and picture extraction are not handled here.

use crate::Line;
use crate::runtime::{FloatOutput, Model};
use serde::Serialize;
use std::collections::BTreeMap;
use unicode_width::UnicodeWidthChar;

const MODEL_MAX_LINES: usize = 512;
const CLASSES: [&str; 10] = [
    "Text",
    "Section-Header",
    "Page-Header",
    "Page-Footer",
    "List-Group",
    "Table",
    "Caption",
    "Footnote",
    "Table-Of-Contents",
    "Form",
];

#[derive(Clone, Debug, Serialize)]
pub struct Block {
    pub label: String,
    pub bbox: [f32; 4],
    pub text: String,
}

fn median(values: impl IntoIterator<Item = f32>) -> f32 {
    let mut values: Vec<f32> = values.into_iter().collect();
    values.sort_by(f32::total_cmp);
    match values.len() {
        0 => 1.0,
        n if n % 2 == 0 => (values[n / 2 - 1] + values[n / 2]) / 2.0,
        n => values[n / 2],
    }
}

// Python isdigit includes superscripts but excludes fractions and Roman numerals; generated from Unicode 17.0 property data.
fn digit(c: char) -> bool {
    matches!(c as u32, 0x30..=0x39 | 0xb2..=0xb3 | 0xb9 | 0x660..=0x669 | 0x6f0..=0x6f9 | 0x7c0..=0x7c9 | 0x966..=0x96f | 0x9e6..=0x9ef | 0xa66..=0xa6f | 0xae6..=0xaef | 0xb66..=0xb6f | 0xbe6..=0xbef | 0xc66..=0xc6f | 0xce6..=0xcef | 0xd66..=0xd6f | 0xde6..=0xdef | 0xe50..=0xe59 | 0xed0..=0xed9 | 0xf20..=0xf29 | 0x1040..=0x1049 | 0x1090..=0x1099 | 0x1369..=0x1371 | 0x17e0..=0x17e9 | 0x1810..=0x1819 | 0x1946..=0x194f | 0x19d0..=0x19da | 0x1a80..=0x1a89 | 0x1a90..=0x1a99 | 0x1b50..=0x1b59 | 0x1bb0..=0x1bb9 | 0x1c40..=0x1c49 | 0x1c50..=0x1c59 | 0x2070 | 0x2074..=0x2079 | 0x2080..=0x2089 | 0x2460..=0x2468 | 0x2474..=0x247c | 0x2488..=0x2490 | 0x24ea | 0x24f5..=0x24fd | 0x24ff | 0x2776..=0x277e | 0x2780..=0x2788 | 0x278a..=0x2792 | 0xa620..=0xa629 | 0xa8d0..=0xa8d9 | 0xa900..=0xa909 | 0xa9d0..=0xa9d9 | 0xa9f0..=0xa9f9 | 0xaa50..=0xaa59 | 0xabf0..=0xabf9 | 0xff10..=0xff19 | 0x104a0..=0x104a9 | 0x10a40..=0x10a43 | 0x10d30..=0x10d39 | 0x10d40..=0x10d49 | 0x10e60..=0x10e68 | 0x11052..=0x1105a | 0x11066..=0x1106f | 0x110f0..=0x110f9 | 0x11136..=0x1113f | 0x111d0..=0x111d9 | 0x112f0..=0x112f9 | 0x11450..=0x11459 | 0x114d0..=0x114d9 | 0x11650..=0x11659 | 0x116c0..=0x116c9 | 0x116d0..=0x116e3 | 0x11730..=0x11739 | 0x118e0..=0x118e9 | 0x11950..=0x11959 | 0x11bf0..=0x11bf9 | 0x11c50..=0x11c59 | 0x11d50..=0x11d59 | 0x11da0..=0x11da9 | 0x11de0..=0x11de9 | 0x11f50..=0x11f59 | 0x16130..=0x16139 | 0x16a60..=0x16a69 | 0x16ac0..=0x16ac9 | 0x16b50..=0x16b59 | 0x16d70..=0x16d79 | 0x1ccf0..=0x1ccf9 | 0x1d7ce..=0x1d7ff | 0x1e140..=0x1e149 | 0x1e2f0..=0x1e2f9 | 0x1e4f0..=0x1e4f9 | 0x1e5f1..=0x1e5fa | 0x1e950..=0x1e959 | 0x1f100..=0x1f10a | 0x1fbf0..=0x1fbf9)
}

// Python regular-expression \d uses decimal digits; generated from Unicode 17.0 property data.
fn decimal(c: char) -> bool {
    matches!(c as u32, 0x30..=0x39 | 0x660..=0x669 | 0x6f0..=0x6f9 | 0x7c0..=0x7c9 | 0x966..=0x96f | 0x9e6..=0x9ef | 0xa66..=0xa6f | 0xae6..=0xaef | 0xb66..=0xb6f | 0xbe6..=0xbef | 0xc66..=0xc6f | 0xce6..=0xcef | 0xd66..=0xd6f | 0xde6..=0xdef | 0xe50..=0xe59 | 0xed0..=0xed9 | 0xf20..=0xf29 | 0x1040..=0x1049 | 0x1090..=0x1099 | 0x17e0..=0x17e9 | 0x1810..=0x1819 | 0x1946..=0x194f | 0x19d0..=0x19d9 | 0x1a80..=0x1a89 | 0x1a90..=0x1a99 | 0x1b50..=0x1b59 | 0x1bb0..=0x1bb9 | 0x1c40..=0x1c49 | 0x1c50..=0x1c59 | 0xa620..=0xa629 | 0xa8d0..=0xa8d9 | 0xa900..=0xa909 | 0xa9d0..=0xa9d9 | 0xa9f0..=0xa9f9 | 0xaa50..=0xaa59 | 0xabf0..=0xabf9 | 0xff10..=0xff19 | 0x104a0..=0x104a9 | 0x10d30..=0x10d39 | 0x10d40..=0x10d49 | 0x11066..=0x1106f | 0x110f0..=0x110f9 | 0x11136..=0x1113f | 0x111d0..=0x111d9 | 0x112f0..=0x112f9 | 0x11450..=0x11459 | 0x114d0..=0x114d9 | 0x11650..=0x11659 | 0x116c0..=0x116c9 | 0x116d0..=0x116e3 | 0x11730..=0x11739 | 0x118e0..=0x118e9 | 0x11950..=0x11959 | 0x11bf0..=0x11bf9 | 0x11c50..=0x11c59 | 0x11d50..=0x11d59 | 0x11da0..=0x11da9 | 0x11de0..=0x11de9 | 0x11f50..=0x11f59 | 0x16130..=0x16139 | 0x16a60..=0x16a69 | 0x16ac0..=0x16ac9 | 0x16b50..=0x16b59 | 0x16d70..=0x16d79 | 0x1ccf0..=0x1ccf9 | 0x1d7ce..=0x1d7ff | 0x1e140..=0x1e149 | 0x1e2f0..=0x1e2f9 | 0x1e4f0..=0x1e4f9 | 0x1e5f1..=0x1e5fa | 0x1e950..=0x1e959 | 0x1fbf0..=0x1fbf9)
}

pub fn line_features(lines: &[Line], width: usize, height: usize) -> Vec<f32> {
    let (pw, ph) = (width.max(1) as f32, height.max(1) as f32);
    let med = median(lines.iter().map(|l| (l.bbox[3] - l.bbox[1]).max(1e-3)));
    let mut features = Vec::with_capacity(lines.len() * 16);
    for line in lines {
        let b = line.bbox;
        let w = (b[2] - b[0]).max(1e-3);
        let h = (b[3] - b[1]).max(1e-3);
        features.extend([
            b[0] / pw,
            b[1] / ph,
            b[2] / pw,
            b[3] / ph,
            (b[0] + b[2]) / (2.0 * pw),
            (b[1] + b[3]) / (2.0 * ph),
            w / pw,
            (h / med).ln(),
            (w / h).ln() / 4.0,
            med / ph * 20.0,
        ]);
        let text = line.text.trim();
        let chars: Vec<char> = text.chars().collect();
        if chars.is_empty() {
            features.extend([0.0; 6]);
            continue;
        }
        let display_len: usize = chars
            .iter()
            .map(|c| if c.width() == Some(2) { 2 } else { 1 })
            .sum();
        let prefix: String = chars.iter().take(3).collect();
        let numbered = !prefix.trim_end_matches(['.', ')']).is_empty()
            && prefix.trim_end_matches(['.', ')']).chars().all(digit)
            && chars.len() > 3;
        features.extend([
            (display_len as f32).ln_1p() / 5.0,
            chars.iter().filter(|c| digit(**c)).count() as f32 / chars.len() as f32,
            f32::from("•-–▪◦*·→".contains(chars[0]) || numbered),
            f32::from(text.ends_with('-')),
            f32::from(".!?:;。！？：；．".contains(*chars.last().unwrap())),
            f32::from(chars[0].is_uppercase()),
        ]);
    }
    features
}

fn log_sigmoid(value: f32) -> f64 {
    let value = value as f64;
    if value >= 0.0 {
        -(-value).exp().ln_1p()
    } else {
        value - value.exp().ln_1p()
    }
}

/// Insertion search over pairwise log probabilities, matching Indra's four sweeps.
pub fn decode_order(logits: &[f32], n: usize) -> Vec<usize> {
    if n < 2 {
        return (0..n).collect();
    }
    assert_eq!(logits.len(), n * n);
    let lp: Vec<f64> = logits.iter().copied().map(log_sigmoid).collect();
    let score: Vec<f64> = (0..n)
        .map(|i| (0..n).map(|j| lp[j * n + i] - lp[i * n + j]).sum())
        .collect();
    let mut order: Vec<usize> = (0..n).collect();
    order.sort_by(|a, b| score[*a].total_cmp(&score[*b]));
    for _ in 0..4 {
        let mut improved = false;
        for x in order.clone() {
            let current = order.iter().position(|i| *i == x).unwrap();
            let rest: Vec<usize> = order.iter().copied().filter(|i| *i != x).collect();
            let mut gains = vec![0.0; n];
            gains[0] = rest.iter().map(|i| lp[x * n + i]).sum();
            for (k, i) in rest.iter().enumerate() {
                gains[k + 1] = gains[k] + lp[i * n + x] - lp[x * n + i];
            }
            let mut best = 0;
            for k in 1..n {
                if gains[k] > gains[best] {
                    best = k;
                }
            }
            if gains[best] > gains[current] + 1e-6 {
                order = rest;
                order.insert(best, x);
                improved = true;
            }
        }
        if !improved {
            break;
        }
    }
    order
}

fn top_down(boxes: &[[f32; 4]], ids: &[usize]) -> Vec<usize> {
    let h = median(ids.iter().map(|i| boxes[*i][3] - boxes[*i][1])).max(1e-3);
    let mut out = ids.to_vec();
    out.sort_by(|a, b| {
        let row = |i: usize| ((boxes[i][1] + boxes[i][3]) / h).round_ties_even();
        row(*a)
            .total_cmp(&row(*b))
            .then_with(|| boxes[*a][0].total_cmp(&boxes[*b][0]))
    });
    out
}

fn best_cut(boxes: &[[f32; 4]], ids: &[usize], axis: usize) -> (f32, usize, Vec<usize>) {
    let mut order = ids.to_vec();
    order.sort_by(|a, b| boxes[*a][axis].total_cmp(&boxes[*b][axis]));
    if order.is_empty() {
        return (0.0, 0, order);
    }
    let mut end = boxes[order[0]][axis + 2];
    let mut best = (0.0, 0);
    for (k, i) in order.iter().enumerate().skip(1) {
        let gap = boxes[*i][axis] - end;
        if gap > best.0 {
            best = (gap, k);
        }
        end = end.max(boxes[*i][axis + 2]);
    }
    (best.0, best.1, order)
}

fn cut_groups(boxes: &[[f32; 4]], ids: &[usize], min_gap: f32, depth: usize) -> Vec<Vec<usize>> {
    if ids.len() < 2 || depth >= 128 {
        return vec![top_down(boxes, ids)];
    }
    let y = best_cut(boxes, ids, 1);
    let x = best_cut(boxes, ids, 0);
    let (gap, k, order) = if y.0 >= x.0 { y } else { x };
    if k == 0 || gap < min_gap {
        return vec![if min_gap > 0.0 {
            order_xycut_subset(boxes, ids, depth + 1)
        } else {
            top_down(boxes, ids)
        }];
    }
    let mut left = cut_groups(boxes, &order[..k], min_gap, depth + 1);
    left.extend(cut_groups(boxes, &order[k..], min_gap, depth + 1));
    left
}

fn order_xycut_subset(boxes: &[[f32; 4]], ids: &[usize], depth: usize) -> Vec<usize> {
    cut_groups(boxes, ids, 0.0, depth)
        .into_iter()
        .flatten()
        .collect()
}

pub fn order_xycut(boxes: &[[f32; 4]]) -> Vec<usize> {
    order_xycut_subset(boxes, &(0..boxes.len()).collect::<Vec<_>>(), 0)
}

/// Average linkage prevents one positive pair from joining otherwise separate blocks.
pub fn cluster(logits: &[f32], n: usize) -> Vec<Vec<usize>> {
    if n == 0 {
        return vec![];
    }
    assert_eq!(logits.len(), n * n);
    let mut sums: Vec<f64> = logits.iter().map(|v| *v as f64).collect();
    let mut means = sums.clone();
    let mut size = vec![1.0; n];
    let mut alive = vec![true; n];
    let mut members: Vec<Vec<usize>> = (0..n).map(|i| vec![i]).collect();
    for i in 0..n {
        sums[i * n + i] = 0.0;
        means[i * n + i] = f64::NEG_INFINITY;
    }
    let best_in_row = |m: &[f64], row: usize| -> usize {
        let mut best = 0;
        for j in 1..n {
            if m[row * n + j] > m[row * n + best] {
                best = j;
            }
        }
        best
    };
    let mut best: Vec<usize> = (0..n).map(|i| best_in_row(&means, i)).collect();
    let mut best_values: Vec<f64> = (0..n).map(|i| means[i * n + best[i]]).collect();
    for _ in 0..n.saturating_sub(1) {
        let mut a = 0;
        for i in 1..n {
            if best_values[i] > best_values[a] {
                a = i;
            }
        }
        if best_values[a] <= 0.0 {
            break;
        }
        let b0 = best[a];
        let (a, b) = (a.min(b0), a.max(b0));
        for j in 0..n {
            let value = sums[b * n + j];
            sums[a * n + j] += value;
        }
        for j in 0..n {
            let value = sums[j * n + b];
            sums[j * n + a] += value;
        }
        sums[a * n + a] = 0.0;
        let removed_size = size[b];
        size[a] += removed_size;
        alive[b] = false;
        let removed = members[b].clone();
        members[a].extend(removed);
        for j in 0..n {
            let value = if alive[j] && j != a {
                sums[a * n + j] / (size[a] * size[j])
            } else {
                f64::NEG_INFINITY
            };
            means[a * n + j] = value;
            means[j * n + a] = value;
            means[b * n + j] = f64::NEG_INFINITY;
            means[j * n + b] = f64::NEG_INFINITY;
        }
        best_values[b] = f64::NEG_INFINITY;
        best[a] = best_in_row(&means, a);
        best_values[a] = means[a * n + best[a]];
        for j in 0..n {
            if !alive[j] || j == a {
                continue;
            }
            if best[j] == a || best[j] == b {
                best[j] = best_in_row(&means, j);
                best_values[j] = means[j * n + best[j]];
            } else if means[j * n + a] > best_values[j] {
                best[j] = a;
                best_values[j] = means[j * n + a];
            }
        }
    }
    members
        .into_iter()
        .enumerate()
        .filter_map(|(i, mut group)| {
            if alive[i] {
                group.sort_unstable();
                Some(group)
            } else {
                None
            }
        })
        .collect()
}

fn class_of(ids: &[usize], classes: &[f32], n_classes: usize) -> usize {
    let mut sums = vec![0.0; n_classes];
    for i in ids {
        for c in 0..n_classes {
            sums[c] += classes[i * n_classes + c];
        }
    }
    let mut best = 0;
    for c in 1..n_classes {
        if sums[c] > sums[best] {
            best = c;
        }
    }
    best
}

fn block_order(pair: &[f32], groups: &[Vec<usize>], n: usize) -> Vec<usize> {
    let m = groups.len();
    let mut mean = vec![0.0; m * m];
    for a in 0..m {
        for b in a + 1..m {
            let mut sum = 0.0f64;
            for i in &groups[a] {
                for j in &groups[b] {
                    sum += pair[i * n + j] as f64;
                }
            }
            let value = (sum / (groups[a].len() * groups[b].len()) as f64) as f32;
            mean[a * m + b] = value;
            mean[b * m + a] = -value;
        }
    }
    decode_order(&mean, m)
}

fn is_cjk(c: char) -> bool {
    matches!(c as u32, 0x3000..=0x30ff | 0x3400..=0x9fff | 0xf900..=0xfaff | 0xff00..=0xffef | 0x20000..=0x2fa1f)
}

pub fn join_lines<'a>(texts: impl IntoIterator<Item = &'a str>) -> String {
    let mut out = String::new();
    for text in texts {
        let text = text.trim();
        if text.is_empty() {
            continue;
        }
        let chars: Vec<char> = out.chars().rev().take(2).collect();
        let first = text.chars().next().unwrap();
        if chars.len() > 1
            && chars[0] == '-'
            && chars[1].is_alphabetic()
            && first.is_alphabetic()
            && first.is_lowercase()
        {
            out.pop();
        } else if !out.is_empty() && !(is_cjk(chars[0]) && is_cjk(first)) {
            out.push(' ');
        }
        out.push_str(text);
    }
    out
}

fn item_start(text: &str) -> bool {
    let text = text.trim_start();
    let chars: Vec<char> = text.chars().collect();
    if chars.is_empty() {
        return false;
    }
    if "•-–▪◦*·→".contains(chars[0]) {
        return chars.len() == 1 || chars[1].is_whitespace();
    }
    let start = usize::from(chars[0] == '(');
    let mut at = start;
    while at < chars.len() && at - start < 3 && decimal(chars[at]) {
        at += 1;
    }
    if at == start && at < chars.len() && chars[at].is_ascii_alphabetic() {
        at += 1;
    }
    at > start
        && at < chars.len()
        && matches!(chars[at], '.' | ')')
        && (at + 1 == chars.len() || chars[at + 1].is_whitespace())
}

fn escape(text: &str) -> String {
    text.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

fn table_rows(lines: &[Line], ids: &[usize]) -> Vec<Vec<usize>> {
    let h = median(ids.iter().map(|i| lines[*i].bbox[3] - lines[*i].bbox[1]));
    let center = |i: usize| (lines[i].bbox[1] + lines[i].bbox[3]) / 2.0;
    let mut order = ids.to_vec();
    order.sort_by(|a, b| center(*a).total_cmp(&center(*b)));
    let mut rows: Vec<Vec<usize>> = vec![];
    for i in order {
        if let Some(last) = rows.last_mut() {
            let mean = last.iter().map(|j| center(*j)).sum::<f32>() / last.len() as f32;
            if (center(i) - mean).abs() < 0.5 * h {
                last.push(i);
                continue;
            }
        }
        rows.push(vec![i]);
    }
    for row in &mut rows {
        row.sort_by(|a, b| lines[*a].bbox[0].total_cmp(&lines[*b].bbox[0]));
    }
    rows
}

/// Geometric table assembly; learned cell/row/column heads remain a separate capability.
pub fn table_html(lines: &[Line], ids: &[usize]) -> String {
    if ids.is_empty() {
        return String::new();
    }
    let mut rows = table_rows(lines, ids);
    let span = union_box(lines, ids);
    if rows.len() > 2 && rows[0].len() == 1 && rows.iter().any(|r| r.len() > 1) {
        let title = rows[0][0];
        if lines[title].bbox[2] - lines[title].bbox[0] > 0.6 * (span[2] - span[0]) {
            let rest: Vec<usize> = ids.iter().copied().filter(|i| *i != title).collect();
            return format!("{}\n\n{}", lines[title].text, table_html(lines, &rest));
        }
    }
    let width = rows.iter().map(Vec::len).max().unwrap_or(1);
    let full: Vec<&Vec<usize>> = rows.iter().filter(|r| r.len() == width).collect();
    let bands: Vec<[f32; 2]> = (0..width)
        .map(|c| {
            [
                median(full.iter().map(|r| lines[r[c]].bbox[0])),
                median(full.iter().map(|r| lines[r[c]].bbox[2])),
            ]
        })
        .collect();
    if rows.len() >= 3 {
        let h = median(ids.iter().map(|i| lines[*i].bbox[3] - lines[*i].bbox[1]));
        let gaps: Vec<f32> = rows
            .windows(2)
            .map(|pair| {
                pair[1]
                    .iter()
                    .map(|i| lines[*i].bbox[1])
                    .fold(f32::INFINITY, f32::min)
                    - pair[0]
                        .iter()
                        .map(|i| lines[*i].bbox[3])
                        .fold(f32::NEG_INFINITY, f32::max)
            })
            .collect();
        let med = median(gaps.iter().copied());
        let mut merged = vec![rows[0].clone()];
        for (j, row) in rows.iter().enumerate().skip(1) {
            if gaps[j - 1] < 0.5 * med && gaps[j - 1] < 0.6 * h && row.len() < rows[j - 1].len() {
                merged.last_mut().unwrap().extend(row);
            } else {
                merged.push(row.clone());
            }
        }
        rows = merged;
    }
    let mut edges = vec![f32::NEG_INFINITY];
    for c in 0..width.saturating_sub(1) {
        edges.push((bands[c][1] + bands[c + 1][0]) / 2.0);
    }
    edges.push(f32::INFINITY);
    let mut out = String::from("<table>\n");
    for (ri, row) in rows.iter().enumerate() {
        let tag = if ri == 0 && rows.len() > 1 {
            "th"
        } else {
            "td"
        };
        let mut row = row.clone();
        row.sort_by(|a, b| {
            lines[*a].bbox[1]
                .total_cmp(&lines[*b].bbox[1])
                .then_with(|| lines[*a].bbox[0].total_cmp(&lines[*b].bbox[0]))
        });
        let mut cells: BTreeMap<usize, (usize, String)> = BTreeMap::new();
        for i in row {
            let b = lines[i].bbox;
            let first = edges
                .partition_point(|v| *v <= b[0])
                .saturating_sub(1)
                .min(width - 1);
            let last = edges
                .partition_point(|v| *v <= b[2])
                .saturating_sub(1)
                .min(width - 1);
            let mut span: Vec<usize> = (first..=last)
                .filter(|c| {
                    b[2].min(bands[*c][1]) - b[0].max(bands[*c][0])
                        > 0.5 * (bands[*c][1] - bands[*c][0])
                })
                .collect();
            if span.is_empty() {
                span.push(first);
            }
            cells
                .entry(span[0])
                .and_modify(|(count, text)| {
                    *count = (*count).max(span.len());
                    text.push(' ');
                    text.push_str(&lines[i].text);
                })
                .or_insert((span.len(), lines[i].text.clone()));
        }
        out.push_str("<tr>");
        let mut c = 0;
        while c < width {
            if let Some((span, text)) = cells.get(&c) {
                let attr = if *span > 1 {
                    format!(" colspan=\"{span}\"")
                } else {
                    String::new()
                };
                out.push_str(&format!("<{tag}{attr}>{}</{tag}>", escape(text)));
                c += span;
            } else {
                out.push_str(&format!("<{tag}></{tag}>"));
                c += 1;
            }
        }
        out.push_str("</tr>\n");
    }
    out.push_str("</table>");
    out
}

fn union_box(lines: &[Line], ids: &[usize]) -> [f32; 4] {
    let mut out = [
        f32::INFINITY,
        f32::INFINITY,
        f32::NEG_INFINITY,
        f32::NEG_INFINITY,
    ];
    for i in ids {
        for a in 0..2 {
            out[a] = out[a].min(lines[*i].bbox[a]);
            out[a + 2] = out[a + 2].max(lines[*i].bbox[a + 2]);
        }
    }
    out.map(|v| (v * 10.0).round_ties_even() / 10.0)
}

fn markdown_part(lines: &[Line], ids: &[usize], class: usize) -> String {
    let texts: Vec<&str> = ids.iter().map(|i| lines[*i].text.as_str()).collect();
    if matches!(class, 2 | 3) {
        return String::new();
    }
    if texts.iter().all(|t| {
        let t = t.trim();
        t.len() > 2 && t.starts_with('$') && t.ends_with('$') && !t[1..t.len() - 1].contains('$')
    }) {
        return texts
            .iter()
            .map(|t| format!("$${}$$", &t.trim()[1..t.trim().len() - 1]))
            .collect::<Vec<_>>()
            .join("\n");
    }
    match class {
        1 => format!("## {}", join_lines(texts)),
        5 if ids.len() > 1 => table_html(lines, ids),
        4 => {
            let mut items: Vec<Vec<&str>> = vec![];
            for text in texts {
                if items.is_empty() || item_start(text) {
                    items.push(vec![text]);
                } else {
                    items.last_mut().unwrap().push(text);
                }
            }
            items
                .into_iter()
                .map(join_lines)
                .collect::<Vec<_>>()
                .join("\n")
        }
        _ => join_lines(texts),
    }
}

fn valid_output(out: &FloatOutput, count: usize, name: &str) -> Result<(), String> {
    if out.values.len() != count || out.values.iter().any(|v| !v.is_finite()) {
        return Err(format!(
            "invalid {name} output {:?}: expected {count} finite values",
            out.shape
        ));
    }
    Ok(())
}

pub fn arrange(
    lines: Vec<Line>,
    width: usize,
    height: usize,
    model: Option<&mut Model>,
) -> Result<(Vec<Line>, Vec<Block>, String), String> {
    if width == 0 || height == 0 {
        return Err("layout requires positive image dimensions".into());
    }
    if lines.iter().any(|l| {
        l.bbox.iter().any(|v| !v.is_finite()) || l.bbox[2] < l.bbox[0] || l.bbox[3] < l.bbox[1]
    }) {
        return Err("layout received invalid line coordinates".into());
    }
    let n = lines.len();
    if n == 0 {
        return Ok((vec![], vec![], String::new()));
    }
    let boxes: Vec<[f32; 4]> = lines.iter().map(|l| l.bbox).collect();
    let mut order = order_xycut(&boxes);
    let mut classes = vec![0.0; n * CLASSES.len()];
    let mut groups = cut_groups(
        &boxes,
        &(0..n).collect::<Vec<_>>(),
        median(boxes.iter().map(|b| b[3] - b[1])),
        0,
    );
    // Keep all lines in large pages while bounding the learned pairwise N² tensors.
    if n >= 2 && n <= MODEL_MAX_LINES {
        if let Some(model) = model {
            let outputs = model.order(line_features(&lines, width, height), n)?;
            let pair = outputs.first().ok_or("order model returned no tensors")?;
            valid_output(pair, n * n, "reading-order")?;
            if outputs.len() >= 3 {
                valid_output(&outputs[1], n * CLASSES.len(), "block-class")?;
                valid_output(&outputs[2], n * n, "same-block")?;
                classes = outputs[1].values.clone();
                let blocks = cluster(&outputs[2].values, n);
                order.clear();
                for k in block_order(&pair.values, &blocks, n) {
                    let block = &blocks[k];
                    let local = if matches!(class_of(block, &classes, CLASSES.len()), 5 | 8 | 9) {
                        top_down(&boxes, block)
                    } else {
                        order_xycut_subset(&boxes, block, 0)
                    };
                    order.extend(local);
                }
                groups.clear();
                for i in &order {
                    if let Some(last) = groups.last_mut() {
                        if outputs[2].values[last[last.len() - 1] * n + i] > 0.0 {
                            last.push(*i);
                            continue;
                        }
                    }
                    groups.push(vec![*i]);
                }
            } else {
                order = decode_order(&pair.values, n);
                groups = vec![order.clone()];
            }
        }
    }
    let mut blocks = Vec::with_capacity(groups.len());
    let mut markdown = vec![];
    for group in groups {
        let class = class_of(&group, &classes, CLASSES.len());
        blocks.push(Block {
            label: CLASSES[class].into(),
            bbox: union_box(&lines, &group),
            text: group
                .iter()
                .map(|i| lines[*i].text.as_str())
                .collect::<Vec<_>>()
                .join("\n"),
        });
        let text = markdown_part(&lines, &group, class);
        if !text.is_empty() {
            markdown.push(text);
        }
    }
    Ok((
        order.into_iter().map(|i| lines[i].clone()).collect(),
        blocks,
        markdown.join("\n\n"),
    ))
}
