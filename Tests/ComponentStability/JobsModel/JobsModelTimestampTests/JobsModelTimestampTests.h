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
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

#if __has_include(<JobsModel/NSString+JobsModelTime.h>)
#import <JobsModel/NSString+JobsModelTime.h>
#else
#import "NSString+JobsModelTime.h"
#endif

#if __has_include(<JobsModel/JobsUserModel.h>)
#import <JobsModel/JobsUserModel.h>
#else
#import "JobsUserModel.h"
#endif

#if __has_include(<JobsModel/FMDoorModel.h>)
#import <JobsModel/FMDoorModel.h>
#else
#import "FMDoorModel.h"
#endif

@interface JobsModelTimestampTests : XCTestCase

@end

#endif /* JOBS_HEADER_GUARD_JOBSMODELTIMESTAMPTESTS */
