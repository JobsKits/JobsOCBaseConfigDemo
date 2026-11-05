//
//  JobsProgressBarStabilityTests.h
//  JobsProgressBar
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsProgressBar/JobsProgressBarHeader.h>

// 用途：声明自动化测试；验证运行中的进度动画不强留视图、非有限输入规整及未启动对象释放。
// 运行：在 Xcode 的 Pods 工程 JobsProgressBar-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsProgressBarStabilityTests : XCTestCase

@end
