//
//  JobsSuspendStabilityTests.h
//  JobsSuspend
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsSuspend/JobsSuspend.h>)
#import <JobsSuspend/JobsSuspend.h>
#else
#import "JobsSuspend.h"
#endif

// 用途：声明自动化测试；验证悬浮控制器释放后，外部保存的弱引用正确归零。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsSuspendStabilityTests : XCTestCase

@end
