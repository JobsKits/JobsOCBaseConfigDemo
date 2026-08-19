//
//  AppDelegate+UIApplicationDelegate.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2021/12/15.
//

#import "AppDelegate+UIApplicationDelegate.h"

//#import "AppDelegate+UISceneSessionLifeCycle.h"

@implementation AppDelegate (UIApplicationDelegate)
#pragma mark —— UIApplicationDelegate
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    JXScaleSetup(375.0, 812.0);
//    JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight;
//    JobsAppTool.currentDeviceOrientation = UIDeviceOrientationLandscapeLeft | UIDeviceOrientationLandscapeRight;
//    JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskLandscapeRight;
//    JobsAppTool.jobsDeviceOrientation = DeviceOrientationLandscape;
    self.localNotifications();
    self.launchFunc2();
    AppDelegate.launchFunc1();          // 如遇“重复副作用”，可改到 SceneDelegate，或在此加 @available 保护
    if (@available(iOS 13.0, *)) {
        // 👉 iOS 13+ 由 SceneDelegate 负责挂窗，这里不再创建 window
        return YES;
    }
    // 👉 iOS 12 及以下，沿用原有逻辑创建 window
    self.jobsSetWindow(jobsMakeAppDelegateWindow(^(__kindof UIWindow * _Nullable window) {
        window
            .byRootViewController(RootViewController)
            .byMakeKeyAndVisible();
    })); return YES;
}
/// 一进入App就横屏 【此方法会执行多次】
- (UIInterfaceOrientationMask)application:(UIApplication *)application
  supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape ? JobsAppTool.currentInterfaceOrientationMask : UIInterfaceOrientationMaskPortrait;
}
/// 系统版本低于iOS13.0的设备
-(jobsByUIApplicationBlock _Nonnull)applicationDidEnterBackground{
    @jobs_weakify(self)
    return ^(UIApplication * application){
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"---applicationDidEnterBackground----");// 进入后台
        JobsPostNotification(退到后台停止播放ZFPlayer, nil);
    };
}
/// 系统版本低于iOS13.0的设备
-(jobsByUIApplicationBlock _Nonnull)applicationDidBecomeActive{
    @jobs_weakify(self)
    return ^(UIApplication * application){
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"---applicationDidBecomeActive----");// 进入前台
    };
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
}

- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error {
    JobsLog(@"Fail to register for remote notifications. error:%@",error);
}

@end
