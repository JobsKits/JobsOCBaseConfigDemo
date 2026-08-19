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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCVideoRecorderCIFilterProcessor
@interface JobsOCVideoRecorderCIFilterProcessor (JobsPropertyDSLSetterAutogen_4a330b8495)
-(void)setFilterType:(JobsOCVideoRecorderCIFilterType)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCVideoRecorderCIFilterProcessor

@implementation JobsOCVideoRecorderCIFilterProcessor
+(JobsRetNSArrayNSNumberByVoidBlock _Nonnull)allFilterTypes{
    return ^NSArray<NSNumber *> *{
        return @[
            @(JobsOCVideoRecorderCIFilterTypeNormal),
            @(JobsOCVideoRecorderCIFilterTypeMono),
            @(JobsOCVideoRecorderCIFilterTypeNoir),
            @(JobsOCVideoRecorderCIFilterTypeSepia),
            @(JobsOCVideoRecorderCIFilterTypeChrome),
            @(JobsOCVideoRecorderCIFilterTypeInstant),
            @(JobsOCVideoRecorderCIFilterTypeFade)
        ];
    };
}

+(JobsRetNSStringByJobsOCVideoRecorderCIFilterTypeBlock _Nonnull)titleForFilterType{
    return ^NSString *(JobsOCVideoRecorderCIFilterType filterType){
        switch (filterType) {
            /// 处理 JobsOCVideoRecorderCIFilterTypeMono 分支
            case JobsOCVideoRecorderCIFilterTypeMono:
                return @"黑白";
            /// 处理 JobsOCVideoRecorderCIFilterTypeNoir 分支
            case JobsOCVideoRecorderCIFilterTypeNoir:
                return @"高反差";
            /// 处理 JobsOCVideoRecorderCIFilterTypeSepia 分支
            case JobsOCVideoRecorderCIFilterTypeSepia:
                return @"怀旧";
            /// 处理 JobsOCVideoRecorderCIFilterTypeChrome 分支
            case JobsOCVideoRecorderCIFilterTypeChrome:
                return @"鲜明";
            /// 处理 JobsOCVideoRecorderCIFilterTypeInstant 分支
            case JobsOCVideoRecorderCIFilterTypeInstant:
                return @"胶片";
            /// 处理 JobsOCVideoRecorderCIFilterTypeFade 分支
            case JobsOCVideoRecorderCIFilterTypeFade:
                return @"褪色";
            /// 处理 JobsOCVideoRecorderCIFilterTypeNormal 分支
            case JobsOCVideoRecorderCIFilterTypeNormal:
            /// 未匹配已知分支时执行兜底处理
            default:
                return @"原片";
        }
    };
}

-(instancetype)init{
    return [self initWithFilterType:JobsOCVideoRecorderCIFilterTypeNormal];
}

-(instancetype)initWithFilterType:(JobsOCVideoRecorderCIFilterType)filterType{
    if (self = [super init]) {
        _filterType = filterType;
        _context = [CIContext contextWithOptions:@{
            kCIContextCacheIntermediates: @(NO)
        }];
    };return self;
}

-(CVPixelBufferRef)processPixelBuffer:(CVPixelBufferRef)pixelBuffer
                     presentationTime:(CMTime)presentationTime{
    (void)presentationTime;
    if (!pixelBuffer || self.filterType == JobsOCVideoRecorderCIFilterTypeNormal) return pixelBuffer;
    CIImage *inputImage = [CIImage imageWithCVPixelBuffer:pixelBuffer];
    CIImage *outputImage = self.outputImageByInputImage(inputImage);
    if (!outputImage) return pixelBuffer;
    CVPixelBufferRef outputPixelBuffer = self.makePixelBufferLike(pixelBuffer);
    if (!outputPixelBuffer) return pixelBuffer;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    [self.context render:outputImage
         toCVPixelBuffer:outputPixelBuffer
                  bounds:CGRectMake(0, 0, CVPixelBufferGetWidth(pixelBuffer), CVPixelBufferGetHeight(pixelBuffer))
              colorSpace:colorSpace];
    if (colorSpace) CGColorSpaceRelease(colorSpace);
    return outputPixelBuffer;
}

-(JobsRetCIImageByCIImageBlock _Nonnull)outputImageByInputImage{
    @jobs_weakify(self)
    return ^CIImage *(CIImage * inputImage){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *filterName = self.filterNameByType(self.filterType);
        if (!filterName.length) return inputImage;
        CIFilter *filter = [CIFilter filterWithName:filterName];
        [filter setDefaults];
        [filter setValue:inputImage forKey:kCIInputImageKey];
        if (self.filterType == JobsOCVideoRecorderCIFilterTypeSepia) {
            [filter setValue:@(0.82) forKey:kCIInputIntensityKey];
        };return filter.outputImage;
    };
}

-(JobsRetNSStringByJobsOCVideoRecorderCIFilterTypeBlock _Nonnull)filterNameByType{
    @jobs_weakify(self)
    return ^NSString *(JobsOCVideoRecorderCIFilterType filterType){
        @jobs_strongify(self)
        if (!self) return nil;
        switch (filterType) {
            /// 处理 JobsOCVideoRecorderCIFilterTypeMono 分支
            case JobsOCVideoRecorderCIFilterTypeMono:
                return @"CIPhotoEffectMono";
            /// 处理 JobsOCVideoRecorderCIFilterTypeNoir 分支
            case JobsOCVideoRecorderCIFilterTypeNoir:
                return @"CIPhotoEffectNoir";
            /// 处理 JobsOCVideoRecorderCIFilterTypeSepia 分支
            case JobsOCVideoRecorderCIFilterTypeSepia:
                return @"CISepiaTone";
            /// 处理 JobsOCVideoRecorderCIFilterTypeChrome 分支
            case JobsOCVideoRecorderCIFilterTypeChrome:
                return @"CIPhotoEffectChrome";
            /// 处理 JobsOCVideoRecorderCIFilterTypeInstant 分支
            case JobsOCVideoRecorderCIFilterTypeInstant:
                return @"CIPhotoEffectInstant";
            /// 处理 JobsOCVideoRecorderCIFilterTypeFade 分支
            case JobsOCVideoRecorderCIFilterTypeFade:
                return @"CIPhotoEffectFade";
            /// 处理 JobsOCVideoRecorderCIFilterTypeNormal 分支
            case JobsOCVideoRecorderCIFilterTypeNormal:
            /// 未匹配已知分支时执行兜底处理
            default:
                return nil;
        }
    };
}

-(JobsRetCVPixelBufferRefByCVPixelBufferRefBlock _Nonnull)makePixelBufferLike{
    @jobs_weakify(self)
    return ^CVPixelBufferRef(CVPixelBufferRef pixelBuffer){
        @jobs_strongify(self)
        if (!self) return (CVPixelBufferRef){0};
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
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCVideoRecorderCIFilterProcessor
-(JobsRetJobsOCVideoRecorderCIFilterProcessorByJobsOCVideoRecorderCIFilterTypeBlock _Nonnull)byFilterType{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderCIFilterProcessor * _Nullable(JobsOCVideoRecorderCIFilterType data){
        @jobs_strongify(self)
        [self setFilterType:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCVideoRecorderCIFilterProcessor
@end
