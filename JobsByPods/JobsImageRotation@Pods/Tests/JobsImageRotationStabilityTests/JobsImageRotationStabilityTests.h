//
//  JobsImageRotationStabilityTests.h
//  JobsImageRotation
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsImageRotation/JobsImageRotation.h>

// 用途：声明自动化测试；验证缺失旋转目标时的启动与复位安全，以及运行中的旋转器不强留宿主。
// 运行：在 Xcode 的 Pods 工程 JobsImageRotation-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsImageRotationStabilityTests : XCTestCase

@end
