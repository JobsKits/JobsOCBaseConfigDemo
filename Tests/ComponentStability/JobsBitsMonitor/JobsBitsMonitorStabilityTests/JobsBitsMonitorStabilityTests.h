//
//  JobsBitsMonitorStabilityTests.h
//  JobsBitsMonitor
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSBITSMONITORSTABILITYTESTS_H
#define JOBS_TEST_JOBSBITSMONITORSTABILITYTESTS_H

#import <XCTest/XCTest.h>
#if __has_include(<JobsBitsMonitor/JobsBitsMonitor.h>)
#import <JobsBitsMonitor/JobsBitsMonitor.h>
#else
#import "JobsBitsMonitor.h"
#endif

// 用途：声明自动化测试；验证多个流量标签独立更新，以及标签随控制器释放时的订阅回收。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsBitsMonitorStabilityTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSBITSMONITORSTABILITYTESTS_H */
