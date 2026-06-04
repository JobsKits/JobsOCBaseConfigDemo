//
//  MyAppTools.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "AppDelegate+TabBarCtr.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

/// 根控制器
#ifndef ROOT_VIEW_CONTROLLER_H
#define ROOT_VIEW_CONTROLLER_H
//
//#define RootViewController AppDelegate.tabBarNavCtrl
//#define RootViewController AppDelegate.tabBarVC
//
#define RootViewController AppDelegate.jobsCustomTabBarNavCtrl
//#define RootViewController AppDelegate.jobsCustomTabBarVC
//
//#define RootViewController AppDelegate.lZTabBarNavCtrl
//#define RootViewController AppDelegate.lZTabBarCtrl
#endif // ROOT_VIEW_CONTROLLER_H

NS_ASSUME_NONNULL_BEGIN

@interface MyAppTools : NSObject

Prop_assign()FMLoginWork loginWork;
/// 仅仅为了iOS 13 版本向下兼容而存在
-(UIWindow *)makeAppDelegateWindow;
-(UIWindow *)makeSceneDelegateWindow;
-(void)appDelegateWindowBlock:(jobsByWindowBlock _Nullable)appDelegateWindowBlock
     sceneDelegateWindowBlock:(jobsByWindowBlock _Nullable)sceneDelegateWindowBlock;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIWindow *_Nonnull
jobsMakeAppDelegateWindow(jobsByWindowBlock _Nonnull block){
    UIWindow *data = MyAppTools.sharedManager.makeAppDelegateWindow;
    if (block) block(data);
    return data;
}
