//
//  JobsLabelScrollConfiguration.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#ifndef JOBS_HEADER_GUARD_JOBSLABELSCROLLCONFIGURATION_20260717
#define JOBS_HEADER_GUARD_JOBSLABELSCROLLCONFIGURATION_20260717

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JobsLabelScrollMode) {
    /// 连续跑马灯：两份文字首尾衔接、循环播放。
    JobsLabelScrollModeContinuous = 0,
    /// 左右往返：到达边界后停留并折返。
    JobsLabelScrollModePingPong
};

/// CoreText 长文本滚动配置。
@interface JobsLabelScrollConfiguration : NSObject <NSCopying>

Prop_assign()JobsLabelScrollMode mode;
/// 每秒位移点数。
Prop_assign()CGFloat speed;
/// 连续循环时两份文字之间的间距。
Prop_assign()CGFloat spacing;
/// 第一次开始移动前的停留时间。
Prop_assign()NSTimeInterval startDelay;
/// 往返模式到达左右边界后的停留时间。
Prop_assign()NSTimeInterval edgePause;
/// JobsTimer 的期望刷新频率，范围为 1～120。
Prop_assign()NSInteger framesPerSecond;
/// 默认使用 JobsTimer 的 CADisplayLink 内核。
Prop_assign()JobsTimerType timerType;
/// 开启“减弱动态效果”时保持静态文本。
Prop_assign()BOOL respectsReduceMotion;

+(instancetype)continuousConfiguration;
+(instancetype)pingPongConfiguration;
-(instancetype)initWithMode:(JobsLabelScrollMode)mode NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSLABELSCROLLCONFIGURATION_20260717 */
