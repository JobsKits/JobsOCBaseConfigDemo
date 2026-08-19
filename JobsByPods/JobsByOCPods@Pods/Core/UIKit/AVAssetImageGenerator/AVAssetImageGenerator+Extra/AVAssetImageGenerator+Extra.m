//
//  AVAssetImageGenerator+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AVAssetImageGenerator+Extra.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN AVAssetImageGenerator
@interface AVAssetImageGenerator (JobsPropertyDSLSetterAutogen_124b13a72c)
-(void)setAppliesPreferredTrackTransform:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END AVAssetImageGenerator

@implementation AVAssetImageGenerator (Extra)
+(JobsRetAVAssetImageGeneratorByAVURLAssetBlock _Nonnull)initBy{
    @jobs_weakify(self)
    return ^__kindof AVAssetImageGenerator *_Nonnull(__kindof AVURLAsset *_Nullable data){
        @jobs_strongify(self)
        return [AVAssetImageGenerator.alloc initWithAsset:data];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN AVAssetImageGenerator
-(JobsRetAVAssetImageGeneratorByBOOLBlock _Nonnull)byAppliesPreferredTrackTransform{
    @jobs_weakify(self)
    return ^__kindof AVAssetImageGenerator * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setAppliesPreferredTrackTransform:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END AVAssetImageGenerator
@end
