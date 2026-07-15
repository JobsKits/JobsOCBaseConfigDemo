//
//  UIProgressView+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIPROGRESSVIEW_EXTRA_6C7BA22717
#define JOBS_HEADER_GUARD_UIPROGRESSVIEW_EXTRA_6C7BA22717

#import <UIKit/UIKit.h>
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIProgressView (Extra)
/// 进度条动画展现到当前值
/// 资料来源：https://www.jianshu.com/p/14a93c6dd929
/// @param duration 持续时间
/// @param progress 当前值
-(UIProgressView *)animateWithDuration:(CGFloat)duration progress:(CGFloat)progress;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIPROGRESSVIEW_EXTRA_6C7BA22717 */
