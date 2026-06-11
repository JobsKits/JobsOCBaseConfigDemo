//
//  LocalNotificationsVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "JobsMakeLocalNotification.h"

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface LocalNotificationsVC : BaseViewController

@end

NS_ASSUME_NONNULL_END
/**
 额外的，还需要配置 AppDelegate
 
 @import UserNotifications;

 @interface AppDelegate () <UNUserNotificationCenterDelegate>
 @end

 @implementation AppDelegate

 - (BOOL)application:(NSApplication *)application didFinishLaunchingWithOptions:(NSDictionary<NSApplicationLaunchOptionsKey, id> *)launchOptions {
     UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
     center.delegate = self;
     [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound + UNAuthorizationOptionBadge)
                           completionHandler:^(BOOL granted, NSError * _Nullable error) {
         if (granted) {
             JobsLog(@"Notification permission granted.");
         } else {
             JobsLog(@"Notification permission denied.");
         }
     }];
     
     return YES;
 }

 // Handle notification when app is running
 - (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    if(completionHandler) completionHandler(UNAuthorizationOptionAlert + UNAuthorizationOptionSound);
 }

 @end

 */
