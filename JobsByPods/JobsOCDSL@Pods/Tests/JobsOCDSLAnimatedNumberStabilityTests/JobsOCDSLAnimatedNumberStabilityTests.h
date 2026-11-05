//
//  JobsOCDSLAnimatedNumberStabilityTests.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsOCDSL/JobsOCDSL.h>

// 用途：声明自动化测试；验证数字动画的重复停止、无效参数、旧任务取消和标签释放后的 DSL 安全。
// 运行：在 Xcode 的 Pods 工程 JobsOCDSL-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCDSLAnimatedNumberStabilityTests : XCTestCase

@end
