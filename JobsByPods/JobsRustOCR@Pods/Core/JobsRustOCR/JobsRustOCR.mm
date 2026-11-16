//
//  JobsRustOCR.mm
//  JobsRustOCR
//
//  Created by Jobs on 2026年11月16日，星期一.
//

#import "JobsRustOCR.h"
#import "JobsRustOCRPrivate.h"

NSString * const JobsRustOCRErrorDomain = @"com.jobs.ocr";
static const size_t JobsOCRMaximumSide = 2400;
static const NSUInteger JobsOCRMaximumEncodedBytes = 64 * 1024 * 1024;
static std::atomic<uint64_t> JobsOCRRequestGeneration(0);

static NSError *JobsOCRError(NSInteger code, NSString *message) {
    return [NSError errorWithDomain:JobsRustOCRErrorDomain
                              code:code
                          userInfo:@{NSLocalizedDescriptionKey: message ?: @"OCR failed."}];
}

static dispatch_queue_t JobsOCRWorkerQueue(void) {
    static dispatch_queue_t queue;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        queue = dispatch_queue_create("com.jobs.ocr.inference", DISPATCH_QUEUE_SERIAL);
    });
    return queue;
}

static NSBundle *JobsOCRResources(void) {
    NSArray<NSBundle *> *candidates = @[[NSBundle bundleForClass:JobsRustOCR.class], NSBundle.mainBundle];
    for (NSBundle *candidate in candidates) {
        NSURL *url = [candidate URLForResource:@"JobsRustOCRResources" withExtension:@"bundle"];
        NSBundle *bundle = url ? [NSBundle bundleWithURL:url] : nil;
        if (bundle) {
            return bundle;
        }
        if ([candidate.bundleURL.lastPathComponent isEqualToString:@"JobsRustOCRResources.bundle"]) {
            return candidate;
        }
    }
    return nil;
}

static NSString *JobsOCRModelsDirectory(NSError **error) {
    NSBundle *bundle = JobsOCRResources();
    NSURL *folder = [bundle.resourceURL URLByAppendingPathComponent:@"Models" isDirectory:YES];
    for (NSString *name in @[@"meta.json", @"det.onnx", @"rec.onnx"]) {
        if (!folder || ![NSFileManager.defaultManager isReadableFileAtPath:[folder URLByAppendingPathComponent:name].path]) {
            if (error) {
                *error = JobsOCRError(1, @"The bundled OCR models are missing. Rebuild with JobsRustOCRResources.bundle.");
            }
            return nil;
        }
    }
    return folder.path;
}

static BOOL JobsOCRInitializeRuntime(NSError **error) {
    static int32_t result = -1;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        const OrtApiBase *base = OrtGetApiBase();
        const OrtApi *api = base ? base->GetApi(17) : nullptr;
        result = api ? jobs_ocr_install_ort_api(api) : -1;
    });
    if (result != 0 && error) {
        *error = JobsOCRError(3, @"The bundled ONNX Runtime does not provide the required C API version 17.");
    }
    return result == 0;
}

static CGImageRef JobsOCRDecodeThumbnail(NSData *data) {
    if (!data.length || data.length > JobsOCRMaximumEncodedBytes) {
        return nullptr;
    }
    NSDictionary *sourceOptions = @{(__bridge NSString *)kCGImageSourceShouldCache: @NO};
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, (__bridge CFDictionaryRef)sourceOptions);
    if (!source) {
        return nullptr;
    }
    // ImageIO applies the file orientation while downsampling before a full-size bitmap is allocated.
    NSDictionary *thumbnailOptions = @{
        (__bridge NSString *)kCGImageSourceCreateThumbnailFromImageAlways: @YES,
        (__bridge NSString *)kCGImageSourceCreateThumbnailWithTransform: @YES,
        (__bridge NSString *)kCGImageSourceThumbnailMaxPixelSize: @(JobsOCRMaximumSide),
        (__bridge NSString *)kCGImageSourceShouldCacheImmediately: @YES
    };
    CGImageRef image = CGImageSourceCreateThumbnailAtIndex(source, 0, (__bridge CFDictionaryRef)thumbnailOptions);
    CFRelease(source);
    return image;
}

static BOOL JobsOCRRasterize(JobsOCRPlatformImage *image,
                             NSMutableData **pixels,
                             size_t *width,
                             size_t *height,
                             size_t *stride,
                             NSError **error) {
    if (!image) {
        if (error) {
            *error = JobsOCRError(2, @"Select a readable image before starting OCR.");
        }
        return NO;
    }
#if TARGET_OS_OSX
    NSRect proposed = NSMakeRect(0, 0, image.size.width, image.size.height);
    CGImageRef source = [image CGImageForProposedRect:&proposed context:nil hints:nil];
    double originalWidth = source ? CGImageGetWidth(source) : 0;
    double originalHeight = source ? CGImageGetHeight(source) : 0;
#else
    CGImageRef source = image.CGImage;
    double originalWidth = source ? CGImageGetWidth(source) : image.size.width * image.scale;
    double originalHeight = source ? CGImageGetHeight(source) : image.size.height * image.scale;
    BOOL swapsAxes = image.imageOrientation == UIImageOrientationLeft ||
                     image.imageOrientation == UIImageOrientationRight ||
                     image.imageOrientation == UIImageOrientationLeftMirrored ||
                     image.imageOrientation == UIImageOrientationRightMirrored;
    if (swapsAxes) {
        std::swap(originalWidth, originalHeight);
    }
#endif
    if (!std::isfinite(originalWidth) || !std::isfinite(originalHeight) || originalWidth <= 0 || originalHeight <= 0) {
        if (error) {
            *error = JobsOCRError(2, @"The image has no usable pixel dimensions.");
        }
        return NO;
    }
    double ratio = std::min(1.0, (double)JobsOCRMaximumSide / std::max(originalWidth, originalHeight));
    *width = std::max((size_t)1, (size_t)std::llround(originalWidth * ratio));
    *height = std::max((size_t)1, (size_t)std::llround(originalHeight * ratio));
    *stride = *width * 4;
    NSMutableData *storage = [NSMutableData dataWithLength:*stride * *height];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(storage.mutableBytes, *width, *height, 8, *stride,
                                               colorSpace, kCGBitmapByteOrder32Big | kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);
    if (!context) {
        if (error) {
            *error = JobsOCRError(2, @"The image pixel buffer could not be allocated.");
        }
        return NO;
    }
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextFillRect(context, CGRectMake(0, 0, *width, *height));
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
#if TARGET_OS_OSX
    CGContextDrawImage(context, CGRectMake(0, 0, *width, *height), source);
#else
    // UIImage drawing honors all eight orientation values. The flipped context stores upright rows.
    CGContextTranslateCTM(context, 0, *height);
    CGContextScaleCTM(context, 1, -1);
    UIGraphicsPushContext(context);
    [image drawInRect:CGRectMake(0, 0, *width, *height)];
    UIGraphicsPopContext();
#endif
    CGContextRelease(context);
    *pixels = storage;
    return YES;
}

static NSDictionary *JobsOCRRun(JobsOCRPlatformImage *image, uint64_t generation, NSError **error) {
    if (generation != JobsOCRRequestGeneration.load()) {
        *error = JobsOCRError(5, @"OCR was cancelled.");
        return nil;
    }
    NSString *models = JobsOCRModelsDirectory(error);
    if (!models || !JobsOCRInitializeRuntime(error)) {
        return nil;
    }
    NSMutableData *pixels = nil;
    size_t width = 0;
    size_t height = 0;
    size_t stride = 0;
    if (!JobsOCRRasterize(image, &pixels, &width, &height, &stride, error)) {
        return nil;
    }
    if (generation != JobsOCRRequestGeneration.load()) {
        *error = JobsOCRError(5, @"OCR was cancelled.");
        return nil;
    }
    char *json = jobs_ocr_recognize_rgba((const uint8_t *)pixels.bytes, (uint32_t)width, (uint32_t)height,
                                       stride, models.UTF8String, nullptr);
    if (!json) {
        *error = JobsOCRError(4, @"The OCR core returned no result.");
        return nil;
    }
    NSDictionary *result = nil;
    @try {
        NSData *data = [NSData dataWithBytes:json length:std::strlen(json)];
        id value = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
        if (![value isKindOfClass:NSDictionary.class]) {
            if (!*error) {
                *error = JobsOCRError(6, @"The OCR core returned invalid JSON.");
            }
            return nil;
        }
        result = value;
    } @finally {
        jobs_ocr_string_free(json);
    }
    if (generation != JobsOCRRequestGeneration.load()) {
        *error = JobsOCRError(5, @"OCR was cancelled.");
        return nil;
    }
    if (![result[@"ok"] boolValue]) {
        NSString *message = [result[@"error"] isKindOfClass:NSString.class] ? result[@"error"] : @"OCR failed.";
        NSInteger code = [message.lowercaseString containsString:@"cancel"] ? 5 : 4;
        *error = JobsOCRError(code, message);
        return nil;
    }
    return result;
}

@implementation JobsRustOCR

+(NSString *)coreVersion{
    const char *value = jobs_ocr_version();
    return value ? [NSString stringWithUTF8String:value] : @"unknown";
}

+(JobsOCRPlatformImage *)imageFromData:(NSData *)data{
    CGImageRef image = JobsOCRDecodeThumbnail(data);
    if (!image) {
        return nil;
    }
#if TARGET_OS_OSX
    NSImage *result = [NSImage.alloc initWithCGImage:image size:NSZeroSize];
#else
    UIImage *result = [UIImage imageWithCGImage:image scale:1 orientation:UIImageOrientationUp];
#endif
    CGImageRelease(image);
    return result;
}

+(JobsOCRPlatformImage *)sampleImage{
    NSURL *url = [JobsOCRResources() URLForResource:@"sample" withExtension:@"png"];
    NSData *data = url ? [NSData dataWithContentsOfURL:url] : nil;
    return data ? [self imageFromData:data] : nil;
}

+(void)recognizeImage:(JobsOCRPlatformImage *)image completion:(JobsRustOCRCompletion)completion{
    if (!completion) {
        return;
    }
    uint64_t generation = JobsOCRRequestGeneration.load();
    dispatch_async(JobsOCRWorkerQueue(), ^{
        @autoreleasepool {
            NSError *error = nil;
            NSDictionary *result = JobsOCRRun(image, generation, &error);
            dispatch_async(dispatch_get_main_queue(), ^{
                if (generation != JobsOCRRequestGeneration.load()) {
                    completion(nil, JobsOCRError(5, @"OCR was cancelled."));
                } else {
                    completion(result, error);
                }
            });
        }
    });
}

+(void)recognizeImageData:(NSData *)data completion:(JobsRustOCRCompletion)completion{
    if (!completion) {
        return;
    }
    if (!data.length || data.length > JobsOCRMaximumEncodedBytes) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(nil, JobsOCRError(2, @"The encoded image is invalid or exceeds the 64 MiB input limit."));
        });
        return;
    }
    // NSData may be mutable at the caller; freeze it before crossing the queue boundary.
    NSData *snapshot = data.copy;
    uint64_t generation = JobsOCRRequestGeneration.load();
    dispatch_async(JobsOCRWorkerQueue(), ^{
        @autoreleasepool {
            NSError *error = nil;
            JobsOCRPlatformImage *image = [self imageFromData:snapshot];
            NSDictionary *result = image ? JobsOCRRun(image, generation, &error) : nil;
            if (!image) {
                error = JobsOCRError(2, @"The encoded image is invalid or exceeds the 64 MiB input limit.");
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                if (generation != JobsOCRRequestGeneration.load()) {
                    completion(nil, JobsOCRError(5, @"OCR was cancelled."));
                } else {
                    completion(result, error);
                }
            });
        }
    });
}

+(void)cancel{
    JobsOCRRequestGeneration.fetch_add(1);
    jobs_ocr_cancel_all();
}

@end
