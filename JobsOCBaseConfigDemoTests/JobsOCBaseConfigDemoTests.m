//
//  JobsOCBaseConfigDemoTests.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月16日，星期四.
//

#import "JobsOCBaseConfigDemoTests.h"

// 用途：实现自动化测试；验证宿主 Bundle、计时器前后台与手动暂停、开屏、手势页、下拉选择及蓝牙页面的基础回归。
// 运行：在 Xcode 的 JobsOCBaseConfigDemoTests 测试 Target 执行，或由现有 CI 调用；不编入主 App。

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
        timer.start();
        XCTAssertTrue(timer.isRunning);

        [NSNotificationCenter.defaultCenter postNotificationName:UIApplicationWillResignActiveNotification object:nil];
        XCTAssertFalse(timer.isRunning);

        [NSNotificationCenter.defaultCenter postNotificationName:UIApplicationDidBecomeActiveNotification object:nil];
        XCTAssertTrue(timer.isRunning);

        timer.pause();
        [NSNotificationCenter.defaultCenter postNotificationName:UIApplicationDidBecomeActiveNotification object:nil];
        XCTAssertFalse(timer.isRunning);
        timer.jobsStop();
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
        JobsTimerMgr *manager = JobsTimerMgr.shared();
        XCTAssertTrue([manager upsertTimerWithIdentifier:identifier
                                              timerType:JobsTimerTypeGCD
                                                 policy:JobsTimerBackgroundPolicyPauseAndResume
                                       startImmediately:YES
                                                  build:^(JobsTimer * _Nullable timer) {
            timer.byTimeInterval(60)
                .byQueue(dispatch_get_main_queue());
        } handler:nil]);
        XCTAssertTrue(manager.isRunning(identifier));

        [NSNotificationCenter.defaultCenter postNotificationName:UIApplicationWillResignActiveNotification object:nil];
        XCTAssertFalse(manager.isRunning(identifier));
        [NSNotificationCenter.defaultCenter postNotificationName:UIApplicationDidBecomeActiveNotification object:nil];
        XCTAssertTrue(manager.isRunning(identifier));

        XCTAssertTrue(manager.pause(identifier));
        [NSNotificationCenter.defaultCenter postNotificationName:UIApplicationDidBecomeActiveNotification object:nil];
        XCTAssertFalse(manager.isRunning(identifier));
        XCTAssertTrue(manager.stopAndRemove(identifier));
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
        JobsTimer *oldTimer = manager.timerForIdentifier(identifier);
        XCTAssertTrue([manager upsertTimerWithIdentifier:identifier
                                              timerType:JobsTimerTypeGCD
                                                 policy:JobsTimerBackgroundPolicyIgnore
                                       startImmediately:YES
                                                  build:^(JobsTimer * _Nullable timer) {
            timer.byTimeInterval(60)
                .byQueue(dispatch_get_main_queue());
        } handler:nil]);
        JobsTimer *currentTimer = manager.timerForIdentifier(identifier);

        XCTAssertFalse([manager stopAndRemove:identifier expectedTimer:oldTimer]);
        XCTAssertEqual(manager.timerForIdentifier(identifier),currentTimer);
        XCTAssertTrue(currentTimer.isRunning);
        XCTAssertTrue([manager stopAndRemove:identifier expectedTimer:currentTimer]);
        XCTAssertFalse(manager.exists(identifier));
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
        XCTAssertTrue(manager.pause(manualTimerIdentifier));

        XCTAssertEqual(manager.pauseScope(scopeIdentifier),2);
        XCTAssertFalse(manager.isRunning(scopeTimerIdentifier));
        XCTAssertFalse(manager.isRunning(manualTimerIdentifier));
        XCTAssertEqual(manager.resumeScope(scopeIdentifier),2);
        XCTAssertTrue(manager.isRunning(scopeTimerIdentifier));
        XCTAssertFalse(manager.isRunning(manualTimerIdentifier));
        XCTAssertEqual(manager.stopAndRemoveScope(scopeIdentifier),2);
        XCTAssertFalse(manager.exists(scopeTimerIdentifier));
        XCTAssertFalse(manager.exists(manualTimerIdentifier));
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
        typedef id(*JobsSplashConfigurationIMP)(id, SEL, NSString *, NSBundle *);
        JobsSplashConfigurationIMP makeConfiguration = (JobsSplashConfigurationIMP)objc_msgSend;
        id configuration = makeConfiguration(NSClassFromString(@"JobsOCSplashConfiguration"),
                                             NSSelectorFromString(@"localImage:bundle:"),
                                             @"",
                                             NSBundle.mainBundle);
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
        XCTAssertEqualObjects([controller valueForKeyPath:@"viewModel.textModel.text"], @"手势解锁".jobsTr());
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
        NSString *expectedTitle = [NSString stringWithFormat:@"%@%@", @"点选：".jobsTr(), @"基础配置".jobsTr()];
        XCTAssertEqualObjects([[controller valueForKey:@"selectedTitleLab"] text], expectedTitle);
    };
}

-(void)testBluetoothFeaturePagesLoadAndExecute {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestBluetoothFeaturePagesLoadAndExecute)))(self, @selector(jobsTestBluetoothFeaturePagesLoadAndExecute));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestBluetoothFeaturePagesLoadAndExecute{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        XCTAssertFalse([NSObject instancesRespondToSelector:NSSelectorFromString(@"defaultParagraphStyle")]);
        Class controllerClass = NSClassFromString(@"JobsBluetoothFeatureDemoVC");
        XCTAssertNotNil(controllerClass);
        typedef id (*JobsBluetoothInitIMP)(id, SEL, NSInteger, NSString *);
        for (NSInteger index = 0; index < 28; index++) {
            UIViewController *controller = ((JobsBluetoothInitIMP)objc_msgSend)([controllerClass alloc],
                NSSelectorFromString(@"initWithFeatureIndex:featureTitle:"), index, @"蓝牙回归");
            UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:controller];
            XCTAssertNoThrow([navigation loadViewIfNeeded]);
            XCTAssertNoThrow([controller loadViewIfNeeded], @"入口 %ld", (long)index + 1);
            UIButton *button = [controller valueForKey:@"executeButton"];
            XCTAssertNotNil(button);
            XCTAssertNoThrow([button sendActionsForControlEvents:UIControlEventTouchUpInside]);
            UITextView *logView = [controller valueForKey:@"logTextView"];
            XCTAssertTrue(logView.text.length > 0);
        }
    };
}

-(void)testBluetoothCellFollowsThemeWithoutReload {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestBluetoothCellFollowsThemeWithoutReload)))(self, @selector(jobsTestBluetoothCellFollowsThemeWithoutReload));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestBluetoothCellFollowsThemeWithoutReload{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIViewController *controller = [NSClassFromString(@"JobsBluetoothDemoVC") new];
        UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:controller];
        [navigation loadViewIfNeeded];
        [controller loadViewIfNeeded];
        UITableView *table = [controller valueForKey:@"tableView"];
        UITableViewCell *cell = [table.dataSource tableView:table cellForRowAtIndexPath:
            [NSIndexPath indexPathForRow:0 inSection:0]];
        JobsThemeCenter *center = JobsThemeCenter.shared;
        JobsThemeStyle originalStyle = center.currentStyle;
        BOOL originalFollowingSystem = center.followingSystem;
        NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
        NSDictionary *originalDefaults = @{
            @"JobsTheme.currentStyle": [defaults objectForKey:@"JobsTheme.currentStyle"] ?: NSNull.null,
            @"JobsTheme.followingSystem": [defaults objectForKey:@"JobsTheme.followingSystem"] ?: NSNull.null
        };
        @try {
            for (JobsThemeStyle style in @[JobsThemeStyleLight, JobsThemeStyleDark, JobsThemeStyleLight]) {
                center.setStyle(style);
                XCTAssertEqualObjects(cell.backgroundColor, center.resolvedColorForKey(JobsThemeColorKeyBackgroundGroupedSecondary));
                XCTAssertEqualObjects(cell.textLabel.textColor, center.resolvedColorForKey(JobsThemeColorKeyTextPrimary));
                XCTAssertEqualObjects(cell.detailTextLabel.textColor, center.resolvedColorForKey(JobsThemeColorKeyTextSecondary));
            }
        } @finally {
            center.setStyle(originalStyle);
            if (originalFollowingSystem) {
                [center followSystem];
            }
            for (NSString *key in originalDefaults) {
                if (originalDefaults[key] == NSNull.null) {
                    [defaults removeObjectForKey:key];
                } else {
                    [defaults setObject:originalDefaults[key] forKey:key];
                }
            }
        }
    };
}

-(void)testThemeSelectionPersistsWithoutLosingSystemMode {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestThemeSelectionPersistsWithoutLosingSystemMode)))(self, @selector(jobsTestThemeSelectionPersistsWithoutLosingSystemMode));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestThemeSelectionPersistsWithoutLosingSystemMode{
    return ^{
        NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
        NSString *rawKey = @"JobsTheme.currentStyle";
        NSString *kindKey = @"JobsTheme.followingSystem";
        NSDictionary *original = @{rawKey: [defaults objectForKey:rawKey] ?: NSNull.null,
                                   kindKey: [defaults objectForKey:kindKey] ?: NSNull.null};
        @try {
            for (JobsThemeStyle raw in @[JobsThemeStyleLight, JobsThemeStyleDark]) {
                [defaults setObject:raw forKey:rawKey];
                [defaults removeObjectForKey:kindKey];
                JobsThemeCenter *center = JobsThemeCenter.new;
                XCTAssertTrue([center configureWithResource:@"JobsThemeResources" fileExtension:@"json"
                                                     bundle:NSBundle.mainBundle error:nil]);
                XCTAssertFalse(center.followingSystem);
                XCTAssertEqualObjects(center.currentStyle, raw);
                XCTAssertEqualObjects(center.effectiveStyle, raw);
                XCTAssertNil([defaults objectForKey:kindKey]);
                [center followSystem];
                XCTAssertTrue(center.followingSystem);
                XCTAssertEqualObjects(center.currentStyle, raw);
                XCTAssertEqualObjects([defaults objectForKey:rawKey], raw);
                XCTAssertTrue([defaults boolForKey:kindKey]);
                JobsThemeCenter *cold = JobsThemeCenter.new;
                XCTAssertTrue([cold configureWithResource:@"JobsThemeResources" fileExtension:@"json"
                                                   bundle:NSBundle.mainBundle error:nil]);
                XCTAssertTrue(cold.followingSystem);
                XCTAssertEqualObjects(cold.currentStyle, raw);
                XCTAssertTrue(([@[JobsThemeStyleLight, JobsThemeStyleDark] containsObject:cold.effectiveStyle]));
                cold.setStyle(@"unknown-theme");
                XCTAssertTrue(cold.followingSystem);
                XCTAssertEqualObjects(cold.currentStyle, raw);
                cold.setStyle(raw);
                XCTAssertFalse(cold.followingSystem);
                XCTAssertEqualObjects(cold.effectiveStyle, raw);
                [cold followSystem];
                JobsThemeStyle effective = cold.effectiveStyle;
                cold.toggle();
                XCTAssertFalse(cold.followingSystem);
                XCTAssertEqualObjects(cold.currentStyle,
                    [effective isEqualToString:JobsThemeStyleDark] ? JobsThemeStyleLight : JobsThemeStyleDark);
            }
            [defaults setObject:@"unknown-theme" forKey:rawKey];
            [defaults removeObjectForKey:kindKey];
            JobsThemeCenter *center = JobsThemeCenter.new;
            XCTAssertTrue([center configureWithResource:@"JobsThemeResources" fileExtension:@"json"
                                                 bundle:NSBundle.mainBundle error:nil]);
            XCTAssertEqualObjects(center.currentStyle, JobsThemeStyleLight);
            [center followSystem];
            XCTAssertEqualObjects([defaults objectForKey:rawKey], @"unknown-theme");
        } @finally {
            for (NSString *key in original) {
                if (original[key] == NSNull.null) {
                    [defaults removeObjectForKey:key];
                } else {
                    [defaults setObject:original[key] forKey:key];
                }
            }
        }
    };
}

-(void)testLegacyThemeRawNamesRemainAvailable {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestLegacyThemeRawNamesRemainAvailable)))(self, @selector(jobsTestLegacyThemeRawNamesRemainAvailable));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestLegacyThemeRawNamesRemainAvailable{
    return ^{
        NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
        NSString *rawKey = @"JobsTheme.currentStyle";
        NSString *kindKey = @"JobsTheme.followingSystem";
        NSDictionary *original = @{rawKey: [defaults objectForKey:rawKey] ?: NSNull.null,
                                   kindKey: [defaults objectForKey:kindKey] ?: NSNull.null};
        NSString *folder = [NSTemporaryDirectory() stringByAppendingPathComponent:
            [NSUUID.UUID.UUIDString stringByAppendingPathExtension:@"bundle"]];
        @try {
            NSError *error = nil;
            XCTAssertTrue([NSFileManager.defaultManager createDirectoryAtPath:folder
                                                 withIntermediateDirectories:YES attributes:nil error:&error]);
            XCTAssertNil(error);
            NSDictionary *info = @{ @"CFBundleIdentifier": @"com.jobs.theme.compatibility",
                                    @"CFBundlePackageType": @"BNDL" };
            XCTAssertTrue([info writeToFile:[folder stringByAppendingPathComponent:@"Info.plist"] atomically:YES]);
            NSArray<NSString *> *rawNames = @[@"system", @"system:custom", @"__jobs_theme_mode:system",
                                              @"__jobs_follow_system__/custom"];
            NSMutableDictionary *themes = [@{JobsThemeStyleLight: @{ @"colors": @{ @"background.primary": @"#FFFFFF" } },
                                             JobsThemeStyleDark: @{ @"colors": @{ @"background.primary": @"#000000" } }} mutableCopy];
            for (NSString *raw in rawNames) {
                themes[raw] = @{ @"colors": @{ @"background.primary": @"#123456" } };
            }
            NSData *packet = [NSJSONSerialization dataWithJSONObject:@{ @"defaultTheme": JobsThemeStyleLight,
                                                                       @"themes": themes } options:0 error:&error];
            XCTAssertNil(error);
            XCTAssertTrue([packet writeToFile:[folder stringByAppendingPathComponent:@"Compatibility.json"] atomically:YES]);
            NSBundle *bundle = [NSBundle bundleWithPath:folder];
            XCTAssertNotNil(bundle);
            for (NSString *raw in rawNames) {
                [defaults setObject:raw forKey:rawKey];
                [defaults removeObjectForKey:kindKey];
                JobsThemeCenter *center = JobsThemeCenter.new;
                XCTAssertTrue([center configureWithResource:@"Compatibility" fileExtension:@"json" bundle:bundle error:nil]);
                XCTAssertFalse(center.followingSystem);
                XCTAssertEqualObjects(center.currentStyle, raw);
                XCTAssertEqualObjects(center.effectiveStyle, raw);
                center.setStyle(JobsThemeStyleLight);
                center.setStyle(raw);
                XCTAssertFalse(center.followingSystem);
                XCTAssertEqualObjects([defaults objectForKey:rawKey], raw);
                CGFloat red = 0, green = 0, blue = 0, alpha = 0;
                XCTAssertTrue([center.resolvedColorForKey(JobsThemeColorKeyBackgroundPrimary)
                    getRed:&red green:&green blue:&blue alpha:&alpha]);
                XCTAssertEqualWithAccuracy(red, 18 / 255.0, 0.001);
                XCTAssertEqualWithAccuracy(green, 52 / 255.0, 0.001);
                XCTAssertEqualWithAccuracy(blue, 86 / 255.0, 0.001);
                [center followSystem];
                XCTAssertTrue(center.followingSystem);
                XCTAssertEqualObjects(center.currentStyle, raw);
                XCTAssertEqualObjects([defaults objectForKey:rawKey], raw);
                JobsThemeCenter *cold = JobsThemeCenter.new;
                XCTAssertTrue([cold configureWithResource:@"Compatibility" fileExtension:@"json" bundle:bundle error:nil]);
                XCTAssertTrue(cold.followingSystem);
                XCTAssertEqualObjects(cold.currentStyle, raw);
                cold.setStyle(raw);
                XCTAssertFalse(cold.followingSystem);
                XCTAssertEqualObjects(cold.effectiveStyle, raw);
            }
        } @finally {
            for (NSString *key in original) {
                if (original[key] == NSNull.null) {
                    [defaults removeObjectForKey:key];
                } else {
                    [defaults setObject:original[key] forKey:key];
                }
            }
            [NSFileManager.defaultManager removeItemAtPath:folder error:nil];
        }
    };
}

-(void)testSystemThemeFollowsSceneAboveWindowOverride {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCBaseConfigDemoTests.class, @selector(jobsTestSystemThemeFollowsSceneAboveWindowOverride)))(self, @selector(jobsTestSystemThemeFollowsSceneAboveWindowOverride));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTestSystemThemeFollowsSceneAboveWindowOverride{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (@available(iOS 17.0, *)) {
            UIWindowScene *scene = nil;
            for (UIScene *candidate in UIApplication.sharedApplication.connectedScenes) {
                if ([candidate isKindOfClass:UIWindowScene.class] &&
                    candidate.activationState == UISceneActivationStateForegroundActive) {
                    scene = (UIWindowScene *)candidate;
                    break;
                }
            }
            XCTAssertNotNil(scene);
            if (!scene) {
                return;
            }
            NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
            NSString *rawKey = @"JobsTheme.currentStyle";
            NSString *kindKey = @"JobsTheme.followingSystem";
            NSDictionary *original = @{rawKey: [defaults objectForKey:rawKey] ?: NSNull.null,
                                       kindKey: [defaults objectForKey:kindKey] ?: NSNull.null};
            BOOL hadOverride = [scene.traitOverrides containsTrait:UITraitUserInterfaceStyle.class];
            UIUserInterfaceStyle originalSceneStyle = hadOverride
                ? scene.traitOverrides.userInterfaceStyle
                : UIUserInterfaceStyleUnspecified;
            UIWindow *window = scene.keyWindow;
            UIUserInterfaceStyle originalWindowStyle = window.overrideUserInterfaceStyle;
            JobsThemeCenter *center = JobsThemeCenter.new;
            UILabel *label = UILabel.new;
            @try {
                XCTAssertNil(NSBundle.mainBundle.infoDictionary[@"UIUserInterfaceStyle"],
                             @"App不可用固定Info.plist外观覆盖系统选择。");
                XCTAssertTrue([center configureWithResource:@"JobsThemeResources" fileExtension:@"json"
                                                     bundle:NSBundle.mainBundle error:nil]);
                JobsThemeStyle originalRaw = center.currentStyle;
                id savedRaw = [defaults objectForKey:rawKey];
                [center followSystem];
                [center bindObject:label slot:@"theme-mode-regression"
                             apply:^(__kindof UILabel *object, JobsThemeCenter *theme) {
                    object.backgroundColor = theme.resolvedColorForKey(JobsThemeColorKeyBackgroundPrimary);
                }];
                window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
                for (NSNumber *appearance in @[@(UIUserInterfaceStyleDark),
                                               @(UIUserInterfaceStyleLight),
                                               @(UIUserInterfaceStyleDark)]) {
                    scene.traitOverrides.userInterfaceStyle = appearance.integerValue;
                    JobsThemeStyle expected = appearance.integerValue == UIUserInterfaceStyleDark
                        ? JobsThemeStyleDark
                        : JobsThemeStyleLight;
                    [self expectationForPredicate:[NSPredicate predicateWithBlock:^BOOL(JobsThemeCenter *object,
                                                                                       NSDictionary *bindings) {
                        return [object.effectiveStyle isEqualToString:expected];
                    }] evaluatedWithObject:center handler:nil];
                    [self waitForExpectationsWithTimeout:3 handler:nil];
                    NSLog(@"JOBS_THEME_PROOF following=%d raw=%@ scene=%ld window=%ld effective=%@",
                          center.followingSystem, center.currentStyle,
                          (long)scene.traitCollection.userInterfaceStyle,
                          (long)window.overrideUserInterfaceStyle, center.effectiveStyle);
                    XCTAssertTrue(center.followingSystem);
                    XCTAssertEqualObjects(center.currentStyle, originalRaw);
                    XCTAssertEqualObjects([defaults objectForKey:rawKey], savedRaw);
                    XCTAssertEqualObjects(label.backgroundColor, center.resolvedColorForKey(JobsThemeColorKeyBackgroundPrimary));
                }
                center.setStyle(JobsThemeStyleLight);
                scene.traitOverrides.userInterfaceStyle = UIUserInterfaceStyleLight;
                [center refreshSystemAppearance];
                scene.traitOverrides.userInterfaceStyle = UIUserInterfaceStyleDark;
                [center refreshSystemAppearance];
                XCTAssertFalse(center.followingSystem);
                XCTAssertEqualObjects(center.effectiveStyle, JobsThemeStyleLight);
                [center followSystem];
                XCTAssertEqualObjects(center.currentStyle, JobsThemeStyleLight);
                XCTAssertEqualObjects(center.effectiveStyle, JobsThemeStyleDark);
                JobsThemeCenter *cold = JobsThemeCenter.new;
                XCTAssertTrue([cold configureWithResource:@"JobsThemeResources" fileExtension:@"json"
                                                   bundle:NSBundle.mainBundle error:nil]);
                XCTAssertTrue(cold.followingSystem);
                XCTAssertEqualObjects(cold.currentStyle, JobsThemeStyleLight);
                XCTAssertEqualObjects(cold.effectiveStyle, JobsThemeStyleDark);
            } @finally {
                [center unbindObject:label slot:@"theme-mode-regression"];
                window.overrideUserInterfaceStyle = originalWindowStyle;
                if (hadOverride) {
                    scene.traitOverrides.userInterfaceStyle = originalSceneStyle;
                } else {
                    [scene.traitOverrides removeTrait:UITraitUserInterfaceStyle.class];
                }
                [JobsThemeCenter.shared refreshSystemAppearance];
                for (NSString *key in original) {
                    if (original[key] == NSNull.null) {
                        [defaults removeObjectForKey:key];
                    } else {
                        [defaults setObject:original[key] forKey:key];
                    }
                }
            }
        }
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
