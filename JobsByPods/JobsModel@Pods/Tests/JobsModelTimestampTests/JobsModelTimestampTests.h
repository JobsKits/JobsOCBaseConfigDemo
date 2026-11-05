//
//  JobsModelTimestampTests.h
//  JobsModel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_HEADER_GUARD_JOBSMODELTIMESTAMPTESTS
#define JOBS_HEADER_GUARD_JOBSMODELTIMESTAMPTESTS

#import <XCTest/XCTest.h>

// 用途：声明自动化测试；验证时间戳单位与中国时区转换，以及无效数字和嵌入 NUL 的输入拒绝。
// 运行：在 Xcode 的 Pods 工程 JobsModel-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsModelTimestampTests : XCTestCase

@end

#endif /* JOBS_HEADER_GUARD_JOBSMODELTIMESTAMPTESTS */
