//
//  JobsBluetoothStabilityTests.h
//  JobsBluetooth
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <limits.h>
#import <math.h>
#import <XCTest/XCTest.h>

#if __has_include(<JobsBluetooth/JobsBluetooth.h>)
#import <JobsBluetooth/JobsBluetooth.h>
#else
#import "JobsBluetooth.h"
#endif


// 用途：声明自动化测试；验证蓝牙命令匹配、超时取消、旧连接隔离、MTU 分片与 ACK 完成顺序。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsBluetoothStabilityTests : XCTestCase

@end
