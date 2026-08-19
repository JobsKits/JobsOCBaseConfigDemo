//
//  NSObject+LiveChat.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+LiveChat.h"

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN LiveChat
@interface LiveChat (JobsLocalPropertyDSLAutogen_030501523c)
-(JobsRetLiveChatByNSStringBlock _Nonnull)byGroupId;
-(JobsRetLiveChatByNSStringBlock _Nonnull)byLicenseId;
-(void)setGroupId:(NSString * _Nullable)data;
-(void)setLicenseId:(NSString * _Nullable)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END LiveChat

@implementation NSObject (LiveChat)
#pragma mark —— 一些公有方法
-(jobsByVoidBlock _Nonnull)configLiveChat{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        LiveChat.byLicenseId(LiveChatKEY);
        LiveChat.byGroupId(@"77");
        LiveChat.byName(@"iOS Widget Example");
        LiveChat.byEmail(@"example@livechatinc.com");
        [LiveChat setVariableWithKey:@"First variable name" value:@"Some value"];
        [LiveChat setVariableWithKey:@"Second name" value:@"Other value"];
        LiveChat.byDelegate(self);
    };
}

-(jobsByVoidBlock _Nonnull)openChat{
    return ^(){
        [LiveChat presentChatWithAnimated:YES completion:nil];
    };
}

-(jobsByVoidBlock _Nonnull)clearSession{
    return ^(){
        [LiveChat clearSession];
    };
}
#pragma mark —— 一些私有方法
-(JobsRetAlertControllerByStringBlock _Nonnull)makeAlertControllerBy{
    @jobs_weakify(self)
    return ^__kindof UIAlertController *_Nullable(NSString *_Nullable string){
        UIAlertController *alertVC = JobsMakeAlertControllerBy(jobsMakeAlertModel(^(JobsAlertModel * _Nullable data) {
            data.byAlertControllerTitle(@"Support".jobsTr())
                .byMessage(string)
                .byPreferredStyle(UIAlertControllerStyleAlert);
        }));
        alertVC.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(JobsAlertModel *_Nullable data) {
            data.byAlertActionTitle(@"Go to Chat".jobsTr())
                .byAlertActionStyle(UIAlertActionStyleDefault)
                .byAlertActionBlock(^(__kindof UIAlertAction * _Nullable action) {
                if (!LiveChat.isChatPresented) [LiveChat presentChatWithAnimated:YES completion:nil];
            });
        })));
        alertVC.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(JobsAlertModel *_Nullable data) {
            data.byCancelAlertActionTitle(@"Cancel".jobsTr())
                .byAlertActionStyle(UIAlertActionStyleCancel)
                .byAlertActionBlock(^(__kindof UIAlertAction *_Nullable action) {
                @jobs_strongify(self)
                self.clearSession();
            });
        })));return alertVC;
    };
}
#pragma mark —— LiveChatDelegate
-(jobsByLiveChatMessageBlock _Nonnull)receivedWithMessage{
    @jobs_weakify(self)
    return ^(LiveChatMessage * message){
        @jobs_strongify(self)
        if (!self) return;
        if (!LiveChat.isChatPresented) {
            self.getCurrentViewController.comingToPresentVC(self.makeAlertControllerBy(message.text));
        }
    };
}

-(jobsByVoidBlock _Nonnull)chatPresented {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"Chat presented");
    };
}

-(jobsByVoidBlock _Nonnull)chatDismissed {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"Chat dismissed");
    };
}

-(jobsByErrBlock _Nonnull)chatLoadingFailedWith{
    @jobs_weakify(self)
    return ^(NSError * error){
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"Chat loading failure %@", error.localizedDescription);
    };
}

-(jobsByURLBlock _Nonnull)handleWithURL{
    @jobs_weakify(self)
    return ^(NSURL * URL){
        @jobs_strongify(self)
        if (!self) return;
        self.jobsOpenURL(URL);
    };
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN LiveChat
@implementation LiveChat (JobsLocalPropertyDSLAutogen_030501523c)
-(JobsRetLiveChatByNSStringBlock _Nonnull)byGroupId{
    @jobs_weakify(self)
    return ^__kindof LiveChat * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setGroupId:data];
        return self;
    };
}

-(JobsRetLiveChatByNSStringBlock _Nonnull)byLicenseId{
    @jobs_weakify(self)
    return ^__kindof LiveChat * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setLicenseId:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END LiveChat
