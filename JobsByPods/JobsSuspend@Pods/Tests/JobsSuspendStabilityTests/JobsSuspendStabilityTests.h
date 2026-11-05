//
//  JobsSuspendStabilityTests.h
//  JobsSuspend
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsSuspend/JobsSuspend.h>

// 用途：声明自动化测试；验证悬浮控制器释放后，外部保存的弱引用正确归零。
// 运行：在 Xcode 的 Pods 工程 JobsSuspend-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsSuspendStabilityTests : XCTestCase

@end
