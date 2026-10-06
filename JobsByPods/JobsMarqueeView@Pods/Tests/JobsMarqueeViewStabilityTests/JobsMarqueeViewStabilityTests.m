//
//  JobsMarqueeViewStabilityTests.m
//  JobsMarqueeView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsMarqueeViewStabilityTests.h"

@implementation JobsMarqueeViewStabilityTests



-(void)testUnstartedViewReleasesWithoutWeakRegistrationInDealloc{
    __weak JobsMarqueeView *weakView;
    @autoreleasepool {
        JobsMarqueeView *view = JobsMarqueeView.new;
        weakView = view;
    }
    XCTAssertNil(weakView);
}


@end
