//
//  JobsOCSplashPresenter.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsOCSplashPresenter.h"

@interface JobsOCSplashVC (HostGestureRestoration)

-(jobsByRACSchedulerRecursiveBlock _Nonnull)restoreHostGesturesOnFinish;

@end

static UIViewController *JobsOCSplashOverlayHostViewController(UIViewController *hostViewController) {
    UIViewController *candidate = nil;
    if (hostViewController.presentedViewController && !hostViewController.presentedViewController.isBeingDismissed) {
        candidate = hostViewController.presentedViewController;
    } else if ([hostViewController isKindOfClass:UINavigationController.class]) {
        UINavigationController *navigationController = (UINavigationController *)hostViewController;
        candidate = navigationController.visibleViewController ?: navigationController.topViewController;
    } else if ([hostViewController isKindOfClass:UITabBarController.class]) {
        candidate = ((UITabBarController *)hostViewController).selectedViewController;
    } else if ([hostViewController isKindOfClass:UISplitViewController.class]) {
        candidate = ((UISplitViewController *)hostViewController).viewControllers.lastObject;
    } else if ([hostViewController isKindOfClass:UIPageViewController.class]) {
        candidate = ((UIPageViewController *)hostViewController).viewControllers.firstObject;
    }
    if (!candidate || candidate == hostViewController) return hostViewController;
    return JobsOCSplashOverlayHostViewController(candidate);
}

@implementation JobsOCSplashPresenter
+(__kindof JobsOCSplashVC *)showOver:(__kindof UIViewController *)hostViewController configuration:(JobsOCSplashConfiguration *)configuration {
    UIViewController *overlayHostViewController = JobsOCSplashOverlayHostViewController(hostViewController);
    NSMutableOrderedSet<UIGestureRecognizer *> *hostGestureRecognizerSet = NSMutableOrderedSet.orderedSet;
    [hostGestureRecognizerSet addObjectsFromArray:hostViewController.view.gestureRecognizers ?: @[]];
    [hostGestureRecognizerSet addObjectsFromArray:overlayHostViewController.view.gestureRecognizers ?: @[]];
    NSArray<UIGestureRecognizer *> *hostGestureRecognizers = hostGestureRecognizerSet.array;
    NSMutableArray<NSNumber *> *hostGestureEnabledStates = [NSMutableArray arrayWithCapacity:hostGestureRecognizers.count];
    for (UIGestureRecognizer *gestureRecognizer in hostGestureRecognizers) {
        [hostGestureEnabledStates addObject:@(gestureRecognizer.enabled)];
        gestureRecognizer.byEnabled(NO);
    }
    JobsOCSplashVC *splashVC = [[JobsOCSplashVC alloc] initWithConfiguration:configuration];
    splashVC.restoreHostGesturesOnFinish(^{
        [hostGestureRecognizers enumerateObjectsUsingBlock:^(UIGestureRecognizer *gestureRecognizer, NSUInteger idx, BOOL *stop) {
            gestureRecognizer.byEnabled(hostGestureEnabledStates[idx].boolValue);
        }];
    });
    splashVC.view
        .byFrame(overlayHostViewController.view.bounds)
        .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    [overlayHostViewController addChildViewController:splashVC];
    splashVC.view.addOn(overlayHostViewController.view);
    [splashVC didMoveToParentViewController:overlayHostViewController];
    dispatch_async(dispatch_get_main_queue(), ^{
        [splashVC becomeFirstResponder];
    });
    return splashVC;
}

@end
