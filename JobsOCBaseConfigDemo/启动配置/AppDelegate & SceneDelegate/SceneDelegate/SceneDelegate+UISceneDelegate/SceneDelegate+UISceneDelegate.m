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
    if (![scene isKindOfClass:UIWindowScene.class]) {
        return;
    }
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.jobsSetWindowScene(windowScene);
    NSUserActivity *restorationActivity =
        [JobsOCSceneCoordinator demoActivityFromConnectionOptions:connectionOptions
                                                          session:session];
    self.jobsSetWindow(UIWindow.initByScene(windowScene)).window
        .byWindowFrame(windowScene.coordinateSpace.bounds)
        .byRootViewController(restorationActivity ?
            [JobsOCSceneDelegateDemoVC.alloc
                initWithRestorationActivity:restorationActivity].navCtrl() :
            JobsOCMakeAppRootViewController())
        .byMakeKeyAndVisible();
    [JobsOCSceneCoordinator recordEvent:@"willConnect：创建独立 UIWindow"
                             forSession:session];
    if (!restorationActivity) {
        ((AppDelegate *)UIApplication.sharedApplication.delegate).makeJobsLaunchAdConfig(self.window);
    }
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
        self.jobsSetWindow(nil);
        self.jobsSetWindowScene(nil);
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
        ((AppDelegate *)UIApplication.sharedApplication.delegate).saveContext();
        // 单个窗口退后台不代表整个进程已退后台。
        for (UIScene *connectedScene in UIApplication.sharedApplication.connectedScenes) {
            if (connectedScene != scene &&
                (connectedScene.activationState == UISceneActivationStateForegroundActive ||
                 connectedScene.activationState == UISceneActivationStateForegroundInactive)) {
                return;
            }
        }
        JobsLog(@"---applicationDidEnterBackground----");
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
    JobsOCSceneDelegateDemoVC *demoVC = self.jobs_sceneDemoViewController();
    if (demoVC) {
        demoVC.restoreSceneInteractionStateWithActivity(stateRestorationActivity);
    }
    [JobsOCSceneCoordinator recordEvent:@"restoreInteractionState：恢复 Scene 独立计数"
                             forSession:scene.session];
}

- (void)scene:(UIScene *)scene continueUserActivity:(NSUserActivity *)userActivity {
    if (scene != self.windowScene || !JobsOCSceneCoordinator.isDemoActivity(userActivity)) {
        return;
    }
    JobsOCSceneDelegateDemoVC *demoVC = self.jobs_sceneDemoViewController();
    if (demoVC) {
        demoVC.restoreSceneInteractionStateWithActivity(userActivity);
    } else {
        self.window.byRootViewController([JobsOCSceneDelegateDemoVC.alloc
            initWithRestorationActivity:userActivity].navCtrl());
    }
    [JobsOCSceneCoordinator recordEvent:@"continueUserActivity：恢复当前 Scene 独立计数"
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
