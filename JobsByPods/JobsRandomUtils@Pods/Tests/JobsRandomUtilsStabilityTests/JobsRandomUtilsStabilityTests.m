//
//  JobsRandomUtilsStabilityTests.m
//  JobsRandomUtils
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsRandomUtilsStabilityTests.h"

@implementation JobsRandomUtilsStabilityTests

-(void)testSingleValuesAndReversedBounds{
    XCTAssertEqual(JobsRandomNumber(INT_MIN, INT_MIN), INT_MIN);
    XCTAssertEqual(JobsRandomXY(INT_MAX, INT_MAX), INT_MAX);
    XCTAssertEqual(JobsBaseRandomOffsetValueWithNoContainBorderValue(5, 5), 5);
    for (NSUInteger index = 0; index < 10000; index++) {
        int value = JobsRandomNumber(10, -10);
        XCTAssertGreaterThanOrEqual(value, -10);
        XCTAssertLessThanOrEqual(value, 10);
    }
}

-(void)testEntireSignedIntRangeAndAliases{
    for (NSUInteger index = 0; index < 10000; index++) {
        int open = JobsBaseRandomOffsetValueWithNoContainBorderValue(INT_MIN, INT_MAX);
        XCTAssertGreaterThanOrEqual(open, INT_MIN);
        XCTAssertLessThan(open, INT_MAX);
        int closed = JobsRandomNumber(INT_MIN, INT_MAX);
        XCTAssertGreaterThanOrEqual(closed, INT_MIN);
        XCTAssertLessThanOrEqual(closed, INT_MAX);
        XCTAssertLessThanOrEqual(JobsBaseRandomContainBorderValue(INT_MIN), 0);
        XCTAssertGreaterThan(JobsBaseRandomNoContainBorderValue(INT_MIN), INT_MIN);
        int legacy = random100_200();
        XCTAssertGreaterThanOrEqual(legacy, 100);
        XCTAssertLessThan(legacy, 200);
        int reversed = randomXY(INT_MAX, INT_MIN);
        XCTAssertGreaterThanOrEqual(reversed, INT_MIN);
        XCTAssertLessThanOrEqual(reversed, INT_MAX);
    }
}
@end
