//
//  SceneDelegate.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "SceneDelegate.h"
#import "SceneDelegate+UISceneDelegate.h"

API_AVAILABLE(ios(13.0))
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

@interface SceneDelegate ()

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN SceneDelegate
@interface SceneDelegate (JobsPropertyDSLSetterAutogen_ab301a8750)
-(void)setWindow:(UIWindow * _Nullable)data;
-(void)setWindowScene:(UIWindowScene * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END SceneDelegate

@implementation SceneDelegate
-(JobsRetSceneDelegateByWindowBlock _Nonnull)jobsSetWindow{
    @jobs_weakify(self)
    return ^SceneDelegate *_Nullable(UIWindow *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.byWindow(data);
        return self;
    };
}

-(JobsRetSceneDelegateByWindowSceneBlock _Nonnull)jobsSetWindowScene{
    @jobs_weakify(self)
    return ^SceneDelegate *_Nullable(UIWindowScene *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.byWindowScene(data);
        return self;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        @jobs_weakify(self)
        [self addNotificationName:UISceneWillConnectNotification
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            JobsLog(@"通知传递过来的 = %@",notification.object);
            self.jobsSetWindowScene((UIWindowScene *)notification.object);
        }];
    };return self;
}
#pragma mark —— lazyLoad

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN SceneDelegate
-(JobsRetSceneDelegateByWindowBlock _Nonnull)byWindow{
    @jobs_weakify(self)
    return ^__kindof SceneDelegate * _Nullable(UIWindow * _Nullable data){
        @jobs_strongify(self)
        [self setWindow:data];
        return self;
    };
}

-(JobsRetSceneDelegateByWindowSceneBlock _Nonnull)byWindowScene{
    @jobs_weakify(self)
    return ^__kindof SceneDelegate * _Nullable(UIWindowScene * _Nullable data){
        @jobs_strongify(self)
        [self setWindowScene:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END SceneDelegate
@end

#pragma clang diagnostic pop
