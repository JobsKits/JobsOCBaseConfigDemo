//
//  JobsOCSplashPresenter.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsOCSplashPresenter.h"

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
    JobsOCSplashVC *splashVC = [[JobsOCSplashVC alloc] initWithConfiguration:configuration];
    splashVC.view.frame = overlayHostViewController.view.bounds;
    splashVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [overlayHostViewController addChildViewController:splashVC];
    [overlayHostViewController.view addSubview:splashVC.view];
    [splashVC didMoveToParentViewController:overlayHostViewController];
    dispatch_async(dispatch_get_main_queue(), ^{
        [splashVC becomeFirstResponder];
    });
    return splashVC;
}

@end
