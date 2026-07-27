//
//  JobsOCBaseConfigDemoTests.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#import <XCTest/XCTest.h>
#import <objc/message.h>
#if __has_include(<JobsOCTimer/JobsOCTimer.h>) && __has_include(<JobsOCTimerMgr/JobsOCTimerMgr.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#import <JobsOCTimerMgr/JobsOCTimerMgr.h>
#define JOBS_TIMER_TESTS_AVAILABLE 1
#else
#define JOBS_TIMER_TESTS_AVAILABLE 0
#endif

@interface JobsOCBaseConfigDemoTests : XCTestCase

@end

@implementation JobsOCBaseConfigDemoTests
-(void)setUp {
    [super setUp];
}

-(void)tearDown {
    [super tearDown];
}

-(void)testAppBundleCanBeLoaded {
    NSBundle *bundle = NSBundle.mainBundle;
    XCTAssertNotNil(bundle, @"测试进程必须能读取 App Bundle。");
}

-(void)testInfoPlistBundleIdentifierReadable {
    NSString *bundleIdentifier = NSBundle.mainBundle.bundleIdentifier;
    XCTAssertTrue(bundleIdentifier.length > 0, @"Info.plist 里必须能读到 Bundle Identifier。");
}

#if JOBS_TIMER_TESTS_AVAILABLE
-(void)testTimerResumesOnlyAfterAutomaticPause {
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
}

-(void)testTimerManagerKeepsManualPauseState {
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
}
#endif

-(void)testSplashOverlayDoesNotInstallNavigationUIAndCanSkipWhileRunning {
    UIViewController *rootViewController = UIViewController.new;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    navigationController.view.frame = CGRectMake(0, 0, 402, 874);
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
}

-(void)testSettingGestureDemoLoadsWithJobsBaseControllerContract {
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
}

-(void)testDropDownListSelectionClosesWithoutNilBlockCrash {
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
}

-(void)testPerformanceExample {
    [self measureBlock:^{
        (void)NSBundle.mainBundle.infoDictionary;
    }];
}

@end
