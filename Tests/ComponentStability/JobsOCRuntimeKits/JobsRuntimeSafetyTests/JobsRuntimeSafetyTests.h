//
//  JobsRuntimeSafetyTests.h
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSRUNTIMESAFETYTESTS_H
#define JOBS_TEST_JOBSRUNTIMESAFETYTESTS_H

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCRuntimeKits/NSObject+DynamicInvoke.h>)
#import <JobsOCRuntimeKits/NSObject+DynamicInvoke.h>
#else
#import "NSObject+DynamicInvoke.h"
#endif
#if __has_include(<JobsOCRuntimeKits/JobsWeakAssociation.h>)
#import <JobsOCRuntimeKits/JobsWeakAssociation.h>
#else
#import "JobsWeakAssociation.h"
#endif

// 用途：声明自动化测试；验证动态调用的标量和结构体 ABI、非法调用拒绝、一次执行隔离及弱关联释放。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsRuntimeSafetyTests : XCTestCase 

@property(nonatomic,assign)NSUInteger fixtureCount;

@end

#endif /* JOBS_TEST_JOBSRUNTIMESAFETYTESTS_H */
