//
//  JobsImageCodeViewStabilityTests.h
//  JobsOCTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCTools/JobsOCTools.h>)
#import <JobsOCTools/JobsOCTools.h>
#else
#import "JobsOCTools.h"
#endif

// 用途：声明自动化测试；验证图形验证码视图的初始化与背景 DSL 正常结束，避免递归调用。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsImageCodeViewStabilityTests : XCTestCase

@end
