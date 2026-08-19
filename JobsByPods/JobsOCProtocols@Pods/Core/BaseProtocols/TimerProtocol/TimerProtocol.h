//
//  TimerProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_TIMERPROTOCOL_C8782F4DE8
#define JOBS_HEADER_GUARD_TIMERPROTOCOL_C8782F4DE8

#import <Foundation/Foundation.h>

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
/// 计时器协议：只关心“状态 + 控制 + 回调”
@protocol TimerProtocol <NSObject>
@required
#pragma mark —— 定时器配置
/// 定时器@当前（倒计时模式是剩余）时间
Prop_assign()CGFloat time;
/// 定时器@起始时间：逆时针模式（startTime⮕0）顺时针模式（startTime⮕正无穷）
Prop_assign()NSTimeInterval startTime;
/// 推移时间（秒数）以后执行定时器
Prop_assign()NSTimeInterval timeSecIntervalSinceDate;
/// 跳动步长（频率间距）
Prop_assign()NSTimeInterval timeInterval;
/// 是否重复？
Prop_assign()BOOL repeats;
                     // for NSTimer
Prop_strong(nullable)NSInvocation *invocation; // for NSTimer
Prop_assign()NSRunLoopMode runLoopMode;
Prop_strong(nullable)id userInfo;
Prop_assign()ShowTimeType showTimeType;
/// 倒计时进度（0~100%。未启用倒计时模式时为 0）
/// - 倒计时模式：countdownTimerProgress = (startTime - time) / startTime
/// - 普通模式：startTime <= 0 时 progress 固定为 0
Prop_assign(readonly)double countdownTimerProgress;
/// 定时器方向@逆时针？顺时针？
Prop_assign()JobsTimerStyle timerStyle;
/// iOS系统基本的4大定时器类型@其他类型的定时器均由此二次封装而成（NSTimer / GCD / CADisplayLink / dispatch_after）
Prop_assign()JobsTimerType timerType;
/// 已经流逝的时间（总 elapsed，单位秒）
Prop_assign()NSTimeInterval accumulatedElapsed;
/// 最近一次 start/resume 的时间点（支持 pause/resume）
Prop_strong(nullable)NSDate *lastStartDate;
#pragma mark —— 定时器类型
Prop_retain(nullable)NSTimer *nsTimer;
           // NSTimer
Prop_retain(nullable)dispatch_source_t gcdTimer; // GCD 定时器使用的队列（若为 nil，则默认 global queue）
Prop_retain(nullable)CADisplayLink *displayLink; // CADisplayLink
/// 如果用于：UI刷新（高频需求）👉 dispatch_get_main_queue();
/// 如果用于：重计算 / IO 👉 dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
Prop_retain(nullable)dispatch_queue_t queue;     //
#pragma mark —— 定时器状态
/// 定时器@当前状态
Prop_assign()JobsTimerState timerState;
/// 当前是否正在运行（包括重启的运行➕新建的运行）
Prop_assign(getter=isRunning)BOOL running;
/// 当前是否处于暂停（可恢复）
Prop_assign(getter=isPaused)BOOL paused;
/// 当前是否处于停止（不可恢复）
Prop_assign(getter=isStop)BOOL stop;
#pragma mark —— 定时器方法
/// 启动计时器（自动启动无非是找准一个时机进行启动）
-(jobsByVoidBlock _Nonnull)start;
/// 暂停计时器
-(jobsByVoidBlock _Nonnull)pause;
/// 恢复计时器
-(jobsByVoidBlock _Nonnull)resume;
/// 停止计时器（销毁@有回调）
-(jobsByVoidBlock _Nonnull)fireOnce;
/// 停止计时器（销毁@无回调）
-(jobsByVoidBlock _Nonnull)jobsStop;
#pragma mark —— 定时器回调
/// 注册回调（每 tick 执行一次）
Prop_copy(nullable)jobsByCGFloatBlock onTick;
/// 注册完成回调（用于一次性定时器或倒计时）
Prop_copy(nullable)JobsTimerBlock onFinish;

-(JobsRetBtnByCGFloatBlocks _Nonnull)byOnTick;
-(JobsRetBtnByJTimerBlocks _Nonnull)byOnFinish;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_TIMERPROTOCOL_C8782F4DE8 */
