//
//  NSObject+JobsOCOpen.m
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "NSObject+JobsOCOpen.h"

#if __has_include(<JobsGetWindow/window.h>)
#import <JobsGetWindow/window.h>
#else
#import "window.h"
#endif

@interface _JobsOCOpenObjectMailProxy : NSObject <MFMailComposeViewControllerDelegate>

Prop_copy(nullable) jobsByVoidBlock completionHandlerBlock;

@end

@implementation _JobsOCOpenObjectMailProxy

+(instancetype)shared{
    static _JobsOCOpenObjectMailProxy *proxy = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        proxy = self.class.new;
    });return proxy;
}

-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result
                       error:(NSError *)error{
    jobsByVoidBlock completion = self.completionHandlerBlock;
    [controller dismissViewControllerAnimated:YES completion:completion];
    self.completionHandlerBlock = nil;
}

@end

@implementation NSObject (JobsOCOpen)

-(void)jobs_ocSendMailWithComposeVC:(MFMailComposeViewController *_Nullable)mailComposeVC
             completionHandlerBlock:(jobsByVoidBlock _Nullable)completionHandlerBlock{
    if (!MFMailComposeViewController.canSendMail) {
        if (completionHandlerBlock) completionHandlerBlock();
        return;
    }
    MFMailComposeViewController *vc = mailComposeVC ?: MFMailComposeViewController.new;
    _JobsOCOpenObjectMailProxy.shared.completionHandlerBlock = completionHandlerBlock;
    vc.mailComposeDelegate = _JobsOCOpenObjectMailProxy.shared;
    UIViewController *host = [self jobs_ocTopViewController];
    if (!host) {
        if (completionHandlerBlock) completionHandlerBlock();
        return;
    }
    [host presentViewController:vc animated:YES completion:nil];
}

-(void)jobs_ocDialWithTelephoneNumber:(NSString *_Nullable)telephoneNumber
                  dialFinishBackToApp:(BOOL)dialFinishBackToApp
        successCompletionHandlerBlock:(jobsByIDBlock _Nullable)successCompletionHandlerBlock
           failCompletionHandlerBlock:(jobsByIDBlock _Nullable)failCompletionHandlerBlock{
    NSString *scheme = dialFinishBackToApp ? @"telprompt://" : @"tel://";
    NSString *phone = [self jobs_ocSanitizedPhoneNumber:telephoneNumber];
    if (!phone.length) {
        if (failCompletionHandlerBlock) failCompletionHandlerBlock(@(JobsOCOpenResultInvalidInput));
        return;
    }
    [self jobs_ocOpenURL:[scheme stringByAppendingString:phone]
                 options:@{}
   successCompletionHandlerBlock:^{
        if (successCompletionHandlerBlock) successCompletionHandlerBlock(@(JobsOCOpenResultOpened));
    }
      failCompletionHandlerBlock:^{
        if (failCompletionHandlerBlock) failCompletionHandlerBlock(@(JobsOCOpenResultCannotOpen));
    }];
}

-(void)jobs_ocPushToSysConfig{
    self.jobs_ocOpenURL(UIApplicationOpenSettingsURLString);
}

-(jobsByIDBlock _Nonnull)jobs_ocOpenURL{
    @jobs_weakify(self)
    return ^(id _Nullable URLStr){
        @jobs_strongify(self)
        [self jobs_ocOpenURL:URLStr
                     options:@{}
successCompletionHandlerBlock:nil
  failCompletionHandlerBlock:nil];
    };
}

-(void)jobs_ocOpenURL:(id _Nullable)URLStr
successCompletionHandlerBlock:(jobsByIDBlock _Nullable)successCompletionHandlerBlock{
    [self jobs_ocOpenURL:URLStr
                 options:@{}
successCompletionHandlerBlock:^{
        if (successCompletionHandlerBlock) successCompletionHandlerBlock(@(JobsOCOpenResultOpened));
    }
  failCompletionHandlerBlock:nil];
}

-(void)jobs_ocOpenURL:(id _Nullable)URLStr
failCompletionHandlerBlock:(jobsByIDBlock _Nullable)failCompletionHandlerBlock{
    [self jobs_ocOpenURL:URLStr
                 options:@{}
successCompletionHandlerBlock:nil
  failCompletionHandlerBlock:^{
        if (failCompletionHandlerBlock) failCompletionHandlerBlock(@(JobsOCOpenResultCannotOpen));
    }];
}

-(void)jobs_ocOpenURL:(id _Nullable)URLStr
successCompletionHandlerBlock:(jobsByIDBlock _Nullable)successCompletionHandlerBlock
failCompletionHandlerBlock:(jobsByIDBlock _Nullable)failCompletionHandlerBlock{
    [self jobs_ocOpenURL:URLStr
                 options:@{}
successCompletionHandlerBlock:^{
        if (successCompletionHandlerBlock) successCompletionHandlerBlock(@(JobsOCOpenResultOpened));
    }
  failCompletionHandlerBlock:^{
        if (failCompletionHandlerBlock) failCompletionHandlerBlock(@(JobsOCOpenResultCannotOpen));
    }];
}

-(BOOL)jobs_ocOpenURL:(id _Nullable)URL
              options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *_Nullable)options
successCompletionHandlerBlock:(jobsByVoidBlock _Nullable)successCompletionHandlerBlock
failCompletionHandlerBlock:(jobsByVoidBlock _Nullable)failCompletionHandlerBlock{
    NSURL *openURL = [self jobs_ocURLWithValue:URL];
    if (!openURL || ![UIApplication.sharedApplication canOpenURL:openURL]) {
        if (failCompletionHandlerBlock) failCompletionHandlerBlock();
        return NO;
    }
    [UIApplication.sharedApplication openURL:openURL
                                     options:options ?: @{}
                           completionHandler:^(BOOL success) {
        if (success) {
            if (successCompletionHandlerBlock) successCompletionHandlerBlock();
        }else if (failCompletionHandlerBlock) failCompletionHandlerBlock();
    }];return YES;
}

-(NSURL *_Nullable)jobs_ocURLWithValue:(id _Nullable)value{
    if ([value isKindOfClass:NSURL.class]) return value;
    if ([value isKindOfClass:NSString.class]) return [JobsOCOpenConfiguration jobsURLWithString:value];
    return nil;
}

-(NSString *)jobs_ocSanitizedPhoneNumber:(NSString *_Nullable)telephoneNumber{
    if (![telephoneNumber isKindOfClass:NSString.class]) return @"";
    NSMutableString *phone = NSMutableString.string;
    for (NSUInteger idx = 0; idx < telephoneNumber.length; idx++) {
        unichar character = [telephoneNumber characterAtIndex:idx];
        if ([[NSCharacterSet decimalDigitCharacterSet] characterIsMember:character]) {
            [phone appendFormat:@"%C", character];
        }else if (character == '+' && !phone.length){
            [phone appendString:@"+"];
        }
    };return phone.copy;
}

-(UIViewController *_Nullable)jobs_ocTopViewController{
    UIViewController *rootViewController = jobsGetMainWindow().rootViewController;
    return [self jobs_ocTopViewControllerFrom:rootViewController];
}

-(UIViewController *_Nullable)jobs_ocTopViewControllerFrom:(UIViewController *_Nullable)viewController{
    if (!viewController) return nil;
    if (viewController.presentedViewController) return [self jobs_ocTopViewControllerFrom:viewController.presentedViewController];
    if ([viewController isKindOfClass:UINavigationController.class]) {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        return [self jobs_ocTopViewControllerFrom:navigationController.visibleViewController];
    }
    if ([viewController isKindOfClass:UITabBarController.class]) {
        UITabBarController *tabBarController = (UITabBarController *)viewController;
        return [self jobs_ocTopViewControllerFrom:tabBarController.selectedViewController];
    };return viewController;
}

@end
