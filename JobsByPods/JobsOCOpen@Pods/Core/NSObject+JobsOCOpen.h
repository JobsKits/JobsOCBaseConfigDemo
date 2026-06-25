//
//  NSObject+JobsOCOpen.h
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_JOBSOCOPEN_F9D27E4A30
#define JOBS_HEADER_GUARD_NSOBJECT_JOBSOCOPEN_F9D27E4A30

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "JobsOCOpenConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JobsOCOpen)

/// 从旧 `NSObject+OpenURL` 提炼而来：展示邮件编辑器。
-(void)jobs_ocSendMailWithComposeVC:(MFMailComposeViewController *_Nullable)mailComposeVC
             completionHandlerBlock:(jobsByVoidBlock _Nullable)completionHandlerBlock;
/// 从旧 `NSObject+OpenURL` 提炼而来：拨号，默认建议 `tel://`，`telprompt://` 谨慎使用。
-(void)jobs_ocDialWithTelephoneNumber:(NSString *_Nullable)telephoneNumber
                  dialFinishBackToApp:(BOOL)dialFinishBackToApp
        successCompletionHandlerBlock:(jobsByIDBlock _Nullable)successCompletionHandlerBlock
           failCompletionHandlerBlock:(jobsByIDBlock _Nullable)failCompletionHandlerBlock;
/// 跳转系统设置根页。
-(void)jobs_ocPushToSysConfig;
/// 软性打开 URL，不关心成功失败。
-(jobsByIDBlock _Nonnull)jobs_ocOpenURL;
/// 软性打开 URL，只处理成功。
-(void)jobs_ocOpenURL:(id _Nullable)URLStr
successCompletionHandlerBlock:(jobsByIDBlock _Nullable)successCompletionHandlerBlock;
/// 软性打开 URL，只处理失败。
-(void)jobs_ocOpenURL:(id _Nullable)URLStr
failCompletionHandlerBlock:(jobsByIDBlock _Nullable)failCompletionHandlerBlock;
/// 软性打开 URL，同时处理成功失败。
-(void)jobs_ocOpenURL:(id _Nullable)URLStr
successCompletionHandlerBlock:(jobsByIDBlock _Nullable)successCompletionHandlerBlock
failCompletionHandlerBlock:(jobsByIDBlock _Nullable)failCompletionHandlerBlock;
/// 硬性打开 URL，返回本次触发动作是否可执行。
-(BOOL)jobs_ocOpenURL:(id _Nullable)URL
              options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *_Nullable)options
successCompletionHandlerBlock:(jobsByVoidBlock _Nullable)successCompletionHandlerBlock
failCompletionHandlerBlock:(jobsByVoidBlock _Nullable)failCompletionHandlerBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_JOBSOCOPEN_F9D27E4A30 */
