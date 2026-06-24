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
    splashVC.view.frame = hostViewController.view.bounds;
    splashVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [hostViewController addChildViewController:splashVC];
    [hostViewController.view addSubview:splashVC.view];
    [splashVC didMoveToParentViewController:hostViewController];
    dispatch_async(dispatch_get_main_queue(), ^{
        [splashVC becomeFirstResponder];
    });
    return splashVC;
}

@end
