//
//  UIBaseTextFieldDSLStabilityTests.m
//  UIBaseTextFieldDSL
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "UIBaseTextFieldDSLStabilityTests.h"

@implementation UIBaseTextFieldDSLStabilityTests

-(void)testSavedWarningBlockReturnsNilAfterFieldReleases{
    JobsRetHQTextFieldByVoidBlock warn;
    @autoreleasepool {
        HQTextField *field = HQTextField.new;
        warn = field.byShowWarn;
    }
    XCTAssertNil(warn());
}

@end
