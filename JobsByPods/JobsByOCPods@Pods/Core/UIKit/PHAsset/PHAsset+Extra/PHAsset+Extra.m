//
//  PHAsset+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PHAsset+Extra.h"

@implementation PHAsset (Extra)
/// 对系统方法 fetchAssetsWithOptions 的二次封装
+(JobsRetPHFetchResultWithPHAssetByPHFetchOptionsBlock _Nonnull)initByOptions{
    return ^__kindof PHFetchResult<PHAsset *> *_Nonnull(__kindof PHFetchOptions *_Nullable options){
        return [PHAsset fetchAssetsWithOptions:options];
    };
}

@end
