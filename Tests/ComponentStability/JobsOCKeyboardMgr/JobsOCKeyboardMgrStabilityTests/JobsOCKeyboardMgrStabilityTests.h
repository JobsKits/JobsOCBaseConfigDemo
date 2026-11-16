//
//  JobsOCKeyboardMgrStabilityTests.h
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#if __has_include(<JobsOCKeyboardMgr/JobsOCKeyboardMgr.h>)
#import <JobsOCKeyboardMgr/JobsOCKeyboardMgr.h>
#else
#import "JobsOCKeyboardMgr.h"
#endif

// 用途：声明自动化测试；验证键盘管理器释放后，已保存的开始和停止监听块安全返回。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface JobsOCKeyboardMgrStabilityTests : XCTestCase

@end
