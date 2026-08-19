//
//  UIScrollView+JobsOCRefresher.h
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import <objc/runtime.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <AudioToolbox/AudioToolbox.h>
#import "JobsOCRefreshComponent.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (JobsOCRefresher)

-(JobsRetUIScrollViewByJobsOCRefreshHorizontalModeBlock _Nonnull)jobs_setHorizontalRefreshMode;
-(JobsRetScrollViewByBOOLBlock _Nonnull)jobs_enableRefreshHaptics;
-(JobsRetUIScrollViewByNSStringBlock _Nonnull)jobs_setRefreshSound;
-(JobsRetUIScrollViewByJobsOCRefreshActionBlockBlock _Nonnull)jobs_byRefreshHeaderWithAction;
-(JobsRetUIScrollViewByJobsOCRefreshActionBlockBlock _Nonnull)jobs_byRefreshFooterWithAction;
- (__kindof UIScrollView *)jobs_byRefreshHeaderWithConfig:(nullable JobsOCRefreshConfig *)config
                                                   action:(JobsOCRefreshActionBlock)action;
- (__kindof UIScrollView *)jobs_byRefreshFooterWithConfig:(nullable JobsOCRefreshConfig *)config
                                                   action:(JobsOCRefreshActionBlock)action;
- (__kindof UIScrollView *)jobs_bySideRefreshAt:(JobsOCRefreshPosition)position
                                         config:(nullable JobsOCRefreshConfig *)config
                                         action:(JobsOCRefreshActionBlock)action;
- (__kindof UIScrollView *)jobs_switchRefreshAt:(JobsOCRefreshPosition)position
                                        toState:(JobsOCRefreshState)state;
- (__kindof UIScrollView *)jobs_replaceRefreshAnimator:(nullable id<JobsRefreshAnimatorProtocol>)animator
                                            atPosition:(JobsOCRefreshPosition)position;
-(JobsRetUIScrollViewByJobsOCRefreshPositionBlock _Nonnull)jobs_removeRefreshAt;

@end

NS_ASSUME_NONNULL_END
