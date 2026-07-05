//
//  JobsOCVideoRecorderCIFilterProcessor.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCVideoRecorderCIFilterProcessor.h"

@interface JobsOCVideoRecorderCIFilterProcessor ()

Prop_strong() CIContext *context;

@end

@implementation JobsOCVideoRecorderCIFilterProcessor

+(NSArray<NSNumber *> *)allFilterTypes{
    return @[
        @(JobsOCVideoRecorderCIFilterTypeNormal),
        @(JobsOCVideoRecorderCIFilterTypeMono),
        @(JobsOCVideoRecorderCIFilterTypeNoir),
        @(JobsOCVideoRecorderCIFilterTypeSepia),
        @(JobsOCVideoRecorderCIFilterTypeChrome),
        @(JobsOCVideoRecorderCIFilterTypeInstant),
        @(JobsOCVideoRecorderCIFilterTypeFade)
    ];
}

+(NSString *)titleForFilterType:(JobsOCVideoRecorderCIFilterType)filterType{
    switch (filterType) {
        case JobsOCVideoRecorderCIFilterTypeMono:
            return @"黑白";
        case JobsOCVideoRecorderCIFilterTypeNoir:
            return @"高反差";
        case JobsOCVideoRecorderCIFilterTypeSepia:
            return @"怀旧";
        case JobsOCVideoRecorderCIFilterTypeChrome:
            return @"鲜明";
        case JobsOCVideoRecorderCIFilterTypeInstant:
            return @"胶片";
        case JobsOCVideoRecorderCIFilterTypeFade:
            return @"褪色";
        case JobsOCVideoRecorderCIFilterTypeNormal:
        default:
            return @"原片";
    }
}

-(instancetype)init{
    return [self initWithFilterType:JobsOCVideoRecorderCIFilterTypeNormal];
}

-(instancetype)initWithFilterType:(JobsOCVideoRecorderCIFilterType)filterType{
    if (self = [super init]) {
        _filterType = filterType;
        _context = [CIContext contextWithOptions:nil];
    };return self;
}

-(CVPixelBufferRef)processPixelBuffer:(CVPixelBufferRef)pixelBuffer
                     presentationTime:(CMTime)presentationTime{
    (void)presentationTime;
    if (!pixelBuffer || self.filterType == JobsOCVideoRecorderCIFilterTypeNormal) return pixelBuffer;
    CIImage *inputImage = [CIImage imageWithCVPixelBuffer:pixelBuffer];
    CIImage *outputImage = [self outputImageByInputImage:inputImage];
    if (!outputImage) return pixelBuffer;
    CVPixelBufferRef outputPixelBuffer = [self makePixelBufferLike:pixelBuffer];
    if (!outputPixelBuffer) return pixelBuffer;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    [self.context render:outputImage
         toCVPixelBuffer:outputPixelBuffer
                  bounds:CGRectMake(0, 0, CVPixelBufferGetWidth(pixelBuffer), CVPixelBufferGetHeight(pixelBuffer))
              colorSpace:colorSpace];
    if (colorSpace) CGColorSpaceRelease(colorSpace);
    return outputPixelBuffer;
}

-(CIImage *)outputImageByInputImage:(CIImage *)inputImage{
    NSString *filterName = [self filterNameByType:self.filterType];
    if (!filterName.length) return inputImage;
    CIFilter *filter = [CIFilter filterWithName:filterName];
    [filter setDefaults];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    if (self.filterType == JobsOCVideoRecorderCIFilterTypeSepia) {
        [filter setValue:@(0.82) forKey:kCIInputIntensityKey];
    };return filter.outputImage;
}

-(NSString *)filterNameByType:(JobsOCVideoRecorderCIFilterType)filterType{
    switch (filterType) {
        case JobsOCVideoRecorderCIFilterTypeMono:
            return @"CIPhotoEffectMono";
        case JobsOCVideoRecorderCIFilterTypeNoir:
            return @"CIPhotoEffectNoir";
        case JobsOCVideoRecorderCIFilterTypeSepia:
            return @"CISepiaTone";
        case JobsOCVideoRecorderCIFilterTypeChrome:
            return @"CIPhotoEffectChrome";
        case JobsOCVideoRecorderCIFilterTypeInstant:
            return @"CIPhotoEffectInstant";
        case JobsOCVideoRecorderCIFilterTypeFade:
            return @"CIPhotoEffectFade";
        case JobsOCVideoRecorderCIFilterTypeNormal:
        default:
            return nil;
    }
}

-(CVPixelBufferRef)makePixelBufferLike:(CVPixelBufferRef)pixelBuffer{
    NSDictionary *attributes = @{
        (NSString *)kCVPixelBufferCGImageCompatibilityKey: @(YES),
        (NSString *)kCVPixelBufferCGBitmapContextCompatibilityKey: @(YES),
        (NSString *)kCVPixelBufferIOSurfacePropertiesKey: @{}
    };
    CVPixelBufferRef outputPixelBuffer = nil;
    CVReturn result = CVPixelBufferCreate(kCFAllocatorDefault,
                                          CVPixelBufferGetWidth(pixelBuffer),
                                          CVPixelBufferGetHeight(pixelBuffer),
                                          kCVPixelFormatType_32BGRA,
                                          (__bridge CFDictionaryRef)attributes,
                                          &outputPixelBuffer);
    return result == kCVReturnSuccess ? outputPixelBuffer : nil;
}

@end
