//
//  NSObject+OpenURL.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_OPENURL_6C82E8331F
#define JOBS_HEADER_GUARD_NSOBJECT_OPENURL_6C82E8331F

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h> // 发短信、发邮件
#import <JobsByOCPods/NSObject+Extra.h>
#import <JobsByOCPods/NSString+Check.h>
#import <JobsByOCPods/NSString+Toast.h>
#import <JobsByOCPods/NSString+Replace.h>
#import <JobsByOCPods/NSString+URL.h>
#import <JobsByOCPods/NSMutableArray+Extra.h>
#import <JobsByOCPods/NSURL+Extra.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<WHToastExtra/WHToastExtra.h>)
#import <WHToastExtra/WHToastExtra.h>
#else
#import "WHToastExtra.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (OpenURL)
<
MFMessageComposeViewControllerDelegate
,MFMailComposeViewControllerDelegate
>
/// 发短信、发邮件系统专用VC
Prop_strong()MFMessageComposeViewController *messageComposeVC;
Prop_strong()MFMailComposeViewController *mailComposeVC;
#pragma mark —— 发送邮件
/// @param mailComposeVC 外界自定义的发送邮件的VC，如传nil则用默认值
-(void)jobsSendMailWithComposeVC:(MFMailComposeViewController *_Nullable)mailComposeVC
          completionHandlerBlock:(jobsByVoidBlock _Nullable)completionHandlerBlock;
/// 调用系统电话☎️拨号功能，会以sheet的形式，确认后进行拨号
/// @param telephoneNumber 电话号码
/// @param dialFinishBackToApp 电话结束后是否会留在电话界面【tel留在打电话页面。telprompt返回App（上架App Store🈶被拒的案例）】
/// @param successCompletionHandlerBlock 成功回调
/// @param failCompletionHandlerBlock 失败回调
-(void)jobsDialWithTelephoneNumber:(NSString *_Nullable)telephoneNumber
               dialFinishBackToApp:(BOOL)dialFinishBackToApp
     successCompletionHandlerBlock:(jobsByIDBlock _Nullable)successCompletionHandlerBlock
        failCompletionHandlerBlock:(jobsByIDBlock _Nullable)failCompletionHandlerBlock;
#pragma mark —— 跳转系统设置
/// 在iOS10更新后，跳转到系统设置的具体的子页面被禁用，只能跳转到系统设置根目录
/// 但是苹果又更新了URLscheme，亲测不可用
-(jobsByVoidBlock _Nonnull)jobsPushToSysConfig;
#pragma mark —— 安全打开URL
/// 软性打开URL：【不会处理打开成功和打开失败两种情况】如果URL有误则无法打开
/// 可以接受NSString * 和 URL *
-(jobsByIDBlock _Nonnull)jobsOpenURL;
/// 软性打开URL：【只处理打开成功的情况】
/// 可以接受NSString * 和 URL *
-(void)jobsOpenURL:(id _Nullable)URLStr
successCompletionHandlerBlock:(jobsByIDBlock _Nullable)successCompletionHandlerBlock;
/// 软性打开URL：【只处理打开失败的情况】
/// 可以接受NSString * 和 URL *
-(void)jobsOpenURL:(id _Nullable)URLStr
failCompletionHandlerBlock:(jobsByIDBlock _Nullable)failCompletionHandlerBlock;
/// 软性打开URL：【会处理打开成功和打开失败两种情况】如果URL有误，可以做其他事，比如打开一个备用URL
/// 可以接受NSString * 和 URL *
-(void)jobsOpenURL:(id _Nullable)URLStr
successCompletionHandlerBlock:(jobsByIDBlock _Nullable)successCompletionHandlerBlock
failCompletionHandlerBlock:(jobsByIDBlock _Nullable)failCompletionHandlerBlock;
/// 硬性打开URL：【会处理打开成功和打开失败两种情况】如果URL有误，可以做其他事，比如打开一个备用URL
/// 可以接受NSString * 和 URL *
-(BOOL)jobsOpenURL:(id _Nullable)URL
           options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *_Nullable)options
successCompletionHandlerBlock:(jobsByVoidBlock _Nullable)successCompletionHandlerBlock
failCompletionHandlerBlock:(jobsByVoidBlock _Nullable)failCompletionHandlerBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_OPENURL_6C82E8331F */
