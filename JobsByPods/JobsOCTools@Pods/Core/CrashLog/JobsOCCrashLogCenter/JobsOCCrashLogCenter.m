//
//  JobsOCCrashLogCenter.m
//  JobsOCTools
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsOCCrashLogCenter.h"

static NSString *const JobsOCCrashLogFileName = @"jobs_crash.log";
static NSString *const JobsOCCrashLogSafeExitKey = @"com.jobs.crashlog.safeExit";
static NSString *const JobsOCCrashLogPreviousRunCrashedKey = @"com.jobs.crashlog.previousRunCrashed";
static NSTimeInterval const JobsOCCrashLogMemorySampleInterval = 5.0;
static int64_t const JobsOCCrashLogMaximumBytes = 1024 * 1024;
static int64_t const JobsOCCrashLogRetainedBytes = 512 * 1024;
static void *JobsOCCrashLogIOQueueSpecificKey = &JobsOCCrashLogIOQueueSpecificKey;
static NSUncaughtExceptionHandler *JobsOCPreviousUncaughtExceptionHandler = NULL;

static void JobsOCHandleUncaughtException(NSException *exception);
static void JobsOCHandleCrashSignal(int signo);

@interface JobsOCCrashLogCenter ()

Prop_strong()dispatch_queue_t ioQueue;
Prop_strong(nullable)dispatch_source_t memoryTimer;
Prop_strong()NSMutableArray <id>*notificationTokens;
Prop_copy()NSString *sessionID;
Prop_strong()NSDate *sessionStartedAt;
Prop_assign()uint64_t sessionStartFootprint;
Prop_assign()uint64_t peakFootprint;
Prop_strong(nullable)JobsOCCrashLogMemorySnapshot *memorySnapshot;
Prop_assign()BOOL hasStartedSession;

-(nullable JobsOCCrashLogMemorySnapshot *)captureMemorySnapshot;
-(void)captureAndPersistMemoryEvent:(NSString *)event
                       synchronous:(BOOL)synchronous;
-(void)installLifecycleObservers;
-(void)startMemoryTimer;
-(void)installCrashHandlers;
-(void)trimLogIfNeeded;
-(void)writeStringSync:(NSString *)text;
-(NSString *)currentScreenName;
-(nullable UIViewController *)visibleViewControllerFrom:(nullable UIViewController *)rootViewController;
-(NSString *)currentAppState;

@end

@implementation JobsOCCrashLogCenter

+(instancetype)sharedManager{
    static JobsOCCrashLogCenter *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = JobsOCCrashLogCenter.new;
    });return manager;
}

-(instancetype)init{
    if (self = [super init]) {
        _ioQueue = dispatch_queue_create("com.jobs.crashlog.center.io", DISPATCH_QUEUE_SERIAL);
        dispatch_queue_set_specific(_ioQueue,
                                    JobsOCCrashLogIOQueueSpecificKey,
                                    JobsOCCrashLogIOQueueSpecificKey,
                                    NULL);
        _notificationTokens = NSMutableArray.array;
        _sessionID = @"";
        _sessionStartedAt = NSDate.date;
    };return self;
}

-(void)dealloc{
    if (_memoryTimer) dispatch_source_cancel(_memoryTimer);
    for (id token in _notificationTokens) {
        [NSNotificationCenter.defaultCenter removeObserver:token];
    }
}

#pragma mark —— Session & memory monitor
-(void)startMonitoring{
    @synchronized (self) {
        if (self.hasStartedSession) return;
        self.hasStartedSession = YES;
        NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
        BOOL hadPreviousSession = [defaults objectForKey:JobsOCCrashLogSafeExitKey] != nil;
        BOOL previousRunCrashed = hadPreviousSession && ![defaults boolForKey:JobsOCCrashLogSafeExitKey];
        [defaults setBool:previousRunCrashed
                   forKey:JobsOCCrashLogPreviousRunCrashedKey];
        [defaults setBool:NO
                   forKey:JobsOCCrashLogSafeExitKey];
        [defaults synchronize];
        self.sessionID = NSUUID.UUID.UUIDString;
        self.sessionStartedAt = NSDate.date;
        JobsOCCrashLogMemorySnapshot *snapshot = [self captureMemorySnapshot];
        if (snapshot) {
            self.sessionStartFootprint = snapshot.footprintBytes;
            self.peakFootprint = snapshot.footprintBytes;
            self.memorySnapshot = snapshot;
        }
        [self ensureFileExists];
        NSBundle *bundle = NSBundle.mainBundle;
        NSString *version = [bundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"] ?: @"-";
        NSString *build = [bundle objectForInfoDictionaryKey:@"CFBundleVersion"] ?: @"-";
        NSString *banner = [NSString stringWithFormat:@"\n==================== MEMORY SESSION ====================\ntime: %@\nsession: %@\napp: %@ (%@)\nsystem: %@ %@\npreviousRunCrashed: %@\nsampleInterval: %lds\n=========================================================",
                            self.sessionStartedAt,
                            self.sessionID,
                            version,
                            build,
                            UIDevice.currentDevice.systemName,
                            UIDevice.currentDevice.systemVersion,
                            previousRunCrashed ? @"YES" : @"NO",
                            (long)JobsOCCrashLogMemorySampleInterval];
        [self writeCrashSync:banner];
        [self installCrashHandlers];
        [self installLifecycleObservers];
        [self startMemoryTimer];
        [self captureAndPersistMemoryEvent:@"launch"
                              synchronous:NO];
    }
}

-(void)markAppLaunched{
    [self startMonitoring];
    [NSUserDefaults.standardUserDefaults setBool:NO
                                          forKey:JobsOCCrashLogSafeExitKey];
    [NSUserDefaults.standardUserDefaults synchronize];
    [self append:[NSString stringWithFormat:@"[LIFECYCLE] time=%@ event=active session=%@",
                  NSDate.date,
                  self.sessionID]];
}

-(void)markSafeExitPoint{
    [NSUserDefaults.standardUserDefaults setBool:YES
                                          forKey:JobsOCCrashLogSafeExitKey];
    [NSUserDefaults.standardUserDefaults synchronize];
    [self captureAndPersistMemoryEvent:@"safe_exit"
                          synchronous:YES];
}

-(BOOL)didCrashLastRun{
    return [NSUserDefaults.standardUserDefaults boolForKey:JobsOCCrashLogPreviousRunCrashedKey];
}

-(JobsOCCrashLogMemorySnapshot *_Nullable)latestMemorySnapshot{
    @synchronized (self) {
        return self.memorySnapshot;
    }
}

-(void)startMemoryTimer{
    if (self.memoryTimer) return;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,
                                                     0,
                                                     0,
                                                     dispatch_get_main_queue());
    uint64_t interval = (uint64_t)(JobsOCCrashLogMemorySampleInterval * NSEC_PER_SEC);
    dispatch_source_set_timer(timer,
                              dispatch_time(DISPATCH_TIME_NOW, interval),
                              interval,
                              (uint64_t)(0.5 * NSEC_PER_SEC));
    @jobs_weakify(self)
    dispatch_source_set_event_handler(timer, ^{
        @jobs_strongify(self)
        [self captureAndPersistMemoryEvent:@"sample"
                              synchronous:NO];
    });
    self.memoryTimer = timer;
    dispatch_resume(timer);
}

-(void)installLifecycleObservers{
    NSArray <NSNotificationName>*names = @[
        UIApplicationDidReceiveMemoryWarningNotification,
        UIApplicationWillResignActiveNotification,
        UIApplicationDidEnterBackgroundNotification,
        UIApplicationWillEnterForegroundNotification,
        UIApplicationDidBecomeActiveNotification,
        UIApplicationWillTerminateNotification
    ];
    NSArray <NSString *>*events = @[
        @"memory_warning",
        @"will_resign_active",
        @"did_enter_background",
        @"will_enter_foreground",
        @"did_become_active",
        @"will_terminate"
    ];
    @jobs_weakify(self)
    [names enumerateObjectsUsingBlock:^(NSNotificationName name,
                                        NSUInteger index,
                                        BOOL *_Nonnull stop) {
        id token = [NSNotificationCenter.defaultCenter addObserverForName:name
                                                                   object:nil
                                                                    queue:NSOperationQueue.mainQueue
                                                               usingBlock:^(__unused NSNotification *note) {
            @jobs_strongify(self)
            NSString *event = events[index];
            [self captureAndPersistMemoryEvent:event
                                  synchronous:[event isEqualToString:@"memory_warning"]];
        }];
        [self.notificationTokens addObject:token];
    }];
}

-(void)captureAndPersistMemoryEvent:(NSString *)event
                       synchronous:(BOOL)synchronous{
    JobsOCCrashLogMemorySnapshot *snapshot = [self captureMemorySnapshot];
    if (!snapshot) {
        [self append:[NSString stringWithFormat:@"[MEM] time=%@ event=%@ error=task_info_failed session=%@",
                      NSDate.date,
                      event,
                      self.sessionID]];
        return;
    }
    self.peakFootprint = MAX(self.peakFootprint, snapshot.footprintBytes);
    snapshot = [JobsOCCrashLogMemorySnapshot.alloc initWithFootprintBytes:snapshot.footprintBytes
                                                            residentBytes:snapshot.residentBytes
                                                       peakFootprintBytes:self.peakFootprint
                                                              growthBytes:(int64_t)snapshot.footprintBytes - (int64_t)self.sessionStartFootprint
                                                                   screen:[self currentScreenName]
                                                                 appState:[self currentAppState]
                                                                timestamp:snapshot.timestamp];
    @synchronized (self) {
        self.memorySnapshot = snapshot;
    }
    NSTimeInterval elapsed = [snapshot.timestamp timeIntervalSinceDate:self.sessionStartedAt];
    NSString *line = [NSString stringWithFormat:@"[MEM] time=%@ event=%@ elapsed=%.1fs footprint=%.1fMB resident=%.1fMB peak=%.1fMB growth=%+.1fMB state=%@ screen=%@ session=%@",
                      snapshot.timestamp,
                      event,
                      elapsed,
                      (double)snapshot.footprintBytes / 1024.0 / 1024.0,
                      (double)snapshot.residentBytes / 1024.0 / 1024.0,
                      (double)snapshot.peakFootprintBytes / 1024.0 / 1024.0,
                      (double)snapshot.growthBytes / 1024.0 / 1024.0,
                      snapshot.appState,
                      snapshot.screen,
                      self.sessionID];
    if (synchronous) {
        [self writeCrashSync:line];
    }else{
        [self append:line];
    }
}

-(JobsOCCrashLogMemorySnapshot *_Nullable)captureMemorySnapshot{
    task_vm_info_data_t info = {0};
    mach_msg_type_number_t count = TASK_VM_INFO_COUNT;
    kern_return_t result = task_info(mach_task_self(),
                                     TASK_VM_INFO,
                                     (task_info_t)&info,
                                     &count);
    if (result != KERN_SUCCESS) return nil;
    return [JobsOCCrashLogMemorySnapshot.alloc initWithFootprintBytes:(uint64_t)info.phys_footprint
                                                        residentBytes:(uint64_t)info.resident_size
                                                   peakFootprintBytes:self.peakFootprint
                                                          growthBytes:0
                                                               screen:@"-"
                                                             appState:@"-"
                                                            timestamp:NSDate.date];
}

#pragma mark —— Crash handlers
-(void)installCrashHandlers{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        JobsOCPreviousUncaughtExceptionHandler = NSGetUncaughtExceptionHandler();
        NSSetUncaughtExceptionHandler(JobsOCHandleUncaughtException);
        int signals[] = {SIGABRT, SIGILL, SIGSEGV, SIGFPE, SIGBUS, SIGPIPE};
        size_t count = sizeof(signals) / sizeof(signals[0]);
        for (size_t index = 0; index < count; index++) {
            signal(signals[index], JobsOCHandleCrashSignal);
        }
        NSString *banner = [NSString stringWithFormat:@"log: %@\n\n====== CrashCatcher Installed ======\ntime: %@\nlog: %@\ndidCrashLastRun: %@",
                            self.logPathHint,
                            NSDate.date,
                            self.logPathHint,
                            self.didCrashLastRun ? @"YES" : @"NO"];
        [self writeCrashSync:banner];
    });
}

#pragma mark —— File
-(NSString *)logPathHint{
    NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                   NSUserDomainMask,
                                                                   YES).firstObject ?: NSTemporaryDirectory();
    return [documentsPath stringByAppendingPathComponent:JobsOCCrashLogFileName];
}

-(JobsOCCrashLogFileInfo *)fileInfo{
    NSString *path = self.logPathHint;
    if (![NSFileManager.defaultManager fileExistsAtPath:path]) {
        return [JobsOCCrashLogFileInfo.alloc initWithPath:path
                                                   exists:NO
                                                sizeBytes:0
                                         modificationDate:nil];
    }
    NSDictionary <NSFileAttributeKey,id>*attributes = [NSFileManager.defaultManager attributesOfItemAtPath:path
                                                                                                      error:nil];
    return [JobsOCCrashLogFileInfo.alloc initWithPath:path
                                               exists:YES
                                            sizeBytes:[attributes[NSFileSize] longLongValue]
                                     modificationDate:attributes[NSFileModificationDate]];
}

-(BOOL)ensureFileExists{
    NSString *path = self.logPathHint;
    if ([NSFileManager.defaultManager fileExistsAtPath:path]) return YES;
    return [NSData.data writeToFile:path
                           options:NSDataWritingAtomic
                             error:nil];
}

-(void)append:(NSString *)text{
    if (!text.length) return;
    NSString *content = text.copy;
    dispatch_async(self.ioQueue, ^{
        [self ensureFileExists];
        [self trimLogIfNeeded];
        [self writeStringSync:content];
    });
}

-(void)writeCrashSync:(NSString *)text{
    if (!text.length) return;
    [self ensureFileExists];
    [self writeStringSync:text];
}

-(void)writeStringSync:(NSString *)text{
    NSString *line = [text hasSuffix:@"\n"] ? text : [text stringByAppendingString:@"\n"];
    NSData *data = [line dataUsingEncoding:NSUTF8StringEncoding];
    if (!data.length) return;
    int fileDescriptor = open(self.logPathHint.fileSystemRepresentation,
                              O_CREAT | O_WRONLY | O_APPEND,
                              0644);
    if (fileDescriptor < 0) return;
    write(fileDescriptor, data.bytes, data.length);
    fsync(fileDescriptor);
    close(fileDescriptor);
}

-(void)trimLogIfNeeded{
    JobsOCCrashLogFileInfo *info = self.fileInfo;
    if (!info.exists || info.sizeBytes <= JobsOCCrashLogMaximumBytes) return;
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:info.path];
    if (!handle) return;
    uint64_t offset = (uint64_t)MAX(0, info.sizeBytes - JobsOCCrashLogRetainedBytes);
    [handle seekToFileOffset:offset];
    NSData *tail = handle.readDataToEndOfFile;
    [handle closeFile];
    NSMutableData *data = [[NSString stringWithFormat:@"[LOG_ROTATED] time=%@ retained=%lu bytes\n",
                            NSDate.date,
                            (unsigned long)tail.length] dataUsingEncoding:NSUTF8StringEncoding].mutableCopy;
    [data appendData:tail];
    [data writeToFile:info.path
              options:NSDataWritingAtomic
                error:nil];
}

-(NSString *)readAll{
    NSData *data = [NSData dataWithContentsOfFile:self.logPathHint];
    if (!data) return @"";
    return [NSString.alloc initWithData:data
                               encoding:NSUTF8StringEncoding] ?: @"";
}

-(NSString *)readTailByKilobytes:(NSUInteger)kilobytes{
    JobsOCCrashLogFileInfo *info = self.fileInfo;
    if (!info.exists) return @"";
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:info.path];
    if (!handle) return @"❌ readTail() 失败：无法打开日志文件";
    int64_t requestedBytes = (int64_t)kilobytes * 1024;
    uint64_t offset = (uint64_t)MAX(0, info.sizeBytes - requestedBytes);
    [handle seekToFileOffset:offset];
    NSData *data = handle.readDataToEndOfFile;
    [handle closeFile];
    return [NSString.alloc initWithData:data
                               encoding:NSUTF8StringEncoding] ?: @"";
}

-(BOOL)clearWithMessage:(NSString *_Nullable *_Nullable)message{
    __block BOOL success = YES;
    __block NSString *result = nil;
    void (^clearBlock)(void) = ^{
        NSString *path = self.logPathHint;
        if (![NSFileManager.defaultManager fileExistsAtPath:path]) {
            result = [NSString stringWithFormat:@"✅ 空文件（不存在）：%@",path];
            return;
        }
        NSError *error = nil;
        success = [NSFileManager.defaultManager removeItemAtPath:path
                                                           error:&error];
        result = success
            ? [NSString stringWithFormat:@"✅ 已删除：%@",path]
            : [NSString stringWithFormat:@"❌ 清理失败：%@\n%@",error.localizedDescription,path];
    };
    if (dispatch_get_specific(JobsOCCrashLogIOQueueSpecificKey)) {
        clearBlock();
    }else{
        dispatch_sync(self.ioQueue, clearBlock);
    }
    if (message) *message = result;
    return success;
}

#pragma mark —— App context
-(NSString *)currentScreenName{
    NSMutableArray <UIWindow *>*windows = NSMutableArray.array;
    if (@available(iOS 13.0, *)) {
        for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
            if (![scene isKindOfClass:UIWindowScene.class]) continue;
            [windows addObjectsFromArray:((UIWindowScene *)scene).windows];
        }
    }else{
        [windows addObjectsFromArray:UIApplication.sharedApplication.windows];
    }
    UIWindow *window = nil;
    for (UIWindow *candidate in windows) {
        if (candidate.isKeyWindow) {
            window = candidate;
            break;
        }
    }
    window = window ?: windows.firstObject;
    UIViewController *visibleViewController = [self visibleViewControllerFrom:window.rootViewController];
    if (!visibleViewController) return @"-";
    return [NSStringFromClass(visibleViewController.class) stringByReplacingOccurrencesOfString:@" "
                                                                                      withString:@"_"];
}

-(UIViewController *_Nullable)visibleViewControllerFrom:(UIViewController *_Nullable)rootViewController{
    if (rootViewController.presentedViewController) {
        return [self visibleViewControllerFrom:rootViewController.presentedViewController];
    }
    if ([rootViewController isKindOfClass:UINavigationController.class]) {
        return [self visibleViewControllerFrom:((UINavigationController *)rootViewController).visibleViewController];
    }
    if ([rootViewController isKindOfClass:UITabBarController.class]) {
        return [self visibleViewControllerFrom:((UITabBarController *)rootViewController).selectedViewController];
    }
    if ([rootViewController isKindOfClass:UISplitViewController.class]) {
        return [self visibleViewControllerFrom:((UISplitViewController *)rootViewController).viewControllers.lastObject];
    };return rootViewController;
}

-(NSString *)currentAppState{
    switch (UIApplication.sharedApplication.applicationState) {
        case UIApplicationStateActive:return @"active";
        case UIApplicationStateInactive:return @"inactive";
        case UIApplicationStateBackground:return @"background";
        default:return @"unknown";
    }
}

@end

static void JobsOCHandleUncaughtException(NSException *exception){
    NSString *message = [NSString stringWithFormat:@"\n==================== ❌ Uncaught NSException ====================\ntime: %@\nname: %@\nreason: %@\ncallStack:\n%@\n=================================================================",
                         NSDate.date,
                         exception.name,
                         exception.reason ?: @"-",
                         [exception.callStackSymbols componentsJoinedByString:@"\n"]];
    [JobsOCCrashLogCenter.sharedManager writeCrashSync:message];
    if (JobsOCPreviousUncaughtExceptionHandler) JobsOCPreviousUncaughtExceptionHandler(exception);
}

static void JobsOCHandleCrashSignal(int signo){
    NSString *signalName = nil;
    switch (signo) {
        case SIGABRT:signalName = @"SIGABRT";break;
        case SIGILL:signalName = @"SIGILL";break;
        case SIGSEGV:signalName = @"SIGSEGV";break;
        case SIGFPE:signalName = @"SIGFPE";break;
        case SIGBUS:signalName = @"SIGBUS";break;
        case SIGPIPE:signalName = @"SIGPIPE";break;
        default:signalName = [NSString stringWithFormat:@"SIG(%d)",signo];break;
    }
    NSString *message = [NSString stringWithFormat:@"\n==================== ❌ Signal Crash ====================\ntime: %@\nsignal: %d (%@)\n=========================================================",
                         NSDate.date,
                         signo,
                         signalName];
    [JobsOCCrashLogCenter.sharedManager writeCrashSync:message];
    signal(signo, SIG_DFL);
    raise(signo);
}
