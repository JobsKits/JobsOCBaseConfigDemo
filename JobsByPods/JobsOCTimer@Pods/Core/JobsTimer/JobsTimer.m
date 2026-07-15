//
//  JobsTimer.m
//  JobsOCTimer
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTimer.h"
#import <JobsOCTimer/NSObject+Queue.h>
/// 与 Swift 靶场 JobsSwiftTimer 机制对齐：
/// - 非 GCD 内核（NSTimer/DisplayLink/CFRunLoopTimer）强制：主线程 + RunLoop.main
/// - 生命周期操作（start/pause/resume/stop/fireOnce）非 GCD 强制主线程
/// - generation token：防止 stop/pause 后 late event 穿透
/// - GCD suspend/cancel 平衡，避免崩溃
/// - one-shot（repeats = NO）：首次 tick 后自动 stop + finish（非 GCD stop 回主线程路由）
@interface JobsTimer ()<TimerProtocol>
/// YES  = 已经 suspend 了
/// NO   = 正在运行 / 已经 resume
Prop_assign()BOOL gcdTimerSuspended;
/// 线程安全：统一用这把锁保护关键状态/回调读写
Prop_strong()NSLock *stateLock;
/// generation token：状态变更递增，用于防止残留回调穿透
Prop_assign()uint64_t generation;
/// 前后台感知开关（默认都为 YES）
Prop_assign()BOOL pauseInBackground;
Prop_assign()BOOL autoManageAppState;
/// 只恢复“自动暂停”的，避免干扰手动 pause
Prop_assign()BOOL autoPausedByAppState;
/// 通知 token
Prop_strong(nullable)id didEnterBGToken;
Prop_strong(nullable)id willEnterFGToken;
/// CFRunLoopTimer（对应 Swift kind = .runLoop）
Prop_assign()CFRunLoopTimerRef rlTimer;

- (void)fireTickIfValid:(uint64_t)token;
- (void)configureGCDTimerHandler:(dispatch_source_t)timer token:(uint64_t)token;

@end

typedef struct {
    __unsafe_unretained JobsTimer *timer;
    uint64_t token;
} JobsTimerRunLoopTimerContext;

static void JobsTimerRunLoopTimerContextRelease(const void *info) {
    free((void *)info);
}

static void JobsTimerRunLoopTimerCallback(CFRunLoopTimerRef timer, void *info) {
    JobsTimerRunLoopTimerContext *context = info;
    JobsTimer *jobsTimer = context ? context->timer : nil;
    if (jobsTimer) {
        [jobsTimer fireTickIfValid:context->token];
    }
    (void)timer;
}

@implementation JobsTimer
#pragma mark —— Thread constraints
NS_INLINE void jobs_requireMainThread(NSString *reason) {
    NSCAssert(NSThread.isMainThread, (@"JobsTimer: %@ must be called on main thread (RunLoop/DisplayLink are thread-affine).", reason));
}

#pragma mark —— TimerProtocol associated storage
JobsKey(_time)
- (CGFloat)time {
    return [Jobs_getAssociatedObject(_time) doubleValue];
}

- (void)setTime:(CGFloat)time {
    Jobs_setAssociatedRETAIN_NONATOMIC(_time, @(time))
}

JobsKey(_startTime)
- (NSTimeInterval)startTime {
    return [Jobs_getAssociatedObject(_startTime) doubleValue];
}

- (void)setStartTime:(NSTimeInterval)startTime {
    Jobs_setAssociatedRETAIN_NONATOMIC(_startTime, @(startTime))
}

JobsKey(_timeSecIntervalSinceDate)
- (NSTimeInterval)timeSecIntervalSinceDate {
    return [Jobs_getAssociatedObject(_timeSecIntervalSinceDate) doubleValue];
}

- (void)setTimeSecIntervalSinceDate:(NSTimeInterval)timeSecIntervalSinceDate {
    Jobs_setAssociatedRETAIN_NONATOMIC(_timeSecIntervalSinceDate, @(timeSecIntervalSinceDate))
}

JobsKey(_timeInterval)
- (NSTimeInterval)timeInterval {
    NSTimeInterval value = [Jobs_getAssociatedObject(_timeInterval) doubleValue];
    return value > 0 ? value : 1.0;
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval {
    Jobs_setAssociatedRETAIN_NONATOMIC(_timeInterval, @(timeInterval))
}

JobsKey(_repeats)
- (BOOL)repeats {
    id value = Jobs_getAssociatedObject(_repeats);
    return value ? [value boolValue] : YES;
}

- (void)setRepeats:(BOOL)repeats {
    Jobs_setAssociatedRETAIN_NONATOMIC(_repeats, @(repeats))
}

JobsKey(_invocation)
- (NSInvocation *)invocation {
    return Jobs_getAssociatedObject(_invocation);
}

- (void)setInvocation:(NSInvocation *)invocation {
    Jobs_setAssociatedRETAIN_NONATOMIC(_invocation, invocation)
}

JobsKey(_runLoopMode)
- (NSRunLoopMode)runLoopMode {
    return Jobs_getAssociatedObject(_runLoopMode) ?: NSRunLoopCommonModes;
}

- (void)setRunLoopMode:(NSRunLoopMode)runLoopMode {
    Jobs_setAssociatedCOPY_NONATOMIC(_runLoopMode, runLoopMode)
}

JobsKey(_userInfo)
- (id)userInfo {
    return Jobs_getAssociatedObject(_userInfo);
}

- (void)setUserInfo:(id)userInfo {
    Jobs_setAssociatedRETAIN_NONATOMIC(_userInfo, userInfo)
}

JobsKey(_showTimeType)
- (ShowTimeType)showTimeType {
    return [Jobs_getAssociatedObject(_showTimeType) unsignedIntegerValue];
}

- (void)setShowTimeType:(ShowTimeType)showTimeType {
    Jobs_setAssociatedRETAIN_NONATOMIC(_showTimeType, @(showTimeType))
}

- (double)countdownTimerProgress {
    return self.startTime > 0 ? ((self.startTime - self.time) / self.startTime) : 0;
}

JobsKey(_timerStyle)
- (JobsTimerStyle)timerStyle {
    return [Jobs_getAssociatedObject(_timerStyle) unsignedIntegerValue];
}

- (void)setTimerStyle:(JobsTimerStyle)timerStyle {
    Jobs_setAssociatedRETAIN_NONATOMIC(_timerStyle, @(timerStyle))
}

JobsKey(_timerType)
- (JobsTimerType)timerType {
    return [Jobs_getAssociatedObject(_timerType) unsignedIntegerValue];
}

- (void)setTimerType:(JobsTimerType)timerType {
    Jobs_setAssociatedRETAIN_NONATOMIC(_timerType, @(timerType))
}

JobsKey(_accumulatedElapsed)
- (NSTimeInterval)accumulatedElapsed {
    return [Jobs_getAssociatedObject(_accumulatedElapsed) doubleValue];
}

- (void)setAccumulatedElapsed:(NSTimeInterval)accumulatedElapsed {
    Jobs_setAssociatedRETAIN_NONATOMIC(_accumulatedElapsed, @(accumulatedElapsed))
}

JobsKey(_lastStartDate)
- (NSDate *)lastStartDate {
    return Jobs_getAssociatedObject(_lastStartDate);
}

- (void)setLastStartDate:(NSDate *)lastStartDate {
    Jobs_setAssociatedRETAIN_NONATOMIC(_lastStartDate, lastStartDate)
}

JobsKey(_nsTimer)
- (NSTimer *)nsTimer {
    NSTimer *timer = Jobs_getAssociatedObject(_nsTimer);
    if (!timer) {
        timer = [NSTimer timerWithTimeInterval:self.timeInterval
                                        target:self
                                      selector:@selector(handleTick)
                                      userInfo:self.userInfo
                                       repeats:self.repeats];
        timer.tolerance = 0;
        Jobs_setAssociatedRETAIN_NONATOMIC(_nsTimer, timer)
    };return timer;
}

- (void)setNsTimer:(NSTimer *)nsTimer {
    Jobs_setAssociatedRETAIN_NONATOMIC(_nsTimer, nsTimer)
}

JobsKey(_gcdTimer)
- (dispatch_source_t)gcdTimer {
    return Jobs_getAssociatedObject(_gcdTimer);
}

- (void)setGcdTimer:(dispatch_source_t)gcdTimer {
    Jobs_setAssociatedRETAIN_NONATOMIC(_gcdTimer, gcdTimer)
}

JobsKey(_displayLink)
- (CADisplayLink *)displayLink {
    CADisplayLink *displayLink = Jobs_getAssociatedObject(_displayLink);
    if (!displayLink) {
        displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleTick)];
        Jobs_setAssociatedRETAIN_NONATOMIC(_displayLink, displayLink)
    };return displayLink;
}

- (void)setDisplayLink:(CADisplayLink *)displayLink {
    Jobs_setAssociatedRETAIN_NONATOMIC(_displayLink, displayLink)
}

JobsKey(_queue)
- (dispatch_queue_t)queue {
    return Jobs_getAssociatedObject(_queue) ?: dispatch_get_main_queue();
}

- (void)setQueue:(dispatch_queue_t)queue {
    Jobs_setAssociatedRETAIN_NONATOMIC(_queue, queue)
}

JobsKey(_timerState)
- (JobsTimerState)timerState {
    return [Jobs_getAssociatedObject(_timerState) unsignedIntegerValue];
}

- (void)setTimerState:(JobsTimerState)timerState {
    Jobs_setAssociatedRETAIN_NONATOMIC(_timerState, @(timerState))
    self.running = (timerState == JobsTimerStateRunning);
    self.paused  = (timerState == JobsTimerStatePaused);
    self.stop    = (timerState == JobsTimerStateFinished ||
                    timerState == JobsTimerStateCanceled);
}

JobsKey(_running)
- (BOOL)isRunning {
    return [Jobs_getAssociatedObject(_running) boolValue];
}

- (void)setRunning:(BOOL)running {
    Jobs_setAssociatedRETAIN_NONATOMIC(_running, @(running))
}

JobsKey(_paused)
- (BOOL)isPaused {
    return [Jobs_getAssociatedObject(_paused) boolValue];
}

- (void)setPaused:(BOOL)paused {
    Jobs_setAssociatedRETAIN_NONATOMIC(_paused, @(paused))
}

JobsKey(_stop)
- (BOOL)isStop {
    return [Jobs_getAssociatedObject(_stop) boolValue];
}

- (void)setStop:(BOOL)stop {
    Jobs_setAssociatedRETAIN_NONATOMIC(_stop, @(stop))
}

- (instancetype)init {
    if (self = [super init]) {
        _stateLock = NSLock.new;
        _pauseInBackground = YES;
        _autoManageAppState = YES;
        _autoPausedByAppState = NO;
        self.gcdTimerSuspended = NO;
        _generation = 0;
        _rlTimer = NULL;
        self.timerState = JobsTimerStateIdle;
        self.repeats = YES; // 默认重复
    };return self;
}

- (void)dealloc {
    [self teardownAppStateMonitor];
    [self invalidateInternal](YES);
    if (_rlTimer) {
        CFRunLoopTimerInvalidate(_rlTimer);
        CFRelease(_rlTimer);
        _rlTimer = NULL;
    }
}

#pragma mark —— Core
- (BOOL)isNonGCDKind {
    return (self.timerType != JobsTimerTypeGCD);
}

- (void)setupAppStateIfNeeded {
    [self setupAppStateMonitorIfNeeded];
}

- (void)routeStopIfNeededFromCallback {
    // GCD：不要求主线程
    if (self.timerType == JobsTimerTypeGCD) {
        [self.stateLock lock];
        if (self.timerState != JobsTimerStateCanceled && self.timerState != JobsTimerStateFinished) {
            self.timerState = JobsTimerStateCanceled;
        }
        self.generation += 1;
        [self.stateLock unlock];
        [self invalidateInternal](NO);
        return;
    }
    if (NSThread.isMainThread) {
        [self stop];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self stop];
        });
    }
}

- (void)fireTickIfValid:(uint64_t)token {
    // snapshot
    jobsByCGFloatBlock tickBlock = nil;
    JobsTimerBlock finishBlock = nil;
    BOOL repeats = YES;
    BOOL shouldFinish = NO;
    [self.stateLock lock];
    BOOL shouldFire = (self.timerState == JobsTimerStateRunning && token == self.generation);
    repeats = self.repeats;
    CGFloat currentTime = self.time; // 兼容旧语义：外部可能依赖 time 参数
    if (shouldFire) {
        if (self.timerStyle == TimerStyle_anticlockwise) {
            currentTime = MAX(0, currentTime - self.timeInterval);
            shouldFinish = currentTime <= 0;
        } else {
            currentTime += self.timeInterval;
        }
        self.time = currentTime;
    }
    [self.stateLock unlock];
    tickBlock = self.onTick;
    finishBlock = self.onFinish;
    if (!shouldFire) return;
    // tick 默认在 queue
    dispatch_queue_t q = self.queue ?: dispatch_get_main_queue();
    if (tickBlock) {
        dispatch_async(q, ^{
            tickBlock(currentTime);
        });
    }
    if (shouldFinish || !repeats) {
        // one-shot：触发一次后结束
        [self routeStopIfNeededFromCallback];
        if (finishBlock) {
            dispatch_async(q, ^{
                finishBlock(self);
            });
        }
    }
}

#pragma mark —— TimerProtocol
- (void)start {
    [self setupAppStateIfNeeded];
    if (self.isNonGCDKind) {
        jobs_requireMainThread(@"start");
    }
    // 重复 start：先清理旧定时器
    [self invalidateInternal](NO);
    [self.stateLock lock];
    // generation++，用于防穿透
    self.generation += 1;
    uint64_t token = self.generation;
    // 旧版计时/倒计时字段保持初始化（不再驱动核心机制，只作为对外状态）
    self.accumulatedElapsed = 0;
    self.lastStartDate = NSDate.date;
    self.time = self.startTime;
    self.timerState = JobsTimerStateRunning;
    self.autoPausedByAppState = NO;
    [self.stateLock unlock];
    @jobs_weakify(self)
    [self delayByMainQueue:self.timeSecIntervalSinceDate block:^{
        @jobs_strongify(self)
        if (!self) return;
        // ⚠️ 非 GCD 内核依赖 RunLoop/DisplayLink：强制主线程主 RunLoop
        if (self.isNonGCDKind && !NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self start];
            });return;
        }
        switch (self.timerType) {
            case JobsTimerTypeNSTimer:
                [self startNSTimerWithToken:token];
                break;
            case JobsTimerTypeGCD:
                [self startGCDTimerWithToken:token];
                break;
            case JobsTimerTypeDisplayLink:
                [self startDisplayLinkWithToken:token];
                break;
            case JobsTimerTypeRunLoop:
                [self startRunLoopTimerWithToken:token];
                break;
        }
        [self syncWithCurrentAppStateIfNeeded];
    }];
}

- (void)pause {
    if (!self.isRunning) return;
    if (self.isNonGCDKind) jobs_requireMainThread(@"pause");
    [self.stateLock lock];
    self.timerState = JobsTimerStatePaused;
    self.generation += 1;
    [self.stateLock unlock];
    switch (self.timerType) {
        case JobsTimerTypeNSTimer:
            self.nsTimer.fireDate = NSDate.distantFuture;
            break;
        case JobsTimerTypeGCD:
            if (self.gcdTimer && !self.gcdTimerSuspended) {
                dispatch_suspend(self.gcdTimer);
                self.gcdTimerSuspended = YES;
            }
            break;
        case JobsTimerTypeDisplayLink:
            self.displayLink.paused = YES;
            break;
        case JobsTimerTypeRunLoop:
            if (self.rlTimer) {
                CFRunLoopTimerInvalidate(self.rlTimer);
                CFRelease(self.rlTimer);
                self.rlTimer = NULL;
            }
            break;
    }
}

- (void)resume {
    if (!self.isPaused) return;
    if (self.isNonGCDKind) jobs_requireMainThread(@"resume");
    [self.stateLock lock];
    self.timerState = JobsTimerStateRunning;
    self.generation += 1;
    uint64_t token = self.generation;
    [self.stateLock unlock];
    switch (self.timerType) {
        case JobsTimerTypeNSTimer:
            self.nsTimer.fireDate = [NSDate dateWithTimeIntervalSinceNow:self.timeInterval];
            break;
        case JobsTimerTypeGCD:
            if (self.gcdTimer && self.gcdTimerSuspended) {
                dispatch_source_t timer = self.gcdTimer;
                uint64_t intervalNSEC = (uint64_t)(self.timeInterval * NSEC_PER_SEC);
                dispatch_source_set_timer(timer,
                                          dispatch_time(DISPATCH_TIME_NOW, intervalNSEC),
                                          intervalNSEC,
                                          (uint64_t)(0.1 * NSEC_PER_SEC));
                [self configureGCDTimerHandler:timer token:token];
                dispatch_resume(timer);
                self.gcdTimerSuspended = NO;
            }
            break;
        case JobsTimerTypeDisplayLink:
            self.displayLink.paused = NO;
            break;
        case JobsTimerTypeRunLoop:
            [self startRunLoopTimerWithToken:token];
            break;
    }
}

- (void)fireOnce {
    // 对齐 Swift：停止（销毁）+ 有回调（finish）
    if (self.isNonGCDKind && !NSThread.isMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self fireOnce];
        });
        return;
    }
    JobsTimerBlock finish = nil;
    dispatch_queue_t q = nil;
    [self.stateLock lock];
    BOOL alreadyStopped = (self.timerState == JobsTimerStateCanceled || self.timerState == JobsTimerStateFinished);
    if (!alreadyStopped) {
        self.timerState = JobsTimerStateFinished;
        self.generation += 1;
    }
    q = self.queue ?: dispatch_get_main_queue();
    [self.stateLock unlock];
    finish = self.onFinish;
    if (alreadyStopped) return;
    [self invalidateInternal](NO);
    if (finish) {
        dispatch_async(q, ^{
            finish(self);
        });
    }
}

- (void)stop {
    if (self.isNonGCDKind) jobs_requireMainThread(@"stop");
    [self.stateLock lock];
    BOOL alreadyStopped = (self.timerState == JobsTimerStateCanceled || self.timerState == JobsTimerStateFinished);
    if (!alreadyStopped) {
        self.timerState = JobsTimerStateCanceled;
        self.generation += 1;
    }
    [self.stateLock unlock];
    if (alreadyStopped) return;
    [self invalidateInternal](YES);
}

#pragma mark —— Invalidate
/// 内部销毁逻辑（线程安全：先取快照再销毁）
- (jobsByBOOLBlock)invalidateInternal {
    return ^(BOOL markCanceled) {
        NSTimer *timer = nil;
        dispatch_source_t gcd = nil;
        BOOL wasSuspended = NO;
        CADisplayLink *dl = nil;
        CFRunLoopTimerRef rl = NULL;
        [self.stateLock lock];
        timer = Jobs_getAssociatedObject(_nsTimer);
        Jobs_setAssociatedRETAIN_NONATOMIC(_nsTimer, nil)
        gcd = Jobs_getAssociatedObject(_gcdTimer);
        Jobs_setAssociatedRETAIN_NONATOMIC(_gcdTimer, nil)
        wasSuspended = self.gcdTimerSuspended;
        self.gcdTimerSuspended = NO;
        dl = Jobs_getAssociatedObject(_displayLink);
        Jobs_setAssociatedRETAIN_NONATOMIC(_displayLink, nil)
        rl = self.rlTimer; self.rlTimer = NULL;
        self.lastStartDate      = nil;
        self.accumulatedElapsed = 0;
        self.time               = 0;
        self.autoPausedByAppState = NO;
        [self.stateLock unlock];
        if (timer) [timer invalidate];
        if (gcd) {
            @try {
                // cancel 前必须平衡 suspend
                if (wasSuspended) {
                    dispatch_resume(gcd);
                }
                dispatch_source_set_event_handler(gcd, ^{});
                dispatch_source_cancel(gcd);
            } @catch (__unused NSException *exception) {
                NSLog(@"JobsTimer GCD cancel exception = %@", exception);
            }
        }
        if (dl) [dl invalidate];
        if (rl) {
            CFRunLoopTimerInvalidate(rl);
            CFRelease(rl);
        }
        if (markCanceled) {
            // 这里不强行覆盖 Finished
            if (self.timerState != JobsTimerStateFinished) {
                self.timerState = JobsTimerStateCanceled;
            }
        }
    };
}

#pragma mark —— NSTimer
- (void)startNSTimerWithToken:(uint64_t)token {
    jobs_requireMainThread(@"startNSTimer");
    // 用 mainRunLoop，对齐 Swift（RunLoop.main）
    [NSRunLoop.mainRunLoop addTimer:self.nsTimer forMode:self.runLoopMode];
    @jobs_weakify(self)
    // NSTimer selector 不能携带 token，这里用 event 时读取当前 generation，并通过 token 校验
    // start 时 token 已经固定，若 generation 变化，fireTickIfValid 会拦截
    (void)weak_self;
    // 立即将 state 置 running 已在 start 完成
    [self fireTickIfValid:token];
}

#pragma mark —— GCD
- (void)configureGCDTimerHandler:(dispatch_source_t)timer token:(uint64_t)token {
    if (!timer) return;
    @jobs_weakify(self)
    dispatch_source_set_event_handler(timer, ^{
        @jobs_strongify(self)
        if (!self) return;
        [self fireTickIfValid:token];
    });
}

- (void)startGCDTimerWithToken:(uint64_t)token {
    if (self.timeInterval <= 0) self.timeInterval = 1.0;
    uint64_t intervalNSEC = (uint64_t)(self.timeInterval * NSEC_PER_SEC);
    if (!self.queue) self.queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 重建更干净：避免 resume/suspend 计数错乱
    if (self.gcdTimer) {
        [self invalidateInternal](NO);
    }
    dispatch_source_t t = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, self.queue);
    self.gcdTimer = t;
    dispatch_source_set_timer(t,
                              dispatch_time(DISPATCH_TIME_NOW, intervalNSEC),
                              intervalNSEC,
                              (uint64_t)(0.1 * NSEC_PER_SEC));
    [self configureGCDTimerHandler:t token:token];
    dispatch_resume(t);
    self.gcdTimerSuspended = NO;
}

#pragma mark —— DisplayLink
- (void)startDisplayLinkWithToken:(uint64_t)token {
    jobs_requireMainThread(@"startDisplayLink");
    [self.displayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:self.runLoopMode];
    // CADisplayLink 走 selector（tick）→ 读取当前 generation，使用 start 时 token 校验
    // 先回调一次，保持行为一致
    [self fireTickIfValid:token];
}

#pragma mark —— RunLoop (CFRunLoopTimer)
- (void)startRunLoopTimerWithToken:(uint64_t)token {
    jobs_requireMainThread(@"startRunLoopTimer");
    // 先清理旧的
    if (self.rlTimer) {
        CFRunLoopTimerInvalidate(self.rlTimer);
        CFRelease(self.rlTimer);
        self.rlTimer = NULL;
    }
    CFAbsoluteTime nextFire = CFAbsoluteTimeGetCurrent() + self.timeInterval;
    CFTimeInterval interval = self.repeats ? self.timeInterval : 0;
    JobsTimerRunLoopTimerContext *timerContext = calloc(1, sizeof(JobsTimerRunLoopTimerContext));
    timerContext->timer = self;
    timerContext->token = token;
    CFRunLoopTimerContext ctx = {0, timerContext, NULL, JobsTimerRunLoopTimerContextRelease, NULL};
    CFRunLoopTimerRef timer = CFRunLoopTimerCreate(kCFAllocatorDefault,
                                                   nextFire,
                                                   interval,
                                                   0,
                                                   0,
                                                   JobsTimerRunLoopTimerCallback,
                                                   &ctx);
    CFRunLoopRef rl = CFRunLoopGetMain();
    CFRunLoopMode mode = (self.runLoopMode == NSRunLoopCommonModes)
    ? kCFRunLoopCommonModes
    : (__bridge CFStringRef)self.runLoopMode;
    CFRunLoopAddTimer(rl, timer, mode);
    self.rlTimer = timer;
    // 起步回调
    [self fireTickIfValid:token];
}

#pragma mark —— Selector ticks
- (void)handleTick {
    // 兼容旧 selector：统一转发到 token 校验
    uint64_t token = 0;
    [self.stateLock lock];
    token = self.generation;
    [self.stateLock unlock];
    [self fireTickIfValid:token];
}

#pragma mark —— App State (UIKit)
- (void)setupAppStateMonitorIfNeeded {
    if (!self.autoManageAppState || !self.pauseInBackground) {
        [self teardownAppStateMonitor];
        return;
    }
    if (self.didEnterBGToken || self.willEnterFGToken) return;
    @jobs_weakify(self)
    self.didEnterBGToken = [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationDidEnterBackgroundNotification
                                                                           object:nil
                                                                            queue:NSOperationQueue.mainQueue
                                                                       usingBlock:^(__unused NSNotification * _Nonnull note) {
        @jobs_strongify(self)
        if (!self) return;
        [self jobs_onDidEnterBackground];
    }];
    self.willEnterFGToken = [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationWillEnterForegroundNotification
                                                                            object:nil
                                                                             queue:NSOperationQueue.mainQueue
                                                                        usingBlock:^(__unused NSNotification * _Nonnull note) {
        @jobs_strongify(self)
        if (!self) return;
        [self jobs_onWillEnterForeground];
    }];
}

- (void)teardownAppStateMonitor {
    if (self.didEnterBGToken) {
        [NSNotificationCenter.defaultCenter removeObserver:self.didEnterBGToken];
        self.didEnterBGToken = nil;
    }
    if (self.willEnterFGToken) {
        [NSNotificationCenter.defaultCenter removeObserver:self.willEnterFGToken];
        self.willEnterFGToken = nil;
    }
    self.autoPausedByAppState = NO;
}

- (void)syncWithCurrentAppStateIfNeeded {
    if (!self.autoManageAppState || !self.pauseInBackground) return;
    if (!NSThread.isMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self syncWithCurrentAppStateIfNeeded];
        });
        return;
    }
    UIApplicationState state = UIApplication.sharedApplication.applicationState;
    if (state == UIApplicationStateBackground || state == UIApplicationStateInactive) {
        if (self.isRunning) {
            self.autoPausedByAppState = YES;
            [self pause];
        }
    }
}

- (void)jobs_onDidEnterBackground {
    if (!self.autoManageAppState || !self.pauseInBackground) return;
    if (!self.isRunning) return; // 手动 pause 的不动
    self.autoPausedByAppState = YES;
    [self pause];
}

- (void)jobs_onWillEnterForeground {
    if (!self.autoManageAppState || !self.pauseInBackground) return;
    if (!self.autoPausedByAppState) return;
    self.autoPausedByAppState = NO;
    [self resume];
}

#pragma mark —— onTick / onFinish（线程安全，且保持 DSL 语义）
JobsKey(_onTick)
- (jobsByCGFloatBlock)onTick {
    [self.stateLock lock];
    jobsByCGFloatBlock b = Jobs_getAssociatedObject(_onTick);
    [self.stateLock unlock];
    return b;
}

- (void)setOnTick:(jobsByCGFloatBlock)onTick {
    [self.stateLock lock];
    Jobs_setAssociatedCOPY_NONATOMIC(_onTick, onTick)
    [self.stateLock unlock];
}

JobsKey(_onFinish)
- (JobsTimerBlock)onFinish {
    [self.stateLock lock];
    JobsTimerBlock b = Jobs_getAssociatedObject(_onFinish);
    [self.stateLock unlock];
    return b;
}

- (void)setOnFinish:(JobsTimerBlock)onFinish {
    [self.stateLock lock];
    Jobs_setAssociatedCOPY_NONATOMIC(_onFinish, onFinish)
    [self.stateLock unlock];
}

#pragma mark —— DSL
- (JobsRetTimerByNSUInteger)byTimerType {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerType timerType) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.timerType = timerType;
        [self.stateLock unlock];
        return self;
    };
}

- (JobsRetTimerByNSUInteger)byTimerStyle {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerStyle style) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.timerStyle = style;
        [self.stateLock unlock];
        return self;
    };
}

- (JobsRetTimerByDoubleBlock)byTimeInterval {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSTimeInterval interval) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.timeInterval = interval;
        [self.stateLock unlock];
        return self;
    };
}

- (JobsRetTimerByDoubleBlock)byStartTime {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSTimeInterval startTime) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.startTime = startTime;
        [self.stateLock unlock];
        return self;
    };
}

- (JobsRetTimerByCGFloatBlock)byTime {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(CGFloat time) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.time = time;
        [self.stateLock unlock];
        return self;
    };
}

- (JobsRetTimerByDoubleBlock)byTimeSecIntervalSinceDate {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSTimeInterval delay) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.timeSecIntervalSinceDate = delay;
        [self.stateLock unlock];
        return self;
    };
}

- (JobsRetTimerByStringBlock)byRunLoopMode {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSRunLoopMode mode) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.runLoopMode = mode;
        [self.stateLock unlock];
        return self;
    };
}

- (JobsRetTimerByUserInfo)byUserInfo {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(id userInfo) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.userInfo = userInfo;
        [self.stateLock unlock];
        return self;
    };
}

- (JobsRetTimerByQueue)byQueue {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(dispatch_queue_t queue) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.queue = queue;
        [self.stateLock unlock];
        return self;
    };
}

- (JobsRetTimerByNSUInteger)byTimerState {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerState state) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.timerState = state;
        return self;
    };
}

- (JobsRetTimerByNSUInteger)byPauseInBackground {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSUInteger v) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.pauseInBackground = (v != 0);
        [self setupAppStateMonitorIfNeeded];
        return self;
    };
}

- (JobsRetTimerByNSUInteger)byAutoManageAppState {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSUInteger v) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.autoManageAppState = (v != 0);
        [self setupAppStateMonitorIfNeeded];
        return self;
    };
}

- (JobsRetTimerByCGFloatBlocks)byOnTick {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(jobsByCGFloatBlock block) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.onTick = block;
        return self;
    };
}

- (JobsRetTimerByJTimerBlocks)byOnFinish {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerBlock block) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.onFinish = block;
        return self;
    };
}

@end
