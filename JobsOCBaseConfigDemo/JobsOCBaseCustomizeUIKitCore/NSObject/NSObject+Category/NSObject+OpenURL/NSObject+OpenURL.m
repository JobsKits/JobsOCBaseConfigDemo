//
//  NSObject+OpenURL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2020/10/11.
//

#import "NSObject+OpenURL.h"

@implementation NSObject (OpenURL)
#pragma mark —— 发送邮件
/// @param mailComposeVC 外界自定义的发送邮件的VC，如传nil则用默认值
-(void)jobsSendMailWithComposeVC:(MFMailComposeViewController *_Nullable)mailComposeVC
          completionHandlerBlock:(jobsByVoidBlock _Nullable)completionHandlerBlock{
    if (MFMailComposeViewController.canSendMail) {
        [self.jobsGetCurrentViewController forceComingToPresentVC:mailComposeVC
                                                    requestParams:nil
                                                       completion:completionHandlerBlock];
    }else @"打开邮件失败,请确保设备上至少启用了一个电子邮件帐户！".tr.toast();
}
#pragma mark —— MFMessageComposeViewControllerDelegate
/// 推出页面的方式用presentViewController，pushViewController可能会崩溃
/// [self presentViewController:self.messageComposeVC animated:YES completion:nil];
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller
                 didFinishWithResult:(MessageComposeResult)result {
    [controller dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark —— MFMailComposeViewControllerDelegate
/// [self presentViewController:self.messageComposeVC animated:YES completion:nil];
-(void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
}
/// 调用系统电话☎️拨号功能，会以sheet的形式，确认后进行拨号
/// @param telephoneNumber 电话号码
/// @param dialFinishBackToApp 电话结束后是否会留在电话界面【tel留在打电话页面。telprompt返回App（上架App Store🈶被拒的案例）】
/// @param successCompletionHandlerBlock 成功回调
/// @param failCompletionHandlerBlock 失败回调
-(void)jobsDialWithTelephoneNumber:(NSString *_Nullable)telephoneNumber
               dialFinishBackToApp:(BOOL)dialFinishBackToApp
     successCompletionHandlerBlock:(jobsByIDBlock _Nullable)successCompletionHandlerBlock
        failCompletionHandlerBlock:(jobsByIDBlock _Nullable)failCompletionHandlerBlock{
    /// WKWebView默认禁止了跳转到appStore, 拨打电话, 唤起邮箱等一系列操作
    NSString *tel = dialFinishBackToApp ? @"telprompt://" : @"tel://";
    [NSObject jobsOpenURL:tel.add(telephoneNumber)
                  options:@{}
successCompletionHandlerBlock:^{
        if (successCompletionHandlerBlock) successCompletionHandlerBlock(@1);
    }
failCompletionHandlerBlock:^{
        if (failCompletionHandlerBlock) failCompletionHandlerBlock(@1);
    }];
}
#pragma mark —— 跳转系统设置
/// 在iOS10更新后，跳转到系统设置的具体的子页面被禁用，只能跳转到系统设置根目录
/// 但是苹果又更新了URLscheme，亲测不可用
-(void)jobsPushToSysConfig{
    self.jobsOpenURL(UIApplicationOpenSettingsURLString);
}
#pragma mark —— 安全打开URL
/// 软性打开URL：【不会处理打开成功和打开失败两种情况】如果URL有误则无法打开
-(jobsByIDBlock _Nonnull)jobsOpenURL{
    @jobs_weakify(self)
    return ^(id _Nullable URLStr){
        @jobs_strongify(self)
        [self jobsOpenURL:URLStr
                  options:@{}
    successCompletionHandlerBlock:nil
    failCompletionHandlerBlock:nil];
    };
}
/// 软性打开URL：【只处理打开成功的情况】
-(void)jobsOpenURL:(id _Nullable)URLStr
successCompletionHandlerBlock:(jobsByIDBlock _Nullable)successCompletionHandlerBlock{
    [self jobsOpenURL:URLStr
              options:@{}
successCompletionHandlerBlock:^{
        if (successCompletionHandlerBlock) successCompletionHandlerBlock(@1);
    }
failCompletionHandlerBlock:nil];
}
/// 软性打开URL：【只处理打开失败的情况】
-(void)jobsOpenURL:(id _Nullable)URLStr
failCompletionHandlerBlock:(jobsByIDBlock _Nullable)failCompletionHandlerBlock{
    [self jobsOpenURL:URLStr
              options:@{}
successCompletionHandlerBlock:nil
failCompletionHandlerBlock:^{
        if (failCompletionHandlerBlock) failCompletionHandlerBlock(@1);
    }];
}
/// 软性打开URL：【会处理打开成功和打开失败两种情况】如果URL有误，可以做其他事，比如打开一个备用URL
-(void)jobsOpenURL:(id _Nullable)URLStr
successCompletionHandlerBlock:(jobsByIDBlock _Nullable)successCompletionHandlerBlock
failCompletionHandlerBlock:(jobsByIDBlock _Nullable)failCompletionHandlerBlock{
    [self jobsOpenURL:URLStr
              options:@{}
successCompletionHandlerBlock:^{
        if (successCompletionHandlerBlock) successCompletionHandlerBlock(@1);
    }
failCompletionHandlerBlock:^{
        if (failCompletionHandlerBlock) failCompletionHandlerBlock(@1);
    }];
}
/// 硬性打开URL：【会处理打开成功和打开失败两种情况】如果URL有误，可以做其他事，比如打开一个备用URL
/// 可以接受NSString * 和 URL *
-(BOOL)jobsOpenURL:(id _Nullable)URL
           options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *_Nullable)options
successCompletionHandlerBlock:(jobsByVoidBlock _Nullable)successCompletionHandlerBlock
failCompletionHandlerBlock:(jobsByVoidBlock _Nullable)failCompletionHandlerBlock{
    if ([URL isKindOfClass:NSString.class]) {
        NSString *url = (NSString *)URL;
        if (isNull(url)) {
            @"URL为空，请检查！".tr.toast();
            return NO;
        }else{
            if (!url.jobsCanOpenUrl) {
                @"打开".tr.add(url).add(@"失败，请检查").toast();
                return url.jobsCanOpenUrl;
            }
        }
    }else if ([URL isKindOfClass:NSURL.class]){
        NSURL *url = (NSURL *)URL;
        if (!url.jobsCanOpenUrl) {
            @"打开".add(url.absoluteString).add(@"失败，请检查").toast();
            return url.jobsCanOpenUrl;
        }
    }else{
        @"URL类型不匹配，请检查".tr.toast();
        return NO;
    }
    NSURL *openURL = nil;
    if([URL isKindOfClass:NSURL.class]){
        openURL = URL;
    }else if ([URL isKindOfClass:NSString.class]){
        NSString *url = (NSString *)URL;
        openURL = url.jobsUrl;
    }else{}
    options = options ? options : @{};
    /// 打开的动作
    if (@available(iOS 10.0, *)) {
        if ([UIApplication.sharedApplication respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            if (openURL.jobsCanOpenUrl) {
                [UIApplication.sharedApplication openURL:openURL
                                                 options:options
                                       completionHandler:^(BOOL success) {
                    JobsLog(@"打开成功");
                    if (successCompletionHandlerBlock) successCompletionHandlerBlock();
                }];return YES;
            }else{
                if (failCompletionHandlerBlock) failCompletionHandlerBlock();
                return NO;
            }
        }else {
            if (failCompletionHandlerBlock) failCompletionHandlerBlock();
            return NO;
        }
    }else {
        if (openURL.jobsCanOpenUrl) {
            SuppressWdeprecatedDeclarationsWarning([UIApplication.sharedApplication openURL:openURL]);
        }else if (failCompletionHandlerBlock) failCompletionHandlerBlock();
        return openURL.jobsCanOpenUrl;
    }
}
#pragma mark —— Prop_strong()MFMessageComposeViewController *messageComposeVC;
JobsKey(_messageComposeVC)
@dynamic messageComposeVC;
-(MFMessageComposeViewController *)messageComposeVC{
    MFMessageComposeViewController *MessageComposeVC = Jobs_getAssociatedObject(_messageComposeVC);
    if (!MessageComposeVC) {
        @jobs_weakify(self)
        Jobs_setAssociatedRETAIN_NONATOMIC(_messageComposeVC, jobsMakeMFMessageComposeVC(^(__kindof MFMessageComposeViewController * _Nullable vc) {
            @jobs_strongify(self)
            /// 设置短信内容
            vc.body = @"吃饭了没".tr;
            /// 设置收件人列表
            vc.recipients = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                data.add(@"10010")
                .add(@"10086");
            });
            /// 设置代理
            vc.messageComposeDelegate = self;
        }))
    };return MessageComposeVC;
}

-(void)setMessageComposeVC:(MFMessageComposeViewController *)messageComposeVC{
    Jobs_setAssociatedRETAIN_NONATOMIC(_messageComposeVC, messageComposeVC)
}
#pragma mark —— Prop_strong()MFMailComposeViewController *mailComposeVC;
JobsKey(_mailComposeVC)
@dynamic mailComposeVC;
-(MFMailComposeViewController *)mailComposeVC{
    MFMailComposeViewController *MailComposeVC = Jobs_getAssociatedObject(_mailComposeVC);
    if (!MailComposeVC) {
        @jobs_weakify(self)
        Jobs_setAssociatedRETAIN_NONATOMIC(_mailComposeVC, jobsMakeMFMailComposeVC(^(__kindof MFMailComposeViewController * _Nullable vc) {
            @jobs_strongify(self)
            /// 设置邮件主题
            vc.subject = @"测试邮件".tr;
            /// 设置邮件内容
            [vc setMessageBody:@"测试内容".tr isHTML:NO];
            /// 设置收件人列表
            vc.toRecipients = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                data.add(@"test@qq.com");
            });
            /// 设置抄送人列表
            vc.ccRecipients = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                data.add(@"test1@qq.com");
            });
            /// 设置代理
            vc.mailComposeDelegate = self;
        }))
    };return MailComposeVC;
}

-(void)setMailComposeVC:(MFMailComposeViewController *)mailComposeVC{
    Jobs_setAssociatedRETAIN_NONATOMIC(_mailComposeVC, mailComposeVC)
}

@end
