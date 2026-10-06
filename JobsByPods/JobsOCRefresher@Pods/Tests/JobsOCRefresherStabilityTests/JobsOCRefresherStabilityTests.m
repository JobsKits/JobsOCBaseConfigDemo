//
//  JobsOCRefresherStabilityTests.m
//  JobsOCRefresher
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCRefresherStabilityTests.h"

@implementation JobsOCRefresherStabilityTests

-(void)testRefreshWithOnlyOneSlotAndRepeatedRemoval{
    UIScrollView *scroll = UIScrollView.new;
    scroll.byFrame(CGRectMake(0, 0, 320, 480));
    scroll.jobs_enableRefreshHaptics(NO);
    scroll.byContentOffset(CGPointMake(0, -20));
    scroll.jobs_removeRefreshAt(JobsOCRefreshPositionRight);
    [scroll jobs_byRefreshHeaderWithConfig:nil action:^{}];
    scroll.byContentOffset(CGPointMake(0, -30));
    scroll.jobs_removeRefreshAt(JobsOCRefreshPositionHeader);
    scroll.jobs_removeRefreshAt(JobsOCRefreshPositionHeader);
    for (UIView *view in scroll.subviews) {
        XCTAssertFalse([view isKindOfClass:JobsOCRefreshComponent.class]);
    }
}


-(void)testRefreshRemovalAndReplacementRestoreOnlyOwnInset{
    UIScrollView *scroll = UIScrollView.new;
    scroll.byFrame(CGRectMake(0, 0, 320, 480));
    UIEdgeInsets initial = UIEdgeInsetsMake(-3, 8, 12, 5);
    scroll.byContentInset(initial);
    JobsOCRefreshConfig *config = jobsMakeOCRefreshConfig(^(__kindof JobsOCRefreshConfig *value) {
        value.byViewLength(60).byEnablesHaptics(NO);
    });
    [scroll jobs_byRefreshHeaderWithConfig:config action:^{}];
    [scroll jobs_switchRefreshAt:JobsOCRefreshPositionHeader toState:JobsOCRefreshStateRefreshing];
    XCTAssertEqualWithAccuracy(scroll.contentInset.top, initial.top + 60, 0.01);
    UIEdgeInsets hostChanged = scroll.contentInset;
    hostChanged.bottom += 17;
    scroll.byContentInset(hostChanged);
    [scroll jobs_byRefreshHeaderWithConfig:config action:^{}];
    XCTAssertEqualWithAccuracy(scroll.contentInset.top, initial.top, 0.01);
    XCTAssertEqualWithAccuracy(scroll.contentInset.bottom, initial.bottom + 17, 0.01);
    [scroll jobs_switchRefreshAt:JobsOCRefreshPositionHeader toState:JobsOCRefreshStateRefreshing];
    scroll.jobs_removeRefreshAt(JobsOCRefreshPositionHeader);
    XCTAssertEqualWithAccuracy(scroll.contentInset.top, initial.top, 0.01);
}


-(void)testRefreshFailureAndNoMoreDataDrainContribution{
    UIScrollView *scroll = UIScrollView.new;
    scroll.byFrame(CGRectMake(0, 0, 320, 480));
    [scroll jobs_byRefreshFooterWithConfig:nil action:^{}];
    [scroll jobs_switchRefreshAt:JobsOCRefreshPositionFooter toState:JobsOCRefreshStateRefreshing];
    [scroll jobs_switchRefreshAt:JobsOCRefreshPositionFooter toState:JobsOCRefreshStateNoMoreData];
    XCTAssertEqualWithAccuracy(scroll.contentInset.bottom, 0, 0.01);
    [scroll jobs_byRefreshHeaderWithConfig:nil action:^{}];
    [scroll jobs_switchRefreshAt:JobsOCRefreshPositionHeader toState:JobsOCRefreshStateRefreshing];
    [scroll jobs_switchRefreshAt:JobsOCRefreshPositionHeader toState:JobsOCRefreshStateFailed];
    XCTAssertEqualWithAccuracy(scroll.contentInset.top, 0, 0.01);
    [scroll jobs_switchRefreshAt:JobsOCRefreshPositionHeader toState:JobsOCRefreshStateIdle];
    [scroll jobs_switchRefreshAt:JobsOCRefreshPositionHeader toState:JobsOCRefreshStateRefreshing];
    XCTestExpectation *settled = [self expectationWithDescription:@"旧 ending completion 不覆盖新 refreshing"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 400 * NSEC_PER_MSEC), dispatch_get_main_queue(), ^{
        BOOL foundHeader = NO;
        for (UIView *view in scroll.subviews) {
            if ([view isKindOfClass:JobsOCRefreshComponent.class] && ((JobsOCRefreshComponent *)view).position == JobsOCRefreshPositionHeader) {
                foundHeader = YES;
                XCTAssertEqual(((JobsOCRefreshComponent *)view).state, JobsOCRefreshStateRefreshing);
            }
        }
        XCTAssertTrue(foundHeader);
        scroll.jobs_removeRefreshAt(JobsOCRefreshPositionHeader);
        XCTAssertEqualWithAccuracy(scroll.contentInset.top, 0, 0.01);
        [settled fulfill];
    });
    [self waitForExpectations:@[settled] timeout:2];
}


@end
