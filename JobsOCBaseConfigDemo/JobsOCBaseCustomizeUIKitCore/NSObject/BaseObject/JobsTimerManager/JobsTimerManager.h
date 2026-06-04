//
//  JobsTimerManager.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/12/13.
//

#import <UIKit/UIKit.h>
#import "JobsTimer.h" // 依赖 JobsTimer / TimerProtocol / JobsBlock

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, _JobsTimerPauseState) {
    _JobsTimerPauseStateRunning = 0,
    _JobsTimerPauseStateManualPaused,
    _JobsTimerPauseStateAutoPaused
};

/// Swift 侧：JobsTimerIdentifiable.timerIdentifier
@protocol JobsTimerIdentifiable <NSObject>
@property(nonatomic, copy, readonly) NSString *timerIdentifier;
@end

/// Swift 侧：JobsTimerBackgroundPolicy
typedef NS_ENUM(NSUInteger, JobsTimerBackgroundPolicy) {
    JobsTimerBackgroundPolicyIgnore = 0,        // 不处理
    JobsTimerBackgroundPolicyPauseAndResume,    // 后台自动 pause，前台自动 resume（只恢复“自动暂停”的）
    JobsTimerBackgroundPolicyCancel             // 进后台直接 stop + remove
};

typedef void(^JobsTimerManagerBuildBlock)(JobsTimer *timer);

@interface JobsTimerManager : NSObject

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
                            build:(JobsTimerManagerBuildBlock _Nullable)build
                          handler:(jobsByVoidBlock _Nullable)handler;

- (BOOL)upsertTimerWithIdentifiable:(id<JobsTimerIdentifiable>)identifier
                          timerType:(JobsTimerType)timerType
                             policy:(JobsTimerBackgroundPolicy)policy
                   startImmediately:(BOOL)startImmediately
                              build:(JobsTimerManagerBuildBlock _Nullable)build
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
