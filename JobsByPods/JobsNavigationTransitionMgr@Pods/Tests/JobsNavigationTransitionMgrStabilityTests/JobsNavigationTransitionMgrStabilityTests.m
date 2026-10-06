//
//  JobsNavigationTransitionMgrStabilityTests.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsNavigationTransitionMgrStabilityTests.h"
#import "JobsNavigationTransitionTestContext.h"
#import <JobsByOCPods/UIViewController+Extra.h>

@implementation JobsNavigationTransitionMgrStabilityTests

-(void)testNavigationDirectionIsScopedAndReattachingDoesNotAccumulateGestures{
    UINavigationController *first = UINavigationController.new;
    UINavigationController *second = UINavigationController.new;
    [JobsNavigationTransitionMgr setDirection:JobsTransitionDirectionTop forNavigationController:first];
    [JobsNavigationTransitionMgr setDirection:JobsTransitionDirectionLeft forNavigationController:second];
    XCTAssertNotEqual(first.delegate, second.delegate);
    XCTAssertEqualObjects([(id)first.delegate valueForKey:@"direction"], @(JobsTransitionDirectionTop));
    UIViewController *root = UIViewController.new;
    UIViewController *child = UIViewController.new;
    XCTAssertNil(root.navigationController);
    root.clzPopGesture();
    XCTAssertTrue(root.fd_interactivePopDisabled);
    root.openPopGestureBy(nil);
    XCTAssertFalse(root.fd_interactivePopDisabled);
    first.viewControllers = @[root, child];
    [JobsNavigationTransitionMgr attachToViewController:child animationDirection:JobsTransitionDirectionRight];
    NSUInteger gestureCount = child.view.gestureRecognizers.count;
    [JobsNavigationTransitionMgr attachToViewController:child animationDirection:JobsTransitionDirectionBottom];
    XCTAssertEqual(child.view.gestureRecognizers.count, gestureCount);
    XCTAssertEqualObjects([(id)first.delegate valueForKey:@"direction"], @(JobsTransitionDirectionBottom));
    XCTAssertEqualObjects([(id)second.delegate valueForKey:@"direction"], @(JobsTransitionDirectionLeft));
}


-(void)testCancelledTransitionRestoresFramesInSmallContainer{
    JobsNavigationTransitionTestContext *context = JobsNavigationTransitionTestContext.new;
    context.containerView = UIView.new;
    context.containerView.byFrame(CGRectMake(0, 0, 300, 200));
    context.fromController = UIViewController.new;
    context.toController = UIViewController.new;
    CGRect fromFrame = CGRectMake(0, 0, 300, 200);
    CGRect toFrame = CGRectMake(7, 9, 180, 120);
    context.fromController.view.byFrame(fromFrame).addOn(context.containerView);
    context.toController.view.byFrame(toFrame);
    context.transitionWasCancelled = YES;
    JobsNavigationTransitionMgr *animator = jobsMakeNavigationTransitionMgr(^(__kindof JobsNavigationTransitionMgr *manager) {
        manager.byDirection(JobsTransitionDirectionBottom).byComingStyle(ComingStyle_POP);
    });
    XCTestExpectation *completed = [self expectationWithDescription:@"取消恢复"];
    context.onCompletion = ^{
        XCTAssertTrue(CGRectEqualToRect(context.fromController.view.frame, fromFrame));
        XCTAssertTrue(CGRectEqualToRect(context.toController.view.frame, toFrame));
        XCTAssertFalse(context.completionValue);
        [completed fulfill];
    };
    [animator animateTransition:context];
    [self waitForExpectations:@[completed] timeout:3];
    context.onCompletion = nil;
}

-(void)testTwoContainersCanReleaseAttachedControllers{
    __weak UIViewController *weakChild;
    jobsByVoidBlock lateClose;
    jobsByIDBlock lateOpen;
    @autoreleasepool {
        UIViewController *root = UIViewController.new;
        UIViewController *child = UIViewController.new;
        UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:root];
        navigation.viewControllers = @[root, child];
        [JobsNavigationTransitionMgr attachToViewController:child animationDirection:JobsTransitionDirectionTop];
        weakChild = child;
        lateClose = child.clzPopGesture;
        lateOpen = child.openPopGestureBy;
    }
    XCTAssertNil(weakChild);
    lateClose();
    lateOpen(nil);
    XCTAssertNil(weakChild);
}


@end
