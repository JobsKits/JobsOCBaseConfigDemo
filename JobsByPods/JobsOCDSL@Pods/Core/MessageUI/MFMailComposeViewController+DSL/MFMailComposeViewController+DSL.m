//
//  MFMailComposeViewController+DSL.m
//  JobsOCDSL
//
#import "MFMailComposeViewController+DSL.h"

@implementation MFMailComposeViewController (JobsChain)
+(JobsRetBOOLByVoidBlock)byCanSendMail{
    return ^BOOL(void){
        return [self canSendMail];
    };
}

+(JobsRetMailComposeVCByStrBlock)byMailComposeViewControllerWithSubject{
    return ^__kindof MFMailComposeViewController *_Nullable(NSString *_Nullable data){
        MFMailComposeViewController *vc = [[self alloc] init];
        [vc setSubject:data ?: @""];
        return vc;
    };
}

-(JobsRetMailComposeVCByDelegateBlock)byMailComposeDelegate{
    @jobs_weakify(self)
    return ^__kindof MFMailComposeViewController *_Nullable(id<MFMailComposeViewControllerDelegate> _Nullable data){
        @jobs_strongify(self)
        self.mailComposeDelegate = data;
        return self;
    };
}

-(JobsRetMailComposeVCByStrBlock)bySetSubject{
    @jobs_weakify(self)
    return ^__kindof MFMailComposeViewController *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        [self setSubject:data ?: @""];
        return self;
    };
}

-(JobsRetMailComposeVCByArrBlock)bySetToRecipients{
    @jobs_weakify(self)
    return ^__kindof MFMailComposeViewController *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        [self setToRecipients:data];
        return self;
    };
}

-(JobsRetMailComposeVCByArrBlock)bySetCcRecipients{
    @jobs_weakify(self)
    return ^__kindof MFMailComposeViewController *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        [self setCcRecipients:data];
        return self;
    };
}

-(JobsRetMailComposeVCByArrBlock)bySetBccRecipients{
    @jobs_weakify(self)
    return ^__kindof MFMailComposeViewController *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        [self setBccRecipients:data];
        return self;
    };
}

@end
