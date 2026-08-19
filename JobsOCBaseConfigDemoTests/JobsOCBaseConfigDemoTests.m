//
//  JobsOCBaseConfigDemoTests.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import "JobsOCBaseConfigDemoTests.h"
#import <objc/message.h>

@implementation JobsOCBaseConfigDemoTests
-(void)setUp {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsSetUp)))(self, @selector(jobsSetUp));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsSetUp{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super setUp];
    };
}

-(void)tearDown {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTearDown)))(self, @selector(jobsTearDown));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTearDown{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super tearDown];
    };
}

-(void)testAppBundleCanBeLoaded {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestAppBundleCanBeLoaded)))(self, @selector(jobsTestAppBundleCanBeLoaded));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestAppBundleCanBeLoaded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSBundle *bundle = NSBundle.mainBundle;
        XCTAssertNotNil(bundle, @"测试进程必须能读取 App Bundle。");
    };
}

-(void)testInfoPlistBundleIdentifierReadable {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestInfoPlistBundleIdentifierReadable)))(self, @selector(jobsTestInfoPlistBundleIdentifierReadable));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestInfoPlistBundleIdentifierReadable{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSString *bundleIdentifier = NSBundle.mainBundle.bundleIdentifier;
        XCTAssertTrue(bundleIdentifier.length > 0, @"Info.plist 里必须能读到 Bundle Identifier。");
    };
}

#if JOBS_TIMER_TESTS_AVAILABLE
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
#endif

-(void)testSplashOverlayDoesNotInstallNavigationUIAndCanSkipWhileRunning {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestSplashOverlayDoesNotInstallNavigationUIAndCanSkipWhileRunning)))(self, @selector(jobsTestSplashOverlayDoesNotInstallNavigationUIAndCanSkipWhileRunning));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestSplashOverlayDoesNotInstallNavigationUIAndCanSkipWhileRunning{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIViewController *rootViewController = UIViewController.new;
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
        navigationController.view.byFrame(CGRectMake(0, 0, 402, 874));
        typedef id(*JobsSplashConfigurationIMP)(id, SEL, NSString *);
        JobsSplashConfigurationIMP makeConfiguration = (JobsSplashConfigurationIMP)objc_msgSend;
        id configuration = makeConfiguration(NSClassFromString(@"JobsOCSplashConfiguration"),
                                             NSSelectorFromString(@"localImage:"),
                                             @"");
        [configuration setValue:@8 forKey:@"countdownSeconds"];
        [configuration setValue:@YES forKey:@"skipButtonVisible"];
        typedef UIViewController *(*JobsShowSplashIMP)(id, SEL, UIViewController *, id);
        JobsShowSplashIMP showSplash = (JobsShowSplashIMP)objc_msgSend;
        UIViewController *splashViewController = showSplash(NSClassFromString(@"JobsOCSplashPresenter"),
                                                            NSSelectorFromString(@"showOver:configuration:"),
                                                            navigationController,
                                                            configuration);
        UIButton *skipButton = [splashViewController valueForKey:@"countdownBtn"];
        if (@available(iOS 16.0, *)) {
            XCTAssertEqualWithAccuracy(skipButton.configuration.background.cornerRadius, 18, 0.001);
        } else {
            XCTAssertEqualWithAccuracy(skipButton.layer.cornerRadius, 18, 0.001);
        }
        [splashViewController beginAppearanceTransition:YES animated:NO];
        [splashViewController endAppearanceTransition];
        [splashViewController.view layoutIfNeeded];

        XCTAssertEqual(splashViewController.parentViewController, rootViewController);
        XCTAssertEqualObjects(navigationController.viewControllers, (@[rootViewController]));
        for (UIView *subview in splashViewController.view.subviews) {
            XCTAssertFalse([NSStringFromClass(subview.class) isEqualToString:@"GKCustomNavigationBar"]);
        }
        XCTAssertTrue(skipButton.enabled);
        XCTAssertEqual([splashViewController.view hitTest:skipButton.center withEvent:nil], skipButton);

        [skipButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        XCTAssertNil(splashViewController.parentViewController);
        XCTAssertNil(splashViewController.view.superview);
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

-(void)testDropDownListSelectionClosesWithoutNilBlockCrash {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestDropDownListSelectionClosesWithoutNilBlockCrash)))(self, @selector(jobsTestDropDownListSelectionClosesWithoutNilBlockCrash));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestDropDownListSelectionClosesWithoutNilBlockCrash{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIViewController *controller = [NSClassFromString(@"JobsDropDownListVC") new];
        XCTAssertNotNil(controller);
        XCTAssertNoThrow([controller loadViewIfNeeded]);

        UIButton *button = [controller valueForKey:@"btn"];
        XCTAssertNotNil(button);
        [button sendActionsForControlEvents:UIControlEventTouchUpInside];

        UIView *dropDownListView = [controller valueForKey:@"dropDownListView"];
        XCTAssertNotNil(dropDownListView);
        UITableView *tableView = [dropDownListView valueForKey:@"tableView"];
        XCTAssertEqual([tableView numberOfRowsInSection:0], 3);

        typedef void(*JobsDropDownDidSelectIMP)(id, SEL, UITableView *, NSIndexPath *);
        JobsDropDownDidSelectIMP didSelect = (JobsDropDownDidSelectIMP)objc_msgSend;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0
                                                   inSection:0];
        XCTAssertNoThrow(didSelect(dropDownListView,
                                   NSSelectorFromString(@"tableView:didSelectRowAtIndexPath:"),
                                   tableView,
                                   indexPath));
        XCTAssertNil([controller valueForKey:@"dropDownListView"]);
        XCTAssertFalse(button.selected);
        XCTAssertEqualObjects([[controller valueForKey:@"selectedTitleLab"] text], @"点选：基础配置");
    };
}

-(void)testPerformanceExample {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestPerformanceExample)))(self, @selector(jobsTestPerformanceExample));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestPerformanceExample{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self measureBlock:^{
            (void)NSBundle.mainBundle.infoDictionary;
        }];
    };
}

@end
