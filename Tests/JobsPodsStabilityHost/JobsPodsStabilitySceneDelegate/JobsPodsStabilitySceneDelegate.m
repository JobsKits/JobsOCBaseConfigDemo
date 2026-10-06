//
//  JobsPodsStabilitySceneDelegate.m
//  JobsPodsStabilityHost
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsPodsStabilitySceneDelegate.h"

@implementation JobsPodsStabilitySceneDelegate

- (void)scene:(UIScene *)scene
    willConnectToSession:(UISceneSession *)session
                 options:(UISceneConnectionOptions *)connectionOptions {
    (void)session;
    (void)connectionOptions;
    if (![scene isKindOfClass:UIWindowScene.class]) {
        return;
    }
    // 测试宿主只依赖 UIKit；独立创建空场景，不加载业务 App 和其外部服务。
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    self.window.rootViewController = UIViewController.new;
    [self.window makeKeyAndVisible];
}

@end
