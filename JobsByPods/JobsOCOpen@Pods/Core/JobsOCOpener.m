//
//  JobsOCOpener.m
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCOpener.h"
#import "JobsOCOpenWebViewController.h"

#if __has_include(<JobsGetWindow/window.h>)
#import <JobsGetWindow/window.h>
#else
#import "window.h"
#endif

@implementation JobsOCOpener

+(instancetype)shared{
    static JobsOCOpener *open = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        open = self.class.new;
    });return open;
}

-(void)open:(JobsOCOpenConfiguration *_Nullable)configuration{
    [self open:configuration from:nil];
}

-(void)open:(JobsOCOpenConfiguration *_Nullable)configuration
       from:(UIViewController *_Nullable)sourceViewController{
    JobsOCOpenConfiguration *config = configuration ?: JobsOCOpenConfiguration.config;
    if (!config.url) {
        if (config.completion) config.completion(NO);
        return;
    }
    switch (config.mode) {
        case JobsOCOpenModeInApp:
            [self openInsideApp:config from:sourceViewController];
            break;
        case JobsOCOpenModeExternalBrowser:
            [self openInExternalBrowser:config];
            break;
    }
}

-(void)openInsideApp:(JobsOCOpenConfiguration *)configuration
                from:(UIViewController *_Nullable)sourceViewController{
    UIViewController *source = sourceViewController ?: [self topViewController];
    if (!source) {
        if (configuration.completion) configuration.completion(NO);
        return;
    }
    JobsOCOpenWebViewController *webVC = [[JobsOCOpenWebViewController alloc] initWithURL:configuration.url
                                                                                     title:configuration.pageTitle];
    if (source.navigationController) {
        [source.navigationController pushViewController:webVC animated:configuration.animated];
    }else{
        UINavigationController *navigationController = [UINavigationController.alloc initWithRootViewController:webVC];
        navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
        [source presentViewController:navigationController animated:configuration.animated completion:nil];
    }
    if (configuration.completion) configuration.completion(YES);
}

-(void)openInExternalBrowser:(JobsOCOpenConfiguration *)configuration{
    if (![UIApplication.sharedApplication canOpenURL:configuration.url]) {
        if (configuration.completion) configuration.completion(NO);
        return;
    }
    [UIApplication.sharedApplication openURL:configuration.url
                                     options:@{}
                           completionHandler:configuration.completion];
}

-(UIViewController *_Nullable)topViewController{
    UIViewController *rootViewController = jobsGetMainWindow().rootViewController;
    return [self topViewControllerFrom:rootViewController];
}

-(UIViewController *_Nullable)topViewControllerFrom:(UIViewController *_Nullable)viewController{
    if (!viewController) return nil;
    if (viewController.presentedViewController) return [self topViewControllerFrom:viewController.presentedViewController];
    if ([viewController isKindOfClass:UINavigationController.class]) {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        return [self topViewControllerFrom:navigationController.visibleViewController];
    }
    if ([viewController isKindOfClass:UITabBarController.class]) {
        UITabBarController *tabBarController = (UITabBarController *)viewController;
        return [self topViewControllerFrom:tabBarController.selectedViewController];
    };return viewController;
}

@end
