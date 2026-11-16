//
//  MJRefreshExtraStabilityTests.h
//  MJRefreshExtra
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import "../../../../Libs/JobsOCBaseCustomizeUIKitCore/UIButton/UIButton+Category/UIButtonMake/UIButton+TextView/UIButton+TextView.h"

#if __has_include(<MJRefreshExtra/MJRefreshExtra.h>)
#import <MJRefreshExtra/MJRefreshExtra.h>
#else
#import "MJRefreshExtra.h"
#endif

// 用途：声明自动化测试；验证可选文本视图提供者、初始化失败恢复、配置缓存与刷新回调释放安全。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface MJRefreshExtraStabilityTests : XCTestCase

@end
