//
//  JobsDebugJSONTests.h
//  JobsDebug
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSDEBUGJSONTESTS_H
#define JOBS_TEST_JOBSDEBUGJSONTESTS_H

#import <XCTest/XCTest.h>
#import <JobsDebug/DebugLogDescription.h>

// 用途：声明自动化测试；验证 JSON 排序输出、无效容器兜底，以及容器释放后已保存的格式化块。
// 运行：在 Xcode 的 Pods 工程 JobsDebug-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsDebugJSONTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSDEBUGJSONTESTS_H */
