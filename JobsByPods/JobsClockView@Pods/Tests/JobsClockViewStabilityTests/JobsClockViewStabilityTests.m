//
//  JobsClockViewStabilityTests.m
//  JobsClockView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsClockViewStabilityTests.h"

@implementation JobsClockViewStabilityTests

-(void)testUnstartedClockReleasesWithoutCreatingTimer{
    __weak JobsClockView *weakClock = nil;
    @autoreleasepool {
        JobsClockView *clock = JobsClockView.new;
        weakClock = clock;
        XCTAssertNil([clock valueForKey:@"timer"]);
    }
    XCTAssertNil(weakClock);
}

-(void)testRunningClockReleaseStopsAlreadyCreatedTimer{
    __weak JobsClockView *weakClock = nil;
    JobsTimer *timer = nil;
    __block NSUInteger ticks = 0;
    __block BOOL ownerReleased = NO;
    XCTestExpectation *firstTick = [self expectationWithDescription:@"真实 GCD tick 已投递"];
    XCTestExpectation *unexpectedTick = [self expectationWithDescription:@"时钟释放后不再投递 tick"];
    unexpectedTick.inverted = YES;
    // DSL 返回 self 的临时值必须先排空，才能断言外部强引用释放后的终态。
    @autoreleasepool {
        JobsClockView *clock = JobsClockView.new;
        weakClock = clock;
        clock.start();
        timer = [clock valueForKey:@"timer"];
        XCTAssertNotNil(timer);
        timer.byTimeInterval(0.01);
        jobsByCGFloatBlock clockTick = timer.onTick;
        XCTAssertNotNil(clockTick);
        timer.byOnTick(^(CGFloat time) {
            if (clockTick) {
                clockTick(time);
            }
            ++ticks;
            if (ownerReleased) {
                [unexpectedTick fulfill];
            } else if (ticks == 1) {
                [firstTick fulfill];
            }
        });
        [self waitForExpectations:@[firstTick] timeout:5];
        XCTAssertNotNil([timer valueForKey:@"gcdTimer"]);
        XCTAssertGreaterThan(ticks, 0);
        ownerReleased = YES;
        clock = nil;
    }
    XCTAssertNil(weakClock);
    XCTAssertEqual(timer.timerState, JobsTimerStateCanceled);
    XCTAssertNil([timer valueForKey:@"gcdTimer"]);
    NSUInteger stoppedTicks = ticks;
    [self waitForExpectations:@[unexpectedTick] timeout:0.2];
    XCTAssertEqual(ticks, stoppedTicks);
    XCTAssertEqual(timer.timerState, JobsTimerStateCanceled);
}

-(void)testSavedAndQueuedStartCannotReviveReleasedClock{
    __weak JobsClockView *weakClock = nil;
    jobsByVoidBlock start;
    jobsByVoidBlock stop;
    jobsByNSUIntegerBlock startByType;
    JobsTimer *timer;
    @autoreleasepool {
        JobsClockView *clock = JobsClockView.new;
        weakClock = clock;
        start = clock.start;
        stop = clock.jobsStop;
        startByType = clock.startByTimerType;
        start();
        timer = [clock valueForKey:@"timer"];
    }
    XCTAssertNil(weakClock);
    XCTAssertNotNil(timer);
    XCTAssertEqual(timer.timerState, JobsTimerStateCanceled);
    start();
    startByType(JobsTimerTypeGCD);
    startByType(JobsTimerTypeNSTimer);
    stop();
    XCTestExpectation *settled = [self expectationWithDescription:@"已排队的 engine start 不复活"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 100 * NSEC_PER_MSEC), dispatch_get_main_queue(), ^{
        XCTAssertNil(weakClock);
        XCTAssertEqual(timer.timerState, JobsTimerStateCanceled);
        XCTAssertNil([timer valueForKey:@"gcdTimer"]);
        [settled fulfill];
    });
    [self waitForExpectations:@[settled] timeout:3];
}

@end
