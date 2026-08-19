//
//  JobsDouyinRefreshView.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <QuartzCore/QuartzCore.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/UIView+DSL.h>)
#import <JobsOCDSL/UIView+DSL.h>
#else
#import "UIView+DSL.h"
#endif

#if __has_include(<JobsFuseAnimation/JobsDouyinRefreshConfig.h>)
#import <JobsFuseAnimation/JobsDouyinRefreshConfig.h>
#import <JobsFuseAnimation/JobsRefreshAnimatorProtocol.h>
#else
#import "JobsDouyinRefreshConfig.h"
#import "JobsRefreshAnimatorProtocol.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 红、绿双球交叉换位并错峰跳跃的刷新动画视图。
@interface JobsDouyinRefreshView : UIView<JobsRefreshAnimatorProtocol>

Prop_strong(readonly)JobsDouyinRefreshConfig *config;
Prop_assign(readonly,getter=isAnimating)BOOL animating;

-(instancetype)initWithConfig:(JobsDouyinRefreshConfig *)config;
-(JobsRetIDByJobsDouyinRefreshConfigBlock _Nonnull)byConfig;
-(JobsRetIDByVoidBlock _Nonnull)byStart;
-(JobsRetIDByVoidBlock _Nonnull)byPause;
-(JobsRetIDByVoidBlock _Nonnull)byResume;
-(JobsRetIDByVoidBlock _Nonnull)byStop;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsDouyinRefreshView
-(JobsRetJobsDouyinRefreshViewByBOOLBlock _Nonnull)byAnimating;
-(JobsRetJobsDouyinRefreshViewByCFTimeIntervalBlock _Nonnull)byPausedTime;
-(JobsRetJobsDouyinRefreshViewByCGRectBlock _Nonnull)byLastAnimationBounds;
-(JobsRetJobsDouyinRefreshViewByBOOLBlock _Nonnull)byAccessibilityElement;
-(JobsRetJobsDouyinRefreshViewByNSStringBlock _Nonnull)byAccessibilityLabel;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsDouyinRefreshView
@end

NS_ASSUME_NONNULL_END
