//
//  JobsImageNumberViewStabilityTests.h
//  JobsImageNumberView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsImageNumberView/JobsImageNumberViewHeader.h>

// 用途：声明自动化测试；验证图片数字视图释放后，已保存的模型配置块不访问失效宿主。
// 运行：在 Xcode 的 Pods 工程 JobsImageNumberView-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsImageNumberViewStabilityTests : XCTestCase

@end
