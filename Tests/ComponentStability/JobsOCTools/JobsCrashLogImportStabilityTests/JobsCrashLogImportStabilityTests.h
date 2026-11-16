//
//  JobsCrashLogImportStabilityTests.h
//  JobsOCTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCTools/JobsOCCrashLogCenter.h>)
#import <JobsOCTools/JobsOCCrashLogCenter.h>
#else
#import "JobsOCCrashLogCenter.h"
#endif
#import "JobsCrashSignalRecorder.h"

// 用途：声明自动化测试；验证崩溃信号日志导入的失败保留、损坏内容拒绝，以及同一 IO 队列调用不死锁。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsCrashLogImportStabilityTests : XCTestCase

@end
