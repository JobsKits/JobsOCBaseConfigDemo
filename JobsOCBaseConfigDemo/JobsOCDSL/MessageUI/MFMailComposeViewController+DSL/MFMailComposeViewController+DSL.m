//
//  MFMailComposeViewController+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "MFMailComposeViewController+DSL.h"

@implementation MFMailComposeViewController (JobsChain)
+(JobsRetBOOLByVoidBlock _Nonnull)byCanSendMail{
    return ^BOOL(void){
        return [self canSendMail];
    };
}

+(JobsRetMailComposeVCByStrBlock _Nonnull)byMailComposeViewControllerWithSubject{
    return ^__kindof MFMailComposeViewController *_Nullable(NSString *_Nullable data){
        MFMailComposeViewController *vc = [[self alloc] init];
        [vc setSubject:data ?: @""];
        return vc;
    };
}

-(JobsRetMailComposeVCByDelegateBlock _Nonnull)byMailComposeDelegate{
    @jobs_weakify(self)
    return ^__kindof MFMailComposeViewController *_Nullable(id<MFMailComposeViewControllerDelegate> _Nullable data){
        @jobs_strongify(self)
        self.mailComposeDelegate = data;
        return self;
    };
}

-(JobsRetMailComposeVCByStrBlock _Nonnull)bySetSubject{
    @jobs_weakify(self)
    return ^__kindof MFMailComposeViewController *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        [self setSubject:data ?: @""];
        return self;
    };
}

-(JobsRetMailComposeVCByArrBlock _Nonnull)bySetToRecipients{
    @jobs_weakify(self)
    return ^__kindof MFMailComposeViewController *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        [self setToRecipients:data];
        return self;
    };
}

-(JobsRetMailComposeVCByArrBlock _Nonnull)bySetCcRecipients{
    @jobs_weakify(self)
    return ^__kindof MFMailComposeViewController *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        [self setCcRecipients:data];
        return self;
    };
}

-(JobsRetMailComposeVCByArrBlock _Nonnull)bySetBccRecipients{
    @jobs_weakify(self)
    return ^__kindof MFMailComposeViewController *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        [self setBccRecipients:data];
        return self;
    };
}

@end
