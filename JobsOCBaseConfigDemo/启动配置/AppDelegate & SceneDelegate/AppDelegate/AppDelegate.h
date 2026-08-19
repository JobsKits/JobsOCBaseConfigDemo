//
//  AppDelegate.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2021/11/16.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <CoreData/CoreData.h>
#import "BaseProtocol.h"
#import "JobsTabBarVC.h"
#import "JobsCustomTabBarConfig.h"
#import "LZTabBarController.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@import UserNotifications;/// 配置本地通知

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
/// 一个iOS应用程序App的生命周期里面，只有一个AppDelegate实例存在
/// 但是可能有多个SceneDelegate实例存在
#import "JobsDefineProperty.h"

@interface AppDelegate : UIResponder
<
UIApplicationDelegate,
UNUserNotificationCenterDelegate,
BaseProtocol
>
/// UI
Prop_strong()UIWindow *window;/// 仅仅为了iOS 13 版本向下兼容而存在
/// Data
Prop_strong(readonly)NSPersistentCloudKitContainer *persistentContainer;
Prop_assign()BOOL allowOrentitaionRotation;

+(instancetype)sharedManager;
+(JobsRetAppDelegateByVoidBlock _Nonnull)jobsSharedManager;
-(JobsRetAppDelegateByWindowBlock _Nonnull)jobsSetWindow;
-(jobsByVoidBlock _Nonnull)saveContext;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN AppDelegate
-(JobsRetAppDelegateByWindowBlock _Nonnull)byWindow;
+(JobsRetAppDelegateByNSMutableArrayNSStringBlock _Nonnull)byTabBarItemTitleMutArr;
+(void)setTabBarItemTitleMutArr:(NSMutableArray <__kindof NSString *>* _Nullable)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END AppDelegate
@end

#pragma clang diagnostic pop
