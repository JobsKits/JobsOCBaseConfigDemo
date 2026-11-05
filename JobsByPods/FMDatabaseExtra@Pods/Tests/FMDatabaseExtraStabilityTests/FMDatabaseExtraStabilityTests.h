//
//  FMDatabaseExtraStabilityTests.h
//  FMDatabaseExtra
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <limits.h>
#import <math.h>
#import <XCTest/XCTest.h>

#if __has_include(<FMDatabaseExtra/FMDatabaseExtra.h>)
#import <FMDatabaseExtra/FMDatabaseExtra.h>
#else
#import "FMDatabaseExtra.h"
#endif


// 用途：声明自动化测试；验证 SQL 失败和异常回滚、嵌套事务隔离，以及调用方数据库连接的保留。
// 运行：在 Xcode 的 Pods 工程 FMDatabaseExtra-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface FMDatabaseExtraStabilityTests : XCTestCase

@end
