//
//  JobsImageNumberViewStabilityTests.h
//  JobsImageNumberView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsImageNumberView/JobsImageNumberViewHeader.h>)
#import <JobsImageNumberView/JobsImageNumberViewHeader.h>
#else
#import "JobsImageNumberViewHeader.h"
#endif

// 用途：声明自动化测试；验证图片数字视图释放后，已保存的模型配置块不访问失效宿主。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsImageNumberViewStabilityTests : XCTestCase

@end
