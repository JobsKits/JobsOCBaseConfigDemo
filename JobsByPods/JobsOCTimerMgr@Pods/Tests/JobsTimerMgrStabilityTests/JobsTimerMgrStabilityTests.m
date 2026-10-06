//
//  JobsTimerMgrStabilityTests.m
//  JobsOCTimerMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsTimerMgrStabilityTests.h"

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
