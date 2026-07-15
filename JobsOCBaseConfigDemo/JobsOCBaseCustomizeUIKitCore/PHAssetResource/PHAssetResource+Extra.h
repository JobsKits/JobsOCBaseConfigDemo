//
//  PHAssetResource+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_PHASSETRESOURCE_EXTRA_AE77991187
#define JOBS_HEADER_GUARD_PHASSETRESOURCE_EXTRA_AE77991187

#import <Photos/Photos.h> // 提供系统相册访问能力，可读取和管理照片、视频等媒体资源。
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface PHAssetResource (Extra)

+(JobsRetArrayByPHAssetBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_PHASSETRESOURCE_EXTRA_AE77991187 */
