//
//  JobsOCDeviceGuardTests.h
//  JobsOCDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import <XCTest/XCTest.h>
#import <TargetConditionals.h>
#import <JobsOCDeviceGuard/JobsOCDeviceGuard.h>

// 用途：声明自动化测试；验证设备风险证据按类别去重、阈值与不支持状态判定，以及异步主线程单次回调。
// 运行：在 Xcode 的 Pods 工程 JobsOCDeviceGuard-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCDeviceGuardTests : XCTestCase

@end
