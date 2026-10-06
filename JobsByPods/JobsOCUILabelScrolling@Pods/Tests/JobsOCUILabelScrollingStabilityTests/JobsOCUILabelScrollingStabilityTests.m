//
//  JobsOCUILabelScrollingStabilityTests.m
//  JobsOCUILabelScrolling
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCUILabelScrollingStabilityTests.h"

@implementation JobsOCUILabelScrollingStabilityTests

-(void)testNonfiniteScrollConfigurationNormalizes{
    JobsLabelScrollConfiguration *configuration = JobsLabelScrollConfiguration.continuousConfiguration();
    configuration.bySpeed(INFINITY).bySpacing(NAN).byStartDelay(INFINITY).byEdgePause(NAN);
    XCTAssertEqual(configuration.speed, 0);
    XCTAssertEqual(configuration.spacing, 0);
    XCTAssertEqual(configuration.startDelay, 0);
    XCTAssertEqual(configuration.edgePause, 0);
}

-(void)testVeryLargeFiniteSpeedDoesNotBlockMainRunLoop{
    UILabel *label = UILabel.new;
    label.byFrame(CGRectMake(0, 0, 30, 30));
    label.byText(@"足够长的连续滚动文字用于验证极大速度下的主线程响应");
    JobsLabelScrollConfiguration *configuration = JobsLabelScrollConfiguration.continuousConfiguration();
    configuration.bySpeed(1e100)
        .bySpacing(20)
        .byStartDelay(0)
        .byFramesPerSecond(120)
        .byTimerType(JobsTimerTypeGCD)
        .byRespectsReduceMotion(NO);
    label.byTextScroll(configuration);
    label.byStartTextScroll();
    XCTestExpectation *responsive = [self expectationWithDescription:@"极大速度使用取余而非重复减法"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 100 * NSEC_PER_MSEC), dispatch_get_main_queue(), ^{
        XCTAssertTrue(label.jobs_isTextScrolling());
        label.byStopTextScroll();
        XCTAssertFalse(label.jobs_isTextScrolling());
        [responsive fulfill];
    });
    [self waitForExpectations:@[responsive] timeout:2];
}

@end
