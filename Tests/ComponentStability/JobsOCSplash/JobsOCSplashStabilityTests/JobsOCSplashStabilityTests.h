//
//  JobsOCSplashStabilityTests.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCSplash/JobsOCSplashGIFDecoder.h>)
#import <JobsOCSplash/JobsOCSplashGIFDecoder.h>
#else
#import "JobsOCSplashGIFDecoder.h"
#endif
#import "../JobsSplashCacheFixture/JobsSplashCacheFixture.h"

// 用途：声明自动化测试；验证开屏缓存原子写入、有限重试、GIF 内容限制、共享下载取消及缓存淘汰。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsOCSplashStabilityTests : XCTestCase

@end
