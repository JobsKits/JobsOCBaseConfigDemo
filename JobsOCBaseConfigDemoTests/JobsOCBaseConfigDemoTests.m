//
//  JobsOCBaseConfigDemoTests.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月16日，星期四.
//

#import "JobsOCBaseConfigDemoTests.h"
#import "JobsTimer.h"
#import "JobsTimerMgr.h"

@implementation JobsOCBaseConfigDemoTests
-(void)testTimerResumesOnlyAfterAutomaticPause {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestTimerResumesOnlyAfterAutomaticPause)))(self, @selector(jobsTestTimerResumesOnlyAfterAutomaticPause));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestTimerResumesOnlyAfterAutomaticPause{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsTimer *timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer.byTimerType(JobsTimerTypeGCD)
                .byTimeInterval(60)
                .byQueue(dispatch_get_main_queue())
                .byPauseInBackground(YES)
                .byAutoManageAppState(YES);
        });
        [timer start];
        XCTAssertTrue(timer.isRunning);

        [NSNotificationCenter.defaultCenter postNotificationName:UIApplicationWillResignActiveNotification object:nil];
        XCTAssertFalse(timer.isRunning);

        [NSNotificationCenter.defaultCenter postNotificationName:UIApplicationDidBecomeActiveNotification object:nil];
        XCTAssertTrue(timer.isRunning);

        [timer pause];
        [NSNotificationCenter.defaultCenter postNotificationName:UIApplicationDidBecomeActiveNotification object:nil];
        XCTAssertFalse(timer.isRunning);
        [timer stop];
    };
}

-(void)testTimerManagerKeepsManualPauseState {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestTimerManagerKeepsManualPauseState)))(self, @selector(jobsTestTimerManagerKeepsManualPauseState));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestTimerManagerKeepsManualPauseState{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSString *identifier = [NSString stringWithFormat:@"tests.timer.%@", NSUUID.UUID.UUIDString];
        JobsTimerMgr *manager = JobsTimerMgr.shared;
        XCTAssertTrue([manager upsertTimerWithIdentifier:identifier
                                              timerType:JobsTimerTypeGCD
                                                 policy:JobsTimerBackgroundPolicyPauseAndResume
                                       startImmediately:YES
                                                  build:^(JobsTimer * _Nullable timer) {
            timer.byTimeInterval(60)
                .byQueue(dispatch_get_main_queue());
        } handler:nil]);
        XCTAssertTrue([manager isRunning:identifier]);

        [NSNotificationCenter.defaultCenter postNotificationName:UIApplicationWillResignActiveNotification object:nil];
        XCTAssertFalse([manager isRunning:identifier]);
        [NSNotificationCenter.defaultCenter postNotificationName:UIApplicationDidBecomeActiveNotification object:nil];
        XCTAssertTrue([manager isRunning:identifier]);

        XCTAssertTrue([manager pause:identifier]);
        [NSNotificationCenter.defaultCenter postNotificationName:UIApplicationDidBecomeActiveNotification object:nil];
        XCTAssertFalse([manager isRunning:identifier]);
        XCTAssertTrue([manager stopAndRemove:identifier]);
    };
}

-(void)testTimerManagerExpectedTimerCannotRemoveReplacement {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestTimerManagerExpectedTimerCannotRemoveReplacement)))(self, @selector(jobsTestTimerManagerExpectedTimerCannotRemoveReplacement));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestTimerManagerExpectedTimerCannotRemoveReplacement{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSString *identifier = [NSString stringWithFormat:@"tests.timer.expected.%@",NSUUID.UUID.UUIDString];
        JobsTimerMgr *manager = JobsTimerMgr.new;
        XCTAssertTrue([manager upsertTimerWithIdentifier:identifier
                                              timerType:JobsTimerTypeGCD
                                                 policy:JobsTimerBackgroundPolicyIgnore
                                       startImmediately:NO
                                                  build:nil
                                                handler:nil]);
        JobsTimer *oldTimer = [manager timerForIdentifier:identifier];
        XCTAssertTrue([manager upsertTimerWithIdentifier:identifier
                                              timerType:JobsTimerTypeGCD
                                                 policy:JobsTimerBackgroundPolicyIgnore
                                       startImmediately:YES
                                                  build:^(JobsTimer * _Nullable timer) {
            timer.byTimeInterval(60)
                .byQueue(dispatch_get_main_queue());
        } handler:nil]);
        JobsTimer *currentTimer = [manager timerForIdentifier:identifier];

        XCTAssertFalse([manager stopAndRemove:identifier expectedTimer:oldTimer]);
        XCTAssertEqual([manager timerForIdentifier:identifier],currentTimer);
        XCTAssertTrue(currentTimer.isRunning);
        XCTAssertTrue([manager stopAndRemove:identifier expectedTimer:currentTimer]);
        XCTAssertFalse([manager exists:identifier]);
    };
}

-(void)testTimerManagerScopePreservesManualPause {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestTimerManagerScopePreservesManualPause)))(self, @selector(jobsTestTimerManagerScopePreservesManualPause));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestTimerManagerScopePreservesManualPause{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSString *scopeIdentifier = [NSString stringWithFormat:@"tests.timer.scope.%@",NSUUID.UUID.UUIDString];
        NSString *scopeTimerIdentifier = [scopeIdentifier stringByAppendingString:@".scope"];
        NSString *manualTimerIdentifier = [scopeIdentifier stringByAppendingString:@".manual"];
        JobsTimerMgr *manager = JobsTimerMgr.new;
        for (NSString *identifier in @[scopeTimerIdentifier,manualTimerIdentifier]) {
            XCTAssertTrue([manager upsertTimerWithIdentifier:identifier
                                            scopeIdentifier:scopeIdentifier
                                                  timerType:JobsTimerTypeGCD
                                                     policy:JobsTimerBackgroundPolicyIgnore
                                           startImmediately:YES
                                                      build:^(JobsTimer * _Nullable timer) {
                timer.byTimeInterval(60)
                    .byQueue(dispatch_get_main_queue());
            } handler:nil]);
        }
        XCTAssertTrue([manager pause:manualTimerIdentifier]);

        XCTAssertEqual([manager pauseScope:scopeIdentifier],2);
        XCTAssertFalse([manager isRunning:scopeTimerIdentifier]);
        XCTAssertFalse([manager isRunning:manualTimerIdentifier]);
        XCTAssertEqual([manager resumeScope:scopeIdentifier],2);
        XCTAssertTrue([manager isRunning:scopeTimerIdentifier]);
        XCTAssertFalse([manager isRunning:manualTimerIdentifier]);
        XCTAssertEqual([manager stopAndRemoveScope:scopeIdentifier],2);
        XCTAssertFalse([manager exists:scopeTimerIdentifier]);
        XCTAssertFalse([manager exists:manualTimerIdentifier]);
    };
}

-(void)testSettingGestureDemoLoadsWithJobsBaseControllerContract {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestSettingGestureDemoLoadsWithJobsBaseControllerContract)))(self, @selector(jobsTestSettingGestureDemoLoadsWithJobsBaseControllerContract));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestSettingGestureDemoLoadsWithJobsBaseControllerContract{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        Class controllerClass = NSClassFromString(@"JobsSettingGestureVC");
        Class baseControllerClass = NSClassFromString(@"BaseViewController");
        XCTAssertNotNil(controllerClass);
        XCTAssertNotNil(baseControllerClass);
        UIViewController *controller = [controllerClass new];
        XCTAssertTrue([controller isKindOfClass:baseControllerClass]);
        XCTAssertNoThrow([controller loadViewIfNeeded]);
        XCTAssertNotNil(controller.view);
        XCTAssertEqualObjects([controller valueForKeyPath:@"viewModel.textModel.text"], @"手势解锁");
        UISegmentedControl *modeControl = [controller valueForKey:@"modeControl"];
        XCTAssertEqual(modeControl.numberOfSegments, 2);
        UIView *lockView = [controller valueForKey:@"demoLockView"];
        XCTAssertEqual([[lockView valueForKey:@"nodeButtons"] count], 9);
    };
}

@end
