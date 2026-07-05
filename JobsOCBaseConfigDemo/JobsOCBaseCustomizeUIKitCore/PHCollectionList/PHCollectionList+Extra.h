//
//  PHCollectionList+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_PHCOLLECTIONLIST_EXTRA_89ACB09F1A
#define JOBS_HEADER_GUARD_PHCOLLECTIONLIST_EXTRA_89ACB09F1A

#import <Photos/Photos.h> // 提供系统相册访问能力，可读取和管理照片、视频等媒体资源。

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface PHCollectionList (Extra)
/// 对系统方法 fetchTopLevelUserCollectionsWithOptions 的二次封装
+(JobsRetPHFetchResultWithPHCollectionByPHFetchOptionsBlock _Nonnull)initByOptions;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_PHCOLLECTIONLIST_EXTRA_89ACB09F1A */
