//
//  JobsPodsStabilitySceneDelegate.m
//  JobsOCStabilitySupport
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsPodsStabilitySceneDelegate.h"

// 用途：实现 Pods 稳定性测试宿主的空白 Scene，只提供 UIKit 窗口，不初始化业务服务。
// 运行：由原生单元测试 target 编译，供隔离测试场景复用；主 App 不使用。

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
