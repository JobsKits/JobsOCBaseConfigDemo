//
//  JobsTimer.m
//  JobsOCTimer
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <math.h>

#import "JobsTimer.h"
#import <JobsOCTimer/NSObject+Queue.h>

@interface CADisplayLink (JobsOCTimerDSL)

-(JobsRetCADisplayLinkByBOOLBlock _Nonnull)byPaused;

@end


// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN NSTimer
@interface NSTimer (JobsLocalPropertyDSLAutogen_99824473ef)
-(JobsRetNSTimerByNSTimeIntervalBlock _Nonnull)byTolerance;
-(void)setTolerance:(NSTimeInterval)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN NSTimer
-(JobsRetNSTimerByNSDateBlock _Nonnull)byFireDate;
-(void)setFireDate:(NSDate * _Nullable)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END NSTimer
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END NSTimer

@implementation CADisplayLink (JobsOCTimerDSL)

-(JobsRetCADisplayLinkByBOOLBlock _Nonnull)byPaused{
    @jobs_weakify(self)
    return ^__kindof CADisplayLink *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.paused = data;
        return self;
    };
}

@end

@class JobsTimerTargetProxy;
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
Prop_strong()NSRecursiveLock *stateLock;
/// generation token：状态变更递增，用于防止残留回调穿透
Prop_assign()uint64_t generation;
/// 前后台感知开关（默认都为 YES）
Prop_assign()BOOL pauseInBackground;
Prop_assign()BOOL autoManageAppState;
/// 只恢复“自动暂停”的，避免干扰手动 pause
Prop_assign()BOOL autoPausedByAppState;
/// 通知 token
Prop_strong(nullable)id willResignActiveToken;
Prop_strong(nullable)id didBecomeActiveToken;
/// CFRunLoopTimer（对应 Swift kind = .runLoop）
Prop_assign()CFRunLoopTimerRef rlTimer;
/// NSTimer / CADisplayLink 通过弱代理回调，避免底层引擎反向持有 JobsTimer。
Prop_strong(nullable)JobsTimerTargetProxy *nsTimerProxy;
Prop_strong(nullable)JobsTimerTargetProxy *displayLinkProxy;

-(jobsByUInt64_tBlock _Nonnull)fireTickIfValid;
- (void)configureGCDTimerHandler:(dispatch_source_t)timer token:(uint64_t)token;
-(jobsByBOOLBlock _Nonnull)pauseMarkedAsAutoPause;
-(jobsByBOOLBlock _Nonnull)resumeOnlyIfAutoPaused;
- (void)teardownAppStateMonitor;
- (jobsByVoidBlock _Nonnull)jobsTeardownAppStateMonitor;

@end

@interface JobsTimerTargetProxy : NSObject

Prop_weak(nullable)JobsTimer *timer;
Prop_assign()uint64_t token;
Prop_assign()NSTimeInterval interval;
Prop_assign()CFTimeInterval nextFireTimestamp;

- (instancetype)initWithTimer:(JobsTimer *)timer
                         token:(uint64_t)token
                      interval:(NSTimeInterval)interval;
- (jobsByVoidBlock _Nonnull)resetDisplayLinkSchedule;
-(JobsRetIDByUInt64_tBlock _Nonnull)byToken;
- (void)handleTimer:(NSTimer *)timer;
-(jobsByunusedNSTimerBlock _Nonnull)jobsHandleTimer;
- (void)handleDisplayLink:(CADisplayLink *)displayLink;
-(jobsByCADisplayLinkBlock _Nonnull)jobsHandleDisplayLink;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsTimerTargetProxy
-(JobsRetJobsTimerTargetProxyByCFTimeIntervalBlock _Nonnull)byNextFireTimestamp;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsTimerTargetProxy
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsTimerTargetProxy
@interface JobsTimerTargetProxy (JobsPropertyDSLSetterAutogen_99824473ef)
-(void)setNextFireTimestamp:(CFTimeInterval)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsTimerTargetProxy

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsTimer
@interface JobsTimer (JobsPropertyDSLSetterAutogen_99824473ef)
-(void)setAutoPausedByAppState:(BOOL)data;
-(void)setDisplayLinkProxy:(JobsTimerTargetProxy * _Nullable)data;
-(void)setGcdTimer:(dispatch_source_t)data;
-(void)setGcdTimerSuspended:(BOOL)data;
-(void)setNsTimerProxy:(JobsTimerTargetProxy * _Nullable)data;
-(void)setRlTimer:(CFRunLoopTimerRef)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsTimer

@implementation JobsTimerTargetProxy

-(JobsRetIDByUInt64_tBlock _Nonnull)byToken{
    @jobs_weakify(self)
    return ^id _Nullable(uint64_t data){
        @jobs_strongify(self)
        self.token = data;
        return self;
    };
}

- (instancetype)initWithTimer:(JobsTimer *)timer
                         token:(uint64_t)token
                      interval:(NSTimeInterval)interval {
    if (self = [super init]) {
        self.timer = timer;
        self.token = token;
        self.interval = MAX(0.000001, interval);
        self.resetDisplayLinkSchedule();
    };return self;
}

- (jobsByVoidBlock _Nonnull)resetDisplayLinkSchedule {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byNextFireTimestamp(CACurrentMediaTime() + self.interval);
    };
}

- (void)handleTimer:(__unused NSTimer *)timer {
    jobsByunusedNSTimerBlock action = ((jobsByunusedNSTimerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTimerTargetProxy.class, @selector(jobsHandleTimer)))(self, @selector(jobsHandleTimer));
    if (action) action(timer);
}

-(jobsByunusedNSTimerBlock _Nonnull)jobsHandleTimer{
    @jobs_weakify(self)
    return ^(__unused NSTimer * timer){
        @jobs_strongify(self)
        if (!self) return;
        self.timer.fireTickIfValid(self.token);
    };
}

- (void)handleDisplayLink:(CADisplayLink *)displayLink {
    jobsByCADisplayLinkBlock action = ((jobsByCADisplayLinkBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTimerTargetProxy.class, @selector(jobsHandleDisplayLink)))(self, @selector(jobsHandleDisplayLink));
    if (action) action(displayLink);
}

-(jobsByCADisplayLinkBlock _Nonnull)jobsHandleDisplayLink{
    @jobs_weakify(self)
    return ^(CADisplayLink * displayLink){
        @jobs_strongify(self)
        if (!self) return;
        CFTimeInterval timestamp = displayLink.targetTimestamp;
        if (timestamp + 0.000001 < self.nextFireTimestamp) return;
        CFTimeInterval elapsed = MAX(0, timestamp - self.nextFireTimestamp);
        CFTimeInterval skippedIntervals = floor(elapsed / self.interval) + 1;
        self.nextFireTimestamp += skippedIntervals * self.interval;
        self.timer.fireTickIfValid(self.token);
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsTimerTargetProxy
-(JobsRetJobsTimerTargetProxyByCFTimeIntervalBlock _Nonnull)byNextFireTimestamp{
    @jobs_weakify(self)
    return ^__kindof JobsTimerTargetProxy * _Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        [self setNextFireTimestamp:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsTimerTargetProxy
@end

@implementation JobsTimer

-(JobsRetTimerByDoubleBlock _Nonnull)byAccumulatedElapsed{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(double data){
        @jobs_strongify(self)
        self.accumulatedElapsed = data;
        return self;
    };
}

-(JobsRetTimerByDateBlock _Nonnull)byLastStartDate{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSDate *_Nullable data){
        @jobs_strongify(self)
        self.lastStartDate = data;
        return self;
    };
}
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
    return isfinite(value) && value > 0 ? value : 1.0;
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval {
    if (!isfinite(timeInterval) || timeInterval <= 0) timeInterval = 1.0;
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
        uint64_t token = 0;
        [self.stateLock lock];
        token = self.generation;
        self.stateLock.unlock;
        JobsTimerTargetProxy *proxy = [[JobsTimerTargetProxy alloc] initWithTimer:self
                                                                            token:token
                                                                         interval:self.timeInterval];
        timer = [NSTimer timerWithTimeInterval:self.timeInterval
                                        target:proxy
                                      selector:@selector(handleTimer:)
                                      userInfo:self.userInfo
                                       repeats:self.repeats];
        timer.byTolerance(0);
        self.byNsTimerProxy(proxy);
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
        uint64_t token = 0;
        [self.stateLock lock];
        token = self.generation;
        self.stateLock.unlock;
        JobsTimerTargetProxy *proxy = [[JobsTimerTargetProxy alloc] initWithTimer:self
                                                                            token:token
                                                                         interval:self.timeInterval];
        displayLink = [CADisplayLink displayLinkWithTarget:proxy selector:@selector(handleDisplayLink:)];
        self.byDisplayLinkProxy(proxy);
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
    self.paused = (timerState == JobsTimerStatePaused);
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
        _stateLock = NSRecursiveLock.new;
        _pauseInBackground = YES;
        _autoManageAppState = YES;
        _autoPausedByAppState = NO;
        self.gcdTimerSuspended = NO;
        _generation = 0;
        _rlTimer = NULL;
        self.byTimerState(JobsTimerStateIdle);
        self.repeats = YES;
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
- (JobsRetBOOLByVoidBlock _Nonnull)isNonGCDKind {
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return (self.timerType != JobsTimerTypeGCD);
    };
}

- (jobsByVoidBlock _Nonnull)setupAppStateIfNeeded {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.setupAppStateMonitorIfNeeded();
    };
}

-(jobsByUInt64_tBlock _Nonnull)fireTickIfValid{
    @jobs_weakify(self)
    return ^(uint64_t token){
        @jobs_strongify(self)
        if (!self) return;
        @synchronized (self) {
        // snapshot
        jobsByCGFloatBlock tickBlock = nil;
        JobsTimerBlock finishBlock = nil;
        BOOL repeats = YES;
        BOOL reachesTerminalState = NO;
        [self.stateLock lock];
        BOOL shouldFire = (self.timerState == JobsTimerStateRunning && token == self.generation);
        repeats = self.repeats;
        CGFloat currentTime = self.time; // 兼容旧语义：外部可能依赖 time 参数
        if (shouldFire) {
            if (self.timerStyle == TimerStyle_anticlockwise) {
                currentTime = MAX(0, currentTime - self.timeInterval);
                reachesTerminalState = currentTime <= 0;
            } else {
                currentTime += self.timeInterval;
            }
            self.byTime(currentTime);
            reachesTerminalState = reachesTerminalState || !repeats;
            if (reachesTerminalState) {
                self.byTimerState(JobsTimerStateFinished);
                self.generation += 1;
            }
        }
        tickBlock = self.onTick;
        finishBlock = self.onFinish;
        self.stateLock.unlock;
        if (!shouldFire) return;
        if (reachesTerminalState) {
            [self invalidateInternal](NO);
        }
        dispatch_queue_t q = self.queue ?: dispatch_get_main_queue();
        dispatch_async(q, ^{
            if (!reachesTerminalState) {
                [self.stateLock lock];
                BOOL isStillValid = (self.timerState == JobsTimerStateRunning && self.generation == token);
                self.stateLock.unlock;
                if (!isStillValid) return;
            }
            if (tickBlock) tickBlock(currentTime);
            if (reachesTerminalState && finishBlock) finishBlock(self);
        });
        }
    };
}

#pragma mark —— TimerProtocol
- (jobsByVoidBlock _Nonnull)start {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @synchronized (self) {
        self.setupAppStateIfNeeded();
        if (self.isNonGCDKind()) {
            jobs_requireMainThread(@"start");
        }
        // 重复 start：先清理旧定时器
        [self invalidateInternal](NO);
        [self.stateLock lock];
        // generation++，用于防穿透
        self.generation += 1;
        uint64_t token = self.generation;
        // 旧版计时/倒计时字段保持初始化（不再驱动核心机制，只作为对外状态）
        self.byAccumulatedElapsed(0);
        self.byLastStartDate(NSDate.date);
        self.byTime(self.startTime);
        self.byTimerState(JobsTimerStateRunning);
        self.byAutoPausedByAppState(NO);
        self.stateLock.unlock;
        @jobs_weakify(self)
        [self delayByMainQueue:self.timeSecIntervalSinceDate block:^{
            @jobs_strongify(self)
            if (!self) return;
            @synchronized (self) {
            [self.stateLock lock];
            BOOL shouldStartEngine = (self.timerState == JobsTimerStateRunning && self.generation == token);
            self.stateLock.unlock;
            if (!shouldStartEngine) return;
            // ⚠️ 非 GCD 内核依赖 RunLoop/DisplayLink：强制主线程主 RunLoop
            if (self.isNonGCDKind() && !NSThread.isMainThread) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.start();
                });return;
            }
            switch (self.timerType) {
                /// 处理 JobsTimerTypeNSTimer 分支
                case JobsTimerTypeNSTimer:
                    self.startNSTimerWithToken(token);
                    break;
                /// 处理 JobsTimerTypeGCD 分支
                case JobsTimerTypeGCD:
                    self.startGCDTimerWithToken(token);
                    break;
                /// 处理 JobsTimerTypeDisplayLink 分支
                case JobsTimerTypeDisplayLink:
                    self.startDisplayLinkWithToken(token);
                    break;
                /// 处理 JobsTimerTypeRunLoop 分支
                case JobsTimerTypeRunLoop:
                    self.startRunLoopTimerWithToken(token);
                    break;
            }
            self.syncWithCurrentAppStateIfNeeded();
            }
        }];
        }
    };
}

- (jobsByVoidBlock _Nonnull)pause {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.pauseMarkedAsAutoPause(NO);
    };
}

-(jobsByBOOLBlock _Nonnull)pauseMarkedAsAutoPause{
    @jobs_weakify(self)
    return ^(BOOL markedAsAutoPause){
        @jobs_strongify(self)
        if (!self) return;
        @synchronized (self) {
        if (self.isNonGCDKind()) jobs_requireMainThread(@"pause");
        [self.stateLock lock];
        if (self.timerState == JobsTimerStatePaused) {
            if (!markedAsAutoPause) self.autoPausedByAppState = NO;
            self.stateLock.unlock;
            return;
        }
        if (self.timerState != JobsTimerStateRunning) {
            self.stateLock.unlock;
            return;
        }
        self.byTimerState(JobsTimerStatePaused);
        self.generation += 1;
        self.byAutoPausedByAppState(markedAsAutoPause);
        self.stateLock.unlock;
        switch (self.timerType) {
            /// 处理 JobsTimerTypeNSTimer 分支
            case JobsTimerTypeNSTimer:
                [(NSTimer *)Jobs_getAssociatedObject(_nsTimer) setFireDate:NSDate.distantFuture];
                break;
            /// 处理 JobsTimerTypeGCD 分支
            case JobsTimerTypeGCD:
                if (self.gcdTimer && !self.gcdTimerSuspended) {
                    dispatch_suspend(self.gcdTimer);
                    self.byGcdTimerSuspended(YES);
                }
                break;
            /// 处理 JobsTimerTypeDisplayLink 分支
            case JobsTimerTypeDisplayLink:
                [(CADisplayLink *)Jobs_getAssociatedObject(_displayLink) setPaused:YES];
                break;
            /// 处理 JobsTimerTypeRunLoop 分支
            case JobsTimerTypeRunLoop:
                if (self.rlTimer) {
                    CFRunLoopTimerInvalidate(self.rlTimer);
                    CFRelease(self.rlTimer);
                    self.byRlTimer(NULL);
                }
                break;
        }
        }
    };
}

- (jobsByVoidBlock _Nonnull)resume {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.resumeOnlyIfAutoPaused(NO);
    };
}

-(jobsByBOOLBlock _Nonnull)resumeOnlyIfAutoPaused{
    @jobs_weakify(self)
    return ^(BOOL onlyIfAutoPaused){
        @jobs_strongify(self)
        if (!self) return;
        @synchronized (self) {
        if (self.isNonGCDKind()) jobs_requireMainThread(@"resume");
        [self.stateLock lock];
        if (self.timerState != JobsTimerStatePaused ||
            (onlyIfAutoPaused && !self.autoPausedByAppState)) {
            self.stateLock.unlock;
            return;
        }
        self.byTimerState(JobsTimerStateRunning);
        self.generation += 1;
        self.byAutoPausedByAppState(NO);
        uint64_t token = self.generation;
        self.stateLock.unlock;
        switch (self.timerType) {
            /// 处理 JobsTimerTypeNSTimer 分支
            case JobsTimerTypeNSTimer:
                if (Jobs_getAssociatedObject(_nsTimer)) {
                    self.nsTimerProxy.byToken(token);
                    self.nsTimer.byFireDate([NSDate dateWithTimeIntervalSinceNow:self.timeInterval]);
                } else {
                    self.startNSTimerWithToken(token);
                }
                break;
            /// 处理 JobsTimerTypeGCD 分支
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
                    self.byGcdTimerSuspended(NO);
                } else if (!self.gcdTimer) {
                    self.startGCDTimerWithToken(token);
                }
                break;
            /// 处理 JobsTimerTypeDisplayLink 分支
            case JobsTimerTypeDisplayLink:
                if (Jobs_getAssociatedObject(_displayLink)) {
                    self.displayLinkProxy.byToken(token);
                    self.displayLinkProxy.resetDisplayLinkSchedule();
                    self.displayLink.byPaused(NO);
                } else {
                    self.startDisplayLinkWithToken(token);
                }
                break;
            /// 处理 JobsTimerTypeRunLoop 分支
            case JobsTimerTypeRunLoop:
                self.startRunLoopTimerWithToken(token);
                break;
        }
        self.syncWithCurrentAppStateIfNeeded();
        }
    };
}

- (jobsByVoidBlock _Nonnull)fireOnce {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @synchronized (self) {
        // 对齐 Swift：停止（销毁）+ 有回调（finish）
        if (self.isNonGCDKind() && !NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.fireOnce();
            });
            return;
        }
        JobsTimerBlock finish = nil;
        dispatch_queue_t q = nil;
        [self.stateLock lock];
        BOOL alreadyStopped = (self.timerState == JobsTimerStateCanceled || self.timerState == JobsTimerStateFinished);
        if (!alreadyStopped) {
            self.byTimerState(JobsTimerStateFinished);
            self.generation += 1;
        }
        q = self.queue ?: dispatch_get_main_queue();
        self.stateLock.unlock;
        finish = self.onFinish;
        if (alreadyStopped) return;
        [self invalidateInternal](NO);
        if (finish) {
            dispatch_async(q, ^{
                finish(self);
            });
        }
        }
    };
}

- (void)stop {
    (((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTimer.class, @selector(jobsStop)))(self, @selector(jobsStop)))();
}

- (jobsByVoidBlock _Nonnull)jobsStop {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @synchronized (self) {
        if (self.isNonGCDKind()) jobs_requireMainThread(@"stop");
        [self.stateLock lock];
        BOOL alreadyStopped = (self.timerState == JobsTimerStateCanceled || self.timerState == JobsTimerStateFinished);
        if (!alreadyStopped) {
            self.byTimerState(JobsTimerStateCanceled);
            self.generation += 1;
        }
        self.stateLock.unlock;
        if (alreadyStopped) return;
        [self invalidateInternal](YES);
        }
    };
}

#pragma mark —— Invalidate
/// 内部销毁逻辑（线程安全：先取快照再销毁）
- (jobsByBOOLBlock _Nonnull)invalidateInternal {
    return ^(BOOL markCanceled) {
        NSTimer *timer = nil;
        dispatch_source_t gcd = nil;
        BOOL wasSuspended = NO;
        CADisplayLink *dl = nil;
        CFRunLoopTimerRef rl = NULL;
        [self.stateLock lock];
        timer = Jobs_getAssociatedObject(_nsTimer);
        Jobs_setAssociatedRETAIN_NONATOMIC(_nsTimer, nil)
        self.nsTimerProxy = nil;
        gcd = Jobs_getAssociatedObject(_gcdTimer);
        Jobs_setAssociatedRETAIN_NONATOMIC(_gcdTimer, nil)
        wasSuspended = self.gcdTimerSuspended;
        self.gcdTimerSuspended = NO;
        dl = Jobs_getAssociatedObject(_displayLink);
        Jobs_setAssociatedRETAIN_NONATOMIC(_displayLink, nil)
        self.displayLinkProxy = nil;
        rl = self.rlTimer; self.rlTimer = NULL;
        self.lastStartDate = nil;
        self.accumulatedElapsed = 0;
        self.time = 0;
        self.autoPausedByAppState = NO;
        self.stateLock.unlock;
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
        dispatch_block_t invalidateThreadAffineEngines = ^{
            if (timer) timer.invalidate;
            if (dl) dl.invalidate;
            if (rl) {
                CFRunLoopTimerInvalidate(rl);
                CFRelease(rl);
            }
        };
        if (NSThread.isMainThread) {
            invalidateThreadAffineEngines();
        } else {
            dispatch_async(dispatch_get_main_queue(), invalidateThreadAffineEngines);
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
-(jobsByUInt64_tBlock _Nonnull)startNSTimerWithToken{
    @jobs_weakify(self)
    return ^(uint64_t token){
        @jobs_strongify(self)
        if (!self) return;
        jobs_requireMainThread(@"startNSTimer");
        NSTimer *timer = self.nsTimer;
        self.nsTimerProxy.byToken(token);
        [NSRunLoop.mainRunLoop addTimer:timer forMode:self.runLoopMode];
    };
}

#pragma mark —— GCD
- (void)configureGCDTimerHandler:(dispatch_source_t)timer token:(uint64_t)token {
    if (!timer) return;
    @jobs_weakify(self)
    dispatch_source_set_event_handler(timer, ^{
        @jobs_strongify(self)
        if (!self) return;
        self.fireTickIfValid(token);
    });
}

-(jobsByUInt64_tBlock _Nonnull)startGCDTimerWithToken{
    @jobs_weakify(self)
    return ^(uint64_t token){
        @jobs_strongify(self)
        if (!self) return;
        if (self.timeInterval <= 0) self.timeInterval = 1.0;
        uint64_t intervalNSEC = (uint64_t)(self.timeInterval * NSEC_PER_SEC);
        if (!self.queue) self.queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        // 重建更干净：避免 resume/suspend 计数错乱
        if (self.gcdTimer) {
            [self invalidateInternal](NO);
        }
        dispatch_source_t t = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, self.queue);
        self.byGcdTimer(t);
        dispatch_source_set_timer(t,
                                  dispatch_time(DISPATCH_TIME_NOW, intervalNSEC),
                                  intervalNSEC,
                                  (uint64_t)(0.1 * NSEC_PER_SEC));
        [self configureGCDTimerHandler:t token:token];
        dispatch_resume(t);
        self.byGcdTimerSuspended(NO);
    };
}

#pragma mark —— DisplayLink
-(jobsByUInt64_tBlock _Nonnull)startDisplayLinkWithToken{
    @jobs_weakify(self)
    return ^(uint64_t token){
        @jobs_strongify(self)
        if (!self) return;
        jobs_requireMainThread(@"startDisplayLink");
        CADisplayLink *displayLink = self.displayLink;
        self.displayLinkProxy.byToken(token);
        self.displayLinkProxy.resetDisplayLinkSchedule();
        [displayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:self.runLoopMode];
    };
}

#pragma mark —— RunLoop (CFRunLoopTimer)
-(jobsByUInt64_tBlock _Nonnull)startRunLoopTimerWithToken{
    @jobs_weakify(self)
    return ^(uint64_t token){
        @jobs_strongify(self)
        if (!self) return;
        jobs_requireMainThread(@"startRunLoopTimer");
        // 先清理旧的
        if (self.rlTimer) {
            CFRunLoopTimerInvalidate(self.rlTimer);
            CFRelease(self.rlTimer);
            self.byRlTimer(NULL);
        }
        CFAbsoluteTime nextFire = CFAbsoluteTimeGetCurrent() + self.timeInterval;
        CFTimeInterval interval = self.repeats ? self.timeInterval : 0;
        @jobs_weakify(self)
        CFRunLoopTimerRef timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault,
                                                                  nextFire,
                                                                  interval,
                                                                  0,
                                                                  0,
                                                                  ^(__unused CFRunLoopTimerRef timer) {
            @jobs_strongify(self)
            if (!self) return;
            self.fireTickIfValid(token);
        });
        CFRunLoopRef rl = CFRunLoopGetMain();
        CFRunLoopMode mode = [self.runLoopMode isEqualToString:NSRunLoopCommonModes]
        ? kCFRunLoopCommonModes
        : (__bridge CFStringRef)self.runLoopMode;
        CFRunLoopAddTimer(rl, timer, mode);
        self.byRlTimer(timer);
    };
}

#pragma mark —— App State (UIKit)
- (jobsByVoidBlock _Nonnull)setupAppStateMonitorIfNeeded {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.autoManageAppState || !self.pauseInBackground) {
            self.jobsTeardownAppStateMonitor();
            return;
        }
        if (self.willResignActiveToken || self.didBecomeActiveToken) return;
        @jobs_weakify(self)
        self.willResignActiveToken = [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationWillResignActiveNotification
                                                                                      object:nil
                                                                                       queue:NSOperationQueue.mainQueue
                                                                                  usingBlock:^(__unused NSNotification * _Nonnull note) {
            @jobs_strongify(self)
            if (!self) return;
            self.jobs_onWillResignActive();
        }];
        self.didBecomeActiveToken = [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationDidBecomeActiveNotification
                                                                                     object:nil
                                                                                      queue:NSOperationQueue.mainQueue
                                                                                 usingBlock:^(__unused NSNotification * _Nonnull note) {
            @jobs_strongify(self)
            if (!self) return;
            self.jobs_onDidBecomeActive();
        }];
    };
}

- (void)teardownAppStateMonitor {
    if (self.willResignActiveToken) {
        [NSNotificationCenter.defaultCenter removeObserver:self.willResignActiveToken];
        self.willResignActiveToken = nil;
    }
    if (self.didBecomeActiveToken) {
        [NSNotificationCenter.defaultCenter removeObserver:self.didBecomeActiveToken];
        self.didBecomeActiveToken = nil;
    }
    self.autoPausedByAppState = NO;
}

- (jobsByVoidBlock _Nonnull)jobsTeardownAppStateMonitor {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self teardownAppStateMonitor];
    };
}

- (jobsByVoidBlock _Nonnull)syncWithCurrentAppStateIfNeeded {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.autoManageAppState || !self.pauseInBackground) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.syncWithCurrentAppStateIfNeeded();
            });
            return;
        }
        UIApplicationState state = UIApplication.sharedApplication.applicationState;
        if (state == UIApplicationStateBackground || state == UIApplicationStateInactive) {
            self.pauseMarkedAsAutoPause(YES);
        }
    };
}

- (jobsByVoidBlock _Nonnull)jobs_onWillResignActive {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.autoManageAppState || !self.pauseInBackground) return;
        self.pauseMarkedAsAutoPause(YES);
    };
}

- (jobsByVoidBlock _Nonnull)jobs_onDidBecomeActive {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.autoManageAppState || !self.pauseInBackground) return;
        self.resumeOnlyIfAutoPaused(YES);
    };
}

#pragma mark —— onTick / onFinish（线程安全，且保持 DSL 语义）
JobsKey(_onTick)
- (jobsByCGFloatBlock _Nullable)onTick {
    [self.stateLock lock];
    jobsByCGFloatBlock b = Jobs_getAssociatedObject(_onTick);
    self.stateLock.unlock;
    return b;
}

- (void)setOnTick:(jobsByCGFloatBlock)onTick {
    [self.stateLock lock];
    Jobs_setAssociatedCOPY_NONATOMIC(_onTick, onTick)
    self.stateLock.unlock;
}

JobsKey(_onFinish)
- (JobsTimerBlock _Nullable)onFinish {
    [self.stateLock lock];
    JobsTimerBlock b = Jobs_getAssociatedObject(_onFinish);
    self.stateLock.unlock;
    return b;
}

- (void)setOnFinish:(JobsTimerBlock)onFinish {
    [self.stateLock lock];
    Jobs_setAssociatedCOPY_NONATOMIC(_onFinish, onFinish)
    self.stateLock.unlock;
}

#pragma mark —— DSL
- (JobsRetTimerByNSUInteger)byTimerType {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerType timerType) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.timerType = timerType;
        self.stateLock.unlock;
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
        self.stateLock.unlock;
        return self;
    };
}

- (JobsRetTimerByDoubleBlock _Nonnull)byTimeInterval {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSTimeInterval interval) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.timeInterval = interval;
        self.stateLock.unlock;
        return self;
    };
}

- (JobsRetTimerByDoubleBlock _Nonnull)byStartTime {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSTimeInterval startTime) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.startTime = startTime;
        self.stateLock.unlock;
        return self;
    };
}

- (JobsRetTimerByCGFloatBlock _Nonnull)byTime {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(CGFloat time) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.time = time;
        self.stateLock.unlock;
        return self;
    };
}

- (JobsRetTimerByDoubleBlock _Nonnull)byTimeSecIntervalSinceDate {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSTimeInterval delay) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.timeSecIntervalSinceDate = delay;
        self.stateLock.unlock;
        return self;
    };
}

- (JobsRetTimerByStringBlock _Nonnull)byRunLoopMode {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSRunLoopMode mode) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self.stateLock lock];
        self.runLoopMode = mode;
        self.stateLock.unlock;
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
        self.stateLock.unlock;
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
        self.stateLock.unlock;
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
        self.setupAppStateMonitorIfNeeded();
        return self;
    };
}

- (JobsRetTimerByNSUInteger)byAutoManageAppState {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSUInteger v) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.autoManageAppState = (v != 0);
        self.setupAppStateMonitorIfNeeded();
        return self;
    };
}

- (JobsRetTimerByCGFloatBlocks _Nonnull)byOnTick {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(jobsByCGFloatBlock block) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.onTick = block;
        return self;
    };
}

- (JobsRetTimerByJTimerBlocks _Nonnull)byOnFinish {
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerBlock block) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.onFinish = block;
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsTimer
-(JobsRetJobsTimerByBOOLBlock _Nonnull)byAutoPausedByAppState{
    @jobs_weakify(self)
    return ^__kindof JobsTimer * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setAutoPausedByAppState:data];
        return self;
    };
}

-(JobsRetJobsTimerByBOOLBlock _Nonnull)byGcdTimerSuspended{
    @jobs_weakify(self)
    return ^__kindof JobsTimer * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setGcdTimerSuspended:data];
        return self;
    };
}

-(JobsRetJobsTimerByCFRunLoopTimerRefBlock _Nonnull)byRlTimer{
    @jobs_weakify(self)
    return ^__kindof JobsTimer * _Nullable(CFRunLoopTimerRef data){
        @jobs_strongify(self)
        [self setRlTimer:data];
        return self;
    };
}

-(JobsRetJobsTimerByJobsTimerTargetProxyBlock _Nonnull)byDisplayLinkProxy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer * _Nullable(JobsTimerTargetProxy * _Nullable data){
        @jobs_strongify(self)
        [self setDisplayLinkProxy:data];
        return self;
    };
}

-(JobsRetJobsTimerByJobsTimerTargetProxyBlock _Nonnull)byNsTimerProxy{
    @jobs_weakify(self)
    return ^__kindof JobsTimer * _Nullable(JobsTimerTargetProxy * _Nullable data){
        @jobs_strongify(self)
        [self setNsTimerProxy:data];
        return self;
    };
}
-(JobsRetJobsTimerBydispatch_source_tBlock _Nonnull)byGcdTimer{
    @jobs_weakify(self)
    return ^__kindof JobsTimer * _Nullable(dispatch_source_t data){
        @jobs_strongify(self)
        [self setGcdTimer:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsTimer
@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN NSTimer
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN NSTimer
@interface NSTimer (JobsPropertyDSLSetterAutogen_99824473ef)
-(void)setFireDate:(NSDate * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END NSTimer

@implementation NSTimer (JobsLocalPropertyDSLAutogen_99824473ef)
-(JobsRetNSTimerByNSTimeIntervalBlock _Nonnull)byTolerance{
    @jobs_weakify(self)
    return ^__kindof NSTimer * _Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        [self setTolerance:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN NSTimer
-(JobsRetNSTimerByNSDateBlock _Nonnull)byFireDate{
    @jobs_weakify(self)
    return ^__kindof NSTimer * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        [self setFireDate:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END NSTimer
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END NSTimer
