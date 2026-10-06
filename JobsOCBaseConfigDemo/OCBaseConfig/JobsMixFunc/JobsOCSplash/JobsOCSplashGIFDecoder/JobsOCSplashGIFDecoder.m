//
//  JobsOCSplashGIFDecoder.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsOCSplashGIFDecoder.h"

@implementation JobsOCSplashGIFDecoder
+(nullable UIImage *)imageWithData:(NSData *)data {
    return ((((JobsRetImageByDataBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsOCSplashGIFDecoder.class, @selector(imageWithData)))(self, @selector(imageWithData))))(data);
}
+(JobsRetImageByDataBlock _Nonnull)imageWithData{
    return ^UIImage *(NSData * data){
        if (!data.length || data.length > 16 * 1024 * 1024) return nil;
        CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, nil);
        if (!source) return nil;
        size_t frameCount = CGImageSourceGetCount(source);
        uint64_t pixelBudget = 0;
        if (!frameCount || frameCount > 120) {
            CFRelease(source);
            return nil;
        }
        for (size_t index = 0; index < frameCount; index++) {
            NSDictionary *properties = CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(source, index, nil));
            uint64_t width = [properties[(NSString *)kCGImagePropertyPixelWidth] unsignedLongLongValue];
            uint64_t height = [properties[(NSString *)kCGImagePropertyPixelHeight] unsignedLongLongValue];
            if (!width || !height || width > 8192 || height > 8192 || width * height > 24 * 1024 * 1024 - pixelBudget) {
                CFRelease(source);
                return nil;
            }
            pixelBudget += width * height;
        }
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
    };
}

+(NSTimeInterval)frameDurationWithSource:(CGImageSourceRef)source index:(size_t)index {
    NSDictionary *properties = CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(source, index, nil));
    NSDictionary *gif = properties[(NSString *)kCGImagePropertyGIFDictionary];
    NSNumber *unclamped = gif[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    NSNumber *clamped = gif[(NSString *)kCGImagePropertyGIFDelayTime];
    return MAX((unclamped ?: clamped ?: @0.1).doubleValue, 0.02);
}

@end
