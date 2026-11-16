//
//  JobsOCDeviceGuardLaunchTests.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import <XCTest/XCTest.h>
#import "JobsOCDeviceGuardLaunchGate.h"
#import "JobsOCSceneCoordinator.h"

// 用途：声明自动化测试；验证启动门禁策略冻结、默认越狱阻断、拦截页面及真实 Scene 与冻结判定一致。
// 运行：在 Xcode 的 JobsOCBaseConfigDemoTests 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCDeviceGuardLaunchTests : XCTestCase

@end
