//
//  MFMailComposeViewController+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#ifndef JOBS_HEADER_GUARD_MFMAILCOMPOSEVIEWCONTROLLER_DSL
#define JOBS_HEADER_GUARD_MFMAILCOMPOSEVIEWCONTROLLER_DSL

#import <MessageUI/MessageUI.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
@interface MFMailComposeViewController (JobsChain)

+(JobsRetBOOLByVoidBlock _Nonnull)byCanSendMail;
+(JobsRetMailComposeVCByStrBlock _Nonnull)byMailComposeViewControllerWithSubject;
-(JobsRetMailComposeVCByDelegateBlock _Nonnull)byMailComposeDelegate;
-(JobsRetMailComposeVCByStrBlock _Nonnull)bySetSubject;
-(JobsRetMailComposeVCByArrBlock _Nonnull)bySetToRecipients;
-(JobsRetMailComposeVCByArrBlock _Nonnull)bySetCcRecipients;
-(JobsRetMailComposeVCByArrBlock _Nonnull)bySetBccRecipients;

@end
NS_ASSUME_NONNULL_END
#endif
