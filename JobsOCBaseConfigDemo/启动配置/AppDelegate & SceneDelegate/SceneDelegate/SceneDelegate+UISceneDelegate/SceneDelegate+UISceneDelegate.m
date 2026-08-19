//
//  SceneDelegate+UISceneDelegate.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月30日，星期四.
//

#import "SceneDelegate+UISceneDelegate.h"

@implementation SceneDelegate (UISceneDelegate)
#pragma mark —— UIWindowSceneDelegate
- (void)scene:(UIScene *)scene
willConnectToSession:(UISceneSession *)session
      options:(UISceneConnectionOptions *)connectionOptions {
    self.jobsSetWindowScene((UIWindowScene *)scene);
    NSUserActivity *restorationActivity =
        [JobsOCSceneCoordinator demoActivityFromConnectionOptions:connectionOptions
                                                          session:session];
    @jobs_weakify(self)
    [((MyAppTools *)MyAppTools.jobsSharedManager()) appDelegateWindowBlock:nil
                            sceneDelegateWindowBlock:^(id _Nullable data) {
        @jobs_strongify(self);
        UIWindowScene *ws = (UIWindowScene *)scene;
        // 窗口兜底
        self.jobsSetWindow((UIWindow *)data ?: [UIWindow.alloc initWithWindowScene:ws]).window
            .byWindowScene(ws)
            .byWindowFrame(ws.coordinateSpace.bounds)
            .byRootViewController(restorationActivity ?
                [JobsOCSceneDelegateDemoVC.alloc
                    initWithRestorationActivity:restorationActivity].navCtrl() :
                JobsOCMakeAppRootViewController())
            .byMakeKeyAndVisible();
        [JobsOCSceneCoordinator recordEvent:@"willConnect：创建独立 UIWindow"
                                 forSession:session];
        AppDelegate.launchFunc1();
    }];
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    ((((jobsByUISceneBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(SceneDelegate.class, @selector(sceneDidDisconnect)))(self, @selector(sceneDidDisconnect))))(scene);
}
-(jobsByUISceneBlock _Nonnull)sceneDidDisconnect{
    @jobs_weakify(self)
    return ^(UIScene * scene){
        @jobs_strongify(self)
        if (!self) return;
        [JobsOCSceneCoordinator recordEvent:@"didDisconnect：Scene 与会话暂时断开"
                                 forSession:scene.session];
    };
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
    ((((jobsByUISceneBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(SceneDelegate.class, @selector(sceneDidBecomeActive)))(self, @selector(sceneDidBecomeActive))))(scene);
}
-(jobsByUISceneBlock _Nonnull)sceneDidBecomeActive{
    @jobs_weakify(self)
    return ^(UIScene * scene){
        @jobs_strongify(self)
        if (!self) return;
        [JobsOCSceneCoordinator recordEvent:@"didBecomeActive：开始接收用户事件"
                                 forSession:scene.session];
        JobsLog(@"---applicationDidBecomeActive----");//进入前台
    };
}

- (void)sceneWillResignActive:(UIScene *)scene {
    ((((jobsByUISceneBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(SceneDelegate.class, @selector(sceneWillResignActive)))(self, @selector(sceneWillResignActive))))(scene);
}
-(jobsByUISceneBlock _Nonnull)sceneWillResignActive{
    @jobs_weakify(self)
    return ^(UIScene * scene){
        @jobs_strongify(self)
        if (!self) return;
        [JobsOCSceneCoordinator recordEvent:@"willResignActive：即将暂停交互"
                                 forSession:scene.session];
    };
}

- (void)sceneWillEnterForeground:(UIScene *)scene {
    ((((jobsByUISceneBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(SceneDelegate.class, @selector(sceneWillEnterForeground)))(self, @selector(sceneWillEnterForeground))))(scene);
}
-(jobsByUISceneBlock _Nonnull)sceneWillEnterForeground{
    @jobs_weakify(self)
    return ^(UIScene * scene){
        @jobs_strongify(self)
        if (!self) return;
        [JobsOCSceneCoordinator recordEvent:@"willEnterForeground：即将进入前台"
                                 forSession:scene.session];
    };
}

- (void)sceneDidEnterBackground:(UIScene *)scene {
    ((((jobsByUISceneBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(SceneDelegate.class, @selector(sceneDidEnterBackground)))(self, @selector(sceneDidEnterBackground))))(scene);
}
-(jobsByUISceneBlock _Nonnull)sceneDidEnterBackground{
    @jobs_weakify(self)
    return ^(UIScene * scene){
        @jobs_strongify(self)
        if (!self) return;
        [JobsOCSceneCoordinator recordEvent:@"didEnterBackground：进入后台安全点"
                                 forSession:scene.session];
        JobsLog(@"---applicationDidEnterBackground----"); //进入后台
        ((AppDelegate *)UIApplication.sharedApplication.delegate).saveContext();
        JobsPostNotification(退到后台停止播放ZFPlayer, nil);
    };
}

- (NSUserActivity *)stateRestorationActivityForScene:(UIScene *)scene {
    return ((((JobsRetNSUserActivityByUISceneBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(SceneDelegate.class, @selector(stateRestorationActivityForScene)))(self, @selector(stateRestorationActivityForScene))))(scene);
}
-(JobsRetNSUserActivityByUISceneBlock _Nonnull)stateRestorationActivityForScene{
    @jobs_weakify(self)
    return ^NSUserActivity *(UIScene * scene){
        @jobs_strongify(self)
        if (!self) return nil;
        JobsOCSceneDelegateDemoVC *demoVC = self.jobs_sceneDemoViewController();
        if (demoVC) return demoVC.sceneRestorationActivity();
        return JobsOCSceneCoordinator.isDemoActivity(scene.userActivity) ?
            scene.userActivity :
            nil;
    };
}

- (void)scene:(UIScene *)scene
restoreInteractionStateWithUserActivity:(NSUserActivity *)stateRestorationActivity {
    if (!JobsOCSceneCoordinator.isDemoActivity(stateRestorationActivity)) return;
    (self.jobs_sceneDemoViewController()).restoreSceneInteractionStateWithActivity(stateRestorationActivity);
    [JobsOCSceneCoordinator recordEvent:@"restoreInteractionState：恢复 Scene 独立计数"
                             forSession:scene.session];
}

- (JobsRetJobsOCSceneDelegateDemoVCByVoidBlock _Nonnull)jobs_sceneDemoViewController {
    @jobs_weakify(self)
    return ^JobsOCSceneDelegateDemoVC *{
        @jobs_strongify(self)
        if (!self) return nil;
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
    };
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
