//
//  JobsStringUtilsStabilityTests.m
//  JobsStringUtils
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsStringUtilsStabilityTests.h"

// 用途：实现自动化测试；验证非法 UTF-8 的转换结果与数值转短字符串的输出约定。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@implementation JobsStringUtilsStabilityTests

-(void)testInvalidUTF8AndNumericShortContract{
    const char invalid[] = {(char)0xff, 0};
    XCTAssertEqualObjects(StringWithUTF8String(invalid), @"");
    XCTAssertEqualObjects(StringWithUTF8String(NULL), @"");
    XCTAssertEqualObjects(toStringByShort(SHRT_MIN), @"-32768");
    XCTAssertEqualObjects(toStringByUnsignedShort(USHRT_MAX), @"65535");
    XCTAssertEqualObjects(toStringByChar('A'), @"A");
}

@end
