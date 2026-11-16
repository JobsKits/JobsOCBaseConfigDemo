//
//  JobsOCBaseConfigDemoTests.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOTESTS_E8A113D253
#define JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOTESTS_E8A113D253

#import <objc/message.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#if __has_include(<JobsOCTimer/JobsOCTimer.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#else
#import "JobsTimer.h"
#endif

#if __has_include(<JobsOCTimerMgr/JobsOCTimerMgr.h>)
#import <JobsOCTimerMgr/JobsOCTimerMgr.h>
#else
#import "JobsTimerMgr.h"
#endif

// 两个真实生产头必须可见；不因主工程集成形态静默跳过计时器回归。
#define JOBS_TIMER_TESTS_AVAILABLE 1

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

// 用途：声明自动化测试；验证宿主 Bundle、计时器前后台与手动暂停、开屏、手势页、下拉选择及蓝牙页面的基础回归。
// 运行：在 Xcode 的 JobsOCBaseConfigDemoTests 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCBaseConfigDemoTests : XCTestCase

@end

#endif /* JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOTESTS_E8A113D253 */
