//
//  SceneDelegate+UISceneDelegate.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import "AppDelegate+Func.h"
#import "AppDelegate+TabBarCtr.h"
#import "MyAppTools.h"

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsAppTools/JobsAppToolsHeader.h>)
#import <JobsAppTools/JobsAppToolsHeader.h>
#else
#import "JobsAppToolsHeader.h"
#endif

#if __has_include(<JobsOCTools/JobsOCTools.h>)
#import <JobsOCTools/JobsOCTools.h>
#else
#import "JobsOCTools.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SceneDelegate (UISceneDelegate)<UIWindowSceneDelegate>

@end

NS_ASSUME_NONNULL_END
