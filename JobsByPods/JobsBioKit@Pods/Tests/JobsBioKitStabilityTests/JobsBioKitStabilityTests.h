//
//  JobsBioKitStabilityTests.h
//  JobsBioKit
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <limits.h>
#import <math.h>
#import <XCTest/XCTest.h>

#if __has_include(<JobsBioKit/JobsBioKitHeader.h>)
#import <JobsBioKit/JobsBioKitHeader.h>
#else
#import "JobsBioKitHeader.h"
#endif

// 用途：声明自动化测试；验证生物识别不可用与交互失败的错误分类保持可区分。
// 运行：在 Xcode 的 Pods 工程 JobsBioKit-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsBioKit (JobsStabilityTesting)

+(JobsRetJobsBioKitResultByNSErrorBlock)resultForError;

@end

@interface JobsBioKitStabilityTests : XCTestCase

@end
