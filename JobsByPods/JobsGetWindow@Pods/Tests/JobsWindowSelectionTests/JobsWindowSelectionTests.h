//
//  JobsWindowSelectionTests.h
//  JobsGetWindow
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSWINDOWSELECTIONTESTS_H
#define JOBS_TEST_JOBSWINDOWSELECTIONTESTS_H

#import <XCTest/XCTest.h>
#import <JobsGetWindow/window.h>
#import "JobsWindowFixture.h"
#import "JobsWindowSceneFixture.h"

// 用途：声明自动化测试；验证前台 Scene 和 keyWindow 的选择、指定上下文优先级及后台线程调用边界。
// 运行：在 Xcode 的 Pods 工程 JobsGetWindow-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsWindowSelectionTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSWINDOWSELECTIONTESTS_H */
