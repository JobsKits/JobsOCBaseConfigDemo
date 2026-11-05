//
//  JobsOCUILabelScrollingStabilityTests.h
//  JobsOCUILabelScrolling
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsOCUILabelScrolling/JobsOCUILabelScrolling.h>

// 用途：声明自动化测试；验证滚动标签规整非有限参数，并确保极大有效速度不阻塞主 RunLoop。
// 运行：在 Xcode 的 Pods 工程 JobsOCUILabelScrolling-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCUILabelScrollingStabilityTests : XCTestCase

@end
