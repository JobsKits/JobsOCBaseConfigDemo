//
//  AppDelegate.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h> // 提供对象图管理与本地持久化能力，用于数据建模、存储和查询。
#import "JobsTabBarVC.h"
#import "JobsCustomTabBarConfig.h"
#import "LZTabBarController.h"

@import UserNotifications; // 配置本地通知

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
/// 一个iOS应用程序App的生命周期里面，只有一个AppDelegate实例存在
/// 但是可能有多个SceneDelegate实例存在

@interface AppDelegate : UIResponder
<
UIApplicationDelegate,
UNUserNotificationCenterDelegate,
BaseProtocol
>
/// UI
Prop_strong()UIWindow *window; // 仅仅为了iOS 13 版本向下兼容而存在
/// Data
Prop_strong(readonly)NSPersistentCloudKitContainer *persistentContainer;
Prop_assign()BOOL allowOrentitaionRotation;

+(instancetype)sharedManager;
+(JobsRetAppDelegateByVoidBlock _Nonnull)jobsSharedManager;
-(JobsRetAppDelegateByWindowBlock _Nonnull)jobsSetWindow;
-(jobsByVoidBlock _Nonnull)saveContext;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN AppDelegate
-(JobsRetAppDelegateByWindowBlock _Nonnull)byWindow;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END AppDelegate
@end

#pragma clang diagnostic pop
