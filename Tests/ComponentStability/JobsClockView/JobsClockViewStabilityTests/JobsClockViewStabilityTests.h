//
//  JobsClockViewStabilityTests.h
//  JobsClockView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsClockView/JobsClockViewHeader.h>)
#import <JobsClockView/JobsClockViewHeader.h>
#else
#import "JobsClockViewHeader.h"
#endif

// 用途：声明自动化测试；验证时钟按需创建计时器、释放时停止计时，旧启动块不能复活已释放对象。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsClockViewStabilityTests : XCTestCase

@end
