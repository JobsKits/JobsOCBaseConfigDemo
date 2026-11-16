//
//  JobsOCUILabelScrollingStabilityTests.h
//  JobsOCUILabelScrolling
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCUILabelScrolling/JobsOCUILabelScrolling.h>)
#import <JobsOCUILabelScrolling/JobsOCUILabelScrolling.h>
#else
#import "JobsOCUILabelScrolling.h"
#endif

// 用途：声明自动化测试；验证滚动标签规整非有限参数，并确保极大有效速度不阻塞主 RunLoop。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsOCUILabelScrollingStabilityTests : XCTestCase

@end
