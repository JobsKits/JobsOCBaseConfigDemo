use jobs_ocr::pixels::Gray;
use std::ffi::CStr;

#[test]
fn padded_rgba_rows_do_not_become_pixels() {
    let image = Gray::rgba(
        &[255, 0, 0, 255, 0, 0, 0, 0, 0, 255, 0, 255, 0, 0, 0, 0],
        1,
        2,
        8,
    )
    .unwrap();
    assert_eq!(image.pixels, vec![76, 150]);
}

#[test]
fn invalid_buffers_are_rejected() {
    assert!(Gray::rgba(&[0; 8], 2, 2, 8).is_err());
    assert!(Gray::rgba(&[], 0, 2, 0).is_err());
    assert!(Gray::rgba(&[], 20_000, 20_000, 80_000).is_err());
}

#[test]
fn single_glyph_has_model_safe_padding() {
    let gray = Gray {
        width: 1,
        height: 10,
        pixels: vec![0; 10],
    };
    let (width, data) = gray.crop_line([0., 0., 1., 10.], 32, 1);
    assert!(width >= 8);
    assert_eq!(data.len() % 32, 0);
    assert!(data.len() >= 32 * 32);
}

#[test]
fn null_ffi_has_machine_readable_error() {
    let result = unsafe {
        jobs_ocr::jobs_ocr_recognize_rgba(
            std::ptr::null(),
            1,
            1,
            4,
            std::ptr::null(),
            std::ptr::null(),
        )
    };
    let value: serde_json::Value =
        serde_json::from_str(unsafe { CStr::from_ptr(result) }.to_str().unwrap()).unwrap();
    assert_eq!(value["ok"], false);
    unsafe { jobs_ocr::jobs_ocr_string_free(result) };
}

#[test]
fn four_quarter_turns_preserve_pixels() {
    let gray = Gray {
        width: 3,
        height: 2,
        pixels: vec![1, 2, 3, 4, 5, 6],
    };
    let rotated = gray.rotate_quarters(4);
    assert_eq!(rotated.pixels, gray.pixels);
    assert_eq!(
        gray.rotate_quarters(1).rotate_quarters(3).pixels,
        gray.pixels
    );
}
