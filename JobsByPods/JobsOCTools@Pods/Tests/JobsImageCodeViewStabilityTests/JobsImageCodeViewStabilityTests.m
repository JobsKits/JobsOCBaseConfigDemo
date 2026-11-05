//
//  JobsImageCodeViewStabilityTests.m
//  JobsOCTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsImageCodeViewStabilityTests.h"

// 用途：实现自动化测试；验证图形验证码视图的初始化与背景 DSL 正常结束，避免递归调用。
// 运行：在 Xcode 的 Pods 工程 JobsOCTools-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@implementation JobsImageCodeViewStabilityTests

- (void)testInitializationAndBackgroundDSLTerminate {
    ImageCodeView *view = ImageCodeView.new;
    XCTAssertNotNil(view);
    view.byBgColor(UIColor.redColor);
    XCTAssertEqualObjects(view.bgColor, UIColor.redColor);
    XCTAssertEqualObjects(view.backgroundColor, UIColor.redColor);
    view.bgColor = UIColor.blueColor;
    XCTAssertEqualObjects(view.backgroundColor, UIColor.blueColor);
    view.byCodeStr(@"");
    XCTAssertNoThrow([view drawRect:CGRectZero]);
    XCTAssertNoThrow([view drawRect:CGRectMake(0, 0, 1, 1)]);
}

@end
