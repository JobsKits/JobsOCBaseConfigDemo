//
//  JobsTimerMgr.m
//  JobsOCTimerMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTimerMgr.h"

@interface _JobsTimerMgrEntry : NSObject

Prop_strong()JobsTimer<TimerProtocol> *timer;
Prop_assign()JobsTimerBackgroundPolicy policy;
Prop_assign()_JobsTimerPauseState pauseState;
Prop_strong()NSMutableArray<jobsByCGFloatBlock> *tickBlocks;
Prop_strong()NSMutableArray<JobsTimerBlock> *finishBlocks;

@end

@interface _JobsTimerMgrEntry (DSL)

-(JobsRetJobsTimerMgrEntryByJobsTimerBlock)byTimer;
-(JobsRetJobsTimerMgrEntryByNSUIntegerBlock)byPolicy;
-(JobsRetJobsTimerMgrEntryByNSUIntegerBlock)byPauseState;
-(JobsRetJobsTimerMgrEntryByJobsByCGFloatBlockBlock)byTickBlock;
-(JobsRetJobsTimerMgrEntryByJobsTimerBlockBlock)byFinishBlock;

@end

@implementation _JobsTimerMgrEntry
- (instancetype)init {
    if (self = [super init]) {
        _pauseState = _JobsTimerPauseStateRunning;
    };return self;
}

-(NSMutableArray<jobsByCGFloatBlock> *)tickBlocks{
    if(!_tickBlocks){
        _tickBlocks = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
        });
    };return _tickBlocks;
}

-(NSMutableArray<JobsTimerBlock> *)finishBlocks{
    if(!_finishBlocks){
        _finishBlocks = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
        });
    };return _finishBlocks;
}

@end

@implementation _JobsTimerMgrEntry (DSL)
-(JobsRetJobsTimerMgrEntryByJobsTimerBlock)byTimer{
    return ^__kindof _JobsTimerMgrEntry *_Nullable(JobsTimer<TimerProtocol> *_Nullable timer) {
        self.timer = timer;
        return self;
    };
}

-(JobsRetJobsTimerMgrEntryByNSUIntegerBlock)byPolicy{
    return ^__kindof _JobsTimerMgrEntry *_Nullable(NSUInteger data) {
        self.policy = (JobsTimerBackgroundPolicy)data;
        return self;
    };
}

-(JobsRetJobsTimerMgrEntryByNSUIntegerBlock)byPauseState{
    return ^__kindof _JobsTimerMgrEntry *_Nullable(NSUInteger data) {
        self.pauseState = (_JobsTimerPauseState)data;
        return self;
    };
}

-(JobsRetJobsTimerMgrEntryByJobsByCGFloatBlockBlock)byTickBlock{
    return ^__kindof _JobsTimerMgrEntry *_Nullable(jobsByCGFloatBlock _Nullable block) {
        if (block) [self.tickBlocks addObject:[block copy]];
        return self;
    };
}

-(JobsRetJobsTimerMgrEntryByJobsTimerBlockBlock)byFinishBlock{
    return ^__kindof _JobsTimerMgrEntry *_Nullable(JobsTimerBlock _Nullable block) {
        if (block) [self.finishBlocks addObject:[block copy]];
        return self;
    };
}

@end

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
- (void)handleInactiveState:(BOOL)isBackground;
- (void)handleDidBecomeActive;

@end

@implementation JobsTimerMgr
- (void)dealloc {
    [self teardownAppStateObservers];
    [self stopAndRemoveAll];
}

+ (instancetype)shared {
    static JobsTimerMgr *m = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m = [[JobsTimerMgr alloc] init];
    });return m;
}

- (instancetype)init {
    if (self = [super init]) {
        _isolationQueue = dispatch_queue_create("com.jobs.timer.manager.lock", DISPATCH_QUEUE_SERIAL);
        [self setupAppStateObservers];
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
            [oldTimer stop];
        }
        if (startImmediately) {
            [timer start];
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
- (BOOL)start:(NSString *)identifier {
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
            entry.pauseState = _JobsTimerPauseStateRunning;
            performed = YES;
        });
        if (!performed) return;
        [timer start];
        [self syncEntryWithCurrentAppStateForIdentifier:identifier expectedEntry:entry];
    });return performed;
}

- (BOOL)pause:(NSString *)identifier {
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
            entry.pauseState = _JobsTimerPauseStateManualPaused;
            performed = YES;
        });
        if (!performed) return;
        [timer pause];
    });return performed;
}

- (BOOL)resume:(NSString *)identifier {
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
            entry.pauseState = _JobsTimerPauseStateRunning;
            performed = YES;
        });
        if (!performed) return;
        [timer resume];
        [self syncEntryWithCurrentAppStateForIdentifier:identifier expectedEntry:entry];
    });return performed;
}

- (BOOL)fireOnceAndRemove:(NSString *)identifier {
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
            [self.entries removeObjectForKey:identifier];
            performed = YES;
        });
        if (!performed) return;
        [timer fireOnce];
    });return performed;
}

- (BOOL)stopAndRemove:(NSString *)identifier {
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
            [self.entries removeObjectForKey:identifier];
            performed = YES;
        });
        if (!performed) return;
        [timer stop];
    });return performed;
}

- (void)stopAndRemoveAll {
    __block NSArray<JobsTimer *> *timers = nil;
    dispatch_sync(self.isolationQueue, ^{
        NSMutableArray<JobsTimer *> *tmp = [NSMutableArray arrayWithCapacity:self.entries.count];
        [self.entries enumerateKeysAndObjectsUsingBlock:^(__unused NSString *key, _JobsTimerMgrEntry *obj, __unused BOOL *stop) {
            if (obj.timer) [tmp addObject:obj.timer];
        }];
        [self.entries removeAllObjects];
        timers = [tmp copy];
    });
    if (timers.count == 0) return;
    jobs_runOnMainSyncIfNeeded(^{
        for (JobsTimer *t in timers) {
            [t stop];
        }
    });
}
#pragma mark —— Query
- (BOOL)exists:(NSString *)identifier {
    __block BOOL ok = NO;
    dispatch_sync(self.isolationQueue, ^{
        ok = (self.entries[identifier] != nil);
    });return ok;
}

- (BOOL)isRunning:(NSString *)identifier {
    __block JobsTimer *timer = nil;
    dispatch_sync(self.isolationQueue, ^{
        timer = self.entries[identifier].timer;
    });return timer.isRunning;
}

- (NSArray<NSString *> *)allIdentifiers {
    __block NSArray<NSString *> *ids = nil;
    dispatch_sync(self.isolationQueue, ^{
        ids = [[self.entries allKeys] sortedArrayUsingSelector:@selector(compare:)];
    });return ids ?: @[];
}

- (JobsTimer *)timerForIdentifier:(NSString *)identifier {
    __block JobsTimer *timer = nil;
    dispatch_sync(self.isolationQueue, ^{
        timer = self.entries[identifier].timer;
    });return timer;
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
        blocks = (entry == expectedEntry) ? [entry.finishBlocks copy] : @[];
    });
    for (JobsTimerBlock b in blocks) {
        if (b) b(timer);
    }
}
#pragma mark —— App State Observers
- (void)setupAppStateObservers {
    @jobs_weakify(self)
    self.willResignActiveToken =
    [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationWillResignActiveNotification
                                                    object:nil
                                                     queue:NSOperationQueue.mainQueue
                                                usingBlock:^(__unused NSNotification *note) {
        @jobs_strongify(self)
        [self handleInactiveState:NO];
    }];
    self.didEnterBGToken =
    [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationDidEnterBackgroundNotification
                                                    object:nil
                                                     queue:NSOperationQueue.mainQueue
                                                usingBlock:^(__unused NSNotification *note) {
        @jobs_strongify(self)
        [self handleInactiveState:YES];
    }];
    self.didBecomeActiveToken =
    [NSNotificationCenter.defaultCenter addObserverForName:UIApplicationDidBecomeActiveNotification
                                                    object:nil
                                                     queue:NSOperationQueue.mainQueue
                                                usingBlock:^(__unused NSNotification *note) {
        @jobs_strongify(self)
        [self handleDidBecomeActive];
    }];
}

- (void)teardownAppStateObservers {
    if (self.willResignActiveToken) {
        [NSNotificationCenter.defaultCenter removeObserver:self.willResignActiveToken];
        self.willResignActiveToken = nil;
    }
    if (self.didEnterBGToken) {
        [NSNotificationCenter.defaultCenter removeObserver:self.didEnterBGToken];
        self.didEnterBGToken = nil;
    }
    if (self.didBecomeActiveToken) {
        [NSNotificationCenter.defaultCenter removeObserver:self.didBecomeActiveToken];
        self.didBecomeActiveToken = nil;
    }
}

- (void)syncEntryWithCurrentAppStateForIdentifier:(NSString *)identifier
                                     expectedEntry:(_JobsTimerMgrEntry *)expectedEntry {
    jobs_runOnMainSyncIfNeeded(^{
        UIApplicationState state = UIApplication.sharedApplication.applicationState;
        if (state == UIApplicationStateActive) return;
        __block JobsTimer *toPause = nil;
        __block JobsTimer *toStop = nil;
        dispatch_sync(self.isolationQueue, ^{
            _JobsTimerMgrEntry *entry = self.entries[identifier];
            if (entry != expectedEntry) return;
            switch (entry.policy) {
                /// 处理 JobsTimerBackgroundPolicyIgnore 分支
                case JobsTimerBackgroundPolicyIgnore:
                    break;
                /// 处理 JobsTimerBackgroundPolicyPauseAndResume 分支
                case JobsTimerBackgroundPolicyPauseAndResume:
                    if (!entry.timer.isRunning || entry.pauseState != _JobsTimerPauseStateRunning) break;
                    entry.pauseState = _JobsTimerPauseStateAutoPaused;
                    toPause = entry.timer;
                    break;
                /// 处理 JobsTimerBackgroundPolicyCancel 分支
                case JobsTimerBackgroundPolicyCancel:
                    if (state != UIApplicationStateBackground) break;
                    toStop = entry.timer;
                    [self.entries removeObjectForKey:identifier];
                    break;
            }
        });
        if (toPause) [toPause pause];
        if (toStop) [toStop stop];
    });
}

- (void)handleInactiveState:(BOOL)isBackground {
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
                    entry.pauseState = _JobsTimerPauseStateAutoPaused;
                    if (entry.timer) [toPause addObject:entry.timer];
                } break;
            }
        }
    });
    for (JobsTimer *t in toPause) [t pause];
    for (JobsTimer *t in toStop)  [t stop];
}

- (void)handleDidBecomeActive {
    __block NSMutableArray<JobsTimer *> *toResume = NSMutableArray.array;
    dispatch_sync(self.isolationQueue, ^{
        NSArray<NSString *> *keys = [[self.entries allKeys] copy];
        for (NSString *tid in keys) {
            _JobsTimerMgrEntry *entry = self.entries[tid];
            if (!entry) continue;
            if (entry.policy != JobsTimerBackgroundPolicyPauseAndResume) continue;
            if (entry.pauseState != _JobsTimerPauseStateAutoPaused) continue;
            entry.pauseState = _JobsTimerPauseStateRunning;
            if (entry.timer) [toResume addObject:entry.timer];
        }
    });
    for (JobsTimer *t in toResume) [t resume];
}

-(NSMutableDictionary<NSString *,_JobsTimerMgrEntry *> *)entries{
    if(!_entries){
        _entries = NSMutableDictionary.dictionary;
    };return _entries;
}

@end
