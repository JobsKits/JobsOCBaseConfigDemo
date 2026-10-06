//
//  JobsOCNumberStepperStabilityTests.m
//  JobsOCNumberStepper
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCNumberStepperStabilityTests.h"

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
