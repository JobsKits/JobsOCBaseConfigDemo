//
//  JobsClockViewStabilityTests.h
//  JobsClockView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsClockView/JobsClockViewHeader.h>

// 用途：声明自动化测试；验证时钟按需创建计时器、释放时停止计时，旧启动块不能复活已释放对象。
// 运行：在 Xcode 的 Pods 工程 JobsClockView-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsClockViewStabilityTests : XCTestCase

@end
