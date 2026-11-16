use jobs_ocr::Line;
use jobs_ocr::layout::{
    arrange, cluster, decode_order, join_lines, line_features, order_xycut, table_html,
};

fn line(text: &str, bbox: [f32; 4]) -> Line {
    Line {
        text: text.into(),
        bbox,
        confidence: 0.95,
        script: "base".into(),
    }
}

#[test]
fn paragraph_join_preserves_cjk_and_rejoins_hyphenated_words() {
    assert_eq!(
        join_lines(["tumori-", "genesis", "study"]),
        "tumorigenesis study"
    );
    assert_eq!(join_lines(["中文", "段落"]), "中文段落");
    assert_eq!(join_lines(["한국어", "문장"]), "한국어 문장");
}

#[test]
fn pairwise_search_reads_confident_precedence() {
    let pair = [0.0, -8.0, -8.0, 8.0, 0.0, 8.0, 8.0, -8.0, 0.0];
    assert_eq!(decode_order(&pair, 3), vec![1, 2, 0]);
}

#[test]
fn average_linkage_does_not_join_groups_using_one_spurious_pair() {
    let same = [0.0, 5.0, 2.0, 5.0, 0.0, -8.0, 2.0, -8.0, 0.0];
    assert_eq!(cluster(&same, 3), vec![vec![0, 1], vec![2]]);
}

#[test]
fn xycut_finishes_a_column_before_the_next_column() {
    let boxes = [
        [200.0, 5.0, 280.0, 15.0],
        [0.0, 20.0, 80.0, 30.0],
        [0.0, 5.0, 80.0, 15.0],
        [200.0, 20.0, 280.0, 30.0],
    ];
    assert_eq!(order_xycut(&boxes), vec![2, 1, 0, 3]);
}

#[test]
fn text_features_include_wide_characters_and_empty_line_band() {
    let lines = [
        line("中文", [10.0, 10.0, 50.0, 20.0]),
        line("", [10.0, 30.0, 50.0, 40.0]),
    ];
    let features = line_features(&lines, 100, 100);
    assert_eq!(features.len(), 32);
    assert!((features[10] - 5.0f32.ln() / 5.0).abs() < 1e-6);
    assert_eq!(&features[26..], &[0.0; 6]);
    assert!(features.iter().all(|x| x.is_finite()));
}

#[test]
fn digit_features_follow_python_digit_instead_of_general_numeric() {
    let lines = [line("²½Ⅷ2", [0.0, 0.0, 80.0, 10.0])];
    let features = line_features(&lines, 100, 100);
    assert_eq!(features[11], 0.5);
}

#[test]
fn geometric_tables_escape_html_and_keep_header_rows() {
    let lines = [
        line("A&B", [0.0, 0.0, 30.0, 10.0]),
        line("<C>", [50.0, 0.0, 80.0, 10.0]),
        line("one", [0.0, 25.0, 30.0, 35.0]),
        line("two", [50.0, 25.0, 80.0, 35.0]),
    ];
    let html = table_html(&lines, &[0, 1, 2, 3]);
    assert!(html.contains("<tr><th>A&amp;B</th><th>&lt;C&gt;</th></tr>"));
    assert!(html.contains("<tr><td>one</td><td>two</td></tr>"));
}

#[test]
fn empty_and_invalid_pages_are_explicit() {
    let (lines, blocks, markdown) = arrange(vec![], 100, 100, None).unwrap();
    assert!(lines.is_empty() && blocks.is_empty() && markdown.is_empty());
    assert!(arrange(vec![], 0, 100, None).is_err());
    assert!(arrange(vec![line("bad", [10.0, 0.0, 5.0, 10.0])], 100, 100, None).is_err());
}

#[test]
fn large_pages_keep_every_line_without_quadratic_model_input() {
    let lines: Vec<Line> = (0..600)
        .map(|i| {
            line(
                &format!("row {i}"),
                [0.0, i as f32 * 15.0, 100.0, i as f32 * 15.0 + 10.0],
            )
        })
        .collect();
    let (ordered, blocks, markdown) = arrange(lines, 200, 10000, None).unwrap();
    assert_eq!(ordered.len(), 600);
    assert_eq!(ordered[0].text, "row 0");
    assert_eq!(ordered[599].text, "row 599");
    assert!(!blocks.is_empty());
    assert!(markdown.contains("row 599"));
}

#[test]
fn upstream_python_reference_matches_features_order_and_clustering() {
    let reference: serde_json::Value =
        serde_json::from_str(include_str!("layout_reference.json")).unwrap();
    let boxes: Vec<[f32; 4]> = serde_json::from_value(reference["boxes"].clone()).unwrap();
    let texts: Vec<String> = serde_json::from_value(reference["texts"].clone()).unwrap();
    let lines: Vec<Line> = boxes
        .iter()
        .zip(&texts)
        .map(|(bbox, text)| line(text, *bbox))
        .collect();
    let expected: Vec<Vec<f32>> = serde_json::from_value(reference["features"].clone()).unwrap();
    for (actual, expected) in line_features(&lines, 400, 200)
        .iter()
        .zip(expected.into_iter().flatten())
    {
        assert!(
            (actual - expected).abs() < 2e-6,
            "feature mismatch: {actual} vs {expected}"
        );
    }
    let xycut: Vec<usize> = serde_json::from_value(reference["xycut"].clone()).unwrap();
    assert_eq!(order_xycut(&boxes), xycut);
    let pair: Vec<Vec<f32>> = serde_json::from_value(reference["pairwise"].clone()).unwrap();
    let expected_order: Vec<usize> =
        serde_json::from_value(reference["pair_order"].clone()).unwrap();
    assert_eq!(
        decode_order(&pair.into_iter().flatten().collect::<Vec<_>>(), 9),
        expected_order
    );
    let same: Vec<Vec<f32>> = serde_json::from_value(reference["same"].clone()).unwrap();
    let expected_groups: Vec<Vec<usize>> =
        serde_json::from_value(reference["clusters"].clone()).unwrap();
    assert_eq!(
        cluster(&same.into_iter().flatten().collect::<Vec<_>>(), 9),
        expected_groups
    );
}
