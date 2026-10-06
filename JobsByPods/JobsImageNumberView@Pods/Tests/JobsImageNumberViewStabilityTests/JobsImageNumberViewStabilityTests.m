//
//  JobsImageNumberViewStabilityTests.m
//  JobsImageNumberView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsImageNumberViewStabilityTests.h"

@implementation JobsImageNumberViewStabilityTests

-(void)testSavedModelBlockAfterImageViewReleaseIsSafe{
    __weak JobsImageNumberView *weakView = nil;
    __block jobsByIDBlock modelBlock;
    @autoreleasepool {
        JobsImageNumberView *view = JobsImageNumberView.new;
        weakView = view;
        modelBlock = view.jobsRichViewByModel;
    }
    XCTAssertNil(weakView);
    XCTAssertNotNil(modelBlock);
    modelBlock(@[]);
}

@end
