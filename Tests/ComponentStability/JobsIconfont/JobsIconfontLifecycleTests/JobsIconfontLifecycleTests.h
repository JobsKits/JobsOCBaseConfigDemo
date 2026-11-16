//
//  JobsIconfontLifecycleTests.h
//  JobsIconfont
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSICONFONTLIFECYCLETESTS_H
#define JOBS_TEST_JOBSICONFONTLIFECYCLETESTS_H

#import <XCTest/XCTest.h>
#if __has_include(<JobsIconfont/JobsIconfont.h>)
#import <JobsIconfont/JobsIconfont.h>
#else
#import "JobsIconfont.h"
#endif

// 用途：声明自动化测试；验证图标加载取消只完成一次、释放后回调安全，以及替换请求忽略迟到图片。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsIconfontLifecycleTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSICONFONTLIFECYCLETESTS_H */
