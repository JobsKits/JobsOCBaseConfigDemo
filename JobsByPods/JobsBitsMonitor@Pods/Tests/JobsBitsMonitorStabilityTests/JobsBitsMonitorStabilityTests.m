//
//  JobsBitsMonitorStabilityTests.m
//  JobsBitsMonitor
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsBitsMonitorStabilityTests.h"

@implementation JobsBitsMonitorStabilityTests

-(void)testTwoRealLabelsKeepIndependentUpdatesAfterFirstIsRemoved {
    void (^onMain)(dispatch_block_t) = ^(dispatch_block_t action) {
        if (NSThread.isMainThread) {
            action();
        }else {
            dispatch_sync(dispatch_get_main_queue(), action);
        }
    };
    __block JobsBitsMonitorSuspendLab *first = nil;
    __block JobsBitsMonitorSuspendLab *second = nil;
    __block UIViewController *firstHost = nil;
    __block UIViewController *secondHost = nil;
    __block __weak JobsBitsMonitorSuspendLab *weakFirst = nil;
    __block __weak JobsBitsMonitorSuspendLab *weakSecond = nil;
    __block __weak UIViewController *weakFirstHost = nil;
    __block __weak JobsNetworkTrafficMonitor *weakFirstMonitor = nil;
    __block JobsTimer *firstTimer = nil;
    __block NSTimer *firstNativeTimer = nil;
    __block JobsTimer *secondTimer = nil;
    __block jobsByCGFloatBlock lateFirstTick = nil;
    @try {
        onMain(^{
            @autoreleasepool {
                firstHost = UIViewController.new;
                secondHost = UIViewController.new;
                first = [[JobsBitsMonitorSuspendLab alloc] initBy:JobsBitsMonitorDisplayStylePlainText];
                second = [[JobsBitsMonitorSuspendLab alloc] initBy:JobsBitsMonitorDisplayStyleRichText];
                weakFirst = first;
                weakSecond = second;
                weakFirstHost = firstHost;
                [firstHost.view addSubview:first];
                [secondHost.view addSubview:second];
                first.text = @"first pending";
                second.attributedText = nil;
                second.text = @"second pending";
                // 只检查实际私有 backing 的身份和终态，不导出新 API 或替换采样器。
                JobsNetworkTrafficMonitor *firstMonitor = [first valueForKey:@"trafficMonitor"];
                JobsNetworkTrafficMonitor *secondMonitor = [second valueForKey:@"trafficMonitor"];
                weakFirstMonitor = firstMonitor;
                firstTimer = firstMonitor.timer;
                firstNativeTimer = firstTimer.nsTimer;
                XCTAssertTrue(firstNativeTimer.isValid);
                secondTimer = secondMonitor.timer;
                lateFirstTick = firstTimer.onTick;
                XCTAssertNotNil(firstMonitor);
                XCTAssertNotNil(secondMonitor);
                XCTAssertNotEqual(firstMonitor, secondMonitor);
                XCTAssertNotEqual(firstTimer, secondTimer);
                XCTAssertNotNil(lateFirstTick);
            }
        });
        NSPredicate *bothDisplayTraffic = [NSPredicate predicateWithBlock:^BOOL(id object, NSDictionary *bindings) {
            __block BOOL updated = NO;
            onMain(^{
                updated = [weakFirst.text containsString:@"设备总流量"] &&
                    [weakSecond.attributedText.string containsString:@"设备总流量"];
            });
            return updated;
        }];
        XCTestExpectation *initial = [[XCTNSPredicateExpectation alloc] initWithPredicate:bothDisplayTraffic
                                                                                  object:NSNull.null];
        XCTAssertEqual([XCTWaiter waitForExpectations:@[initial] timeout:5], XCTWaiterResultCompleted);
        onMain(^{
            @autoreleasepool {
                [first removeFromSuperview];
                first = nil;
                firstHost = nil;
            }
            XCTAssertNil(weakFirst);
            XCTAssertNil(weakFirstHost);
            XCTAssertNil(weakFirstMonitor);
            XCTAssertEqual(firstTimer.timerState, JobsTimerStateCanceled);
            XCTAssertFalse(firstNativeTimer.isValid);
            XCTAssertFalse(firstTimer.isRunning);
            if (lateFirstTick) {
                XCTAssertNoThrow(lateFirstTick(999));
            }
            XCTAssertNotNil(weakSecond);
            XCTAssertTrue(secondTimer.isRunning);
            second.attributedText = nil;
            second.text = @"second must refresh after first leaves";
        });
        NSPredicate *remainingLabelRefreshes = [NSPredicate predicateWithBlock:^BOOL(id object, NSDictionary *bindings) {
            __block BOOL updated = NO;
            onMain(^{
                updated = [weakSecond.attributedText.string containsString:@"设备总流量"];
            });
            return updated;
        }];
        XCTestExpectation *remaining = [[XCTNSPredicateExpectation alloc] initWithPredicate:remainingLabelRefreshes
                                                                                    object:NSNull.null];
        XCTAssertEqual([XCTWaiter waitForExpectations:@[remaining] timeout:5], XCTWaiterResultCompleted);
        onMain(^{
            XCTAssertNil(weakFirst);
            XCTAssertNil(weakFirstMonitor);
            XCTAssertTrue(secondTimer.isRunning);
        });
    }@finally {
        onMain(^{
            @autoreleasepool {
                [first removeFromSuperview];
                [second removeFromSuperview];
                first = nil;
                second = nil;
                firstHost = nil;
                secondHost = nil;
            }
            if (firstTimer) {
                firstTimer.jobsStop();
            }
            if (secondTimer) {
                secondTimer.jobsStop();
            }
        });
    }
}

-(void)testBothDisplayStylesReleaseWithTheirRealControllerOwners100Times {
    void (^scenario)(void) = ^{
        for (NSUInteger cycle = 0; cycle < 100; cycle++) {
            for (NSUInteger style = JobsBitsMonitorDisplayStylePlainText;
                 style <= JobsBitsMonitorDisplayStyleRichText;
                 style++) {
                __weak JobsBitsMonitorSuspendLab *weakLabel = nil;
                __weak UIViewController *weakController = nil;
                __weak JobsNetworkTrafficMonitor *weakMonitor = nil;
                JobsTimer *createdTimer = nil;
                NSTimer *createdNativeTimer = nil;
                jobsByCGFloatBlock lateTick = nil;
                @autoreleasepool {
                    UIViewController *controller = UIViewController.new;
                    JobsBitsMonitorSuspendLab *label = [[JobsBitsMonitorSuspendLab alloc] initBy:style];
                    [controller.view addSubview:label];
                    weakLabel = label;
                    weakController = controller;
                    JobsNetworkTrafficMonitor *monitor = [label valueForKey:@"trafficMonitor"];
                    weakMonitor = monitor;
                    createdTimer = monitor.timer;
                    createdNativeTimer = createdTimer.nsTimer;
                    XCTAssertTrue(createdNativeTimer.isValid);
                    lateTick = createdTimer.onTick;
                    XCTAssertNotNil(createdTimer);
                    XCTAssertNotNil(lateTick);
                }
                XCTAssertNil(weakController);
                XCTAssertNil(weakLabel);
                XCTAssertNil(weakMonitor);
                XCTAssertEqual(createdTimer.timerState, JobsTimerStateCanceled);
                XCTAssertFalse(createdNativeTimer.isValid);
                XCTAssertFalse(createdTimer.isRunning);
                if (lateTick) {
                    XCTAssertNoThrow(lateTick(999));
                }
            }
        }
    };
    if (NSThread.isMainThread) {
        scenario();
    }else {
        dispatch_sync(dispatch_get_main_queue(), scenario);
    }
}

@end
