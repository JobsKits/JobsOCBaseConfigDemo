//
//  JobsOCSkeletonViewStabilityTests.h
//  JobsOCSkeletonView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCSkeletonView/JobsOCSkeletonView.h>)
#import <JobsOCSkeletonView/JobsOCSkeletonView.h>
#else
#import "JobsOCSkeletonView.h"
#endif

// 用途：声明自动化测试；验证骨架视图释放后，已保存的显示和隐藏 DSL 块安全返回。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsOCSkeletonViewStabilityTests : XCTestCase

@end
