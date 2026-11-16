#ifndef JOBS_OCR_CORE_H
#define JOBS_OCR_CORE_H
#include <stdint.h>
#include <stddef.h>
#ifdef __cplusplus
extern "C" {
#endif
/* Install ONNX Runtime GetApi(17). Runtime must remain loaded until process exit. */
int32_t jobs_ocr_install_ort_api(const void *api);
const char *jobs_ocr_version(void);
/* Returned UTF-8 JSON is owned by Rust; release exactly once with string_free. */
char *jobs_ocr_recognize_rgba(const uint8_t *pixels, uint32_t width, uint32_t height,
                            size_t stride, const char *model_dir, const char *options_json);
char *jobs_ocr_recognize_file(const char *image_path, const char *model_dir, const char *options_json);
void jobs_ocr_cancel_all(void);
void jobs_ocr_string_free(char *value);
#ifdef __cplusplus
}
#endif
#endif
