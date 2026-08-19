//
//  JobsOCBaseConfigDemoTests.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOTESTS_E8A113D253
#define JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOTESTS_E8A113D253

#import <XCTest/XCTest.h>

#if __has_include(<JobsOCTimer/JobsOCTimer.h>) && __has_include(<JobsOCTimerMgr/JobsOCTimerMgr.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#import <JobsOCTimerMgr/JobsOCTimerMgr.h>
#define JOBS_TIMER_TESTS_AVAILABLE 1
#else
#define JOBS_TIMER_TESTS_AVAILABLE 0
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@interface JobsOCBaseConfigDemoTests : XCTestCase
@end

#endif /* JOBS_HEADER_GUARD_JOBSOCBASECONFIGDEMOTESTS_E8A113D253 */
