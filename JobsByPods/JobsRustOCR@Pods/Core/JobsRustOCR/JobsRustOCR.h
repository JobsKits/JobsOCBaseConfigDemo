//
//  JobsRustOCR.h
//  JobsRustOCR
//
//  Created by Jobs on 2026年11月16日，星期一.
//

#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#if TARGET_OS_OSX
#import <AppKit/AppKit.h>
#define JobsOCRPlatformImage NSImage
#else
#import <UIKit/UIKit.h>
#define JobsOCRPlatformImage UIImage
#endif

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const JobsRustOCRErrorDomain;
typedef void(^JobsRustOCRCompletion)(NSDictionary<NSString *, id> * _Nullable result,
                                    NSError * _Nullable error);

@interface JobsRustOCR : NSObject

+(NSString *)coreVersion NS_SWIFT_NAME(coreVersion());
+(nullable JobsOCRPlatformImage *)sampleImage NS_SWIFT_NAME(sampleImage());
+(nullable JobsOCRPlatformImage *)imageFromData:(NSData *)data NS_SWIFT_NAME(image(from:));
// Images are normalized to an upright, white-backed RGBA buffer of at most 2400px per side.
+(void)recognizeImage:(JobsOCRPlatformImage *)image
          completion:(JobsRustOCRCompletion)completion NS_SWIFT_NAME(recognize(image:completion:));
+(void)recognizeImageData:(NSData *)data
              completion:(JobsRustOCRCompletion)completion NS_SWIFT_NAME(recognize(data:completion:));
// Cancels the running request and queued requests. Completion is always delivered on the main queue.
+(void)cancel;

@end

NS_ASSUME_NONNULL_END
