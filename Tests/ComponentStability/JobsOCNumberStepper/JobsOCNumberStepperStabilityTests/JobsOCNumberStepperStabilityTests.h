//
//  JobsOCNumberStepperStabilityTests.h
//  JobsOCNumberStepper
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCNumberStepper/JobsOCNumberStepper.h>)
#import <JobsOCNumberStepper/JobsOCNumberStepper.h>
#else
#import "JobsOCNumberStepper.h"
#endif

// 用途：声明自动化测试；验证步进器 DSL 链与显示同步，且数值始终处于配置范围。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsOCNumberStepperStabilityTests : XCTestCase

@end
