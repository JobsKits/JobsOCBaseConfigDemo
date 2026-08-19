//
//  NSObject+JobsOCOpen.h
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_JOBSOCOPEN_F9D27E4A30
#define JOBS_HEADER_GUARD_NSOBJECT_JOBSOCOPEN_F9D27E4A30

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <MessageUI/MessageUI.h>
#import "JobsOCOpenConfiguration.h"

#if __has_include(<JobsGetWindow/JobsGetWindow.h>)
#import <JobsGetWindow/JobsGetWindow.h>
#else
#import "JobsGetWindow.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

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
-(jobsByVoidBlock _Nonnull)jobs_ocPushToSysConfig;
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
