//
//  UIBaseTextFieldDSLStabilityTests.h
//  UIBaseTextFieldDSL
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <XCTest/XCTest.h>
#import <UIBaseTextFieldDSL/UIBaseTextFieldDSL.h>

// 用途：声明自动化测试；验证输入框释放后，已保存的警告提示 DSL 块安全返回。
// 运行：在 Xcode 的 Pods 工程 UIBaseTextFieldDSL-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@interface UIBaseTextFieldDSLStabilityTests : XCTestCase

@end
