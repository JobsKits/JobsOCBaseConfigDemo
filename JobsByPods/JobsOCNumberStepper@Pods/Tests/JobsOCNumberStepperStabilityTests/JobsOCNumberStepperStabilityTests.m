//
//  JobsOCNumberStepperStabilityTests.m
//  JobsOCNumberStepper
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCNumberStepperStabilityTests.h"

// 用途：实现自动化测试；验证步进器 DSL 链与显示同步，且数值始终处于配置范围。
// 运行：在 Xcode 的 Pods 工程 JobsOCNumberStepper-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

@implementation JobsOCNumberStepperStabilityTests

-(void)testStepperChainsSynchronizeAndStayWithinBounds{
    JobsOCNumberStepper *stepper = JobsOCNumberStepper.new;
    stepper.byMinimumValue(@2).byMaximumValue(@8).byStepValue(0).byValue(99);
    XCTAssertEqual(stepper.value, 8);
    XCTAssertEqual(stepper.stepValue, 1);
    XCTAssertEqualObjects(stepper.textField.text, @"8");
    XCTAssertFalse(stepper.increaseButton.enabled);
    stepper.byValue(2);
    XCTAssertFalse(stepper.decreaseButton.enabled);
    stepper.byStepValue(NSIntegerMax);
    [stepper.increaseButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    XCTAssertLessThanOrEqual(stepper.value, 8);
    [stepper configureWithValue:NSIntegerMin minimumValue:nil maximumValue:nil stepValue:NSIntegerMax];
    [stepper.decreaseButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    XCTAssertEqual(stepper.value, NSIntegerMin);
}


@end
