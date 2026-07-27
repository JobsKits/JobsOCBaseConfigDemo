//
//  JobsOCBaseConfigDemoTests.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月16日，星期四.
//

#import <XCTest/XCTest.h>
#import "JobsTimer.h"
#import "JobsTimerMgr.h"

@interface JobsOCBaseConfigDemoTests : XCTestCase

@end

@implementation JobsOCBaseConfigDemoTests
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

@end
