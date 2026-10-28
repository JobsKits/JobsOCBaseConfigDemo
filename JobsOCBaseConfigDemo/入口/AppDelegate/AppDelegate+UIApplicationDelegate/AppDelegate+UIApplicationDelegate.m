//
//  AppDelegate+UIApplicationDelegate.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate+UIApplicationDelegate.h"

//#import "AppDelegate+UISceneSessionLifeCycle.h"

@implementation AppDelegate (UIApplicationDelegate)

#pragma mark —— UIApplicationDelegate
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    JobsOCDeviceGuardLaunchDecision *decision = JobsOCDeviceGuardLaunchGate.prepare();
    if (decision.blocked) {
        NSLog(@"[DeviceGuardLaunch] 已阻断业务初始化，等待Scene展示拦截页");
        return YES;
    }
    NSLog(@"[DeviceGuardLaunch] 已放行启动，verdict=%@", JobsOCDeviceGuardVerdictName(decision.report.verdict));
    (((JobsOCCrashLogCenter *)JobsOCCrashLogCenter.jobsSharedManager())).startMonitoring();
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
    if (JobsOCDeviceGuardLaunchGate.decision.blocked) {
        return UIInterfaceOrientationMaskPortrait;
    }
    return JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape ? JobsAppTool.currentInterfaceOrientationMask : UIInterfaceOrientationMaskPortrait;
}
/// 系统版本低于iOS13.0的设备
-(jobsByUIApplicationBlock _Nonnull)applicationDidEnterBackground{
    @jobs_weakify(self)
    return ^(UIApplication * application){
        @jobs_strongify(self)
        if (!self || JobsOCDeviceGuardLaunchGate.decision.blocked) {
            return;
        }
        ((JobsOCCrashLogCenter *)JobsOCCrashLogCenter.jobsSharedManager()).markSafeExitPoint();
        JobsLog(@"---applicationDidEnterBackground----");// 进入后台
        JobsPostNotification(退到后台停止播放ZFPlayer, nil);
    };
}
/// 系统版本低于iOS13.0的设备
-(jobsByUIApplicationBlock _Nonnull)applicationDidBecomeActive{
    @jobs_weakify(self)
    return ^(UIApplication * application){
        @jobs_strongify(self)
        if (!self || JobsOCDeviceGuardLaunchGate.decision.blocked) {
            return;
        }
        ((JobsOCCrashLogCenter *)JobsOCCrashLogCenter.jobsSharedManager()).markAppLaunched();
        JobsLog(@"---applicationDidBecomeActive----");// 进入前台
    };
}

-(void)applicationWillTerminate:(UIApplication *)application{
    ((((jobsByUIApplicationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(AppDelegate.class, @selector(applicationWillTerminate)))(self, @selector(applicationWillTerminate))))(application);
}
-(jobsByUIApplicationBlock _Nonnull)applicationWillTerminate{
    @jobs_weakify(self)
    return ^(UIApplication * application){
        @jobs_strongify(self)
        if (!self || JobsOCDeviceGuardLaunchGate.decision.blocked) {
            return;
        }
        ((JobsOCCrashLogCenter *)JobsOCCrashLogCenter.jobsSharedManager()).markSafeExitPoint();
    };
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    if (JobsOCDeviceGuardLaunchGate.decision.blocked) {
        return;
    }
}

- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error {
    if (JobsOCDeviceGuardLaunchGate.decision.blocked) {
        return;
    }
    JobsLog(@"Fail to register for remote notifications. error:%@",error);
}

@end
