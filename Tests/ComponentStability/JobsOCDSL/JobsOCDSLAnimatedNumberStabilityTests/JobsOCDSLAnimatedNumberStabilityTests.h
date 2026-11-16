//
//  JobsOCDSLAnimatedNumberStabilityTests.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

// 用途：声明自动化测试；验证数字动画的重复停止、无效参数、旧任务取消和标签释放后的 DSL 安全。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsOCDSLAnimatedNumberStabilityTests : XCTestCase

@end
