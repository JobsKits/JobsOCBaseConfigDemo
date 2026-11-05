//
//  JobsRandomUtilsStabilityTests.h
//  JobsRandomUtils
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <limits.h>
#import <XCTest/XCTest.h>

#if __has_include(<JobsRandomUtils/JobsRandomUtilsHeader.h>)
#import <JobsRandomUtils/JobsRandomUtilsHeader.h>
#else
#import "JobsRandomUtilsHeader.h"
#endif

// 用途：声明自动化测试；验证随机整数的单值、逆序边界、完整有符号整数范围及兼容别名。
// 运行：在 Xcode 的 Pods 工程 JobsRandomUtils-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsRandomUtilsStabilityTests : XCTestCase

@end
