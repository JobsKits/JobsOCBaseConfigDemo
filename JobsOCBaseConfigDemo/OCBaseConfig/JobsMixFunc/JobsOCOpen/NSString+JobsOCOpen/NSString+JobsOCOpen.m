//
//  NSString+JobsOCOpen.m
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "NSString+JobsOCOpen.h"

#import "NSString+Sys.h"

@interface _JobsOCOpenMailProxy : NSObject <MFMailComposeViewControllerDelegate>

Prop_copy(nullable) void (^completion)(JobsOCOpenResult result);
-(JobsRetIDByJobsOCOpenResultBlockBlock _Nonnull)byCompletion;

@end

@implementation _JobsOCOpenMailProxy
-(JobsRetIDByJobsOCOpenResultBlockBlock _Nonnull)byCompletion{
    @jobs_weakify(self)
    return ^id(jobsByJobsOCOpenResultBlock _Nullable completion){
        @jobs_strongify(self)
        [self setCompletion:completion];
        return self;
    };
}

+(JobsRetIDByVoidBlock _Nonnull)shared{
    return ^id{
        static _JobsOCOpenMailProxy *proxy = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            proxy = self.class.new;
        });return proxy;
    };
}

-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result
                       error:(NSError *)error{
    void (^completion)(JobsOCOpenResult result) = self.completion;
    [controller dismissViewControllerAnimated:YES completion:^{
        if (completion) completion(JobsOCOpenResultOpened);
    }];
    self.byCompletion(nil);
}

@end

@implementation NSString (JobsOCOpen)
-(JobsRetJobsOCOpenResultByVoidBlock _Nonnull)jobs_open{
    @jobs_weakify(self)
    return ^JobsOCOpenResult{
        @jobs_strongify(self)
        if (!self) return (JobsOCOpenResult){0};
        return [self jobs_openWithOptions:nil completion:nil];
    };
}

-(JobsOCOpenResult)jobs_openWithOptions:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *_Nullable)options
                             completion:(void (^_Nullable)(JobsOCOpenResult))completion{
    NSURL *url = JobsOCOpenConfiguration.jobsURLWithString(self);
    if (!url) {
        if (completion) completion(JobsOCOpenResultInvalidInput);
        return JobsOCOpenResultInvalidInput;
    }
    if (![UIApplication.sharedApplication canOpenURL:url]) {
        if (completion) completion(JobsOCOpenResultCannotOpen);
        return JobsOCOpenResultCannotOpen;
    }
    [UIApplication.sharedApplication openURL:url
                                     options:options ?: @{}
                           completionHandler:^(BOOL success) {
        if (completion) completion(success ? JobsOCOpenResultOpened : JobsOCOpenResultCannotOpen);
    }];return JobsOCOpenResultOpened;
}

-(JobsRetJobsOCOpenResultByVoidBlock _Nonnull)jobs_call{
    @jobs_weakify(self)
    return ^JobsOCOpenResult{
        @jobs_strongify(self)
        if (!self) return (JobsOCOpenResult){0};
        return [self jobs_callUsePrompt:NO completion:nil];
    };
}

-(JobsOCOpenResult)jobs_callUsePrompt:(BOOL)usePrompt
                           completion:(void (^_Nullable)(JobsOCOpenResult))completion{
#if TARGET_OS_SIMULATOR
    if (completion) completion(JobsOCOpenResultCannotOpen);
    return JobsOCOpenResultCannotOpen;
#else
    NSString *phone = self.jobs_sanitizedPhoneNumber();
    if (!phone.length) {
        if (completion) completion(JobsOCOpenResultInvalidInput);
        return JobsOCOpenResultInvalidInput;
    }
    NSString *scheme = usePrompt ? @"telprompt://" : @"tel://";
    NSURL *url = [NSURL URLWithString:[scheme stringByAppendingString:phone]];
    if (!url || ![UIApplication.sharedApplication canOpenURL:url]) {
        if (completion) completion(JobsOCOpenResultCannotOpen);
        return JobsOCOpenResultCannotOpen;
    }
    [UIApplication.sharedApplication openURL:url
                                     options:@{}
                           completionHandler:^(BOOL success) {
        if (completion) completion(success ? JobsOCOpenResultOpened : JobsOCOpenResultCannotOpen);
    }];return JobsOCOpenResultOpened;
#endif
}

-(JobsRetJobsOCOpenResultByVoidBlock _Nonnull)jobs_mail{
    @jobs_weakify(self)
    return ^JobsOCOpenResult{
        @jobs_strongify(self)
        if (!self) return (JobsOCOpenResult){0};
        return [self jobs_mailWithSubject:nil
                                     body:nil
                                   isHTML:NO
                                       cc:nil
                                      bcc:nil
                              presentFrom:nil
                               completion:nil];
    };
}

-(JobsOCOpenResult)jobs_mailWithSubject:(NSString *_Nullable)subject
                                   body:(NSString *_Nullable)body
                                 isHTML:(BOOL)isHTML
                                     cc:(NSArray<NSString *> *_Nullable)cc
                                    bcc:(NSArray<NSString *> *_Nullable)bcc
                            presentFrom:(UIViewController *_Nullable)presentFrom
                             completion:(void (^_Nullable)(JobsOCOpenResult))completion{
    NSArray<NSString *> *tos = self.jobs_parseEmails(self);
    if (!tos.count) {
        if (completion) completion(JobsOCOpenResultInvalidInput);
        return JobsOCOpenResultInvalidInput;
    }
    if (MFMailComposeViewController.canSendMail) {
        MFMailComposeViewController *mailVC = jobsMakeMFMailComposeVC(^(MFMailComposeViewController *object){});
        [mailVC setToRecipients:tos];
        if (subject.length) [mailVC setSubject:subject];
        if (body.length) [mailVC setMessageBody:body isHTML:isHTML];
        if (cc.count) [mailVC setCcRecipients:self.jobs_parseEmails([cc componentsJoinedByString:@","])];
        if (bcc.count) [mailVC setBccRecipients:self.jobs_parseEmails([bcc componentsJoinedByString:@","])];
        ((_JobsOCOpenMailProxy *)_JobsOCOpenMailProxy.shared()).byCompletion(completion);
        mailVC.byMailComposeDelegate(((_JobsOCOpenMailProxy *)_JobsOCOpenMailProxy.shared()));
        UIViewController *host = presentFrom ?: self.jobs_topViewController();
        if (!host) {
            if (completion) completion(JobsOCOpenResultCannotOpen);
            return JobsOCOpenResultCannotOpen;
        }
        [host presentViewController:mailVC animated:YES completion:nil];
        return JobsOCOpenResultOpened;
    }
    NSURL *mailtoURL = [self jobs_mailtoURLWithTo:tos subject:subject body:body cc:cc bcc:bcc];
    if (!mailtoURL || ![UIApplication.sharedApplication canOpenURL:mailtoURL]) {
        if (completion) completion(JobsOCOpenResultCannotOpen);
        return JobsOCOpenResultCannotOpen;
    }
    [UIApplication.sharedApplication openURL:mailtoURL
                                     options:@{}
                           completionHandler:^(BOOL success) {
        if (completion) completion(success ? JobsOCOpenResultOpened : JobsOCOpenResultCannotOpen);
    }];return JobsOCOpenResultOpened;
}

-(JobsRetNSArrayNSStringByNSStringBlock _Nonnull)jobs_parseEmails{
    @jobs_weakify(self)
    return ^NSArray<NSString *> *(NSString * string){
        @jobs_strongify(self)
        if (!self) return nil;
        NSMutableArray<NSString *> *emails = NSMutableArray.array;
        NSCharacterSet *separators = [NSCharacterSet characterSetWithCharactersInString:@",; \n\t"];
        for (NSString *item in [string componentsSeparatedByCharactersInSet:separators]) {
            NSString *email = item.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
            if (email.length) [emails addObject:email];
        };return emails.copy;
    };
}

-(JobsRetStrByVoidBlock _Nonnull)jobs_sanitizedPhoneNumber{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSMutableString *phone = NSMutableString.string;
        for (NSUInteger idx = 0; idx < self.length; idx++) {
            unichar character = [self characterAtIndex:idx];
            if ([[NSCharacterSet decimalDigitCharacterSet] characterIsMember:character]) {
                [phone appendFormat:@"%C", character];
            }else if (character == '+' && !phone.length){
                [phone appendString:@"+"];
            }
        };return phone.copy;
    };
}

-(NSURL *_Nullable)jobs_mailtoURLWithTo:(NSArray<NSString *> *)to
                                subject:(NSString *_Nullable)subject
                                   body:(NSString *_Nullable)body
                                     cc:(NSArray<NSString *> *_Nullable)cc
                                    bcc:(NSArray<NSString *> *_Nullable)bcc{
    NSMutableArray<NSURLQueryItem *> *items = NSMutableArray.array;
    if (subject.length) [items addObject:[NSURLQueryItem queryItemWithName:@"subject" value:subject]];
    if (body.length) [items addObject:[NSURLQueryItem queryItemWithName:@"body" value:body]];
    if (cc.count) [items addObject:[NSURLQueryItem queryItemWithName:@"cc" value:[cc componentsJoinedByString:@","]]];
    if (bcc.count) [items addObject:[NSURLQueryItem queryItemWithName:@"bcc" value:[bcc componentsJoinedByString:@","]]];
    NSURLComponents *components = NSURLComponents.new
        .byScheme(@"mailto")
        .byPath([to componentsJoinedByString:@","])
        .byQueryItems(items.count ? items : nil);
    return components.URL;
}

-(JobsRetVCByVoidBlock _Nonnull)jobs_topViewController{
    @jobs_weakify(self)
    return ^UIViewController *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        UIViewController *rootViewController = jobsGetMainWindow().rootViewController;
        return self.jobs_topViewControllerFrom(rootViewController);
    };
}

-(JobsRetVCByVCBlock _Nonnull)jobs_topViewControllerFrom{
    @jobs_weakify(self)
    return ^UIViewController *_Nullable(UIViewController *_Nullable viewController){
        @jobs_strongify(self)
        if (!self) return nil;
        if (!viewController) return nil;
        if (viewController.presentedViewController) return self.jobs_topViewControllerFrom(viewController.presentedViewController);
        if ([viewController isKindOfClass:UINavigationController.class]) {
            UINavigationController *navigationController = (UINavigationController *)viewController;
            return self.jobs_topViewControllerFrom(navigationController.visibleViewController);
        }
        if ([viewController isKindOfClass:UITabBarController.class]) {
            UITabBarController *tabBarController = (UITabBarController *)viewController;
            return self.jobs_topViewControllerFrom(tabBarController.selectedViewController);
        };return viewController;
    };
}

@end
