//
//  JobsMakeLocalNotification.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSMAKELOCALNOTIFICATION_7DF2F94DB3
#define JOBS_HEADER_GUARD_JOBSMAKELOCALNOTIFICATION_7DF2F94DB3

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h> // 提供本地通知和远程通知处理能力，是现代通知框架的统一入口。

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsMakeLocalNotification : NSObject

- (void)triggerLocalNotification:(JobsLocalNotificationModel *)localNotificationModel;

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
         completionHandler(UNAuthorizationOptionAlert + UNAuthorizationOptionSound);
     }

     @end
 */
#endif /* JOBS_HEADER_GUARD_JOBSMAKELOCALNOTIFICATION_7DF2F94DB3 */
