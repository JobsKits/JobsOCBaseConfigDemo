//
//  JobsTodayNewsRefreshView.h
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

#if __has_include(<JobsFuseAnimation/JobsRefreshAnimatorProtocol.h>)
#import <JobsFuseAnimation/JobsRefreshAnimatorProtocol.h>
#import <JobsFuseAnimation/JobsTodayNewsRefreshConfig.h>
#else
#import "JobsRefreshAnimatorProtocol.h"
#import "JobsTodayNewsRefreshConfig.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 今日头条红色轮廓形变刷新动画；支持下拉进度、刷新循环和环境暂停。
@interface JobsTodayNewsRefreshView : UIView<JobsRefreshAnimatorProtocol>

Prop_strong(readonly)JobsTodayNewsRefreshConfig *config;
Prop_assign(readonly,getter=isAnimating)BOOL animating;

-(instancetype)initWithConfig:(JobsTodayNewsRefreshConfig *)config;
-(JobsRetIDByJobsTodayNewsRefreshConfigBlock _Nonnull)byConfig;
-(JobsRetIDByVoidBlock _Nonnull)byStart;
-(JobsRetIDByVoidBlock _Nonnull)byPause;
-(JobsRetIDByVoidBlock _Nonnull)byResume;
-(JobsRetIDByVoidBlock _Nonnull)byStop;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsTodayNewsRefreshView
-(JobsRetJobsTodayNewsRefreshViewByBOOLBlock _Nonnull)byAnimating;
-(JobsRetJobsTodayNewsRefreshViewByBOOLBlock _Nonnull)byWantsAnimating;
-(JobsRetJobsTodayNewsRefreshViewByCFTimeIntervalBlock _Nonnull)byPausedTime;
-(JobsRetJobsTodayNewsRefreshViewByCGRectBlock _Nonnull)byLastAnimationBounds;
-(JobsRetJobsTodayNewsRefreshViewByBOOLBlock _Nonnull)byAccessibilityElement;
-(JobsRetJobsTodayNewsRefreshViewByNSStringBlock _Nonnull)byAccessibilityLabel;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsTodayNewsRefreshView
@end

NS_ASSUME_NONNULL_END
