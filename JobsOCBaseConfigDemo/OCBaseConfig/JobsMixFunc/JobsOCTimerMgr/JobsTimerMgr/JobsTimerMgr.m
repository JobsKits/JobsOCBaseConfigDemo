//
//  JobsTimerMgr.m
//  JobsOCTimerMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTimerMgr.h"
#import "_JobsTimerMgrEntry.h"

static inline void jobs_runOnMainSyncIfNeeded(dispatch_block_t block) {
    if ([NSThread isMainThread]) { block(); return; }
    dispatch_sync(dispatch_get_main_queue(), block);
}

static inline void jobs_trySetBoolByKVC(id obj, NSString *key, BOOL value) {
    @try {
        [obj setValue:@(value) forKey:key];
    } @catch (__unused NSException *e) {}
}

@interface JobsTimerMgr ()
Prop()dispatch_queue_t isolationQueue;
Prop_strong()NSMutableDictionary<NSString *, _JobsTimerMgrEntry *> *entries;
Prop_strong()NSMutableSet<NSString *> *pausedScopeIdentifiers;
/// 通知 token：用 id（别用 id<NSObjectProtocol>，你工程里会报类型找不到）
Prop_strong(nullable)id willResignActiveToken;
Prop_strong(nullable)id didEnterBGToken;
Prop_strong(nullable)id didBecomeActiveToken;

- (void)invokeTickBlocksForIdentifier:(NSString *)identifier
                        expectedEntry:(_JobsTimerMgrEntry *)expectedEntry
                                  time:(CGFloat)time;
- (void)invokeFinishBlocksForIdentifier:(NSString *)identifier
                          expectedEntry:(_JobsTimerMgrEntry *)expectedEntry
                                   timer:(JobsTimer * _Nullable)timer;
- (void)syncEntryWithCurrentAppStateForIdentifier:(NSString *)identifier
                                     expectedEntry:(_JobsTimerMgrEntry *)expectedEntry;
-(jobsByBOOLBlock _Nonnull)handleInactiveState;
- (jobsByVoidBlock _Nonnull)handleDidBecomeActive;
-(JobsRetStrByStrBlock _Nonnull)normalizedScopeIdentifier;

@end

@implementation JobsTimerMgr
- (void)dealloc {
    [self jobsTeardownAppStateObserversInternal];
    // 此时所有外部强引用已释放，直接取现有 ivar，避免创建 weak self 或重新唤醒懒加载。
    NSArray<_JobsTimerMgrEntry *> *entries = [_entries.allValues copy];
    [_entries removeAllObjects];
    [_pausedScopeIdentifiers removeAllObjects];
    dispatch_block_t stopTimers = ^{
        for (_JobsTimerMgrEntry *entry in entries) {
            entry.timer.onTick = nil;
            entry.timer.onFinish = nil;
            entry.timer.jobsStop();
        }
    };
    if (NSThread.isMainThread) {
        stopTimers();
    } else {
        dispatch_async(dispatch_get_main_queue(), stopTimers);
    }
}

+ (JobsRetJobsTimerMgrByVoidBlock _Nonnull)shared {
    return ^__kindof JobsTimerMgr *{
        static JobsTimerMgr *m = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            m = [[JobsTimerMgr alloc] init];
        });return m;
    };
}

- (instancetype)init {
    if (self = [super init]) {
        _isolationQueue = dispatch_queue_create("com.jobs.timer.manager.lock", DISPATCH_QUEUE_SERIAL);
        self.setupAppStateObservers();
    };return self;
}
#pragma mark —— Upsert
- (BOOL)upsertTimerWithIdentifiable:(id<JobsTimerIdentifiable>)identifier
                          timerType:(JobsTimerType)timerType
                             policy:(JobsTimerBackgroundPolicy)policy
                   startImmediately:(BOOL)startImmediately
                              build:(JobsTimerMgrBuildBlock)build
                            handler:(jobsByVoidBlock)handler {
    return [self upsertTimerWithIdentifier:identifier.timerIdentifier
                                timerType:timerType
                                   policy:policy
                         startImmediately:startImmediately
                                    build:build
                                  handler:handler];
}

- (BOOL)upsertTimerWithIdentifier:(NSString *)identifier
                        timerType:(JobsTimerType)timerType
                           policy:(JobsTimerBackgroundPolicy)policy
                 startImmediately:(BOOL)startImmediately
                            build:(JobsTimerMgrBuildBlock)build
                          handler:(jobsByVoidBlock)handler {
    return [self upsertTimerWithIdentifier:identifier
                           scopeIdentifier:nil
                                 timerType:timerType
                                    policy:policy
                          startImmediately:startImmediately
                                     build:build
                                   handler:handler];
}

- (BOOL)upsertTimerWithIdentifier:(NSString *)identifier
                  scopeIdentifier:(NSString *)scopeIdentifier
                        timerType:(JobsTimerType)timerType
                           policy:(JobsTimerBackgroundPolicy)policy
                 startImmediately:(BOOL)startImmediately
                            build:(JobsTimerMgrBuildBlock)build
                          handler:(jobsByVoidBlock)handler {
    if (identifier.length == 0) return NO;
    JobsTimer *timer = jobsMakeTimer(^(JobsTimer * _Nullable t) {
        t.byTimerType(timerType)
         .byTimerState(JobsTimerStateIdle);
        // 尽力关闭 timer 内核自带前后台监听（如果你 JobsTimer 支持的话）
        jobs_trySetBoolByKVC(t, @"autoManageAppState", NO);
        jobs_trySetBoolByKVC(t, @"pauseInBackground", NO);
        if (build) build(t);
    });
    jobsByCGFloatBlock presetTick = timer.onTick;
    JobsTimerBlock presetFinish = timer.onFinish;
    _JobsTimerMgrEntry *entry = _JobsTimerMgrEntry.new
        .byTimer(timer)
        .byScopeIdentifier(self.normalizedScopeIdentifier(scopeIdentifier))
        .byPolicy(policy)
        .byPauseState(_JobsTimerPauseStateRunning)
        .byTickBlock(handler ? ^(__unused CGFloat time) {
            handler();
        } : nil)
        .byTickBlock(presetTick)
        .byFinishBlock(presetFinish);
    @jobs_weakify(self)
    NSString *idCopy = [identifier copy];
    __weak _JobsTimerMgrEntry *weakEntry = entry;
    timer.onTick = ^(CGFloat time) {
        @jobs_strongify(self)
        _JobsTimerMgrEntry *strongEntry = weakEntry;
        if (!strongEntry) return;
        [self invokeTickBlocksForIdentifier:idCopy expectedEntry:strongEntry time:time];
    };
    timer.onFinish = ^(JobsTimer * _Nullable t) {
        @jobs_strongify(self)
        _JobsTimerMgrEntry *strongEntry = weakEntry;
        if (!strongEntry) return;
        [self invokeFinishBlocksForIdentifier:idCopy expectedEntry:strongEntry timer:t];
    };
    jobs_runOnMainSyncIfNeeded(^{
        __block JobsTimer *oldTimer = nil;
        dispatch_sync(self.isolationQueue, ^{
            oldTimer = self.entries[identifier].timer;
            self.entries[identifier] = entry;
        });
        if (oldTimer && oldTimer != timer) {
            oldTimer.jobsStop();
        }
        if (startImmediately) {
            timer.start();
            [self syncEntryWithCurrentAppStateForIdentifier:identifier expectedEntry:entry];
        }
    });return YES;
}
#pragma mark —— Register callbacks
- (BOOL)onTickVoid:(NSString *)identifier block:(jobsByVoidBlock)block {
    if (!block) return NO;
    return [self onTick:identifier block:^(__unused CGFloat t) { block(); }];
}

- (BOOL)onTick:(NSString *)identifier block:(jobsByCGFloatBlock)block {
    if (identifier.length == 0 || !block) return NO;
    __block BOOL ok = NO;
    dispatch_sync(self.isolationQueue, ^{
        _JobsTimerMgrEntry *entry = self.entries[identifier];
        if (!entry) return;
        [entry.tickBlocks addObject:[block copy]];
        ok = YES;
    });return ok;
}

- (BOOL)onFinishVoid:(NSString *)identifier block:(jobsByVoidBlock)block {
    if (!block) return NO;
    return [self onFinish:identifier block:^(__unused JobsTimer *t) { block(); }];
}

- (BOOL)onFinish:(NSString *)identifier block:(JobsTimerBlock)block {
    if (identifier.length == 0 || !block) return NO;
    __block BOOL ok = NO;
    dispatch_sync(self.isolationQueue, ^{
        _JobsTimerMgrEntry *entry = self.entries[identifier];
        if (!entry) return;
        [entry.finishBlocks addObject:[block copy]];
        ok = YES;
    });return ok;
}

#pragma mark —— Controls
-(JobsRetBOOLByStrBlock _Nonnull)start{
    @jobs_weakify(self)
    return ^BOOL(NSString * identifier){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        __block _JobsTimerMgrEntry *entry = nil;
        __block JobsTimer *timer = nil;
        __block BOOL ok = NO;
        dispatch_sync(self.isolationQueue, ^{
            entry = self.entries[identifier];
            if (!entry) return;
            timer = entry.timer;
            ok = YES;
        });
        if (!ok || !timer) return NO;
        __block BOOL performed = NO;
        jobs_runOnMainSyncIfNeeded(^{
            dispatch_sync(self.isolationQueue, ^{
                if (self.entries[identifier] != entry) return;
                entry.byPauseState(_JobsTimerPauseStateRunning);
                if (!entry.timer.isRunning) {
                    entry.finishDelivered = NO;
                }
                performed = YES;
            });
            if (!performed) return;
            timer.start();
            [self syncEntryWithCurrentAppStateForIdentifier:identifier expectedEntry:entry];
        });return performed;
    };
}

- (BOOL)pause:(NSString *)identifier {
    return ((((JobsRetBOOLByStrBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTimerMgr.class, @selector(pause)))(self, @selector(pause))))(identifier);
}
-(JobsRetBOOLByStrBlock _Nonnull)pause{
    @jobs_weakify(self)
    return ^BOOL(NSString * identifier){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        __block _JobsTimerMgrEntry *entry = nil;
        __block JobsTimer *timer = nil;
        __block BOOL ok = NO;
        dispatch_sync(self.isolationQueue, ^{
            entry = self.entries[identifier];
            if (!entry) return;
            timer = entry.timer;
            ok = YES;
        });
        if (!ok || !timer) return NO;
        __block BOOL performed = NO;
        jobs_runOnMainSyncIfNeeded(^{
            dispatch_sync(self.isolationQueue, ^{
                if (self.entries[identifier] != entry) return;
                entry.byPauseState(_JobsTimerPauseStateManualPaused);
                performed = YES;
            });
            if (!performed) return;
            timer.pause();
        });return performed;
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)resume{
    @jobs_weakify(self)
    return ^BOOL(NSString * identifier){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        __block _JobsTimerMgrEntry *entry = nil;
        __block JobsTimer *timer = nil;
        __block BOOL ok = NO;
        dispatch_sync(self.isolationQueue, ^{
            entry = self.entries[identifier];
            if (!entry) return;
            timer = entry.timer;
            ok = YES;
        });
        if (!ok || !timer) return NO;
        __block BOOL performed = NO;
        jobs_runOnMainSyncIfNeeded(^{
            dispatch_sync(self.isolationQueue, ^{
                if (self.entries[identifier] != entry) return;
                entry.byPauseState(_JobsTimerPauseStateRunning);
                performed = YES;
            });
            if (!performed) return;
            timer.resume();
            [self syncEntryWithCurrentAppStateForIdentifier:identifier expectedEntry:entry];
        });return performed;
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)fireOnceAndRemove{
    @jobs_weakify(self)
    return ^BOOL(NSString *identifier) {
        @jobs_strongify(self)
        if (!self || identifier.length == 0) {
            return NO;
        }
        __block BOOL performed = NO;
        jobs_runOnMainSyncIfNeeded(^{
            __block JobsTimer *timer = nil;
            __block NSArray<JobsTimerBlock> *finishBlocks = nil;
            dispatch_sync(self.isolationQueue, ^{
                _JobsTimerMgrEntry *entry = self.entries[identifier];
                if (!entry || !entry.timer) {
                    return;
                }
                timer = entry.timer;
                if (!entry.finishDelivered) {
                    entry.finishDelivered = YES;
                    finishBlocks = [entry.finishBlocks copy];
                }
                [self.entries removeObjectForKey:identifier];
                performed = YES;
            });
            if (!performed) {
                return;
            }
            // 终态快照独立于注册表；旧 entry 的迟到回调仍走身份过滤。
            timer.onFinish = nil;
            timer.fireOnce();
            if (finishBlocks.count > 0) {
                dispatch_async(timer.queue ?: dispatch_get_main_queue(), ^{
                    for (JobsTimerBlock block in finishBlocks) {
                        block(timer);
                    }
                });
            }
        });
        return performed;
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)stopAndRemove{
    @jobs_weakify(self)
    return ^BOOL(NSString * identifier){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        __block JobsTimer *timer = nil;
        dispatch_sync(self.isolationQueue, ^{
            timer = self.entries[identifier].timer;
        });
        if (!timer) return NO;
        return [self stopAndRemove:identifier expectedTimer:timer];
    };
}

- (BOOL)stopAndRemove:(NSString *)identifier
        expectedTimer:(JobsTimer *)expectedTimer {
    if (identifier.length == 0 || !expectedTimer) return NO;
    __block BOOL performed = NO;
    jobs_runOnMainSyncIfNeeded(^{
        dispatch_sync(self.isolationQueue, ^{
            _JobsTimerMgrEntry *entry = self.entries[identifier];
            if (!entry || entry.timer != expectedTimer) return;
            [self.entries removeObjectForKey:identifier];
            performed = YES;
        });
        expectedTimer.jobsStop();
    });return performed;
}

-(JobsRetNSUIntegerByNSStringBlock _Nonnull)pauseScope{
    @jobs_weakify(self)
    return ^NSUInteger(NSString * scopeIdentifier){
        @jobs_strongify(self)
        if (!self) return (NSUInteger){0};
        NSString *scope = self.normalizedScopeIdentifier(scopeIdentifier);
        if (!scope) return 0;
        __block NSMutableArray<JobsTimer *> *toPause = NSMutableArray.array;
        __block NSUInteger matchedCount = 0;
        dispatch_sync(self.isolationQueue, ^{
            [self.pausedScopeIdentifiers addObject:scope];
            [self.entries enumerateKeysAndObjectsUsingBlock:^(__unused NSString *identifier,
                                                              _JobsTimerMgrEntry *entry,
                                                              __unused BOOL *stop) {
                if (![entry.scopeIdentifier isEqualToString:scope]) return;
                matchedCount += 1;
                switch (entry.pauseState) {
                    /// Scope 只接管正在运行或系统自动暂停的 Timer
                    case _JobsTimerPauseStateRunning:
                    case _JobsTimerPauseStateAutoPaused:
                        entry.byPauseState(_JobsTimerPauseStateScopePaused);
                        if (entry.timer) [toPause addObject:entry.timer];
                        break;
                    /// 手动暂停和已经被 Scope 暂停的状态保持原语义
                    case _JobsTimerPauseStateManualPaused:
                    case _JobsTimerPauseStateScopePaused:
                        break;
                }
            }];
        });
        jobs_runOnMainSyncIfNeeded(^{
            for (JobsTimer *timer in toPause) {
                timer.pause();
            }
        });return matchedCount;
    };
}

-(JobsRetNSUIntegerByNSStringBlock _Nonnull)resumeScope{
    @jobs_weakify(self)
    return ^NSUInteger(NSString * scopeIdentifier){
        @jobs_strongify(self)
        if (!self) return (NSUInteger){0};
        NSString *scope = self.normalizedScopeIdentifier(scopeIdentifier);
        if (!scope) return 0;
        __block NSMutableArray<NSString *> *identifiers = NSMutableArray.array;
        __block NSMutableArray<_JobsTimerMgrEntry *> *entries = NSMutableArray.array;
        __block NSUInteger matchedCount = 0;
        dispatch_sync(self.isolationQueue, ^{
            [self.pausedScopeIdentifiers removeObject:scope];
            [self.entries enumerateKeysAndObjectsUsingBlock:^(NSString *identifier,
                                                              _JobsTimerMgrEntry *entry,
                                                              __unused BOOL *stop) {
                if (![entry.scopeIdentifier isEqualToString:scope]) return;
                matchedCount += 1;
                if (entry.pauseState != _JobsTimerPauseStateScopePaused) return;
                entry.byPauseState(_JobsTimerPauseStateRunning);
                [identifiers addObject:identifier];
                [entries addObject:entry];
            }];
        });
        jobs_runOnMainSyncIfNeeded(^{
            [entries enumerateObjectsUsingBlock:^(_JobsTimerMgrEntry *entry,
                                                  NSUInteger idx,
                                                  __unused BOOL *stop) {
                entry.timer.resume();
                [self syncEntryWithCurrentAppStateForIdentifier:identifiers[idx]
                                                 expectedEntry:entry];
            }];
        });return matchedCount;
    };
}

-(JobsRetNSUIntegerByNSStringBlock _Nonnull)stopAndRemoveScope{
    @jobs_weakify(self)
    return ^NSUInteger(NSString * scopeIdentifier){
        @jobs_strongify(self)
        if (!self) return (NSUInteger){0};
        NSString *scope = self.normalizedScopeIdentifier(scopeIdentifier);
        if (!scope) return 0;
        __block NSMutableArray<JobsTimer *> *timers = NSMutableArray.array;
        dispatch_sync(self.isolationQueue, ^{
            NSArray<NSString *> *identifiers = self.entries.allKeys.copy;
            for (NSString *identifier in identifiers) {
                _JobsTimerMgrEntry *entry = self.entries[identifier];
                if (![entry.scopeIdentifier isEqualToString:scope]) continue;
                if (entry.timer) [timers addObject:entry.timer];
                [self.entries removeObjectForKey:identifier];
            }
            [self.pausedScopeIdentifiers removeObject:scope];
        });
        jobs_runOnMainSyncIfNeeded(^{
            for (JobsTimer *timer in timers) {
                timer.jobsStop();
            }
        });return timers.count;
    };
}

- (jobsByVoidBlock _Nonnull)stopAndRemoveAll {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        __block NSArray<JobsTimer *> *timers = nil;
        dispatch_sync(self.isolationQueue, ^{
            NSMutableArray<JobsTimer *> *tmp = [NSMutableArray arrayWithCapacity:self.entries.count];
            [self.entries enumerateKeysAndObjectsUsingBlock:^(__unused NSString *key, _JobsTimerMgrEntry *obj, __unused BOOL *stop) {
                if (obj.timer) [tmp addObject:obj.timer];
            }];
            [self.entries removeAllObjects];
            [self.pausedScopeIdentifiers removeAllObjects];
            timers = [tmp copy];
        });
        if (timers.count == 0) return;
        jobs_runOnMainSyncIfNeeded(^{
            for (JobsTimer *t in timers) {
                t.jobsStop();
            }
        });
    };
}
#pragma mark —— Query
-(JobsRetBOOLByStrBlock _Nonnull)exists{
    @jobs_weakify(self)
    return ^BOOL(NSString * identifier){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        __block BOOL ok = NO;
        dispatch_sync(self.isolationQueue, ^{
            ok = (self.entries[identifier] != nil);
        });return ok;
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)isRunning{
    @jobs_weakify(self)
    return ^BOOL(NSString * identifier){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        __block JobsTimer *timer = nil;
        dispatch_sync(self.isolationQueue, ^{
            timer = self.entries[identifier].timer;
        });return timer.isRunning;
    };
}

- (JobsRetNSArrayNSStringByVoidBlock _Nonnull)allIdentifiers {
    @jobs_weakify(self)
    return ^NSArray<NSString *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        __block NSArray<NSString *> *ids = nil;
        dispatch_sync(self.isolationQueue, ^{
            ids = [[self.entries allKeys] sortedArrayUsingSelector:@selector(compare:)];
        });return ids ?: @[];
    };
}

-(JobsRetTimerByStringBlock _Nonnull)timerForIdentifier{
    @jobs_weakify(self)
    return ^JobsTimer *(NSString * identifier){
        @jobs_strongify(self)
        if (!self) return nil;
        __block JobsTimer *timer = nil;
        dispatch_sync(self.isolationQueue, ^{
            timer = self.entries[identifier].timer;
        });return timer;
    };
}
#pragma mark —— Private: callback invoke (snapshot)
- (void)invokeTickBlocksForIdentifier:(NSString *)identifier
                        expectedEntry:(_JobsTimerMgrEntry *)expectedEntry
                                  time:(CGFloat)time {
    __block NSArray<jobsByCGFloatBlock> *blocks = nil;
    dispatch_sync(self.isolationQueue, ^{
        _JobsTimerMgrEntry *entry = self.entries[identifier];
        blocks = (entry == expectedEntry) ? [entry.tickBlocks copy] : @[];
    });
    for (jobsByCGFloatBlock b in blocks) {
        if (b) b(time);
    }
}

- (void)invokeFinishBlocksForIdentifier:(NSString *)identifier
                          expectedEntry:(_JobsTimerMgrEntry *)expectedEntry
                                   timer:(JobsTimer * _Nullable)timer {
    __block NSArray<JobsTimerBlock> *blocks = nil;
    dispatch_sync(self.isolationQueue, ^{
        _JobsTimerMgrEntry *entry = self.entries[identifier];
        if (entry == expectedEntry && !entry.finishDelivered) {
            entry.finishDelivered = YES;
            blocks = [entry.finishBlocks copy];
        } else {
            blocks = @[];
        }
    });
    for (JobsTimerBlock b in blocks) {
        if (b) b(timer);
    }
}
#pragma mark —— App State Observers
- (jobsByVoidBlock _Nonnull)setupAppStateObservers {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        self.willResignActiveToken =
        [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationWillResignActiveNotification
                                                        object:nil
                                                         queue:NSOperationQueue.mainQueue
                                                    usingBlock:^(__unused NSNotification *note) {
            @jobs_strongify(self)
            if (!self) {
                return;
            }
            self.handleInactiveState(NO);
        }];
        self.didEnterBGToken =
        [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationDidEnterBackgroundNotification
                                                        object:nil
                                                         queue:NSOperationQueue.mainQueue
                                                    usingBlock:^(__unused NSNotification *note) {
            @jobs_strongify(self)
            if (!self) {
                return;
            }
            self.handleInactiveState(YES);
        }];
        self.didBecomeActiveToken =
        [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationDidBecomeActiveNotification
                                                        object:nil
                                                         queue:NSOperationQueue.mainQueue
                                                    usingBlock:^(__unused NSNotification *note) {
            @jobs_strongify(self)
            if (!self) {
                return;
            }
            self.handleDidBecomeActive();
        }];
    };
}

- (jobsByVoidBlock _Nonnull)teardownAppStateObservers {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (self) {
            [self jobsTeardownAppStateObserversInternal];
        }
    };
}

- (void)jobsTeardownAppStateObserversInternal {
    NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
    if (_willResignActiveToken) {
        [center removeObserver:_willResignActiveToken];
        _willResignActiveToken = nil;
    }
    if (_didEnterBGToken) {
        [center removeObserver:_didEnterBGToken];
        _didEnterBGToken = nil;
    }
    if (_didBecomeActiveToken) {
        [center removeObserver:_didBecomeActiveToken];
        _didBecomeActiveToken = nil;
    }
}

- (void)syncEntryWithCurrentAppStateForIdentifier:(NSString *)identifier
                                     expectedEntry:(_JobsTimerMgrEntry *)expectedEntry {
    jobs_runOnMainSyncIfNeeded(^{
        UIApplicationState state = UIApplication.sharedApplication.applicationState;
        __block JobsTimer *toPause = nil;
        __block JobsTimer *toStop = nil;
        dispatch_sync(self.isolationQueue, ^{
            _JobsTimerMgrEntry *entry = self.entries[identifier];
            if (entry != expectedEntry) return;
            if (entry.policy == JobsTimerBackgroundPolicyCancel &&
                state == UIApplicationStateBackground) {
                toStop = entry.timer;
                [self.entries removeObjectForKey:identifier];
                return;
            }
            if (entry.scopeIdentifier &&
                [self.pausedScopeIdentifiers containsObject:entry.scopeIdentifier] &&
                entry.timer.isRunning) {
                entry.byPauseState(_JobsTimerPauseStateScopePaused);
                toPause = entry.timer;
                return;
            }
            if (state == UIApplicationStateActive) return;
            switch (entry.policy) {
                /// 处理 JobsTimerBackgroundPolicyIgnore 分支
                case JobsTimerBackgroundPolicyIgnore:
                    break;
                /// 处理 JobsTimerBackgroundPolicyPauseAndResume 分支
                case JobsTimerBackgroundPolicyPauseAndResume:
                    if (!entry.timer.isRunning || entry.pauseState != _JobsTimerPauseStateRunning) break;
                    entry.byPauseState(_JobsTimerPauseStateAutoPaused);
                    toPause = entry.timer;
                    break;
                /// 处理 JobsTimerBackgroundPolicyCancel 分支
                case JobsTimerBackgroundPolicyCancel:
                    break;
            }
        });
        if (toPause) toPause.pause();
        if (toStop) toStop.jobsStop();
    });
}

-(jobsByBOOLBlock _Nonnull)handleInactiveState{
    @jobs_weakify(self)
    return ^(BOOL isBackground){
        @jobs_strongify(self)
        if (!self) return;
        __block NSMutableArray<JobsTimer *> *toPause = NSMutableArray.array;
        __block NSMutableArray<JobsTimer *> *toStop  = NSMutableArray.array;
        dispatch_sync(self.isolationQueue, ^{
            NSArray<NSString *> *keys = [[self.entries allKeys] copy];
            for (NSString *tid in keys) {
                _JobsTimerMgrEntry *entry = self.entries[tid];
                if (!entry) continue;
                switch (entry.policy) {
                    /// 处理 JobsTimerBackgroundPolicyIgnore 分支
                    case JobsTimerBackgroundPolicyIgnore:
                        break;
                    /// 处理 JobsTimerBackgroundPolicyCancel 分支
                    case JobsTimerBackgroundPolicyCancel:
                        if (isBackground) {
                            if (entry.timer) [toStop addObject:entry.timer];
                            [self.entries removeObjectForKey:tid];
                        }
                        break;
                    /// 处理 JobsTimerBackgroundPolicyPauseAndResume 分支
                    case JobsTimerBackgroundPolicyPauseAndResume: {
                        if (!entry.timer.isRunning) break;
                        if (entry.pauseState != _JobsTimerPauseStateRunning) break;
                        entry.byPauseState(_JobsTimerPauseStateAutoPaused);
                        if (entry.timer) [toPause addObject:entry.timer];
                    } break;
                }
            }
        });
        for (JobsTimer *t in toPause) t.pause();
        for (JobsTimer *t in toStop)  t.jobsStop();
    };
}

- (jobsByVoidBlock _Nonnull)handleDidBecomeActive {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        __block NSMutableArray<JobsTimer *> *toResume = NSMutableArray.array;
        dispatch_sync(self.isolationQueue, ^{
            NSArray<NSString *> *keys = [[self.entries allKeys] copy];
            for (NSString *tid in keys) {
                _JobsTimerMgrEntry *entry = self.entries[tid];
                if (!entry) continue;
                if (entry.policy != JobsTimerBackgroundPolicyPauseAndResume) continue;
                if (entry.pauseState != _JobsTimerPauseStateAutoPaused) continue;
                entry.byPauseState(_JobsTimerPauseStateRunning);
                if (entry.timer) [toResume addObject:entry.timer];
            }
        });
        for (JobsTimer *t in toResume) t.resume();
    };
}

-(NSMutableDictionary<NSString *,_JobsTimerMgrEntry *> *)entries{
    if(!_entries){
        _entries = NSMutableDictionary.dictionary;
    };return _entries;
}

-(NSMutableSet<NSString *> *)pausedScopeIdentifiers{
    if(!_pausedScopeIdentifiers){
        _pausedScopeIdentifiers = NSMutableSet.set;
    };return _pausedScopeIdentifiers;
}

-(JobsRetStrByStrBlock _Nonnull)normalizedScopeIdentifier{
    @jobs_weakify(self)
    return ^NSString *(NSString * scopeIdentifier){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *scope = [scopeIdentifier stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        return scope.length > 0 ? scope : nil;
    };
}

@end
