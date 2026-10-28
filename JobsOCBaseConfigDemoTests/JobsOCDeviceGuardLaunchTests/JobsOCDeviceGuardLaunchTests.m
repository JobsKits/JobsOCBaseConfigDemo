//
//  JobsOCDeviceGuardLaunchTests.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsOCDeviceGuardLaunchTests.h"

static JobsOCDeviceGuardReport *JobsOCLaunchTestReport(NSArray<JobsOCDeviceGuardCheck *> *checks, NSString *unsupportedReason) {
    return [[JobsOCDeviceGuardReport alloc] initWithChecks:checks
        configuration:JobsOCDeviceGuardConfiguration.defaultConfiguration() unsupportedReason:unsupportedReason];
}

static JobsOCDeviceGuardCheck *JobsOCLaunchTestEvidence(JobsOCDeviceGuardCategory category, JobsOCDeviceGuardCheckStatus status) {
    return [[JobsOCDeviceGuardCheck alloc] initWithCategory:category status:status identifier:@"launch-test" detail:@"synthetic" errorCode:0];
}

@implementation JobsOCDeviceGuardLaunchTests

-(void)testDefaultPolicyBlocksOnlyJailbroken {
    NSArray<JobsOCDeviceGuardReport *> *reports = @[
        JobsOCLaunchTestReport(@[JobsOCLaunchTestEvidence(JobsOCDeviceGuardCategoryFileSystem, JobsOCDeviceGuardCheckStatusDetected),
                                JobsOCLaunchTestEvidence(JobsOCDeviceGuardCategoryRuntime, JobsOCDeviceGuardCheckStatusDetected)], @""),
        JobsOCLaunchTestReport(@[JobsOCLaunchTestEvidence(JobsOCDeviceGuardCategoryFileSystem, JobsOCDeviceGuardCheckStatusDetected)], @""),
        JobsOCLaunchTestReport(@[JobsOCLaunchTestEvidence(JobsOCDeviceGuardCategoryRuntime, JobsOCDeviceGuardCheckStatusPassed)], @""),
        JobsOCLaunchTestReport(@[], @""),
        JobsOCLaunchTestReport(@[], @"Simulator")
    ];
    for (JobsOCDeviceGuardReport *report in reports) {
        JobsOCDeviceGuardLaunchDecision *decision = [[JobsOCDeviceGuardLaunchDecision alloc] initWithReport:report policy:nil];
        XCTAssertEqual(decision.blocked, report.isJailbroken);
        XCTAssertEqual(decision.report, report);
        if (report.verdict == JobsOCDeviceGuardVerdictUnsupported || report.verdict == JobsOCDeviceGuardVerdictIndeterminate) {
            XCTAssertTrue(report.shouldRestrict);
            XCTAssertFalse(decision.blocked);
        }
    }
}

-(void)testDecisionFreezesPolicyResult {
    __block BOOL blocks = YES;
    __block NSUInteger invocations = 0;
    JobsOCDeviceGuardReport *report = JobsOCLaunchTestReport(@[], @"Simulator");
    JobsOCDeviceGuardLaunchDecision *decision = [[JobsOCDeviceGuardLaunchDecision alloc]
        initWithReport:report policy:^BOOL(JobsOCDeviceGuardReport *value) {
            invocations += 1;
            XCTAssertEqual(value, report);
            return blocks;
        }];
    blocks = NO;
    XCTAssertTrue(decision.blocked);
    XCTAssertEqual(invocations, 1);
}

-(void)testProcessDecisionIsStableAndConfigurationFrozen {
    JobsOCDeviceGuardLaunchDecision *first = JobsOCDeviceGuardLaunchGate.prepare();
    JobsOCDeviceGuardLaunchDecision *second = JobsOCDeviceGuardLaunchGate.prepare();
    XCTAssertEqual(first, second);
    XCTAssertEqual(first, JobsOCDeviceGuardLaunchGate.decision);
    XCTAssertFalse([JobsOCDeviceGuardLaunchGate configurePolicy:^BOOL(JobsOCDeviceGuardReport *report) {
        return !report.isJailbroken;
    } blockedViewControllerFactory:nil]);
#if DEBUG
    XCTAssertFalse(JobsOCDeviceGuardLaunchGate.configureReportProviderForTesting(^JobsOCDeviceGuardReport * {
        return JobsOCLaunchTestReport(@[], @"late");
    }));
#endif
    XCTAssertEqual(first, JobsOCDeviceGuardLaunchGate.decision);
}

-(void)testBlockedControllerHasNoBusinessBaseClass {
    JobsOCDeviceGuardReport *report = JobsOCLaunchTestReport(@[
        JobsOCLaunchTestEvidence(JobsOCDeviceGuardCategoryFileSystem, JobsOCDeviceGuardCheckStatusDetected),
        JobsOCLaunchTestEvidence(JobsOCDeviceGuardCategoryRuntime, JobsOCDeviceGuardCheckStatusDetected)], @"");
    JobsOCDeviceGuardBlockedVC *controller = [[JobsOCDeviceGuardBlockedVC alloc] initWithReport:report];
    XCTAssertEqual(JobsOCDeviceGuardBlockedVC.superclass, UIViewController.class);
    XCTAssertNoThrow([controller loadViewIfNeeded]);
    XCTAssertEqualObjects(controller.view.accessibilityIdentifier, @"JobsDeviceGuardBlockedRoot");
    XCTAssertEqual(controller.report, report);
    XCTAssertEqual(controller.childViewControllers.count, 0);
}

-(void)testActualSceneMatchesFrozenDecision {
    JobsOCDeviceGuardLaunchDecision *decision = JobsOCDeviceGuardLaunchGate.decision;
    NSUInteger checkedWindows = 0;
    for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
        if (![scene isKindOfClass:UIWindowScene.class]) {
            continue;
        }
        id<UIWindowSceneDelegate> delegate = (id<UIWindowSceneDelegate>)scene.delegate;
        UIWindow *window = delegate.window;
        if (!window) {
            continue;
        }
        checkedWindows += 1;
        if (decision.blocked) {
            XCTAssertTrue([window.rootViewController isKindOfClass:JobsOCDeviceGuardBlockedVC.class]);
            XCTAssertEqualObjects(window.rootViewController.view.accessibilityIdentifier, @"JobsDeviceGuardBlockedRoot");
            id<UIWindowSceneDelegate> sceneDelegate = delegate;
            UIViewController *originalRoot = window.rootViewController;
            NSUserActivity *activity = [JobsOCSceneCoordinator demoActivityWithCounter:7 sourceSession:scene.session];
            [sceneDelegate scene:scene continueUserActivity:activity];
            [sceneDelegate scene:scene restoreInteractionStateWithUserActivity:activity];
            XCTAssertEqual(window.rootViewController, originalRoot);
            XCTAssertNil([sceneDelegate stateRestorationActivityForScene:scene]);
            UIViewController *first = JobsOCDeviceGuardLaunchGate.makeBlockedViewController();
            UIViewController *second = JobsOCDeviceGuardLaunchGate.makeBlockedViewController();
            XCTAssertNotNil(first);
            XCTAssertNotEqual(first, second);
        } else {
            XCTAssertFalse([window.rootViewController isKindOfClass:JobsOCDeviceGuardBlockedVC.class]);
        }
    }
    XCTAssertGreaterThan(checkedWindows, 0);
}

@end
