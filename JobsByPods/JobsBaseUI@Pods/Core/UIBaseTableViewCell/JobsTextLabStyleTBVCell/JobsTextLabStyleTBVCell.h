//
//  JobsTextLabStyleTBVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTEXTLABSTYLETBVCELL_70818A3301
#define JOBS_HEADER_GUARD_JOBSTEXTLABSTYLETBVCELL_70818A3301

#import <JobsBaseUI/JobsBaseTableViewCell.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 将一个Label整个覆盖到TableViewCell上面
@interface JobsTextLabStyleTBVCell : JobsBaseTableViewCell
/// 获取绑定的数据源
-(UIViewModel *)getViewModel;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSTEXTLABSTYLETBVCELL_70818A3301 */
