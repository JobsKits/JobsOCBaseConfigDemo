//
//  JobsOCSnowflakeStabilityTests.h
//  JobsOCSnowflake
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <stdlib.h>
#import <XCTest/XCTest.h>

#if __has_include(<JobsOCSnowflake/JobsOCSnowflakeHeader.h>)
#import <JobsOCSnowflake/JobsOCSnowflakeHeader.h>
#else
#import "JobsOCSnowflakeHeader.h"
#endif

// 用途：声明自动化测试；验证雪花 ID 序列耗尽、时钟回退、节点和时间边界，以及并发唯一性。
// 运行：在 Xcode 的 Pods 工程 JobsOCSnowflake-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCSnowflakeStabilityTests : XCTestCase

@end
