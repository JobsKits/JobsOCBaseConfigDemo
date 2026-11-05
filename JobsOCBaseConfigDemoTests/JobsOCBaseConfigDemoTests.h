//
//  JobsOCBaseConfigDemoTests.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOTESTS_E8A113D253
#define JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOTESTS_E8A113D253

#import <XCTest/XCTest.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

// 用途：声明计时器状态与手势设置页的 XCTest 回归用例，具体断言在同名实现文件。
// 运行：选用包含 JobsOCBaseConfigDemoTests 的测试 Scheme；当前共享 Scheme 尚未登记测试。
// 边界：供单元测试 Target 使用，不属于主 App 的业务接口。

@interface JobsOCBaseConfigDemoTests : XCTestCase

@end

#endif /* JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOTESTS_E8A113D253 */
