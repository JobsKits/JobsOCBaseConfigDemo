//
//  JobsOCRefresherStabilityTests.h
//  JobsOCRefresher
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCRefresher/JobsOCRefresher.h>)
#import <JobsOCRefresher/JobsOCRefresher.h>
#else
#import "JobsOCRefresher.h"
#endif

// 用途：声明自动化测试；验证单个刷新槽位、移除和替换时的 inset 归还，以及失败和无更多数据收尾。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsOCRefresherStabilityTests : XCTestCase

@end
