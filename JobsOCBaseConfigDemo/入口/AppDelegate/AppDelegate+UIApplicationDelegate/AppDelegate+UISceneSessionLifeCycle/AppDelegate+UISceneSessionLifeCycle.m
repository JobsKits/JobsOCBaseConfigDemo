//
//  AppDelegate+UISceneSessionLifeCycle.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate+UISceneSessionLifeCycle.h"

@implementation AppDelegate (UISceneSessionLifeCycle)
#pragma mark —— UIScene Support
- (UISceneConfiguration *)application:(UIApplication *)application
configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession
                              options:(UISceneConnectionOptions *)options {
    UISceneConfiguration *configuration =
        [UISceneConfiguration.alloc initWithName:@"Default Configuration"
                                     sessionRole:connectingSceneSession.role];
    configuration.delegateClass = SceneDelegate.class;
    return configuration;
}

- (void)application:(UIApplication *)application
didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    [JobsOCSceneCoordinator discardSessions:sceneSessions];
}

@end
