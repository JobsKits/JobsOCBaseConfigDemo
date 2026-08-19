//
//  JobsOCSplashAction.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsOCSplashAction.h"

#import "JobsOCSplashVC.h"

@interface JobsOCSplashAction ()

Prop_assign() JobsOCSplashActionType type;
Prop_strong(nullable) NSURL *URL;
Prop_copy(nullable) JobsOCSplashActionBlock customBlock;

@end

@implementation JobsOCSplashAction
-(JobsRetJobsOCSplashActionByActionTypeBlock _Nonnull)byType{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashAction *_Nullable(JobsOCSplashActionType data){
        @jobs_strongify(self)
        self.type = data;
        return self;
    };
}

-(JobsRetJobsOCSplashActionByNSURLBlock _Nonnull)byURL{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashAction *_Nullable(NSURL *_Nullable data){
        @jobs_strongify(self)
        self.URL = data;
        return self;
    };
}

-(JobsRetJobsOCSplashActionByJobsOCSplashActionBlockBlock _Nonnull)byCustomBlock{
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashAction *_Nullable(JobsOCSplashActionBlock data){
        @jobs_strongify(self)
        self.customBlock = data;
        return self;
    };
}

+(JobsRetJobsOCSplashActionByVoidBlock _Nonnull)none {
    return ^__kindof JobsOCSplashAction *{
        return JobsOCSplashAction.alloc.init.byType(JobsOCSplashActionTypeNone);
    };
}

+(JobsRetJobsOCSplashActionByNSURLBlock _Nonnull)openURL{
    return ^__kindof JobsOCSplashAction *(NSURL * URL){
        return JobsOCSplashAction.alloc.init
            .byType(JobsOCSplashActionTypeOpenURL)
            .byURL(URL);
    };
}

+(JobsRetJobsOCSplashActionByJobsOCSplashActionBlockBlock _Nonnull)custom{
    return ^__kindof JobsOCSplashAction *(JobsOCSplashActionBlock block){
        return JobsOCSplashAction.alloc.init
            .byType(JobsOCSplashActionTypeCustom)
            .byCustomBlock(block);
    };
}

-(id)copyWithZone:(NSZone *)zone {
    return [[JobsOCSplashAction allocWithZone:zone] init]
        .byType(self.type)
        .byURL(self.URL)
        .byCustomBlock(self.customBlock)
        .byOpensExternally(self.opensExternally);
}

-(JobsRetJobsOCSplashActionByBOOLBlock _Nonnull)byOpensExternally {
    @jobs_weakify(self)
    return ^__kindof JobsOCSplashAction *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.opensExternally = data;
        return self;
    };
}

-(JobsOCSplashActionBlock _Nonnull)performWithSplashVC{
    @jobs_weakify(self)
    return ^(__kindof JobsOCSplashVC * splashVC){
        @jobs_strongify(self)
        if (!self) return;
        switch (self.type) {
            /// 处理 JobsOCSplashActionTypeOpenURL 分支
            case JobsOCSplashActionTypeOpenURL: {
                if (!self.URL) return;
                UIApplication *application = UIApplication.sharedApplication;
                if (@available(iOS 10.0, *)) {
                    [application openURL:self.URL options:@{} completionHandler:nil];
                } else {
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
                    [application openURL:self.URL];
    #pragma clang diagnostic pop
                }
            } break;
            /// 处理 JobsOCSplashActionTypeCustom 分支
            case JobsOCSplashActionTypeCustom:
                if (self.customBlock) self.customBlock(splashVC);
                break;
            /// 处理 JobsOCSplashActionTypeNone 分支
            case JobsOCSplashActionTypeNone:
                break;
        }
    };
}

@end
