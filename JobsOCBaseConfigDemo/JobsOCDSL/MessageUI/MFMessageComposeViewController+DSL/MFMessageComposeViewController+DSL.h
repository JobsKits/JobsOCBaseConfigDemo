//
//  MFMessageComposeViewController+DSL.h
//  JobsOCDSL
//
#ifndef JOBS_HEADER_GUARD_MFMESSAGECOMPOSEVIEWCONTROLLER_DSL
#define JOBS_HEADER_GUARD_MFMESSAGECOMPOSEVIEWCONTROLLER_DSL

#import <MessageUI/MessageUI.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
@interface MFMessageComposeViewController (JobsChain)

+(JobsRetBOOLByVoidBlock _Nonnull)byCanSendText;
+(JobsRetMessageComposeVCByStrBlock _Nonnull)byMessageComposeViewControllerWithBody;
-(JobsRetMessageComposeVCByDelegateBlock _Nonnull)byMessageComposeDelegate;
-(JobsRetMessageComposeVCByArrBlock _Nonnull)byRecipients;
-(JobsRetMessageComposeVCByStrBlock _Nonnull)byBody;
-(JobsRetMessageComposeVCByBOOLBlock _Nonnull)byDisableUserAttachments;

@end
NS_ASSUME_NONNULL_END
#endif
