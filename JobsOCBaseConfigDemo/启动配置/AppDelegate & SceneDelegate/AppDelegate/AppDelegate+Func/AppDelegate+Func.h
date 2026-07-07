//
//  AppDelegate+Func.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate.h"
//#import "SceneDelegate.h"
#import "NSObject+UserInfo.h"
@import CocoaLumberjack;
#if DEBUG
//#if __has_include(<DoraemonManager/DoraemonManager.h>)
//#import <DoraemonKit/DoraemonManager.h>
//#else
//#import "DoraemonManager.h"
//#endif
#endif
/// 检查联网情况
#if __has_include(<Reachability/Reachability.h>)
#import <Reachability/Reachability.h>
#else
#import "Reachability.h"
#endif
#import "NSString+Reachability.h"

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#if __has_include(<IQKeyboardManager/IQKeyboardManager.h>)
#import <IQKeyboardManager/IQKeyboardManager.h>
#else
#import "IQKeyboardManager.h"
#endif

#if __has_include(<KTVHTTPCache/KTVHTTPCache.h>)
#import <KTVHTTPCache/KTVHTTPCache.h>
#else
#import "KTVHTTPCache.h"
#endif

#if __has_include(<TABAnimated/TABAnimated.h>)
#import <TABAnimated/TABAnimated.h>
#else
#import "TABAnimated.h"
#endif

#import "JobsByOCPods.h"

#import "JobsMakes.h"

#import "JobsOCKeyboardMgr.h"

#import "JobsBlock.h"

#import "JobsOCTools.h"

#import "JobsOCDSL.h"

#import "JobsDefines.h"

#import "JobsNavBarHeader.h"

#import "JobsOCSplash.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (Func)
<
UNUserNotificationCenterDelegate
>
#pragma mark —— 启动调用功能
+(jobsByVoidBlock _Nonnull)launchFunc1;
-(jobsByVoidBlock _Nonnull)launchFunc2;
#pragma mark —— 开屏广告
-(jobsByVoidBlock _Nonnull)makeJobsLaunchAdConfig;
#pragma mark —— YTKNetworkConfig
-(jobsByVoidBlock _Nonnull)YTKNetworkConfig;
#pragma mark —— 欢迎引导页面
-(jobsByVoidBlock _Nonnull)guide;
#pragma mark —— 存取用户信息Demo
-(jobsByVoidBlock _Nonnull)saveAndReadUserInfoDemo;
#pragma mark —— 读取Plist配置文件
-(jobsByVoidBlock _Nonnull)readPlistConfig;
#pragma mark —— 全局配置 TABAnimated
-(jobsByVoidBlock _Nonnull)makeTABAnimatedConfig;
#pragma mark —— 全局配置键盘
-(jobsByVoidBlock _Nonnull)makeJobsOCKeyboardMgrConfig;
-(jobsByVoidBlock _Nonnull)makeIQKeyboardManagerConfig;
#pragma mark —— 全局配置GKNavigationBar
-(jobsByVoidBlock _Nonnull)makeGKNavigationBarConfig;
#pragma mark —— 本地推送通知
-(jobsByVoidBlock _Nonnull)localNotifications;
#pragma mark —— 网络环境监测
-(jobsByVoidBlock _Nonnull)makeReachabilityConfig;

@end

NS_ASSUME_NONNULL_END
