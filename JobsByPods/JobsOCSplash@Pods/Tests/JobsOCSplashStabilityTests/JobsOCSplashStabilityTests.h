//
//  JobsOCSplashStabilityTests.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <JobsOCSplash/JobsOCSplashGIFDecoder.h>
#import "../JobsSplashCacheFixture/JobsSplashCacheFixture.h"

// 用途：声明自动化测试；验证开屏缓存原子写入、有限重试、GIF 内容限制、共享下载取消及缓存淘汰。
// 运行：在 Xcode 的 Pods 工程 JobsOCSplash-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface JobsOCSplashStabilityTests : XCTestCase

@end
