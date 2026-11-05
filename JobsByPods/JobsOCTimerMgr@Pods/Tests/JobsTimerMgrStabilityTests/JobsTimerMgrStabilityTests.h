//
//  JobsTimerMgrStabilityTests.h
//  JobsOCTimerMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsOCTimerMgr/JobsOCTimerMgr.h>

// 用途：声明自动化测试；验证计时器强制完成只投递一次、不误删替换任务，以及管理器释放后停止计时。
// 运行：在 Xcode 的 Pods 工程 JobsOCTimerMgr-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsTimerMgrStabilityTests : XCTestCase

@end
