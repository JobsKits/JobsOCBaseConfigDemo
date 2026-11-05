//
//  JobsKeychainIdentityTests.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSKEYCHAINIDENTITYTESTS_H
#define JOBS_TEST_JOBSKEYCHAINIDENTITYTESTS_H

#import <XCTest/XCTest.h>
#import <JobsBaseUI/JobsKeychainHelper.h>

// 用途：声明自动化测试；验证 Keychain 账户隔离、定向删除、归档失败保护、解码类型限制和显式迁移。
// 运行：在 Xcode 的 Pods 工程 JobsBaseUI-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsKeychainIdentityTests : XCTestCase 

@property(nonatomic,copy)NSString *service;

@end

#endif /* JOBS_TEST_JOBSKEYCHAINIDENTITYTESTS_H */
