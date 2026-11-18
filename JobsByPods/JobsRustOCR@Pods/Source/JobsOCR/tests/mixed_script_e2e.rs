use std::{path::PathBuf, process::Command};

/// Run explicitly with a matching local ONNX Runtime; never downloads models.
#[test]
#[ignore = "requires JOBS_OCR_RUNTIME and the local Indra models"]
fn mixed_script_images_preserve_chinese_and_ascii() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let runtime = std::env::var_os("JOBS_OCR_RUNTIME")
        .expect("set JOBS_OCR_RUNTIME to a local runtime library");
    let models = std::env::var_os("JOBS_OCR_MODELS")
        .map(PathBuf::from)
        .unwrap_or_else(|| root.join("Models"));
    let fixtures = root.join("tests/Fixtures/MixedScript");
    let manifest: serde_json::Value =
        serde_json::from_slice(&std::fs::read(fixtures.join("expected.json")).unwrap()).unwrap();
    for case in manifest["cases"].as_array().unwrap() {
        let name = case["file"].as_str().unwrap();
        let output = Command::new(env!("CARGO_BIN_EXE_jobs-ocr"))
            .arg(&runtime)
            .arg(&models)
            .arg(fixtures.join(name))
            .output()
            .unwrap();
        assert!(
            output.status.success(),
            "{name}: {}",
            String::from_utf8_lossy(&output.stderr)
        );
        let result: serde_json::Value = serde_json::from_slice(&output.stdout).unwrap();
        assert_eq!(result["ok"], true, "{name}: {result}");
        let text = result["text"].as_str().unwrap();
        let normalized = text.split_whitespace().collect::<Vec<_>>().join(" ");
        if case["exact_lines"] == true {
            let actual: Vec<_> = text.lines().map(str::trim).collect();
            let expected: Vec<_> = case["lines"]
                .as_array()
                .unwrap()
                .iter()
                .map(|line| line.as_str().unwrap())
                .collect();
            assert_eq!(actual, expected, "{name}: control text changed");
        }
        for field in ["required_fragments", "ascii_fragments_to_preserve"] {
            for fragment in case[field].as_array().unwrap() {
                let expected = fragment.as_str().unwrap();
                assert!(
                    normalized.contains(expected),
                    "{name} lost {expected:?}; actual {text:?}"
                );
            }
        }
    }
}
