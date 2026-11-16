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
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsOCSnowflakeStabilityTests : XCTestCase

@end
