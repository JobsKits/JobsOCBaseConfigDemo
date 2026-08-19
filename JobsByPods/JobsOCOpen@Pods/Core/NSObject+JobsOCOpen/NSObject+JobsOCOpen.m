//
//  NSObject+JobsOCOpen.m
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "NSObject+JobsOCOpen.h"

@interface _JobsOCOpenObjectMailProxy : NSObject <MFMailComposeViewControllerDelegate>

Prop_copy(nullable) jobsByVoidBlock completionHandlerBlock;
-(JobsRetIDByjobsByVoidBlockBlock _Nonnull)byCompletionHandlerBlock;

@end

@implementation _JobsOCOpenObjectMailProxy
-(JobsRetIDByjobsByVoidBlockBlock _Nonnull)byCompletionHandlerBlock{
    @jobs_weakify(self)
    return ^id(jobsByVoidBlock _Nullable completionHandlerBlock){
        @jobs_strongify(self)
        [self setCompletionHandlerBlock:completionHandlerBlock];
        return self;
    };
}

+(JobsRetIDByVoidBlock _Nonnull)shared{
    return ^id{
        static _JobsOCOpenObjectMailProxy *proxy = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            proxy = self.class.new;
        });return proxy;
    };
}

-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result
                       error:(NSError *)error{
    jobsByVoidBlock completion = self.completionHandlerBlock;
    [controller dismissViewControllerAnimated:YES completion:completion];
    self.byCompletionHandlerBlock(nil);
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
    ((_JobsOCOpenObjectMailProxy *)_JobsOCOpenObjectMailProxy.shared()).byCompletionHandlerBlock(completionHandlerBlock);
    vc.byMailComposeDelegate(((_JobsOCOpenObjectMailProxy *)_JobsOCOpenObjectMailProxy.shared()));
    UIViewController *host = self.jobs_ocTopViewController();
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
    NSString *phone = self.jobs_ocSanitizedPhoneNumber(telephoneNumber);
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

-(jobsByVoidBlock _Nonnull)jobs_ocPushToSysConfig{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.jobs_ocOpenURL(UIApplicationOpenSettingsURLString);
    };
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
    NSURL *openURL = self.jobs_ocURLWithValue(URL);
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

-(JobsRetNSURLByIDBlock _Nonnull)jobs_ocURLWithValue{
    @jobs_weakify(self)
    return ^NSURL *_Nullable(id _Nullable value){
        @jobs_strongify(self)
        if (!self) return nil;
        if ([value isKindOfClass:NSURL.class]) return value;
        if ([value isKindOfClass:NSString.class]) return JobsOCOpenConfiguration.jobsURLWithString(value);
        return nil;
    };
}

-(JobsRetStrByStrBlock _Nonnull)jobs_ocSanitizedPhoneNumber{
    @jobs_weakify(self)
    return ^NSString *(NSString *_Nullable telephoneNumber){
        @jobs_strongify(self)
        if (!self) return nil;
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
    };
}

-(JobsRetVCByVoidBlock _Nonnull)jobs_ocTopViewController{
    @jobs_weakify(self)
    return ^UIViewController *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        UIViewController *rootViewController = jobsGetMainWindow().rootViewController;
        return self.jobs_ocTopViewControllerFrom(rootViewController);
    };
}

-(JobsRetVCByVCBlock _Nonnull)jobs_ocTopViewControllerFrom{
    @jobs_weakify(self)
    return ^UIViewController *_Nullable(UIViewController *_Nullable viewController){
        @jobs_strongify(self)
        if (!self) return nil;
        if (!viewController) return nil;
        if (viewController.presentedViewController) return self.jobs_ocTopViewControllerFrom(viewController.presentedViewController);
        if ([viewController isKindOfClass:UINavigationController.class]) {
            UINavigationController *navigationController = (UINavigationController *)viewController;
            return self.jobs_ocTopViewControllerFrom(navigationController.visibleViewController);
        }
        if ([viewController isKindOfClass:UITabBarController.class]) {
            UITabBarController *tabBarController = (UITabBarController *)viewController;
            return self.jobs_ocTopViewControllerFrom(tabBarController.selectedViewController);
        };return viewController;
    };
}

@end
