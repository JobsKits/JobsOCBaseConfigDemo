//
//  JobsOCBaseConfigDemoUITests.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOUITESTS_0CF5BC28FA
#define JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOUITESTS_0CF5BC28FA

#import <XCTest/XCTest.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

// 用途：声明 App 启动与启动性能的 XCTest UI 测试，具体操作在同名实现文件。
// 运行：选用包含 JobsOCBaseConfigDemoUITests 的测试 Scheme；当前共享 Scheme 尚未登记测试。
// 边界：供独立 UI 测试进程使用，不属于主 App 的业务接口。

@interface JobsOCBaseConfigDemoUITests : XCTestCase

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCBaseConfigDemoUITests
-(JobsRetJobsOCBaseConfigDemoUITestsByBOOLBlock _Nonnull)byContinueAfterFailure;
-(void)setContinueAfterFailure:(BOOL)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCBaseConfigDemoUITests

@end

#endif /* JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOUITESTS_0CF5BC28FA */
