//
//  JobsTimerMgrStabilityTests.m
//  JobsOCTimerMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsTimerMgrStabilityTests.h"

// 用途：实现自动化测试；验证计时器强制完成只投递一次、不误删替换任务，以及管理器释放后停止计时。
// 运行：在 Xcode 的 Pods 工程 JobsOCTimerMgr-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@implementation JobsTimerMgrStabilityTests

- (void)testForceFinishDeliversOnceAfterRemovalAndDoesNotRemoveReplacement {
    JobsTimerMgr *manager = JobsTimerMgr.new;
    XCTestExpectation *finished = [self expectationWithDescription:@"forced finish"];
    finished.expectedFulfillmentCount = 1;
    finished.assertForOverFulfill = YES;
    __block NSUInteger count = 0;
    XCTAssertTrue([manager upsertTimerWithIdentifier:@"test"
                                          timerType:JobsTimerTypeNSTimer
                                             policy:JobsTimerBackgroundPolicyIgnore
                                   startImmediately:NO
                                              build:nil
                                            handler:nil]);
    JobsTimer *oldTimer = manager.timerForIdentifier(@"test");
    [manager onFinish:@"test" block:^(JobsTimer *timer) {
        XCTAssertEqual(timer, oldTimer);
        count++;
        [finished fulfill];
    }];
    XCTAssertTrue(manager.fireOnceAndRemove(@"test"));
    XCTAssertFalse(manager.fireOnceAndRemove(@"test"));
    XCTAssertTrue([manager upsertTimerWithIdentifier:@"test"
                                          timerType:JobsTimerTypeNSTimer
                                             policy:JobsTimerBackgroundPolicyIgnore
                                   startImmediately:NO
                                              build:nil
                                            handler:nil]);
    [self waitForExpectations:@[finished] timeout:2];
    XCTAssertEqual(count, 1u);
    XCTAssertTrue(manager.exists(@"test"));
    XCTAssertNotEqual(manager.timerForIdentifier(@"test"), oldTimer);
    manager.stopAndRemoveAll();
}

- (void)testStartedManagerCanReleaseAndStopsRetainedTimer {
    __weak JobsTimerMgr *weakManager = nil;
    JobsTimer *timer = nil;
    @autoreleasepool {
        JobsTimerMgr *manager = JobsTimerMgr.new;
        weakManager = manager;
        XCTAssertTrue([manager upsertTimerWithIdentifier:@"release"
                                              timerType:JobsTimerTypeNSTimer
                                                 policy:JobsTimerBackgroundPolicyIgnore
                                       startImmediately:YES
                                                  build:nil
                                                handler:nil]);
        timer = manager.timerForIdentifier(@"release");
        XCTAssertTrue(timer.isRunning);
    }
    XCTAssertNil(weakManager);
    XCTAssertFalse(timer.isRunning);
    XCTAssertNil(timer.onFinish);
    XCTAssertNil(timer.onTick);
}

@end
