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

-(JobsRetJobsOCCrashLogMemorySnapshotByVoidBlock _Nonnull)captureMemorySnapshot;
-(void)captureAndPersistMemoryEvent:(NSString *)event
                       synchronous:(BOOL)synchronous;
-(jobsByVoidBlock _Nonnull)installLifecycleObservers;
-(jobsByVoidBlock _Nonnull)startMemoryTimer;
-(jobsByVoidBlock _Nonnull)installCrashHandlers;
-(jobsByVoidBlock _Nonnull)trimLogIfNeeded;
-(jobsByStrBlock _Nonnull)writeStringSync;
-(JobsRetStrByVoidBlock _Nonnull)currentScreenName;
-(JobsRetVCByVCBlock _Nonnull)visibleViewControllerFrom;
-(JobsRetStrByVoidBlock _Nonnull)currentAppState;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCCrashLogCenter
@interface JobsOCCrashLogCenter (JobsPropertyDSLSetterAutogen_da63b6557e)
-(void)setHasStartedSession:(BOOL)data;
-(void)setMemorySnapshot:(JobsOCCrashLogMemorySnapshot * _Nullable)data;
-(void)setMemoryTimer:(dispatch_source_t)data;
-(void)setPeakFootprint:(uint64_t)data;
-(void)setSessionID:(NSString * _Nullable)data;
-(void)setSessionStartFootprint:(uint64_t)data;
-(void)setSessionStartedAt:(NSDate * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCCrashLogCenter

@implementation JobsOCCrashLogCenter

+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsOCCrashLogCenter.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        static JobsOCCrashLogCenter *manager;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = JobsOCCrashLogCenter.new;
        });return manager;
    };
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
-(jobsByVoidBlock _Nonnull)startMonitoring{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @synchronized (self) {
            if (self.hasStartedSession) return;
            self.byHasStartedSession(YES);
            NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
            BOOL hadPreviousSession = [defaults objectForKey:JobsOCCrashLogSafeExitKey] != nil;
            BOOL previousRunCrashed = hadPreviousSession && ![defaults boolForKey:JobsOCCrashLogSafeExitKey];
            [defaults setBool:previousRunCrashed
                       forKey:JobsOCCrashLogPreviousRunCrashedKey];
            [defaults setBool:NO
                       forKey:JobsOCCrashLogSafeExitKey];
            [defaults synchronize];
            self.bySessionID(NSUUID.UUID.UUIDString);
            self.bySessionStartedAt(NSDate.date);
            JobsOCCrashLogMemorySnapshot *snapshot = self.captureMemorySnapshot();
            if (snapshot) {
                self.bySessionStartFootprint(snapshot.footprintBytes);
                self.byPeakFootprint(snapshot.footprintBytes);
                self.byMemorySnapshot(snapshot);
            }
            [self ensureFileExists]();
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
            self.writeCrashSync(banner);
            self.installCrashHandlers();
            self.installLifecycleObservers();
            self.startMemoryTimer();
            [self captureAndPersistMemoryEvent:@"launch"
                                  synchronous:NO];
        }
    };
}

-(jobsByVoidBlock _Nonnull)markAppLaunched{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.startMonitoring();
        [NSUserDefaults.standardUserDefaults setBool:NO
                                              forKey:JobsOCCrashLogSafeExitKey];
        [NSUserDefaults.standardUserDefaults synchronize];
        self.append([NSString stringWithFormat:@"[LIFECYCLE] time=%@ event=active session=%@",
                      NSDate.date,
                      self.sessionID]);
    };
}

-(jobsByVoidBlock _Nonnull)markSafeExitPoint{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [NSUserDefaults.standardUserDefaults setBool:YES
                                              forKey:JobsOCCrashLogSafeExitKey];
        [NSUserDefaults.standardUserDefaults synchronize];
        [self captureAndPersistMemoryEvent:@"safe_exit"
                              synchronous:YES];
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)didCrashLastRun{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return [NSUserDefaults.standardUserDefaults boolForKey:JobsOCCrashLogPreviousRunCrashedKey];
    };
}

-(JobsRetJobsOCCrashLogMemorySnapshotByVoidBlock _Nonnull)latestMemorySnapshot{
    @jobs_weakify(self)
    return ^JobsOCCrashLogMemorySnapshot *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        @synchronized (self) {
            return self.memorySnapshot;
        }
    };
}

-(jobsByVoidBlock _Nonnull)startMemoryTimer{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
        self.byMemoryTimer(timer);
        dispatch_resume(timer);
    };
}

-(jobsByVoidBlock _Nonnull)installLifecycleObservers{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
    };
}

-(void)captureAndPersistMemoryEvent:(NSString *)event
                       synchronous:(BOOL)synchronous{
    JobsOCCrashLogMemorySnapshot *snapshot = self.captureMemorySnapshot();
    if (!snapshot) {
        self.append([NSString stringWithFormat:@"[MEM] time=%@ event=%@ error=task_info_failed session=%@",
                      NSDate.date,
                      event,
                      self.sessionID]);
        return;
    }
    self.byPeakFootprint(MAX(self.peakFootprint, snapshot.footprintBytes));
    snapshot = [JobsOCCrashLogMemorySnapshot.alloc initWithFootprintBytes:snapshot.footprintBytes
                                                            residentBytes:snapshot.residentBytes
                                                       peakFootprintBytes:self.peakFootprint
                                                              growthBytes:(int64_t)snapshot.footprintBytes - (int64_t)self.sessionStartFootprint
                                                                   screen:self.currentScreenName()
                                                                 appState:self.currentAppState()
                                                                timestamp:snapshot.timestamp];
    @synchronized (self) {
        self.byMemorySnapshot(snapshot);
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
        self.writeCrashSync(line);
    }else{
        self.append(line);
    }
}

-(JobsRetJobsOCCrashLogMemorySnapshotByVoidBlock _Nonnull)captureMemorySnapshot{
    @jobs_weakify(self)
    return ^JobsOCCrashLogMemorySnapshot *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
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
    };
}

#pragma mark —— Crash handlers
-(jobsByVoidBlock _Nonnull)installCrashHandlers{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
                                self.logPathHint(),
                                NSDate.date,
                                self.logPathHint(),
                                self.didCrashLastRun() ? @"YES" : @"NO"];
            self.writeCrashSync(banner);
        });
    };
}

#pragma mark —— File
-(JobsRetStrByVoidBlock _Nonnull)logPathHint{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                       NSUserDomainMask,
                                                                       YES).firstObject ?: NSTemporaryDirectory();
        return [documentsPath stringByAppendingPathComponent:JobsOCCrashLogFileName];
    };
}

-(JobsRetJobsOCCrashLogFileInfoByVoidBlock _Nonnull)fileInfo{
    @jobs_weakify(self)
    return ^JobsOCCrashLogFileInfo *{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *path = self.logPathHint();
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
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)ensureFileExists{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSString *path = self.logPathHint();
        if ([NSFileManager.defaultManager fileExistsAtPath:path]) return YES;
        return [NSData.data writeToFile:path
                               options:NSDataWritingAtomic
                                 error:nil];
    };
}

-(jobsByStrBlock _Nonnull)append{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        if (!text.length) return;
        NSString *content = text.copy;
        dispatch_async(self.ioQueue, ^{
            [self ensureFileExists]();
            self.trimLogIfNeeded();
            self.writeStringSync(content);
        });
    };
}

-(jobsByStrBlock _Nonnull)writeCrashSync{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        if (!text.length) return;
        [self ensureFileExists]();
        self.writeStringSync(text);
    };
}

-(jobsByStrBlock _Nonnull)writeStringSync{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        NSString *line = [text hasSuffix:@"\n"] ? text : [text stringByAppendingString:@"\n"];
        NSData *data = [line dataUsingEncoding:NSUTF8StringEncoding];
        if (!data.length) return;
        int fileDescriptor = open(self.logPathHint().fileSystemRepresentation,
                                  O_CREAT | O_WRONLY | O_APPEND,
                                  0644);
        if (fileDescriptor < 0) return;
        write(fileDescriptor, data.bytes, data.length);
        fsync(fileDescriptor);
        close(fileDescriptor);
    };
}

-(jobsByVoidBlock _Nonnull)trimLogIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsOCCrashLogFileInfo *info = self.fileInfo();
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
    };
}

-(JobsRetStrByVoidBlock _Nonnull)readAll{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSData *data = [NSData dataWithContentsOfFile:self.logPathHint()];
        if (!data) return @"";
        return [NSString.alloc initWithData:data
                                   encoding:NSUTF8StringEncoding] ?: @"";
    };
}

-(JobsRetStrByUIntegerBlock _Nonnull)readTailByKilobytes{
    @jobs_weakify(self)
    return ^NSString *(NSUInteger kilobytes){
        @jobs_strongify(self)
        if (!self) return nil;
        JobsOCCrashLogFileInfo *info = self.fileInfo();
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
    };
}

-(JobsRetBOOLByNSStringBlock _Nonnull)clearWithMessage{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable *_Nullable message){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        __block BOOL success = YES;
        __block NSString *result = nil;
        void (^clearBlock)(void) = ^{
            NSString *path = self.logPathHint();
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
    };
}

#pragma mark —— App context
-(JobsRetStrByVoidBlock _Nonnull)currentScreenName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
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
        UIViewController *visibleViewController = self.visibleViewControllerFrom(window.rootViewController);
        if (!visibleViewController) return @"-";
        return [NSStringFromClass(visibleViewController.class) stringByReplacingOccurrencesOfString:@" "
                                                                                          withString:@"_"];
    };
}

-(JobsRetVCByVCBlock _Nonnull)visibleViewControllerFrom{
    @jobs_weakify(self)
    return ^UIViewController *_Nullable(UIViewController *_Nullable rootViewController){
        @jobs_strongify(self)
        if (!self) return nil;
        if (rootViewController.presentedViewController) {
            return self.visibleViewControllerFrom(rootViewController.presentedViewController);
        }
        if ([rootViewController isKindOfClass:UINavigationController.class]) {
            return self.visibleViewControllerFrom(((UINavigationController *)rootViewController).visibleViewController);
        }
        if ([rootViewController isKindOfClass:UITabBarController.class]) {
            return self.visibleViewControllerFrom(((UITabBarController *)rootViewController).selectedViewController);
        }
        if ([rootViewController isKindOfClass:UISplitViewController.class]) {
            return self.visibleViewControllerFrom(((UISplitViewController *)rootViewController).viewControllers.lastObject);
        };return rootViewController;
    };
}

-(JobsRetStrByVoidBlock _Nonnull)currentAppState{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        switch (UIApplication.sharedApplication.applicationState) {
            /// 处理 UIApplicationStateActive 分支
            case UIApplicationStateActive:return @"active";
            /// 处理 UIApplicationStateInactive 分支
            case UIApplicationStateInactive:return @"inactive";
            /// 处理 UIApplicationStateBackground 分支
            case UIApplicationStateBackground:return @"background";
            /// 未匹配已知分支时执行兜底处理
            default:return @"unknown";
        }
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCCrashLogCenter
-(JobsRetJobsOCCrashLogCenterByBOOLBlock _Nonnull)byHasStartedSession{
    @jobs_weakify(self)
    return ^__kindof JobsOCCrashLogCenter * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setHasStartedSession:data];
        return self;
    };
}

-(JobsRetJobsOCCrashLogCenterByJobsOCCrashLogMemorySnapshotBlock _Nonnull)byMemorySnapshot{
    @jobs_weakify(self)
    return ^__kindof JobsOCCrashLogCenter * _Nullable(JobsOCCrashLogMemorySnapshot * _Nullable data){
        @jobs_strongify(self)
        [self setMemorySnapshot:data];
        return self;
    };
}

-(JobsRetJobsOCCrashLogCenterByNSDateBlock _Nonnull)bySessionStartedAt{
    @jobs_weakify(self)
    return ^__kindof JobsOCCrashLogCenter * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        [self setSessionStartedAt:data];
        return self;
    };
}

-(JobsRetJobsOCCrashLogCenterByNSStringBlock _Nonnull)bySessionID{
    @jobs_weakify(self)
    return ^__kindof JobsOCCrashLogCenter * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setSessionID:data];
        return self;
    };
}

-(JobsRetJobsOCCrashLogCenterBydispatch_source_tBlock _Nonnull)byMemoryTimer{
    @jobs_weakify(self)
    return ^__kindof JobsOCCrashLogCenter * _Nullable(dispatch_source_t data){
        @jobs_strongify(self)
        [self setMemoryTimer:data];
        return self;
    };
}

-(JobsRetJobsOCCrashLogCenterByuint64_tBlock _Nonnull)byPeakFootprint{
    @jobs_weakify(self)
    return ^__kindof JobsOCCrashLogCenter * _Nullable(uint64_t data){
        @jobs_strongify(self)
        [self setPeakFootprint:data];
        return self;
    };
}

-(JobsRetJobsOCCrashLogCenterByuint64_tBlock _Nonnull)bySessionStartFootprint{
    @jobs_weakify(self)
    return ^__kindof JobsOCCrashLogCenter * _Nullable(uint64_t data){
        @jobs_strongify(self)
        [self setSessionStartFootprint:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCCrashLogCenter
@end

static void JobsOCHandleUncaughtException(NSException *exception){
    NSString *message = [NSString stringWithFormat:@"\n==================== ❌ Uncaught NSException ====================\ntime: %@\nname: %@\nreason: %@\ncallStack:\n%@\n=================================================================",
                         NSDate.date,
                         exception.name,
                         exception.reason ?: @"-",
                         [exception.callStackSymbols componentsJoinedByString:@"\n"]];
    ((JobsOCCrashLogCenter *)JobsOCCrashLogCenter.jobsSharedManager()).writeCrashSync(message);
    if (JobsOCPreviousUncaughtExceptionHandler) JobsOCPreviousUncaughtExceptionHandler(exception);
}

static void JobsOCHandleCrashSignal(int signo){
    NSString *signalName = nil;
    switch (signo) {
        /// 处理 SIGABRT 分支
        case SIGABRT:signalName = @"SIGABRT";break;
        /// 处理 SIGILL 分支
        case SIGILL:signalName = @"SIGILL";break;
        /// 处理 SIGSEGV 分支
        case SIGSEGV:signalName = @"SIGSEGV";break;
        /// 处理 SIGFPE 分支
        case SIGFPE:signalName = @"SIGFPE";break;
        /// 处理 SIGBUS 分支
        case SIGBUS:signalName = @"SIGBUS";break;
        /// 处理 SIGPIPE 分支
        case SIGPIPE:signalName = @"SIGPIPE";break;
        /// 未匹配已知分支时执行兜底处理
        default:signalName = [NSString stringWithFormat:@"SIG(%d)",signo];break;
    }
    NSString *message = [NSString stringWithFormat:@"\n==================== ❌ Signal Crash ====================\ntime: %@\nsignal: %d (%@)\n=========================================================",
                         NSDate.date,
                         signo,
                         signalName];
    ((JobsOCCrashLogCenter *)JobsOCCrashLogCenter.jobsSharedManager()).writeCrashSync(message);
    signal(signo, SIG_DFL);
    raise(signo);
}
