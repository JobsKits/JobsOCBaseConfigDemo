//
//  JobsProgressBarStabilityTests.h
//  JobsProgressBar
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsProgressBar/JobsProgressBarHeader.h>)
#import <JobsProgressBar/JobsProgressBarHeader.h>
#else
#import "JobsProgressBar.h"
#endif

// 用途：声明自动化测试；验证运行中的进度动画不强留视图、非有限输入规整及未启动对象释放。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsProgressBarStabilityTests : XCTestCase

@end
