//
//  JobsSuspendStabilityTests.m
//  JobsSuspend
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsSuspendStabilityTests.h"

@implementation JobsSuspendStabilityTests

-(void)testSuspendControllerReferenceZeros{
    UIView *floating = UIView.new;
    __weak UIViewController *weakController;
    @autoreleasepool {
        UIViewController *controller = UIViewController.new;
        floating.byVc(controller);
        weakController = controller;
        XCTAssertEqual(floating.vc, controller);
    }
    XCTAssertNil(weakController);
    XCTAssertNil(floating.vc);
}


@end
