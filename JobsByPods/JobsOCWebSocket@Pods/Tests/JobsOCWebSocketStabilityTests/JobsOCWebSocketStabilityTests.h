//
//  JobsOCWebSocketStabilityTests.h
//  JobsOCWebSocket
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsOCWebSocket/JobsOCWebSocketClient.h>
#import "../JobsWebSocketTransportFixture/JobsWebSocketTransportFixture.h"

// 用途：声明自动化测试；验证心跳只接受当前连接的匹配 pong、超时终止，以及未连接客户端的释放。
// 运行：在 Xcode 的 Pods 工程 JobsOCWebSocket-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCWebSocketStabilityTests : XCTestCase

@end
