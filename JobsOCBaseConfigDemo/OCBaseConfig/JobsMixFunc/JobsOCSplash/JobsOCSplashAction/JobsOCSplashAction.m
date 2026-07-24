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
+(__kindof JobsOCSplashAction *)none {
    JobsOCSplashAction *action = JobsOCSplashAction.alloc.init;
    action.type = JobsOCSplashActionTypeNone;
    return action;
}

+(__kindof JobsOCSplashAction *)openURL:(NSURL *)URL {
    JobsOCSplashAction *action = JobsOCSplashAction.alloc.init;
    action.type = JobsOCSplashActionTypeOpenURL;
    action.URL = URL;
    return action;
}

+(__kindof JobsOCSplashAction *)custom:(JobsOCSplashActionBlock)block {
    JobsOCSplashAction *action = JobsOCSplashAction.alloc.init;
    action.type = JobsOCSplashActionTypeCustom;
    action.customBlock = block;
    return action;
}

-(id)copyWithZone:(NSZone *)zone {
    JobsOCSplashAction *action = [[JobsOCSplashAction allocWithZone:zone] init];
    action.type = self.type;
    action.URL = self.URL;
    action.customBlock = self.customBlock;
    action.opensExternally = self.opensExternally;
    return action;
}

-(JobsOCSplashAction *(^)(BOOL))byOpensExternally {
    return ^JobsOCSplashAction *(BOOL data) {
        self.opensExternally = data;
        return self;
    };
}

-(void)performWithSplashVC:(__kindof JobsOCSplashVC *)splashVC {
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
}

@end
