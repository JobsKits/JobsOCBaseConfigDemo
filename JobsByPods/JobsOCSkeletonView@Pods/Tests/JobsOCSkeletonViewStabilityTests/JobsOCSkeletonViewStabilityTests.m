//
//  JobsOCSkeletonViewStabilityTests.m
//  JobsOCSkeletonView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCSkeletonViewStabilityTests.h"

@implementation JobsOCSkeletonViewStabilityTests

-(void)testSavedSkeletonBlocksReturnNilAfterViewReleases{
    JobsRetViewByVoidBlock show;
    JobsRetViewByBOOLBlock enable;
    @autoreleasepool {
        UIView *view = UIView.new;
        show = view.byShowGradientSkeleton;
        enable = view.bySkeletonable;
    }
    XCTAssertNil(show());
    XCTAssertNil(enable(YES));
}

@end
