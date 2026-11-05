//
//  JobsClassLifecycleTests.h
//  JobsClass
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSCLASSLIFECYCLETESTS_H
#define JOBS_TEST_JOBSCLASSLIFECYCLETESTS_H

#import <XCTest/XCTest.h>
#import <JobsClass/NSObject+Class.h>

// 用途：声明自动化测试；验证对象释放后已保存的属性读取块安全返回，不继续访问已销毁宿主。
// 运行：在 Xcode 的 Pods 工程 JobsClass-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsClassLifecycleTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSCLASSLIFECYCLETESTS_H */
