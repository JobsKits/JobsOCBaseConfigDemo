//
//  AppDelegate+UISceneSessionLifeCycle.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate.h"
#import "SceneDelegate.h"
#import "JobsOCSceneCoordinator.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (UISceneSessionLifeCycle)<UIApplicationDelegate>

@end

NS_ASSUME_NONNULL_END
