//
//  JobsTimeUtilsStabilityTests.m
//  JobsTimeUtils
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsTimeUtilsStabilityTests.h"

// 用途：实现自动化测试；验证显式日期格式、零时间与无效输入的区别，以及时间戳单位和非法值拒绝。
// 运行：在 Xcode 的 Pods 工程 JobsTimeUtils-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

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
