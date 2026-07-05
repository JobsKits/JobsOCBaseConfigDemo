//
//  AppDelegate+UIApplicationDelegate.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate.h"
#import "AppDelegate+Func.h"
#import "MyAppTools.h"
#import "JobsScale.h"

#if __has_include(<JobsAppTools/JobsAppToolsHeader.h>)
#import <JobsAppTools/JobsAppToolsHeader.h>
#else
#import "JobsAppToolsHeader.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (UIApplicationDelegate)<UIApplicationDelegate>

@end

NS_ASSUME_NONNULL_END
