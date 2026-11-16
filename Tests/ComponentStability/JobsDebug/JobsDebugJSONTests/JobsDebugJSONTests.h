//
//  JobsDebugJSONTests.h
//  JobsDebug
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSDEBUGJSONTESTS_H
#define JOBS_TEST_JOBSDEBUGJSONTESTS_H

#import <XCTest/XCTest.h>
#if __has_include(<JobsDebug/DebugLogDescription.h>)
#import <JobsDebug/DebugLogDescription.h>
#else
#import "DebugLogDescription.h"
#endif

// 用途：声明自动化测试；验证 JSON 排序输出、无效容器兜底，以及容器释放后已保存的格式化块。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsDebugJSONTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSDEBUGJSONTESTS_H */
