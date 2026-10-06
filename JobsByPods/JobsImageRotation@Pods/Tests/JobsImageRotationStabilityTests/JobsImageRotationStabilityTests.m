//
//  JobsImageRotationStabilityTests.m
//  JobsImageRotation
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsImageRotationStabilityTests.h"

@implementation JobsImageRotationStabilityTests

-(void)testMissingTargetCanStartAndResetWithoutNilBlockCall{
    UIView *target = UIView.new;
    JobsImageRotator *rotator = [[JobsImageRotator alloc] initWithTargetView:target direction:JobsImageRotationDirectionClockwise interval:NAN];
    XCTAssertTrue(isfinite(rotator.interval));
    target = nil;
    rotator.start();
    XCTAssertNil([rotator valueForKey:@"timer"]);
    rotator.jobsStop();
    XCTAssertNil([rotator valueForKey:@"timer"]);
}

-(void)testRunningRotatorDoesNotRetainItsOwner{
    UIView *target = UIView.new;
    __weak JobsImageRotator *weakRotator;
    @autoreleasepool {
        JobsImageRotator *rotator = [[JobsImageRotator alloc] initWithTargetView:target];
        rotator.start();
        weakRotator = rotator;
    }
    XCTAssertNil(weakRotator);
}

@end
