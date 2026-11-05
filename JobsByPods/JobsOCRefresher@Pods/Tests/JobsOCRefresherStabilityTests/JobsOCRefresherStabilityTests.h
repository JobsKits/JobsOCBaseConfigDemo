//
//  JobsOCRefresherStabilityTests.h
//  JobsOCRefresher
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsOCRefresher/JobsOCRefresher.h>

// 用途：声明自动化测试；验证单个刷新槽位、移除和替换时的 inset 归还，以及失败和无更多数据收尾。
// 运行：在 Xcode 的 Pods 工程 JobsOCRefresher-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCRefresherStabilityTests : XCTestCase

@end
