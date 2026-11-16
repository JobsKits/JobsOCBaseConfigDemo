use std::{
    ffi::{CStr, CString, c_char, c_void},
    path::PathBuf,
};

#[cfg(unix)]
unsafe extern "C" {
    fn dlopen(path: *const c_char, flags: i32) -> *mut c_void;
    fn dlsym(handle: *mut c_void, symbol: *const c_char) -> *mut c_void;
}
#[cfg(windows)]
#[link(name = "kernel32")]
unsafe extern "system" {
    fn LoadLibraryW(path: *const u16) -> *mut c_void;
    fn GetProcAddress(handle: *mut c_void, symbol: *const c_char) -> *mut c_void;
}

fn run() -> Result<(), String> {
    let args: Vec<String> = std::env::args().collect();
    if args.len() < 4 {
        return Err(
            "Usage: jobs-ocr <runtime-library> <model-folder> <image> [output.json]".into(),
        );
    }
    let library = PathBuf::from(&args[1])
        .canonicalize()
        .map_err(|e| e.to_string())?;
    #[cfg(unix)]
    let handle = unsafe {
        dlopen(
            CString::new(library.to_string_lossy().as_bytes())
                .map_err(|e| e.to_string())?
                .as_ptr(),
            2,
        )
    };
    #[cfg(windows)]
    let handle = {
        use std::os::windows::ffi::OsStrExt;
        let path: Vec<u16> = library.as_os_str().encode_wide().chain(Some(0)).collect();
        unsafe { LoadLibraryW(path.as_ptr()) }
    };
    if handle.is_null() {
        return Err(format!("Cannot load runtime {}", library.display()));
    }
    #[cfg(unix)]
    let symbol = unsafe { dlsym(handle, c"OrtGetApiBase".as_ptr()) };
    #[cfg(windows)]
    let symbol = unsafe { GetProcAddress(handle, c"OrtGetApiBase".as_ptr()) };
    if symbol.is_null() {
        return Err("Runtime does not export OrtGetApiBase".into());
    }
    let getter: unsafe extern "system" fn() -> *const ort::sys::OrtApiBase =
        unsafe { std::mem::transmute(symbol) };
    let base = unsafe { getter() };
    if base.is_null() {
        return Err("Runtime returned no API base".into());
    }
    let api = unsafe { ((*base).GetApi)(17) };
    if unsafe { jobs_ocr::jobs_ocr_install_ort_api(api.cast()) } != 0 {
        return Err("Incompatible ONNX Runtime API".into());
    }
    let image = CString::new(args[3].as_str()).map_err(|e| e.to_string())?;
    let models = CString::new(args[2].as_str()).map_err(|e| e.to_string())?;
    let out = unsafe {
        jobs_ocr::jobs_ocr_recognize_file(image.as_ptr(), models.as_ptr(), std::ptr::null())
    };
    let json = unsafe { CStr::from_ptr(out) }
        .to_string_lossy()
        .into_owned();
    unsafe { jobs_ocr::jobs_ocr_string_free(out) };
    if let Some(path) = args.get(4) {
        std::fs::write(path, &json).map_err(|e| e.to_string())?;
    } else {
        println!("{json}");
    }
    let result: serde_json::Value = serde_json::from_str(&json).map_err(|e| e.to_string())?;
    if result["ok"] != true {
        return Err(result["error"].as_str().unwrap_or("OCR failed").into());
    }
    Ok(())
}

fn main() {
    if let Err(error) = run() {
        eprintln!("{error}");
        std::process::exit(1);
    }
}
