//
//  JobsImageCodeViewStabilityTests.m
//  JobsOCTools
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsImageCodeViewStabilityTests.h"

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
