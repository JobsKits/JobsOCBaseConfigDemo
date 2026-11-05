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

// 用途：声明自动化测试；通过独立 UI 测试 Runner 启动 App，并测量启动性能。
// 运行：在 Xcode 的 JobsOCBaseConfigDemoUITests 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCBaseConfigDemoUITests : XCTestCase

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCBaseConfigDemoUITests
-(JobsRetJobsOCBaseConfigDemoUITestsByBOOLBlock _Nonnull)byContinueAfterFailure;
-(void)setContinueAfterFailure:(BOOL)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCBaseConfigDemoUITests
@end

#endif /* JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOUITESTS_0CF5BC28FA */
