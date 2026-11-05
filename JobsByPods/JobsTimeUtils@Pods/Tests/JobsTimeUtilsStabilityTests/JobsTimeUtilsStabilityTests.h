//
//  JobsTimeUtilsStabilityTests.h
//  JobsTimeUtils
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <limits.h>
#import <math.h>
#import <XCTest/XCTest.h>

#if __has_include(<JobsTimeUtils/JobsTimeUtils.h>)
#import <JobsTimeUtils/JobsTimeUtils.h>
#else
#import "JobsTimeUtils.h"
#endif


// 用途：声明自动化测试；验证显式日期格式、零时间与无效输入的区别，以及时间戳单位和非法值拒绝。
// 运行：在 Xcode 的 Pods 工程 JobsTimeUtils-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsTimeUtilsStabilityTests : XCTestCase

@end
