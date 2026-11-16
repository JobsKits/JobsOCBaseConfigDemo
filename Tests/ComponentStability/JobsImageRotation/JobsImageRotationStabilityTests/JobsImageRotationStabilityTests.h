//
//  JobsImageRotationStabilityTests.h
//  JobsImageRotation
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsImageRotation/JobsImageRotation.h>)
#import <JobsImageRotation/JobsImageRotation.h>
#else
#import "JobsImageRotation.h"
#endif

// 用途：声明自动化测试；验证缺失旋转目标时的启动与复位安全，以及运行中的旋转器不强留宿主。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsImageRotationStabilityTests : XCTestCase

@end
