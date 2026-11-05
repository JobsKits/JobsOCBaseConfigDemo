//
//  JobsCipherCompatibilityTests.h
//  JobsCryptography
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSCIPHERCOMPATIBILITYTESTS_H
#define JOBS_TEST_JOBSCIPHERCOMPATIBILITYTESTS_H

#import <XCTest/XCTest.h>
#import <JobsCryptography/AES.h>
#import <JobsCryptography/AESCipher.h>
#import <JobsCryptography/JobsAuthenticatedCipher.h>

// 用途：声明自动化测试；验证认证加密的空文本、Unicode、随机性、篡改拒绝及旧格式读取兼容。
// 运行：在 Xcode 的 Pods 工程 JobsCryptography-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsCipherCompatibilityTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSCIPHERCOMPATIBILITYTESTS_H */
