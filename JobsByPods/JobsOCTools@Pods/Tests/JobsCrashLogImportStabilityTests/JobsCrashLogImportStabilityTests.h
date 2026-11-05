//
//  JobsCrashLogImportStabilityTests.h
//  JobsOCTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsOCTools/JobsOCCrashLogCenter.h>
#import "../../Core/CrashLog/JobsCrashSignalRecorder/JobsCrashSignalRecorder.h"

// 用途：声明自动化测试；验证崩溃信号日志导入的失败保留、损坏内容拒绝，以及同一 IO 队列调用不死锁。
// 运行：在 Xcode 的 Pods 工程 JobsOCTools-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsCrashLogImportStabilityTests : XCTestCase

@end
