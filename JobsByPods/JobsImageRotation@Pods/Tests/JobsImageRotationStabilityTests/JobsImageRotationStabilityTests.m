//
//  JobsImageRotationStabilityTests.m
//  JobsImageRotation
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsImageRotationStabilityTests.h"

// 用途：实现自动化测试；验证缺失旋转目标时的启动与复位安全，以及运行中的旋转器不强留宿主。
// 运行：在 Xcode 的 Pods 工程 JobsImageRotation-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

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
