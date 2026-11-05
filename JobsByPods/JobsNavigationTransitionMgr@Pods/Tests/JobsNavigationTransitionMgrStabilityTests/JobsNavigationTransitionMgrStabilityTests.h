//
//  JobsNavigationTransitionMgrStabilityTests.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsNavigationTransitionMgr/JobsNavigationTransitionMgrHeader.h>

// 用途：声明自动化测试；验证导航手势按容器隔离、重复挂载去重、取消转场恢复位置及控制器释放。
// 运行：在 Xcode 的 Pods 工程 JobsNavigationTransitionMgr-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsNavigationTransitionMgrStabilityTests : XCTestCase

@end
