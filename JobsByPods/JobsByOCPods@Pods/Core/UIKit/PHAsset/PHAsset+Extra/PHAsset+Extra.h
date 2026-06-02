//
//  PHAsset+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_PHASSET_EXTRA_E525342D13
#define JOBS_HEADER_GUARD_PHASSET_EXTRA_E525342D13

#import <Photos/Photos.h> // 提供系统相册访问能力，可读取和管理照片、视频等媒体资源。

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface PHAsset (Extra)
/// 对系统方法 fetchAssetsWithOptions 的二次封装
+(JobsRetPHFetchResultWithPHAssetByPHFetchOptionsBlock _Nonnull)initByOptions;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_PHASSET_EXTRA_E525342D13 */
