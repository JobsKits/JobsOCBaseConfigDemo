pub mod layout;
pub mod lm;
pub mod pipeline;
pub mod pixels;
pub mod runtime;

use image::ImageDecoder;
use serde::{Deserialize, Serialize};
use std::{
    ffi::{CStr, CString, c_char, c_void},
    path::{Path, PathBuf},
    sync::{
        Mutex, OnceLock,
        atomic::{AtomicBool, Ordering},
    },
};

pub const VERSION: &str = "0.1.0";
static API_READY: AtomicBool = AtomicBool::new(false);
static ENGINE: OnceLock<Mutex<Option<(PathBuf, pipeline::Engine)>>> = OnceLock::new();

#[derive(Clone, Serialize)]
pub struct Line {
    pub text: String,
    pub bbox: [f32; 4],
    pub confidence: f32,
    pub script: String,
}

#[derive(Serialize)]
pub struct OcrResult {
    pub ok: bool,
    pub engine: String,
    pub version: String,
    pub text: String,
    pub markdown: String,
    pub lines: Vec<Line>,
    pub blocks: Vec<layout::Block>,
    pub width: usize,
    pub height: usize,
    pub rotation: usize,
    pub skew: f64,
    pub elapsed_ms: f64,
    pub notes: Vec<String>,
}

#[derive(Clone, Deserialize)]
#[serde(default)]
pub struct Options {
    pub max_side: usize,
    pub max_lines: usize,
    pub deskew: bool,
    pub orientation: bool,
    pub language_model: bool,
    pub min_confidence: f32,
}

impl Default for Options {
    fn default() -> Self {
        Self {
            max_side: 2400,
            max_lines: 2000,
            deskew: true,
            orientation: true,
            language_model: true,
            min_confidence: 0.5,
        }
    }
}

pub fn recognize(
    gray: pixels::Gray,
    model_dir: &Path,
    options: Options,
) -> runtime::Result<OcrResult> {
    if !API_READY.load(Ordering::Acquire) {
        return Err("ONNX Runtime API is not installed".into());
    }
    if !(1..=4000).contains(&options.max_lines)
        || !options.min_confidence.is_finite()
        || !(0.0..=1.0).contains(&options.min_confidence)
    {
        return Err("Invalid OCR options".into());
    }
    let canonical = model_dir
        .canonicalize()
        .map_err(|e| format!("Model directory: {e}"))?;
    let mut slot = ENGINE
        .get_or_init(|| Mutex::new(None))
        .lock()
        .map_err(|_| "OCR state unavailable after panic")?;
    if slot.as_ref().is_none_or(|(path, _)| path != &canonical) {
        *slot = None;
        *slot = Some((canonical.clone(), pipeline::Engine::load(&canonical)?));
    }
    slot.as_mut()
        .ok_or("Engine not loaded")?
        .1
        .recognize(gray, options)
}

/// # Safety
/// `api` must point to a live ONNX Runtime GetApi(17) table. Its code remains loaded for the process lifetime.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn jobs_ocr_install_ort_api(api: *const c_void) -> i32 {
    if api.is_null() {
        return -1;
    }
    if API_READY.load(Ordering::Acquire) {
        return 0;
    }
    let result = std::panic::catch_unwind(|| {
        let table = unsafe { std::ptr::read(api.cast::<ort::sys::OrtApi>()) };
        ort::set_api(table);
        API_READY.store(true, Ordering::Release);
    });
    if result.is_ok() { 0 } else { -2 }
}

#[unsafe(no_mangle)]
pub extern "C" fn jobs_ocr_version() -> *const c_char {
    c"jobs-rust-ocr/0.1.0".as_ptr()
}

#[unsafe(no_mangle)]
pub extern "C" fn jobs_ocr_cancel_all() {
    pipeline::CANCEL_GENERATION.fetch_add(1, Ordering::Relaxed);
}

/// # Safety
/// Caller supplies valid readable buffers/UTF-8 NUL-terminated paths; stride*height bytes are available.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn jobs_ocr_recognize_rgba(
    pixels: *const u8,
    width: u32,
    height: u32,
    stride: usize,
    model_dir: *const c_char,
    options_json: *const c_char,
) -> *mut c_char {
    json_boundary(|| {
        if pixels.is_null() {
            return Err("Missing pixels".into());
        }
        let length = stride
            .checked_mul(height as usize)
            .filter(|n| *n <= 128_000_000)
            .ok_or("Image buffer exceeds limit")?;
        if width == 0
            || height == 0
            || stride
                < (width as usize)
                    .checked_mul(4)
                    .ok_or("Image dimensions overflow")?
        {
            return Err("Invalid image dimensions or stride".into());
        }
        let data = unsafe { std::slice::from_raw_parts(pixels, length) };
        let gray = pixels::Gray::rgba(data, width as usize, height as usize, stride)?;
        let folder = unsafe { string_argument(model_dir) }?;
        let options = unsafe { parse_options(options_json) }?;
        recognize(gray, Path::new(&folder), options)
    })
}

/// # Safety
/// Caller supplies valid UTF-8 NUL-terminated strings. The returned string belongs to Rust.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn jobs_ocr_recognize_file(
    path: *const c_char,
    model_dir: *const c_char,
    options_json: *const c_char,
) -> *mut c_char {
    json_boundary(|| {
        let file = unsafe { string_argument(path) }?;
        let folder = unsafe { string_argument(model_dir) }?;
        let options = unsafe { parse_options(options_json) }?;
        let metadata = std::fs::metadata(&file).map_err(|e| e.to_string())?;
        if metadata.len() > 64_000_000 {
            return Err("Encoded image exceeds 64 MB".into());
        }
        let mut reader = image::ImageReader::open(&file).map_err(|e| e.to_string())?;
        let mut limits = image::Limits::default();
        limits.max_image_width = Some(20_000);
        limits.max_image_height = Some(20_000);
        limits.max_alloc = Some(128_000_000);
        reader.limits(limits);
        let mut decoder = reader.into_decoder().map_err(|e| e.to_string())?;
        let (width, height) = decoder.dimensions();
        if u64::from(width) * u64::from(height) > 24_000_000 {
            return Err("Image exceeds 24 megapixels".into());
        }
        let orientation = decoder.orientation().map_err(|e| e.to_string())?;
        let mut decoded = image::DynamicImage::from_decoder(decoder).map_err(|e| e.to_string())?;
        decoded.apply_orientation(orientation);
        let image = decoded.to_rgba8();
        let gray = pixels::Gray::rgba(
            image.as_raw(),
            image.width() as usize,
            image.height() as usize,
            image.width() as usize * 4,
        )?;
        recognize(gray, Path::new(&folder), options)
    })
}

/// # Safety
/// `value` is null or a live pointer returned by an OCR JSON function; release it once only.
#[unsafe(no_mangle)]
pub unsafe extern "C" fn jobs_ocr_string_free(value: *mut c_char) {
    if !value.is_null() {
        unsafe {
            drop(CString::from_raw(value));
        }
    }
}

unsafe fn string_argument(value: *const c_char) -> runtime::Result<String> {
    if value.is_null() {
        return Err("Missing string argument".into());
    }
    unsafe { CStr::from_ptr(value) }
        .to_str()
        .map(str::to_owned)
        .map_err(|e| e.to_string())
}

unsafe fn parse_options(value: *const c_char) -> runtime::Result<Options> {
    if value.is_null() {
        return Ok(Options::default());
    }
    let value = unsafe { string_argument(value) }?;
    if value.is_empty() {
        return Ok(Options::default());
    }
    serde_json::from_str(&value).map_err(|e| format!("Invalid options JSON: {e}"))
}

fn json_boundary<F: FnOnce() -> runtime::Result<OcrResult>>(action: F) -> *mut c_char {
    let value = match std::panic::catch_unwind(std::panic::AssertUnwindSafe(action)) {
        Ok(Ok(result)) => serde_json::to_string(&result)
            .unwrap_or_else(|_| "{\"ok\":false,\"error\":\"Serialization failed\"}".into()),
        Ok(Err(error)) => serde_json::json!({"ok":false,"error":error}).to_string(),
        Err(_) => "{\"ok\":false,\"error\":\"OCR internal panic\"}".into(),
    };
    CString::new(value)
        .expect("JSON cannot contain literal NUL")
        .into_raw()
}
