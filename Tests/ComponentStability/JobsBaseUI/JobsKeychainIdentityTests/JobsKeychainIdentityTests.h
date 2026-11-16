//
//  JobsKeychainIdentityTests.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSKEYCHAINIDENTITYTESTS_H
#define JOBS_TEST_JOBSKEYCHAINIDENTITYTESTS_H

#import <XCTest/XCTest.h>
#if __has_include(<JobsBaseUI/JobsKeychainHelper.h>)
#import <JobsBaseUI/JobsKeychainHelper.h>
#else
#import "JobsKeychainHelper.h"
#endif

// 用途：声明自动化测试；验证 Keychain 账户隔离、定向删除、归档失败保护、解码类型限制和显式迁移。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsKeychainIdentityTests : XCTestCase 

@property(nonatomic,copy)NSString *service;

@end

#endif /* JOBS_TEST_JOBSKEYCHAINIDENTITYTESTS_H */
