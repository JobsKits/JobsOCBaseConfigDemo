//
//  JobsMarqueeViewStabilityTests.h
//  JobsMarqueeView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsMarqueeView/JobsMarqueeView.h>

// 用途：声明自动化测试；验证尚未启动的跑马灯视图能够释放，析构期间不重新注册弱引用。
// 运行：在 Xcode 的 Pods 工程 JobsMarqueeView-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsMarqueeViewStabilityTests : XCTestCase

@end
