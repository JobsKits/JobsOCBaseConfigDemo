//
//  JobsWindowSelectionTests.h
//  JobsGetWindow
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSWINDOWSELECTIONTESTS_H
#define JOBS_TEST_JOBSWINDOWSELECTIONTESTS_H

#import <XCTest/XCTest.h>
#if __has_include(<JobsGetWindow/window.h>)
#import <JobsGetWindow/window.h>
#else
#import "window.h"
#endif
#import "JobsWindowFixture.h"
#import "JobsWindowSceneFixture.h"

// 用途：声明自动化测试；验证前台 Scene 和 keyWindow 的选择、指定上下文优先级及后台线程调用边界。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsWindowSelectionTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSWINDOWSELECTIONTESTS_H */
