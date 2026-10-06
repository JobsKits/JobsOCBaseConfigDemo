//
//  JobsStringUtilsStabilityTests.m
//  JobsStringUtils
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsStringUtilsStabilityTests.h"

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
