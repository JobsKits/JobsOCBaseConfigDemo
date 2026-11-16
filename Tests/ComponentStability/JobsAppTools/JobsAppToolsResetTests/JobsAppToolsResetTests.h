//
//  JobsAppToolsResetTests.h
//  JobsAppTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSAPPTOOLSRESETTESTS_H
#define JOBS_TEST_JOBSAPPTOOLSRESETTESTS_H

#import <XCTest/XCTest.h>
#if __has_include(<JobsAppTools/JobsAppTools.h>)
#import <JobsAppTools/JobsAppTools.h>
#else
#import "JobsAppTools.h"
#endif

// 用途：声明自动化测试；验证单例的并发读取和销毁重建，确保仍被持有的旧代对象有效。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsAppToolsResetTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSAPPTOOLSRESETTESTS_H */
