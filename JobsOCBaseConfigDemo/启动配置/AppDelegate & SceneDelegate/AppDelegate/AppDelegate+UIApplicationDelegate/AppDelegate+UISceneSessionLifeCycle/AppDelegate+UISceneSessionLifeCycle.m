//
//  AppDelegate+UISceneSessionLifeCycle.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月30日，星期四.
//

#import "AppDelegate+UISceneSessionLifeCycle.h"

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN UISceneConfiguration
@interface UISceneConfiguration (JobsLocalPropertyDSLAutogen_15c9507897)
-(JobsRetUISceneConfigurationByClassBlock _Nonnull)byDelegateClass;
-(void)setDelegateClass:(Class _Nullable)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END UISceneConfiguration

@implementation AppDelegate (UISceneSessionLifeCycle)
#pragma mark —— UIScene Support
- (UISceneConfiguration *)application:(UIApplication *)application
configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession
                              options:(UISceneConnectionOptions *)options {
    UISceneConfiguration *configuration =
        [UISceneConfiguration.alloc initWithName:@"Default Configuration"
                                     sessionRole:connectingSceneSession.role];
    configuration.byDelegateClass(SceneDelegate.class);
    return configuration;
}

- (void)application:(UIApplication *)application
didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    JobsOCSceneCoordinator.discardSessions(sceneSessions);
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UISceneConfiguration
@implementation UISceneConfiguration (JobsLocalPropertyDSLAutogen_15c9507897)
-(JobsRetUISceneConfigurationByClassBlock _Nonnull)byDelegateClass{
    @jobs_weakify(self)
    return ^__kindof UISceneConfiguration * _Nullable(Class _Nullable data){
        @jobs_strongify(self)
        [self setDelegateClass:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UISceneConfiguration
