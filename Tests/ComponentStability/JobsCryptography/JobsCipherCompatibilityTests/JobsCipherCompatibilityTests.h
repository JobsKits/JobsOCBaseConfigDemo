//
//  JobsCipherCompatibilityTests.h
//  JobsCryptography
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_TEST_JOBSCIPHERCOMPATIBILITYTESTS_H
#define JOBS_TEST_JOBSCIPHERCOMPATIBILITYTESTS_H

#import <XCTest/XCTest.h>
#if __has_include(<JobsCryptography/AES.h>)
#import <JobsCryptography/AES.h>
#else
#import "AES.h"
#endif
#if __has_include(<JobsCryptography/AESCipher.h>)
#import <JobsCryptography/AESCipher.h>
#else
#import "AESCipher.h"
#endif
#if __has_include(<JobsCryptography/JobsAuthenticatedCipher.h>)
#import <JobsCryptography/JobsAuthenticatedCipher.h>
#else
#import "JobsAuthenticatedCipher.h"
#endif

// 用途：声明自动化测试；验证认证加密的空文本、Unicode、随机性、篡改拒绝及旧格式读取兼容。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsCipherCompatibilityTests : XCTestCase

@end

#endif /* JOBS_TEST_JOBSCIPHERCOMPATIBILITYTESTS_H */
