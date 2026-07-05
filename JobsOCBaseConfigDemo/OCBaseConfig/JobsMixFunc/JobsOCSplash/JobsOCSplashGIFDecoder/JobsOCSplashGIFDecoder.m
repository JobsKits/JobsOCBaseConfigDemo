//
//  JobsOCSplashGIFDecoder.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsOCSplashGIFDecoder.h"

@implementation JobsOCSplashGIFDecoder

+(nullable UIImage *)imageWithData:(NSData *)data {
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, nil);
    if (!source) return nil;

    size_t frameCount = CGImageSourceGetCount(source);
    if (frameCount <= 1) {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, 0, nil);
        UIImage *image = imageRef ? [UIImage imageWithCGImage:imageRef] : nil;
        if (imageRef) CGImageRelease(imageRef);
        CFRelease(source);
        return image;
    }

    NSMutableArray<UIImage *> *frames = NSMutableArray.array;
    NSTimeInterval duration = 0;
    for (size_t index = 0; index < frameCount; index++) {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, index, nil);
        if (!imageRef) continue;
        [frames addObject:[UIImage imageWithCGImage:imageRef]];
        duration += [self frameDurationWithSource:source index:index];
        CGImageRelease(imageRef);
    }
    CFRelease(source);
    if (!frames.count) return nil;
    return [UIImage animatedImageWithImages:frames duration:MAX(duration, 0.1)];
}

+(NSTimeInterval)frameDurationWithSource:(CGImageSourceRef)source index:(size_t)index {
    NSDictionary *properties = CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(source, index, nil));
    NSDictionary *gif = properties[(NSString *)kCGImagePropertyGIFDictionary];
    NSNumber *unclamped = gif[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    NSNumber *clamped = gif[(NSString *)kCGImagePropertyGIFDelayTime];
    return MAX((unclamped ?: clamped ?: @0.1).doubleValue, 0.02);
}

@end
