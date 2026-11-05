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

// 用途：声明自动化测试；按目标 UI 配置启动 App，并保留启动界面截图附件。
// 运行：在 Xcode 的 JobsOCBaseConfigDemoUITests 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCBaseConfigDemoUITestsLaunchTests : XCTestCase

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCBaseConfigDemoUITestsLaunchTests
-(JobsRetJobsOCBaseConfigDemoUITestsLaunchTestsByBOOLBlock _Nonnull)byContinueAfterFailure;
-(void)setContinueAfterFailure:(BOOL)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCBaseConfigDemoUITestsLaunchTests
@end

#endif /* JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOUITESTSLAUNCHTESTS_A9C35C620F */
