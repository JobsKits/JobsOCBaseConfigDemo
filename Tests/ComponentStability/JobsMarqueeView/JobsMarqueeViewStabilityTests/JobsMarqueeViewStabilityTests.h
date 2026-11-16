//
//  JobsMarqueeViewStabilityTests.h
//  JobsMarqueeView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsMarqueeView/JobsMarqueeView.h>)
#import <JobsMarqueeView/JobsMarqueeView.h>
#else
#import "JobsMarqueeView.h"
#endif

// 用途：声明自动化测试；验证尚未启动的跑马灯视图能够释放，析构期间不重新注册弱引用。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsMarqueeViewStabilityTests : XCTestCase

@end
