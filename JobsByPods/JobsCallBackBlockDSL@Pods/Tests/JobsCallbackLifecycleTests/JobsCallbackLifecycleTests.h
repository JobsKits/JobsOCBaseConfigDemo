//
//  JobsCallbackLifecycleTests.h
//  JobsCallBackBlockDSL
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSCALLBACKLIFECYCLETESTS_H
#define JOBS_TEST_JOBSCALLBACKLIFECYCLETESTS_H

#import <XCTest/XCTest.h>
#import <JobsCallBackBlockDSL/NSObject+CallBackInfoByBlock+DSL.h>

// 用途：声明自动化测试；验证回调存储与调用，以及宿主释放后已保存的回调设置块仍可安全执行。
// 运行：在 Xcode 的 Pods 工程 JobsCallBackBlockDSL-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsCallbackLifecycleTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSCALLBACKLIFECYCLETESTS_H */
