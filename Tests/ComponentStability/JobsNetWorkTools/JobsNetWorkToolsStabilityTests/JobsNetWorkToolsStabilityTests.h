//
//  JobsNetWorkToolsStabilityTests.h
//  JobsNetWorkTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <limits.h>
#import <math.h>
#import <XCTest/XCTest.h>

#if __has_include(<JobsNetWorkTools/JobsNetWorkToolsHeader.h>)
#import <JobsNetWorkTools/JobsNetWorkToolsHeader.h>
#else
#import "JobsNetWorkToolsHeader.h"
#endif


// 用途：声明自动化测试；验证流量采样基线按实例隔离、采样周期校验、重启换定时器与多订阅保活。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsNetWorkToolsStabilityTests : XCTestCase

@end
