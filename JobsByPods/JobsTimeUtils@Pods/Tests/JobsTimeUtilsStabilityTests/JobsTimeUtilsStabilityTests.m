//
//  JobsTimeUtilsStabilityTests.m
//  JobsTimeUtils
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsTimeUtilsStabilityTests.h"

@implementation JobsTimeUtilsStabilityTests

-(void)testExplicitFormatAndZeroVersusInvalidInterval{
    NSObject *owner = [NSObject new];
    NSTimeInterval interval = -1;
    NSError *error = nil;
    XCTAssertTrue([owner jobsTimeIntervalFrom:@"2026/10/05 10:00" to:@"2026/10/05 10:02" format:@"yyyy/MM/dd HH:mm" interval:&interval error:&error]);
    XCTAssertEqualWithAccuracy(interval, 120, 0.001);
    XCTAssertTrue([owner jobsTimeIntervalFrom:@"2026/10/05" to:@"2026/10/05" format:@"yyyy/MM/dd" interval:&interval error:&error]);
    XCTAssertEqual(interval, 0);
    XCTAssertFalse([owner jobsTimeIntervalFrom:@"bad" to:nil format:@"yyyy/MM/dd" interval:&interval error:&error]);
    XCTAssertNotNil(error);
    XCTAssertEqualWithAccuracy([owner timeIntervalstartDate:@"2026/10/05 10:00" endDate:@"2026/10/05 10:02" timeFormatter:@"yyyy/MM/dd HH:mm"], 120, 0.001);
}

-(void)testTimestampUnitsAndInvalidFailClosed{
    XCTAssertTrue(@"1000000000".isExpired());
    XCTAssertTrue(@"1000000000000".isExpired());
    XCTAssertFalse(@"9999999999".isExpired());
    XCTAssertFalse(@"9999999999000".isExpired());
    XCTAssertTrue(@"not-a-time".isExpired());
    XCTAssertNil(@"999999999x".readableTimeByFormatter(nil));
}

@end
