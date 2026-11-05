//
//  JobsOCBaseConfigDemoUITestsLaunchTests.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOUITESTSLAUNCHTESTS_A9C35C620F
#define JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOUITESTSLAUNCHTESTS_A9C35C620F

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

// 用途：声明逐 UI 配置启动 App 并保留启动截图的 XCTest 测试。
// 运行：选用包含 JobsOCBaseConfigDemoUITests 的测试 Scheme；当前共享 Scheme 尚未登记测试。
// 边界：供独立 UI 测试进程使用，截图仅作测试附件，不是 App 运行资源。

@interface JobsOCBaseConfigDemoUITestsLaunchTests : XCTestCase

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCBaseConfigDemoUITestsLaunchTests
-(JobsRetJobsOCBaseConfigDemoUITestsLaunchTestsByBOOLBlock _Nonnull)byContinueAfterFailure;
-(void)setContinueAfterFailure:(BOOL)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCBaseConfigDemoUITestsLaunchTests

@end

#endif /* JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOUITESTSLAUNCHTESTS_A9C35C620F */
