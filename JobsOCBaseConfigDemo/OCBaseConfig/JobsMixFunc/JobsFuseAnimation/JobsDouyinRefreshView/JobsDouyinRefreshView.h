//
//  JobsDouyinRefreshView.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

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
-(instancetype)byConfig:(JobsDouyinRefreshConfig *)config;
-(instancetype)byStart;
-(instancetype)byPause;
-(instancetype)byResume;
-(instancetype)byStop;

@end

NS_ASSUME_NONNULL_END
