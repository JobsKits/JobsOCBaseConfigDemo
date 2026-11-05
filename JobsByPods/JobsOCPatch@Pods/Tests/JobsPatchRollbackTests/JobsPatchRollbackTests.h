//
//  JobsPatchRollbackTests.h
//  JobsOCPatch
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSPATCHROLLBACKTESTS_H
#define JOBS_TEST_JOBSPATCHROLLBACKTESTS_H

#import <XCTest/XCTest.h>
#import <JobsOCPatch/JobsOCPatchMgr.h>

// 用途：声明自动化测试；验证运行时补丁回滚后的旧 IMP 可调用、ABI 拒绝、继承隔离与并发安装回滚。
// 运行：在 Xcode 的 Pods 工程 JobsOCPatch-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsPatchRollbackTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSPATCHROLLBACKTESTS_H */
