//
//  UIScrollView+JobsOCRefresher.h
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import <objc/runtime.h>
#import <AudioToolbox/AudioToolbox.h>
#import "JobsOCRefreshComponent.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (JobsOCRefresher)

- (__kindof UIScrollView *)jobs_setHorizontalRefreshMode:(JobsOCRefreshHorizontalMode)mode;
- (__kindof UIScrollView *)jobs_enableRefreshHaptics:(BOOL)enable;
- (__kindof UIScrollView *)jobs_setRefreshSound:(nullable NSString *)soundName;
- (__kindof UIScrollView *)jobs_byRefreshHeaderWithAction:(JobsOCRefreshActionBlock)action;
- (__kindof UIScrollView *)jobs_byRefreshFooterWithAction:(JobsOCRefreshActionBlock)action;
- (__kindof UIScrollView *)jobs_byRefreshHeaderWithConfig:(nullable JobsOCRefreshConfig *)config
                                                   action:(JobsOCRefreshActionBlock)action;
- (__kindof UIScrollView *)jobs_byRefreshFooterWithConfig:(nullable JobsOCRefreshConfig *)config
                                                   action:(JobsOCRefreshActionBlock)action;
- (__kindof UIScrollView *)jobs_bySideRefreshAt:(JobsOCRefreshPosition)position
                                         config:(nullable JobsOCRefreshConfig *)config
                                         action:(JobsOCRefreshActionBlock)action;
- (__kindof UIScrollView *)jobs_switchRefreshAt:(JobsOCRefreshPosition)position
                                        toState:(JobsOCRefreshState)state;
- (__kindof UIScrollView *)jobs_removeRefreshAt:(JobsOCRefreshPosition)position;

@end

NS_ASSUME_NONNULL_END
