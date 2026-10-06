//
//  JobsWindowSelectionTests.m
//  JobsGetWindow
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsWindowSelectionTests.h"

@implementation JobsWindowSelectionTests

-(void)testForegroundSearchSkipsBackgroundAndFindsLaterKeyWindow {
    if (@available(iOS 13.0, *)) {
        JobsWindowFixture *background = [[JobsWindowFixture alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        background.hidden = NO;
        background.simulatedKeyWindow = YES;
        JobsWindowFixture *ordinary = [[JobsWindowFixture alloc] initWithFrame:background.frame];
        ordinary.hidden = NO;
        JobsWindowFixture *key = [[JobsWindowFixture alloc] initWithFrame:background.frame];
        key.hidden = NO;
        key.simulatedKeyWindow = YES;
        JobsWindowSceneFixture *back = JobsWindowSceneFixture.new;
        back.persistentIdentifier = @"0";
        back.activationState = UISceneActivationStateBackground;
        back.windows = @[background];
        JobsWindowSceneFixture *first = JobsWindowSceneFixture.new;
        first.persistentIdentifier = @"1";
        first.activationState = UISceneActivationStateForegroundActive;
        first.windows = @[ordinary];
        JobsWindowSceneFixture *second = JobsWindowSceneFixture.new;
        second.persistentIdentifier = @"2";
        second.activationState = UISceneActivationStateForegroundActive;
        second.windows = @[key];
        XCTAssertEqual(jobsGetMainWindowFromScenes((id)@[second, back, first]), key);
        key.hidden = YES;
        XCTAssertEqual(jobsGetMainWindowFromScenes((id)@[second, back, first]), ordinary);
        XCTAssertNil(jobsGetMainWindowFromScenes((id)@[back]));
    }
}

-(void)testContextWindowAndBackgroundThreadBoundary {
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    UIViewController *controller = UIViewController.new;
    XCTAssertNil(jobsGetWindowForViewController(controller));
    XCTAssertFalse(controller.isViewLoaded);
    window.rootViewController = controller;
    window.hidden = NO;
    XCTAssertEqual(jobsGetWindowForView(controller.view), window);
    XCTAssertEqual(jobsGetWindowForViewController(controller), window);
    UIView *context = controller.view;
    XCTestExpectation *done = [self expectationWithDescription:@"Off-main queries return nil"];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        XCTAssertNil(jobsGetWindowForView(context));
        XCTAssertNil(jobsGetMainWindow());
        [done fulfill];
    });
    [self waitForExpectations:@[done] timeout:2];
    window.hidden = YES;
}

@end
