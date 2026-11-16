//
//  JobsCallbackLifecycleTests.h
//  JobsCallBackBlockDSL
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSCALLBACKLIFECYCLETESTS_H
#define JOBS_TEST_JOBSCALLBACKLIFECYCLETESTS_H

#import <XCTest/XCTest.h>
#if __has_include(<JobsCallBackBlockDSL/NSObject+CallBackInfoByBlock+DSL.h>)
#import <JobsCallBackBlockDSL/NSObject+CallBackInfoByBlock+DSL.h>
#else
#import "NSObject+CallBackInfoByBlock+DSL.h"
#endif

// 用途：声明自动化测试；验证回调存储与调用，以及宿主释放后已保存的回调设置块仍可安全执行。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsCallbackLifecycleTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSCALLBACKLIFECYCLETESTS_H */
