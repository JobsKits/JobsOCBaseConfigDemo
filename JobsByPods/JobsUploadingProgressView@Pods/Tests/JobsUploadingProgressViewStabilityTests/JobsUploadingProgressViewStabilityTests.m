//
//  JobsUploadingProgressViewStabilityTests.m
//  JobsUploadingProgressView
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsUploadingProgressViewStabilityTests.h"

// 声明现有实现中的关闭 Block，仅供回归调用，不扩展生产公开 API。
@interface JobsUploadingProgressView (JobsStabilityDismiss)
-(jobsByVoidBlock _Nonnull)jobsDismiss;
@end

@implementation JobsUploadingProgressViewStabilityTests

-(void)testDismissThenShowRestartsAnimationInExplicitHost{
    UIView *host = UIView.new;
    JobsUploadingProgressView *view = JobsUploadingProgressView.new;
    XCTAssertNotNil(view.strokeColor);
    view.byHostView(host);
    view.updateProgressText(@"10%");
    XCTAssertEqual(view.superview, host);
    CAShapeLayer *layer = [view valueForKey:@"shapLayer"];
    XCTAssertNotNil([layer animationForKey:@"CLAnimation"]);
    view.jobsDismiss();
    view.jobsDismiss();
    XCTAssertNil([layer animationForKey:@"CLAnimation"]);
    view.updateProgressText(@"20%");
    XCTAssertNotNil([layer animationForKey:@"CLAnimation"]);
    XCTAssertFalse(view.hidden);
    view.jobsDismiss();
}

-(void)testExplicitHostReferenceDoesNotKeepContainerAlive{
    __weak UIView *weakHost;
    __weak JobsUploadingProgressView *weakView;
    jobsByVoidBlock lateDismiss;
    jobsByStrBlock lateUpdate;
    @autoreleasepool {
        JobsUploadingProgressView *view = JobsUploadingProgressView.new;
        weakView = view;
        @autoreleasepool {
            UIView *host = UIView.new;
            weakHost = host;
            view.byHostView(host);
        }
        XCTAssertNil(weakHost);
        XCTAssertNil(view.hostView);
        lateDismiss = view.jobsDismiss;
        lateUpdate = view.updateProgressText;
    }
    XCTAssertNil(weakView);
    lateDismiss();
    lateUpdate(@"迟到的上传进度");
    XCTAssertNil(weakView);
}

@end
