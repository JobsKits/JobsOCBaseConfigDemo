//
//  JobsOCNumberStepperStabilityTests.h
//  JobsOCNumberStepper
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsOCNumberStepper/JobsOCNumberStepper.h>

// 用途：声明自动化测试；验证步进器 DSL 链与显示同步，且数值始终处于配置范围。
// 运行：在 Xcode 的 Pods 工程 JobsOCNumberStepper-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCNumberStepperStabilityTests : XCTestCase

@end
