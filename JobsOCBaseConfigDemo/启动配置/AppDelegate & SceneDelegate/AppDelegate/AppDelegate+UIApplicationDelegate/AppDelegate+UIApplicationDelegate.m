//
//  AppDelegate+UIApplicationDelegate.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2021年12月15日，星期三.
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
    AppDelegate.launchFunc1();
    // 当前最低部署版本为 iOS 16.6，窗口统一交给 SceneDelegate。
    return YES;
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
