//
//  JobsTodayNewsRefreshView.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

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
-(instancetype)byConfig:(JobsTodayNewsRefreshConfig *)config;
-(instancetype)byStart;
-(instancetype)byPause;
-(instancetype)byResume;
-(instancetype)byStop;

@end

NS_ASSUME_NONNULL_END
