//
//  NSString+JobsOCOpen.m
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "NSString+JobsOCOpen.h"
#import <JobsOCOpen/NSString+Sys.h>

@interface _JobsOCOpenMailProxy : NSObject <MFMailComposeViewControllerDelegate>

Prop_copy(nullable) void (^completion)(JobsOCOpenResult result);

@end

@implementation _JobsOCOpenMailProxy
+(instancetype)shared{
    static _JobsOCOpenMailProxy *proxy = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        proxy = self.class.new;
    });return proxy;
}

-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result
                       error:(NSError *)error{
    void (^completion)(JobsOCOpenResult result) = self.completion;
    [controller dismissViewControllerAnimated:YES completion:^{
        if (completion) completion(JobsOCOpenResultOpened);
    }];
    self.completion = nil;
}

@end

@implementation NSString (JobsOCOpen)
-(JobsOCOpenResult)jobs_open{
    return [self jobs_openWithOptions:nil completion:nil];
}

-(JobsOCOpenResult)jobs_openWithOptions:(NSDictionary<UIApplicationOpenExternalURLOptionsKey,id> *_Nullable)options
                             completion:(void (^_Nullable)(JobsOCOpenResult))completion{
    NSURL *url = [JobsOCOpenConfiguration jobsURLWithString:self];
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

-(JobsOCOpenResult)jobs_call{
    return [self jobs_callUsePrompt:NO completion:nil];
}

-(JobsOCOpenResult)jobs_callUsePrompt:(BOOL)usePrompt
                           completion:(void (^_Nullable)(JobsOCOpenResult))completion{
#if TARGET_OS_SIMULATOR
    if (completion) completion(JobsOCOpenResultCannotOpen);
    return JobsOCOpenResultCannotOpen;
#else
    NSString *phone = [self jobs_sanitizedPhoneNumber];
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

-(JobsOCOpenResult)jobs_mail{
    return [self jobs_mailWithSubject:nil
                                 body:nil
                               isHTML:NO
                                   cc:nil
                                  bcc:nil
                          presentFrom:nil
                           completion:nil];
}

-(JobsOCOpenResult)jobs_mailWithSubject:(NSString *_Nullable)subject
                                   body:(NSString *_Nullable)body
                                 isHTML:(BOOL)isHTML
                                     cc:(NSArray<NSString *> *_Nullable)cc
                                    bcc:(NSArray<NSString *> *_Nullable)bcc
                            presentFrom:(UIViewController *_Nullable)presentFrom
                             completion:(void (^_Nullable)(JobsOCOpenResult))completion{
    NSArray<NSString *> *tos = [self jobs_parseEmails:self];
    if (!tos.count) {
        if (completion) completion(JobsOCOpenResultInvalidInput);
        return JobsOCOpenResultInvalidInput;
    }
    if (MFMailComposeViewController.canSendMail) {
        MFMailComposeViewController *mailVC = MFMailComposeViewController.new;
        [mailVC setToRecipients:tos];
        if (subject.length) [mailVC setSubject:subject];
        if (body.length) [mailVC setMessageBody:body isHTML:isHTML];
        if (cc.count) [mailVC setCcRecipients:[self jobs_parseEmails:[cc componentsJoinedByString:@","]]];
        if (bcc.count) [mailVC setBccRecipients:[self jobs_parseEmails:[bcc componentsJoinedByString:@","]]];
        _JobsOCOpenMailProxy.shared.completion = completion;
        mailVC.mailComposeDelegate = _JobsOCOpenMailProxy.shared;
        UIViewController *host = presentFrom ?: [self jobs_topViewController];
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

-(NSArray<NSString *> *)jobs_parseEmails:(NSString *)string{
    NSMutableArray<NSString *> *emails = NSMutableArray.array;
    NSCharacterSet *separators = [NSCharacterSet characterSetWithCharactersInString:@",; \n\t"];
    for (NSString *item in [string componentsSeparatedByCharactersInSet:separators]) {
        NSString *email = item.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
        if (email.length) [emails addObject:email];
    };return emails.copy;
}

-(NSString *)jobs_sanitizedPhoneNumber{
    NSMutableString *phone = NSMutableString.string;
    for (NSUInteger idx = 0; idx < self.length; idx++) {
        unichar character = [self characterAtIndex:idx];
        if ([[NSCharacterSet decimalDigitCharacterSet] characterIsMember:character]) {
            [phone appendFormat:@"%C", character];
        }else if (character == '+' && !phone.length){
            [phone appendString:@"+"];
        }
    };return phone.copy;
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
    NSURLComponents *components = NSURLComponents.new;
    components.scheme = @"mailto";
    components.path = [to componentsJoinedByString:@","];
    components.queryItems = items.count ? items : nil;
    return components.URL;
}

-(UIViewController *_Nullable)jobs_topViewController{
    UIViewController *rootViewController = jobsGetMainWindow().rootViewController;
    return [self jobs_topViewControllerFrom:rootViewController];
}

-(UIViewController *_Nullable)jobs_topViewControllerFrom:(UIViewController *_Nullable)viewController{
    if (!viewController) return nil;
    if (viewController.presentedViewController) return [self jobs_topViewControllerFrom:viewController.presentedViewController];
    if ([viewController isKindOfClass:UINavigationController.class]) {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        return [self jobs_topViewControllerFrom:navigationController.visibleViewController];
    }
    if ([viewController isKindOfClass:UITabBarController.class]) {
        UITabBarController *tabBarController = (UITabBarController *)viewController;
        return [self jobs_topViewControllerFrom:tabBarController.selectedViewController];
    };return viewController;
}

@end
