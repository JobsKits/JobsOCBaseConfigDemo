//
//  AVAssetImageGenerator+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AVAssetImageGenerator+Extra.h"

@implementation AVAssetImageGenerator (Extra)

+(JobsRetAVAssetImageGeneratorByAVURLAssetBlock _Nonnull)initBy{
    @jobs_weakify(self)
    return ^__kindof AVAssetImageGenerator *_Nonnull(__kindof AVURLAsset *_Nullable data){
        @jobs_strongify(self)
        return [AVAssetImageGenerator.alloc initWithAsset:data];
    };
}

@end
