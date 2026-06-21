//
//  JobsTimer.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/11/19.
//

#import "JobsTimer.h"

@interface JobsTimer ()
/// YES  = 已经 suspend 了
/// NO   = 正在运行 / 已经 resume
Prop_assign()BOOL gcdTimerSuspended;
/// ✅ 线程安全：统一用这把锁保护关键状态/回调读写
Prop_strong()NSLock *stateLock;
/// ✅ 前后台感知开关（默认都为 YES）
Prop_assign()BOOL pauseInBackground;
Prop_assign()BOOL autoManageAppState;
/// ✅ 只恢复“自动暂停”的，避免干扰手动 pause
Prop_assign()BOOL autoPausedByAppState;
/// ✅ 不用 id<NSObjectProtocol>，直接用 id（兼容你的工程环境）
Prop_strong(nullable)id didEnterBGToken;
Prop_strong(nullable)id willEnterFGToken;

@end

@implementation JobsTimer
TimerProtocol_synthesize_lock
- (instancetype)init {
    if (self = [super init]) {
        _stateLock = NSLock.new;
        _pauseInBackground = YES;
        _autoManageAppState = YES;
        _autoPausedByAppState = NO;
        _gcdTimerSuspended = NO;
        self.timerState = JobsTimerStateIdle;
    };return self;
}

-(void)dealloc {
    [self teardownAppStateMonitor];
    self.invalidateInternal(YES);
}
#pragma mark —— TimerProtocol 状态语义
-(void)setTimerState:(JobsTimerState)timerState{
    [self.stateLock lock];
    _timerState = timerState;
    _running = (timerState == JobsTimerStateRunning);
    _paused  = (timerState == JobsTimerStatePaused);
    _stop    = (timerState == JobsTimerStateFinished ||
                timerState == JobsTimerStateCanceled);
    [self.stateLock unlock];
}

-(BOOL)isRunning{ [self.stateLock lock]; BOOL v=_running; [self.stateLock unlock]; return v; }
-(BOOL)isPaused { [self.stateLock lock]; BOOL v=_paused;  [self.stateLock unlock]; return v; }
-(BOOL)isStop   { [self.stateLock lock]; BOOL v=_stop;    [self.stateLock unlock]; return v; }
#pragma mark —— TimerProtocol
-(void)start{
    [self setupAppStateMonitorIfNeeded];

    /// 重复 start：先清理旧定时器
    self.invalidateInternal(NO);

    [self.stateLock lock];
    self.accumulatedElapsed = 0;
    self.lastStartDate      = NSDate.date;

    if (self.isCountdownMode) self.time = self.startTime;
    else self.time = 0;

    // start 后如果被自动暂停，不要遗留状态
    self.autoPausedByAppState = NO;
    [self.stateLock unlock];

    @jobs_weakify(self)
    [self delayByMainQueue:self.timeSecIntervalSinceDate block:^{
        @jobs_strongify(self)
        switch (self.timerType) {
            case JobsTimerTypeNSTimer:      [self startNSTimer];      break;
            case JobsTimerTypeGCD:          [self startGCDTimer];     break;
            case JobsTimerTypeDisplayLink:  [self startDisplayLink];  break;
        }
        [self syncWithCurrentAppStateIfNeeded];
    }];
}

-(void)pause{
    if (!self.isRunning) return;

    [self updateElapsedAndMaybeRemaining];

    [self.stateLock lock];
    self.lastStartDate = nil;
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
    }
    self.timerState = JobsTimerStatePaused;
}

-(void)resume{
    if (!self.isPaused) return;

    [self.stateLock lock];
    BOOL isCountdown = self.isCountdownMode;
    BOOL shouldRestoreBase = (!self.lastStartDate &&
                             (!isCountdown || self.time > 0));
    if (shouldRestoreBase) self.lastStartDate = NSDate.date;
    [self.stateLock unlock];

    switch (self.timerType) {
        case JobsTimerTypeNSTimer:
            self.nsTimer.fireDate = [NSDate dateWithTimeIntervalSinceNow:self.timeInterval];
            break;
        case JobsTimerTypeGCD:
            if (self.gcdTimer && self.gcdTimerSuspended) {
                dispatch_resume(self.gcdTimer);
                self.gcdTimerSuspended = NO;
            }
            break;
        case JobsTimerTypeDisplayLink:
            self.displayLink.paused = NO;
            break;
    }
    self.timerState = JobsTimerStateRunning;
}

-(void)fireOnce{
    [self handleTick];
}

-(void)stop{
    self.invalidateInternal(YES);
}
#pragma mark —— 一些私有方法
-(BOOL)repeats{ return YES; }
/// 统一 Tick 入口（线程安全：回调 snapshot）
-(void)handleTick{
    BOOL countdownFinished = [self updateCountdownOnTickIfNeeded];

    jobsByCGFloatBlock tickBlock = nil;
    JobsTimerBlock finishBlock = nil;

    tickBlock = self.onTick;
    finishBlock = self.onFinish;

    if (tickBlock) tickBlock(self.time);

    if (countdownFinished) {
        self.invalidateInternal(NO);
        self.timerState = JobsTimerStateFinished;
        if (finishBlock) finishBlock(self);
    }
}

-(BOOL)isCountdownMode{
    return (self.timerStyle == TimerStyle_anticlockwise && self.startTime > 0);
}

-(void)updateElapsedAndMaybeRemaining{
    [self.stateLock lock];
    if (!self.lastStartDate) { [self.stateLock unlock]; return; }

    NSDate *now = NSDate.date;
    NSTimeInterval delta = [now timeIntervalSinceDate:self.lastStartDate];
    if (delta < 0) delta = 0;

    self.lastStartDate      = now;
    self.accumulatedElapsed += delta;

    if (self.isCountdownMode) {
        NSTimeInterval remaining = self.startTime - self.accumulatedElapsed;
        if (remaining < 0) remaining = 0;
        self.time = remaining;
    } else {
        self.time = self.accumulatedElapsed;
    }
    [self.stateLock unlock];
}

-(BOOL)updateCountdownOnTickIfNeeded{
    [self updateElapsedAndMaybeRemaining];
    if (!self.isCountdownMode) return NO;

    [self.stateLock lock];
    BOOL finished = (self.time <= 0);
    [self.stateLock unlock];

    return finished;
}

-(double)countdownTimerProgress{
    if (!self.isCountdownMode) return 0;

    [self.stateLock lock];
    double remaining = self.time;
    double start = self.startTime;
    [self.stateLock unlock];

    if (remaining < 0) remaining = 0;
    if (remaining > start) remaining = start;

    double done = start - remaining;
    return start > 0 ? (done / start) : 0;
}
/// 内部销毁逻辑（线程安全：先取快照再销毁）
- (jobsByBOOLBlock _Nonnull)invalidateInternal {
    return ^(BOOL markCanceled){

        NSTimer *timer = nil;
        dispatch_source_t gcd = nil;
        BOOL wasSuspended = NO;
        CADisplayLink *dl = nil;

        [self.stateLock lock];
        timer = self->_nsTimer; self->_nsTimer = nil;

        gcd = self->_gcdTimer; self->_gcdTimer = nil;
        wasSuspended = self.gcdTimerSuspended;
        self.gcdTimerSuspended = NO;

        dl = self->_displayLink; self->_displayLink = nil;

        self.lastStartDate      = nil;
        self.accumulatedElapsed = 0;
        self.time               = 0;

        // 自动暂停标记清理
        self.autoPausedByAppState = NO;
        [self.stateLock unlock];
        if (timer) [timer invalidate];
        if (gcd) {
            @try {
                // ✅ cancel 前必须 resume（如果之前 suspend 过）
                if (wasSuspended) dispatch_resume(gcd);
                dispatch_source_cancel(gcd);
            } @catch (__unused NSException *exception) {
                NSLog(@"JobsTimer GCD cancel exception = %@", exception);
            }
        }

        if (dl) [dl invalidate];

        if (markCanceled) {
            self.timerState = JobsTimerStateCanceled;
        } else {
            if (self.timerState == JobsTimerStateRunning ||
                self.timerState == JobsTimerStatePaused) {
                self.timerState = JobsTimerStateIdle;
            }
        }
    };
}
#pragma mark —— NSTimer
-(void)startNSTimer{
    // ✅ 只 add 一次 RunLoop（配合 timerWithTimeInterval）
    [NSRunLoop.currentRunLoop addTimer:self.nsTimer forMode:self.runLoopMode];
    self.timerState = JobsTimerStateRunning;
}
#pragma mark —— GCD
- (void)startGCDTimer {
    if (self.timeInterval <= 0) self.timeInterval = 1.0;
    uint64_t intervalNSEC = (uint64_t)(self.timeInterval * NSEC_PER_SEC);
    if (!self.queue) self.queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_source_set_timer(self.gcdTimer,
                              dispatch_time(DISPATCH_TIME_NOW, intervalNSEC),
                              intervalNSEC,
                              (uint64_t)(0.1 * NSEC_PER_SEC));

    @jobs_weakify(self)
    dispatch_source_set_event_handler(self.gcdTimer, ^{
        @jobs_strongify(self)
        [self handleTick];
    });

    dispatch_resume(self.gcdTimer);
    self.gcdTimerSuspended = NO;
    self.timerState = JobsTimerStateRunning;
}
#pragma mark —— DisplayLink
-(void)startDisplayLink{
    [self.displayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:self.runLoopMode];
    self.timerState = JobsTimerStateRunning;
}
#pragma mark —— LazyLoad
-(NSTimer *)nsTimer{
    if(!_nsTimer){
        // ✅ 不用 scheduledTimer（它会自动 add），改为 timerWithTimeInterval，然后在 startNSTimer 里 add 一次
        _nsTimer = [NSTimer timerWithTimeInterval:self.timeInterval
                                           target:self
                                         selector:@selector(handleTick)
                                         userInfo:self.userInfo
                                          repeats:self.repeats];
    };return _nsTimer;
}

-(dispatch_source_t)gcdTimer{
    if(!_gcdTimer){
        _gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, self.queue);
    };return _gcdTimer;
}

-(CADisplayLink *)displayLink{
    if(!_displayLink){
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleTick)];
    };return _displayLink;
}

-(NSRunLoopMode)runLoopMode{
    if(!_runLoopMode){
        _runLoopMode = NSRunLoopCommonModes;
    };return _runLoopMode;
}

-(NSTimeInterval)timeInterval{
    if(_timeInterval <= 0){
        _timeInterval = 1.0;
    };return _timeInterval;
}

-(dispatch_queue_t)queue{
    if(!_queue){
        _queue = dispatch_get_main_queue();
    };return _queue;
}
#pragma mark —— 前后台感知（直接用 UIKit，无条件编译）
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
        [self jobs_onDidEnterBackground];
    }];

    self.willEnterFGToken = [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationWillEnterForegroundNotification
                                                                            object:nil
                                                                             queue:NSOperationQueue.mainQueue
                                                                        usingBlock:^(__unused NSNotification * _Nonnull note) {
        @jobs_strongify(self)
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

    if (![NSThread isMainThread]) {
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
#pragma mark —— onTick / onFinish（线程安全）
JobsKey(_onTick)
-(jobsByCGFloatBlock _Nullable)onTick{
    [self.stateLock lock];
    jobsByCGFloatBlock b = Jobs_getAssociatedObject(_onTick);
    [self.stateLock unlock];
    return b;
}
-(void)setOnTick:(jobsByCGFloatBlock _Nullable)onTick{
    [self.stateLock lock];
    Jobs_setAssociatedCOPY_NONATOMIC(_onTick, onTick)
    [self.stateLock unlock];
}

JobsKey(_onFinish)
-(JobsTimerBlock _Nullable)onFinish{
    [self.stateLock lock];
    JobsTimerBlock b = Jobs_getAssociatedObject(_onFinish);
    [self.stateLock unlock];
    return b;
}
-(void)setOnFinish:(JobsTimerBlock _Nullable)onFinish{
    [self.stateLock lock];
    Jobs_setAssociatedCOPY_NONATOMIC(_onFinish, onFinish)
    [self.stateLock unlock];
}
#pragma mark —— DSL
-(JobsRetTimerByNSUInteger _Nonnull)byTimerType{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerType timerType){
        @jobs_strongify(self)
        [self.stateLock lock]; self.timerType = timerType; [self.stateLock unlock];
        return self;
    };
}

-(JobsRetTimerByNSUInteger _Nonnull)byTimerStyle{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerStyle style){
        @jobs_strongify(self)
        [self.stateLock lock]; self.timerStyle = style; [self.stateLock unlock];
        return self;
    };
}

-(JobsRetTimerByDoubleBlock _Nonnull)byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSTimeInterval interval){
        @jobs_strongify(self)
        [self.stateLock lock]; self.timeInterval = interval; [self.stateLock unlock];
        return self;
    };
}

-(JobsRetTimerByDoubleBlock _Nonnull)byStartTime{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSTimeInterval startTime){
        @jobs_strongify(self)
        [self.stateLock lock]; self.startTime = startTime; [self.stateLock unlock];
        return self;
    };
}

-(JobsRetTimerByCGFloatBlock _Nonnull)byTime{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(CGFloat time){
        @jobs_strongify(self)
        [self.stateLock lock]; self.time = time; [self.stateLock unlock];
        return self;
    };
}

-(JobsRetTimerByDoubleBlock _Nonnull)byTimeSecIntervalSinceDate{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSTimeInterval delay){
        @jobs_strongify(self)
        [self.stateLock lock]; self.timeSecIntervalSinceDate = delay; [self.stateLock unlock];
        return self;
    };
}

-(JobsRetTimerByStringBlock _Nonnull)byRunLoopMode{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSRunLoopMode mode){
        @jobs_strongify(self)
        [self.stateLock lock]; self.runLoopMode = mode; [self.stateLock unlock];
        return self;
    };
}

-(JobsRetTimerByUserInfo _Nonnull)byUserInfo{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(id userInfo){
        @jobs_strongify(self)
        [self.stateLock lock]; self.userInfo = userInfo; [self.stateLock unlock];
        return self;
    };
}

-(JobsRetTimerByQueue _Nonnull)byQueue{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(dispatch_queue_t queue){
        @jobs_strongify(self)
        [self.stateLock lock]; self.queue = queue; [self.stateLock unlock];
        return self;
    };
}

-(JobsRetTimerByNSUInteger _Nonnull)byTimerState{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerState state){
        @jobs_strongify(self)
        self.timerState = state;
        return self;
    };
}
/// ✅ 新增：0/1
-(JobsRetTimerByNSUInteger _Nonnull)byPauseInBackground{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSUInteger v){
        @jobs_strongify(self)
        self.pauseInBackground = (v != 0);
        [self setupAppStateMonitorIfNeeded];
        return self;
    };
}

-(JobsRetTimerByNSUInteger _Nonnull)byAutoManageAppState{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(NSUInteger v){
        @jobs_strongify(self)
        self.autoManageAppState = (v != 0);
        [self setupAppStateMonitorIfNeeded];
        return self;
    };
}

-(JobsRetTimerByCGFloatBlocks _Nonnull)byOnTick{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(jobsByCGFloatBlock _Nullable block){
        @jobs_strongify(self)
        self.onTick = block;
        return self;
    };
}

-(JobsRetTimerByJTimerBlocks _Nonnull)byOnFinish{
    @jobs_weakify(self)
    return ^__kindof JobsTimer *_Nullable(JobsTimerBlock block){
        @jobs_strongify(self)
        self.onFinish = block;
        return self;
    };
}

@end
