//
//  JobsOCWebSocketStabilityTests.h
//  JobsOCWebSocket
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCWebSocket/JobsOCWebSocketClient.h>)
#import <JobsOCWebSocket/JobsOCWebSocketClient.h>
#else
#import "JobsOCWebSocketClient.h"
#endif
#import "../JobsWebSocketTransportFixture/JobsWebSocketTransportFixture.h"

// 用途：声明自动化测试；验证心跳只接受当前连接的匹配 pong、超时终止，以及未连接客户端的释放。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsOCWebSocketStabilityTests : XCTestCase

@end
