//
//  JobsProgressBarStabilityTests.m
//  JobsProgressBar
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsProgressBarStabilityTests.h"

@implementation JobsProgressBarStabilityTests

-(void)testRunningProgressDoesNotRetainViewAndNormalizesNonfiniteInput{
    __weak JobsProgressBar *weakProgress;
    @autoreleasepool {
        JobsProgressBar *progress = JobsProgressBar.new;
        progress.byProgress(NAN);
        XCTAssertEqual(progress.progress, 0);
        [progress startAutoProgressFromZero:YES step:NAN interval:INFINITY animated:NO];
        weakProgress = progress;
    }
    XCTAssertNil(weakProgress);
}


-(void)testUnstartedViewReleasesWithoutWeakRegistrationInDealloc{
    __weak JobsProgressBar *weakView;
    @autoreleasepool {
        JobsProgressBar *view = JobsProgressBar.new;
        weakView = view;
    }
    XCTAssertNil(weakView);
}


@end
