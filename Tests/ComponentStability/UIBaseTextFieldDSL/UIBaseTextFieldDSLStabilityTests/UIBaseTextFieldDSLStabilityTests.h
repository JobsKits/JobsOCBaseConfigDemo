//
//  UIBaseTextFieldDSLStabilityTests.h
//  UIBaseTextFieldDSL
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
// 旧主工程按公共 UIKit 入口建立声明顺序，避免 CJ/HQ 头循环依赖。
#import "../../../../Libs/JobsOCBaseCustomizeUIKitCore/JobsBaseCustomizeUIKitCoreHeader.h"
#import "../../../../Libs/JobsOCBaseCustomizeUIKitCore/UITextField/UIBaseTextFieldDSL.h"

// 用途：声明自动化测试；验证输入框释放后，已保存的警告提示 DSL 块安全返回。
// 运行：在旧主工程 JobsOCBaseConfigDemoTests 执行；不编入主 App。

@interface UIBaseTextFieldDSLStabilityTests : XCTestCase

@end
