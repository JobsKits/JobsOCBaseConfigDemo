//
//  JobsBitsMonitorStabilityTests.h
//  JobsBitsMonitor
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSBITSMONITORSTABILITYTESTS_H
#define JOBS_TEST_JOBSBITSMONITORSTABILITYTESTS_H

#import <XCTest/XCTest.h>
#import <JobsBitsMonitor/JobsBitsMonitor.h>

// 用途：声明自动化测试；验证多个流量标签独立更新，以及标签随控制器释放时的订阅回收。
// 运行：在 Xcode 的 Pods 工程 JobsBitsMonitor-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsBitsMonitorStabilityTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSBITSMONITORSTABILITYTESTS_H */
