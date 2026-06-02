//
//  PHCollectionList+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PHCollectionList+Extra.h"

@implementation PHCollectionList (Extra)
/// 对系统方法 fetchTopLevelUserCollectionsWithOptions 的二次封装
+(JobsRetPHFetchResultWithPHCollectionByPHFetchOptionsBlock _Nonnull)initByOptions{
    return ^__kindof PHFetchResult <__kindof PHCollection *>*_Nonnull(__kindof PHFetchOptions *_Nullable options){
        /// 获取相册的集合
        return [PHCollectionList fetchTopLevelUserCollectionsWithOptions:options];
    };
}

@end
