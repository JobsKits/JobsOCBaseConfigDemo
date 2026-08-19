//
//  JobsOCOpener.m
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCOpener.h"

#import "JobsOCOpenWebViewController.h"

@implementation JobsOCOpener
+(JobsRetIDByVoidBlock _Nonnull)shared{
    return ^id{
        static JobsOCOpener *open = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            open = self.class.new;
        });return open;
    };
}

-(jobsByJobsOCOpenConfigurationBlock _Nonnull)open{
    @jobs_weakify(self)
    return ^(JobsOCOpenConfiguration *_Nullable configuration){
        @jobs_strongify(self)
        if (!self) return;
        [self open:configuration from:nil];
    };
}

-(void)open:(JobsOCOpenConfiguration *_Nullable)configuration
       from:(UIViewController *_Nullable)sourceViewController{
    JobsOCOpenConfiguration *config = configuration ?: JobsOCOpenConfiguration.config();
    if (!config.url) {
        if (config.completion) config.completion(NO);
        return;
    }
    switch (config.mode) {
        /// 处理 JobsOCOpenModeInApp 分支
        case JobsOCOpenModeInApp:
            [self openInsideApp:config from:sourceViewController];
            break;
        /// 处理 JobsOCOpenModeExternalBrowser 分支
        case JobsOCOpenModeExternalBrowser:
            self.openInExternalBrowser(config);
            break;
    }
}

-(void)openInsideApp:(JobsOCOpenConfiguration *)configuration
                from:(UIViewController *_Nullable)sourceViewController{
    UIViewController *source = sourceViewController ?: self.jobsTopViewController();
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
        navigationController.byModalPresentationStyle(UIModalPresentationFullScreen);
        [source presentViewController:navigationController animated:configuration.animated completion:nil];
    }
    if (configuration.completion) configuration.completion(YES);
}

-(jobsByJobsOCOpenConfigurationBlock _Nonnull)openInExternalBrowser{
    @jobs_weakify(self)
    return ^(JobsOCOpenConfiguration * configuration){
        @jobs_strongify(self)
        if (!self) return;
        if (![UIApplication.sharedApplication canOpenURL:configuration.url]) {
            if (configuration.completion) configuration.completion(NO);
            return;
        }
        [UIApplication.sharedApplication openURL:configuration.url
                                         options:@{}
                               completionHandler:configuration.completion];
    };
}

-(UIViewController *_Nullable)topViewController{
    return ((((JobsRetVCByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCOpener.class, @selector(jobsTopViewController)))(self, @selector(jobsTopViewController))))();
}

-(JobsRetVCByVoidBlock _Nonnull)jobsTopViewController{
    @jobs_weakify(self)
    return ^UIViewController *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        UIViewController *rootViewController = jobsGetMainWindow().rootViewController;
        return self.topViewControllerFrom(rootViewController);
    };
}

-(JobsRetVCByVCBlock _Nonnull)topViewControllerFrom{
    @jobs_weakify(self)
    return ^UIViewController *_Nullable(UIViewController *_Nullable viewController){
        @jobs_strongify(self)
        if (!self) return nil;
        if (!viewController) return nil;
        if (viewController.presentedViewController) return self.topViewControllerFrom(viewController.presentedViewController);
        if ([viewController isKindOfClass:UINavigationController.class]) {
            UINavigationController *navigationController = (UINavigationController *)viewController;
            return self.topViewControllerFrom(navigationController.visibleViewController);
        }
        if ([viewController isKindOfClass:UITabBarController.class]) {
            UITabBarController *tabBarController = (UITabBarController *)viewController;
            return self.topViewControllerFrom(tabBarController.selectedViewController);
        };return viewController;
    };
}

@end
