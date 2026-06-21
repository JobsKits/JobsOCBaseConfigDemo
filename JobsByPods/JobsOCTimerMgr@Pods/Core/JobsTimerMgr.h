//
//  JobsTimerMgr.h
//  JobsOCTimerMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTIMERMGR_159B1DF4D3
#define JOBS_HEADER_GUARD_JOBSTIMERMGR_159B1DF4D3

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

#if __has_include(<JobsOCTimer/JobsTimer.h>)
#import <JobsOCTimer/JobsTimer.h>
#else
#import "JobsTimer.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

#ifndef _JobsTimerPauseState
typedef NS_ENUM(NSUInteger, _JobsTimerPauseState) {
    _JobsTimerPauseStateRunning = 0,
    _JobsTimerPauseStateManualPaused,
    _JobsTimerPauseStateAutoPaused
};
#endif
/// Swift 侧：JobsTimerIdentifiable.timerIdentifier
@protocol JobsTimerIdentifiable <NSObject>
Prop_copy(readonly)NSString *timerIdentifier;
@end
/// Swift 侧：JobsTimerBackgroundPolicy
#ifndef JobsTimerBackgroundPolicy
typedef NS_ENUM(NSUInteger, JobsTimerBackgroundPolicy) {
    JobsTimerBackgroundPolicyIgnore = 0,        // 不处理
    JobsTimerBackgroundPolicyPauseAndResume,    // 后台自动 pause，前台自动 resume（只恢复“自动暂停”的）
    JobsTimerBackgroundPolicyCancel             // 进后台直接 stop + remove
};
#endif

@interface JobsTimerMgr : NSObject

+ (instancetype)shared;

/// 创建/覆盖一个 timer（同 id：先 stop + remove 再创建；并尽力关闭 timer 内核自带前后台监听，统一交给 Manager）
/// - identifier: 唯一 id
/// - timerType: JobsTimerTypeNSTimer / JobsTimerTypeGCD / JobsTimerTypeDisplayLink
/// - policy: 前后台策略
/// - startImmediately: 是否立刻 start
/// - build: 用于配置 timer（时间间隔/倒计时参数/队列等）；⚠️ 回调建议用 Manager 的 onTick/onFinish 注册
/// - handler: “首次 tick 回调”（Swift 侧 handler 是 void，这里保持一致）
- (BOOL)upsertTimerWithIdentifier:(NSString *)identifier
                        timerType:(JobsTimerType)timerType
                           policy:(JobsTimerBackgroundPolicy)policy
                 startImmediately:(BOOL)startImmediately
                            build:(JobsTimerMgrBuildBlock _Nullable)build
                          handler:(jobsByVoidBlock _Nullable)handler;

- (BOOL)upsertTimerWithIdentifiable:(id<JobsTimerIdentifiable>)identifier
                          timerType:(JobsTimerType)timerType
                             policy:(JobsTimerBackgroundPolicy)policy
                   startImmediately:(BOOL)startImmediately
                              build:(JobsTimerMgrBuildBlock _Nullable)build
                            handler:(jobsByVoidBlock _Nullable)handler;

/// 注册回调：tick / finish（支持叠加多个）
- (BOOL)onTick:(NSString *)identifier block:(jobsByCGFloatBlock)block;
- (BOOL)onTickVoid:(NSString *)identifier block:(jobsByVoidBlock)block;

- (BOOL)onFinish:(NSString *)identifier block:(JobsTimerBlock)block;
- (BOOL)onFinishVoid:(NSString *)identifier block:(jobsByVoidBlock)block;

/// Controls
- (BOOL)start:(NSString *)identifier;
- (BOOL)pause:(NSString *)identifier;
- (BOOL)resume:(NSString *)identifier;

- (BOOL)fireOnceAndRemove:(NSString *)identifier;
- (BOOL)stopAndRemove:(NSString *)identifier;
- (void)stopAndRemoveAll;

/// Query
- (BOOL)exists:(NSString *)identifier;
- (BOOL)isRunning:(NSString *)identifier;
- (NSArray<NSString *> *)allIdentifiers;

/// 可选：拿到 timer 引用（只读，不建议外部直接改回调）
- (JobsTimer * _Nullable)timerForIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END

#import "JobsTimerMgr+DSL.h"
#endif /* JOBS_HEADER_GUARD_JOBSTIMERMGR_159B1DF4D3 */
