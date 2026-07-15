//
//  JobsOCSplashPresenter.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsOCSplashPresenter.h"

@implementation JobsOCSplashPresenter
+(__kindof JobsOCSplashVC *)showOver:(__kindof UIViewController *)hostViewController configuration:(JobsOCSplashConfiguration *)configuration {
    JobsOCSplashVC *splashVC = [[JobsOCSplashVC alloc] initWithConfiguration:configuration];
    splashVC.view
        .byFrame(hostViewController.view.bounds)
        .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    [hostViewController addChildViewController:splashVC];
    splashVC.view.addOn(hostViewController.view);
    [splashVC didMoveToParentViewController:hostViewController];
    dispatch_async(dispatch_get_main_queue(), ^{
        [splashVC becomeFirstResponder];
    });
    return splashVC;
}

@end
