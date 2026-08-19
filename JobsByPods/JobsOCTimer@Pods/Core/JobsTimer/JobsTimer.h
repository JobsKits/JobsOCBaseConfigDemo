//
//  JobsTimer.h
//  JobsOCTimer
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTIMER_BCB1BF4076
#define JOBS_HEADER_GUARD_JOBSTIMER_BCB1BF4076

#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h> // 提供 Core Animation 和 CALayer 能力，用于动画、图层和视觉渲染。
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCProtocols/TimerProtocol.h>)
#import <JobsOCProtocols/TimerProtocol.h>
#else
#import "TimerProtocol.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 统一的 OC 版计时器实现：基于 TimerProtocol，只额外提供进度语义
@interface JobsTimer : NSObject<TimerProtocol>

-(JobsRetTimerByNSUInteger _Nonnull)byTimerType;
-(JobsRetTimerByNSUInteger _Nonnull)byTimerStyle;
-(JobsRetTimerByDoubleBlock _Nonnull)byTimeInterval;
-(JobsRetTimerByDoubleBlock _Nonnull)byStartTime;
-(JobsRetTimerByCGFloatBlock _Nonnull)byTime;
-(JobsRetTimerByDoubleBlock _Nonnull)byTimeSecIntervalSinceDate;
-(JobsRetTimerByDoubleBlock _Nonnull)byAccumulatedElapsed;
-(JobsRetTimerByDateBlock _Nonnull)byLastStartDate;
-(JobsRetTimerByStringBlock _Nonnull)byRunLoopMode;
-(JobsRetTimerByUserInfo _Nonnull)byUserInfo;
-(JobsRetTimerByQueue _Nonnull)byQueue;
-(JobsRetTimerByNSUInteger _Nonnull)byTimerState;
/// 前后台感知配置（用 0/1 传值）
-(JobsRetTimerByNSUInteger _Nonnull)byPauseInBackground;    // 默认 1
-(JobsRetTimerByNSUInteger _Nonnull)byAutoManageAppState;   // 默认 1
/// 回调链式 DSL
-(JobsRetTimerByCGFloatBlocks _Nonnull)byOnTick;
-(JobsRetTimerByJTimerBlocks _Nonnull)byOnFinish;
/// 旧工程与外部调用兼容入口，Block 形态使用 `jobsStop`。
-(void)stop;
-(jobsByVoidBlock _Nonnull)jobsStop;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsTimer
-(JobsRetJobsTimerByBOOLBlock _Nonnull)byAutoPausedByAppState;
-(JobsRetJobsTimerByBOOLBlock _Nonnull)byGcdTimerSuspended;
-(JobsRetJobsTimerByCFRunLoopTimerRefBlock _Nonnull)byRlTimer;
-(JobsRetJobsTimerByJobsTimerTargetProxyBlock _Nonnull)byDisplayLinkProxy;
-(JobsRetJobsTimerByJobsTimerTargetProxyBlock _Nonnull)byNsTimerProxy;
-(JobsRetJobsTimerBydispatch_source_tBlock _Nonnull)byGcdTimer;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsTimer
@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsTimer *_Nonnull
jobsMakeTimer(JobsTimerBlock _Nonnull block){
    JobsTimer *data = JobsTimer.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSTIMER_BCB1BF4076 */
