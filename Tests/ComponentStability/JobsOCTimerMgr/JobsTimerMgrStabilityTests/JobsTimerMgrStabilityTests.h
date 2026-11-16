//
//  JobsTimerMgrStabilityTests.h
//  JobsOCTimerMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCTimerMgr/JobsOCTimerMgr.h>)
#import <JobsOCTimerMgr/JobsOCTimerMgr.h>
#else
#import "JobsOCTimerMgr.h"
#endif

// 用途：声明自动化测试；验证计时器强制完成只投递一次、不误删替换任务，以及管理器释放后停止计时。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsTimerMgrStabilityTests : XCTestCase

@end
