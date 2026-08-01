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

@implementation SceneDelegate
-(instancetype)init{
    if (self = [super init]) {
        @jobs_weakify(self)
        [self addNotificationName:UISceneWillConnectNotification
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            JobsLog(@"通知传递过来的 = %@",notification.object);
            self.windowScene = notification.object;
        }];
    };return self;
}
#pragma mark —— lazyLoad

@end

#pragma clang diagnostic pop
