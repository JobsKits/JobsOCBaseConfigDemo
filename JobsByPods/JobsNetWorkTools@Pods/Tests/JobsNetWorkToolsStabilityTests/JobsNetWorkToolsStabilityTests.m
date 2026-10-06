//
//  JobsNetWorkToolsStabilityTests.m
//  JobsNetWorkTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsNetWorkToolsStabilityTests.h"

@implementation JobsNetWorkToolsStabilityTests

-(void)testInstancesOwnBaselinesAndRestartValidatesInterval{
    JobsNetworkTrafficMonitor *first = [JobsNetworkTrafficMonitor new];
    JobsNetworkTrafficMonitor *second = [JobsNetworkTrafficMonitor new];
    first.byStartWithInterval(NAN);
    second.byStartWithInterval(0.5);
    XCTAssertEqualWithAccuracy(first.timeInterval, 1, 0.0001);
    XCTAssertEqualWithAccuracy(second.timeInterval, 0.5, 0.0001);
    XCTAssertNotEqual(first.timer, second.timer);
    first.byStop();
    XCTAssertEqual([[first valueForKey:@"lastSampleTime"] doubleValue], 0);
    XCTAssertGreaterThan([[second valueForKey:@"lastSampleTime"] doubleValue], 0);
    second.byStop();
}

-(void)testInvalidIntervalsAndRestartReplaceTheActualTimer {
    void (^scenario)(void) = ^{
        JobsNetworkTrafficMonitor *monitor = JobsNetworkTrafficMonitor.new;
        @try {
            NSArray<NSNumber *> *invalidIntervals = @[@0, @(-2), @(NAN), @(INFINITY)];
            for (NSNumber *interval in invalidIntervals) {
                monitor.byStartWithInterval(interval.doubleValue);
                XCTAssertEqualWithAccuracy(monitor.timeInterval, 1, 0.0001);
                XCTAssertEqualWithAccuracy(monitor.timer.timeInterval, 1, 0.0001);
            }
            monitor.byStartWithInterval(2.5);
            JobsTimer *previousTimer = monitor.timer;
            NSTimer *previousNativeTimer = previousTimer.nsTimer;
            XCTAssertTrue(previousNativeTimer.isValid);
            XCTAssertEqualWithAccuracy(previousTimer.timeInterval, 2.5, 0.0001);
            monitor.byStartWithInterval(0.25);
            XCTAssertNotEqual(previousTimer, monitor.timer);
            XCTAssertEqual(previousTimer.timerState, JobsTimerStateCanceled);
            XCTAssertFalse(previousNativeTimer.isValid);
            XCTAssertFalse(previousTimer.isRunning);
            XCTAssertEqualWithAccuracy(monitor.timeInterval, 0.25, 0.0001);
            XCTAssertEqualWithAccuracy(monitor.timer.timeInterval, 0.25, 0.0001);
            XCTAssertGreaterThan([[monitor valueForKey:@"lastSampleTime"] doubleValue], 0);
            monitor.byStop();
            XCTAssertEqual([[monitor valueForKey:@"lastSampleTime"] doubleValue], 0);
        }@finally {
            monitor.byStop();
        }
    };
    if (NSThread.isMainThread) {
        scenario();
    }else {
        dispatch_sync(dispatch_get_main_queue(), scenario);
    }
}

-(void)testTwoPublicSubscriptionsKeepTheRemainingSamplerRunning {
    void (^onMain)(dispatch_block_t) = ^(dispatch_block_t action) {
        if (NSThread.isMainThread) {
            action();
        }else {
            dispatch_sync(dispatch_get_main_queue(), action);
        }
    };
    XCTestExpectation *firstUpdate = [self expectationWithDescription:@"first independent callback"];
    XCTestExpectation *secondUpdate = [self expectationWithDescription:@"second independent callback"];
    XCTestExpectation *secondAfterRemoval = [self expectationWithDescription:@"second callback after first stops"];
    __block JobsNetworkTrafficMonitor *first = nil;
    __block JobsNetworkTrafficMonitor *second = nil;
    __block JobsTimer *firstTimer = nil;
    __block NSTimer *firstNativeTimer = nil;
    __block jobsByCGFloatBlock lateFirstTick = nil;
    __block __weak JobsNetworkTrafficMonitor *weakFirst = nil;
    __block NSUInteger firstTicks = 0;
    __block NSUInteger secondTicks = 0;
    __block BOOL waitingForRemaining = NO;
    __block BOOL remainingFulfilled = NO;
    @try {
        onMain(^{
            @autoreleasepool {
                first = JobsNetworkTrafficMonitor.new;
                second = JobsNetworkTrafficMonitor.new;
                weakFirst = first;
                first.onUpdateBy(^(JobsNetworkSource *source, uint64_t upload, uint64_t download) {
                    XCTAssertTrue(NSThread.isMainThread);
                    XCTAssertEqual(source.type, JobsNetworkSourceTypeUnknown);
                    XCTAssertEqualObjects(source.displayName, @"设备总流量");
                    firstTicks += 1;
                    if (firstTicks == 1) {
                        [firstUpdate fulfill];
                    }
                });
                second.onUpdateBy(^(JobsNetworkSource *source, uint64_t upload, uint64_t download) {
                    XCTAssertTrue(NSThread.isMainThread);
                    secondTicks += 1;
                    if (secondTicks == 1) {
                        [secondUpdate fulfill];
                    }
                    if (waitingForRemaining && !remainingFulfilled) {
                        remainingFulfilled = YES;
                        [secondAfterRemoval fulfill];
                    }
                });
                first.byStartWithInterval(0.1);
                second.byStartWithInterval(0.1);
                firstTimer = first.timer;
                firstNativeTimer = firstTimer.nsTimer;
                XCTAssertTrue(firstNativeTimer.isValid);
                lateFirstTick = firstTimer.onTick;
                XCTAssertNotEqual(firstTimer, second.timer);
                XCTAssertNotNil(lateFirstTick);
            }
        });
        XCTWaiterResult initialResult = [XCTWaiter waitForExpectations:@[firstUpdate, secondUpdate] timeout:5];
        XCTAssertEqual(initialResult, XCTWaiterResultCompleted);
        __block NSUInteger stoppedFirstTicks = 0;
        __block NSUInteger beforeRemainingTicks = 0;
        onMain(^{
            @autoreleasepool {
                first.byStop();
                first = nil;
            }
            XCTAssertNil(weakFirst);
            XCTAssertEqual(firstTimer.timerState, JobsTimerStateCanceled);
            XCTAssertFalse(firstNativeTimer.isValid);
            XCTAssertFalse(firstTimer.isRunning);
            stoppedFirstTicks = firstTicks;
            beforeRemainingTicks = secondTicks;
            waitingForRemaining = YES;
            if (lateFirstTick) {
                XCTAssertNoThrow(lateFirstTick(999));
            }
            XCTAssertEqual(firstTicks, stoppedFirstTicks);
            XCTAssertTrue(second.timer.isRunning);
        });
        XCTAssertEqual([XCTWaiter waitForExpectations:@[secondAfterRemoval] timeout:5], XCTWaiterResultCompleted);
        onMain(^{
            XCTAssertEqual(firstTicks, stoppedFirstTicks);
            XCTAssertGreaterThan(secondTicks, beforeRemainingTicks);
            XCTAssertTrue(second.timer.isRunning);
        });
    }@finally {
        onMain(^{
            if (first) {
                first.byStop();
            }
            if (second) {
                second.byStop();
            }
        });
    }
}

@end
