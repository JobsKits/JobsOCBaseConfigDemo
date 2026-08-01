//
//  SceneDelegate+UISceneDelegate.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "SceneDelegate+UISceneDelegate.h"

@implementation SceneDelegate (UISceneDelegate)
#pragma mark —— UIWindowSceneDelegate
- (void)scene:(UIScene *)scene
willConnectToSession:(UISceneSession *)session
      options:(UISceneConnectionOptions *)connectionOptions {
    self.windowScene = (UIWindowScene *)scene;
    NSUserActivity *restorationActivity =
        [JobsOCSceneCoordinator demoActivityFromConnectionOptions:connectionOptions
                                                          session:session];
    @jobs_weakify(self)
    [MyAppTools.sharedManager appDelegateWindowBlock:nil
                            sceneDelegateWindowBlock:^(id _Nullable data) {
        @jobs_strongify(self);
        UIWindowScene *ws = (UIWindowScene *)scene;
        // 窗口兜底
        self.window = (UIWindow *)data ?: [UIWindow.alloc initWithWindowScene:ws];
        self.window.windowScene = ws;
        self.window.byFrame(ws.coordinateSpace.bounds);
        self.window.rootViewController = restorationActivity ?
            [[JobsOCSceneDelegateDemoVC.alloc
                initWithRestorationActivity:restorationActivity] navCtrl] :
            JobsOCMakeAppRootViewController();
        [self.window makeKeyAndVisible];
        [JobsOCSceneCoordinator recordEvent:@"willConnect：创建独立 UIWindow"
                                 forSession:session];
        AppDelegate.launchFunc1();
    }];
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    [JobsOCSceneCoordinator recordEvent:@"didDisconnect：Scene 与会话暂时断开"
                             forSession:scene.session];
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
    [JobsOCSceneCoordinator recordEvent:@"didBecomeActive：开始接收用户事件"
                             forSession:scene.session];
    [JobsOCCrashLogCenter.sharedManager markAppLaunched];
    JobsLog(@"---applicationDidBecomeActive----");//进入前台
}

- (void)sceneWillResignActive:(UIScene *)scene {
    [JobsOCSceneCoordinator recordEvent:@"willResignActive：即将暂停交互"
                             forSession:scene.session];
}

- (void)sceneWillEnterForeground:(UIScene *)scene {
    [JobsOCSceneCoordinator recordEvent:@"willEnterForeground：即将进入前台"
                             forSession:scene.session];
}

- (void)sceneDidEnterBackground:(UIScene *)scene {
    [JobsOCSceneCoordinator recordEvent:@"didEnterBackground：进入后台安全点"
                             forSession:scene.session];
    [JobsOCCrashLogCenter.sharedManager markSafeExitPoint];
    JobsLog(@"---applicationDidEnterBackground----"); //进入后台
    [(AppDelegate *)UIApplication.sharedApplication.delegate saveContext];
    JobsPostNotification(退到后台停止播放ZFPlayer, nil);
}

- (NSUserActivity *)stateRestorationActivityForScene:(UIScene *)scene {
    JobsOCSceneDelegateDemoVC *demoVC = [self jobs_sceneDemoViewController];
    if (demoVC) return demoVC.sceneRestorationActivity;
    return [JobsOCSceneCoordinator isDemoActivity:scene.userActivity] ?
        scene.userActivity :
        nil;
}

- (void)scene:(UIScene *)scene
restoreInteractionStateWithUserActivity:(NSUserActivity *)stateRestorationActivity {
    if (![JobsOCSceneCoordinator isDemoActivity:stateRestorationActivity]) return;
    [[self jobs_sceneDemoViewController]
        restoreSceneInteractionStateWithActivity:stateRestorationActivity];
    [JobsOCSceneCoordinator recordEvent:@"restoreInteractionState：恢复 Scene 独立计数"
                             forSession:scene.session];
}

- (JobsOCSceneDelegateDemoVC *)jobs_sceneDemoViewController {
    UIViewController *viewController = self.window.rootViewController;
    BOOL keepsFinding = YES;
    while (viewController && keepsFinding) {
        if (viewController.presentedViewController) {
            viewController = viewController.presentedViewController;
        } else if ([viewController isKindOfClass:UINavigationController.class]) {
            viewController = ((UINavigationController *)viewController).visibleViewController;
        } else if ([viewController isKindOfClass:UITabBarController.class]) {
            viewController = ((UITabBarController *)viewController).selectedViewController;
        } else {
            keepsFinding = NO;
        }
    }
    return [viewController isKindOfClass:JobsOCSceneDelegateDemoVC.class] ?
        (JobsOCSceneDelegateDemoVC *)viewController :
        nil;
}
// ✅ 横竖切换 / 尺寸变化时，随场景更新窗口 Frame（防止再次出现半屏）
- (void)windowScene:(UIWindowScene *)windowScene
didUpdateCoordinateSpace:(id<UICoordinateSpace>)previousCoordinateSpace
interfaceOrientation:(UIInterfaceOrientation)previousInterfaceOrientation
   traitCollection:(UITraitCollection *)previousTraitCollection {
    if (windowScene == self.window.windowScene) {
        self.window.byFrame(windowScene.coordinateSpace.bounds);
        self.window.rootViewController.view.byFrame(self.window.bounds);
    }
}

@end
