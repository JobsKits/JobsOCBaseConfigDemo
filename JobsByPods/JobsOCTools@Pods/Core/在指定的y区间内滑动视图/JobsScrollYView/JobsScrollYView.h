//
//  JobsScrollYView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSCROLLYVIEW_768014F09F
#define JOBS_HEADER_GUARD_JOBSSCROLLYVIEW_768014F09F

#import <UIKit/UIKit.h>

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

/// 锚点1（最低点）
#define 初始位置 JobsMainScreen_HEIGHT() / 2
/// 锚点2（最高点）
#define 终点位置 100

NS_ASSUME_NONNULL_BEGIN

@interface JobsScrollYView : BaseView

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSSCROLLYVIEW_768014F09F */
