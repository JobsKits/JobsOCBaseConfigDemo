//
//  JobsScrollYView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSCROLLYVIEW_768014F09F
#define JOBS_HEADER_GUARD_JOBSSCROLLYVIEW_768014F09F

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsBaseUI.h"
#import "JobsDefines.h"

/// 锚点1（最低点）
#define 初始位置 JobsMainScreen_HEIGHT() / 2
/// 锚点2（最高点）
#define 终点位置 100

NS_ASSUME_NONNULL_BEGIN

@interface JobsScrollYView : BaseView

-(jobsByVoidBlock _Nonnull)jobsAwakeFromNib;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsScrollYView
-(JobsRetJobsScrollYViewByCGFloatBlock _Nonnull)byX;
-(JobsRetJobsScrollYViewByCGFloatBlock _Nonnull)byY;
-(JobsRetJobsScrollYViewByCGPointBlock _Nonnull)byInitialTouchPoint;
-(JobsRetJobsScrollYViewByCGSizeBlock _Nonnull)bySizer;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsScrollYView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSSCROLLYVIEW_768014F09F */
