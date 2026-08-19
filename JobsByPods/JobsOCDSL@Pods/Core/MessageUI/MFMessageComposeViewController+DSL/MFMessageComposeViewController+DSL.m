//
//  MFMessageComposeViewController+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "MFMessageComposeViewController+DSL.h"

@implementation MFMessageComposeViewController (JobsChain)
+(JobsRetBOOLByVoidBlock _Nonnull)byCanSendText{
    return ^BOOL(void){
        return [self canSendText];
    };
}

+(JobsRetMessageComposeVCByStrBlock _Nonnull)byMessageComposeViewControllerWithBody{
    return ^__kindof MFMessageComposeViewController *_Nullable(NSString *_Nullable data){
        MFMessageComposeViewController *vc = [[self alloc] init];
        vc.body = data;
        return vc;
    };
}

-(JobsRetMessageComposeVCByDelegateBlock _Nonnull)byMessageComposeDelegate{
    @jobs_weakify(self)
    return ^__kindof MFMessageComposeViewController *_Nullable(id<MFMessageComposeViewControllerDelegate> _Nullable data){
        @jobs_strongify(self)
        self.messageComposeDelegate = data;
        return self;
    };
}

-(JobsRetMessageComposeVCByArrBlock _Nonnull)byRecipients{
    @jobs_weakify(self)
    return ^__kindof MFMessageComposeViewController *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.recipients = data;
        return self;
    };
}

-(JobsRetMessageComposeVCByStrBlock _Nonnull)byBody{
    @jobs_weakify(self)
    return ^__kindof MFMessageComposeViewController *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.body = data;
        return self;
    };
}

-(JobsRetMessageComposeVCByBOOLBlock _Nonnull)byDisableUserAttachments{
    @jobs_weakify(self)
    return ^__kindof MFMessageComposeViewController *_Nullable(BOOL data){
        @jobs_strongify(self)
        (void)data;
        return self;
    };
}

@end
