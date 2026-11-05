//
//  JobsStringUtilsStabilityTests.h
//  JobsStringUtils
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <limits.h>
#import <math.h>
#import <XCTest/XCTest.h>

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
#endif


// 用途：声明自动化测试；验证非法 UTF-8 的转换结果与数值转短字符串的输出约定。
// 运行：在 Xcode 的 Pods 工程 JobsStringUtils-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsStringUtilsStabilityTests : XCTestCase

@end
