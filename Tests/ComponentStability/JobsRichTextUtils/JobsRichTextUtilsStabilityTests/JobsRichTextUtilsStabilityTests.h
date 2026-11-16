//
//  JobsRichTextUtilsStabilityTests.h
//  JobsRichTextUtils
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <limits.h>
#import <math.h>
#import <XCTest/XCTest.h>

#if __has_include(<JobsRichTextUtils/JobsRichTextUtils.h>)
#import <JobsRichTextUtils/JobsRichTextUtils.h>
#else
#import "JobsRichTextUtils.h"
#endif


// 用途：声明自动化测试；验证富文本下划线颜色，以及越界或溢出范围的安全处理。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsRichTextUtilsStabilityTests : XCTestCase

@end
