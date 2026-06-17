//
//  MFMessageComposeViewController+DSL.m
//  JobsOCBaseConfigDemo
//
#import "MFMessageComposeViewController+DSL.h"

@implementation MFMessageComposeViewController (JobsChain)
+(JobsRetBOOLByVoidBlock)byCanSendText{
    return ^BOOL(void){
        return [self canSendText];
    };
}

+(JobsRetMessageComposeVCByStrBlock)byMessageComposeViewControllerWithBody{
    return ^__kindof MFMessageComposeViewController *_Nullable(NSString *_Nullable data){
        MFMessageComposeViewController *vc = [[self alloc] init];
        vc.body = data;
        return vc;
    };
}

-(JobsRetMessageComposeVCByDelegateBlock)byMessageComposeDelegate{
    @jobs_weakify(self)
    return ^__kindof MFMessageComposeViewController *_Nullable(id<MFMessageComposeViewControllerDelegate> _Nullable data){
        @jobs_strongify(self)
        self.messageComposeDelegate = data;
        return self;
    };
}

-(JobsRetMessageComposeVCByArrBlock)byRecipients{
    @jobs_weakify(self)
    return ^__kindof MFMessageComposeViewController *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.recipients = data;
        return self;
    };
}

-(JobsRetMessageComposeVCByStrBlock)byBody{
    @jobs_weakify(self)
    return ^__kindof MFMessageComposeViewController *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.body = data;
        return self;
    };
}

-(JobsRetMessageComposeVCByBOOLBlock)byDisableUserAttachments{
    @jobs_weakify(self)
    return ^__kindof MFMessageComposeViewController *_Nullable(BOOL data){
        @jobs_strongify(self)
        (void)data;
        return self;
    };
}

@end
