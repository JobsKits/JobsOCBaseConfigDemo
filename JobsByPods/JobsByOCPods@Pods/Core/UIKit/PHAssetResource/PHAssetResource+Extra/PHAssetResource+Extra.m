//
//  PHAssetResource+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PHAssetResource+Extra.h"

@implementation PHAssetResource (Extra)
+(JobsRetArrayByPHAssetBlock _Nonnull)initBy{
    return ^__kindof NSArray <PHAssetResource *>*_Nonnull(__kindof PHAsset *_Nullable data){
        return [PHAssetResource assetResourcesForAsset:data];
    };
}

@end
