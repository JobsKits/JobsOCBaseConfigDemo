//
//  JobsOCSkeletonViewStabilityTests.m
//  JobsOCSkeletonView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCSkeletonViewStabilityTests.h"

// 用途：实现自动化测试；验证骨架视图释放后，已保存的显示和隐藏 DSL 块安全返回。
// 运行：在 Xcode 的 Pods 工程 JobsOCSkeletonView-Unit-Stability 测试 Target 执行，或由现有 CI 调用；不编入主 App。

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
