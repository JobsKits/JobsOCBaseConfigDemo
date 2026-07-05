//
//  NSString+JobsOCOpen.h
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_JOBSOCOPEN_6787358AA7
#define JOBS_HEADER_GUARD_NSSTRING_JOBSOCOPEN_6787358AA7

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "JobsOCOpenConfiguration.h"

#if __has_include(<JobsGetWindow/JobsGetWindow.h>)
#import <JobsGetWindow/JobsGetWindow.h>
#else
#import "JobsGetWindow.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JobsOCOpen)

-(JobsOCOpenResult)jobs_open;
-(JobsOCOpenResult)jobs_openWithOptions:(NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *_Nullable)options
                             completion:(void (^_Nullable)(JobsOCOpenResult result))completion;
-(JobsOCOpenResult)jobs_call;
-(JobsOCOpenResult)jobs_callUsePrompt:(BOOL)usePrompt
                           completion:(void (^_Nullable)(JobsOCOpenResult result))completion;
-(JobsOCOpenResult)jobs_mail;
-(JobsOCOpenResult)jobs_mailWithSubject:(NSString *_Nullable)subject
                                   body:(NSString *_Nullable)body
                                 isHTML:(BOOL)isHTML
                                     cc:(NSArray<NSString *> *_Nullable)cc
                                    bcc:(NSArray<NSString *> *_Nullable)bcc
                            presentFrom:(UIViewController *_Nullable)presentFrom
                             completion:(void (^_Nullable)(JobsOCOpenResult result))completion;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_JOBSOCOPEN_6787358AA7 */
