//
//  MyAppTools.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#import "AppDelegate.h"
#import "AppDelegate+TabBarCtr.h"

/// 根控制器
#ifndef ROOT_VIEW_CONTROLLER_H

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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
/// 仅供 iOS 12 及以下旧宿主使用；iOS 13+ 返回 nil。
-(JobsRetWindowByVoidBlock _Nonnull)makeAppDelegateWindow;
/// 兼容旧调用，固定返回 nil；当前窗口从 view.window 获取。
-(JobsRetWindowByVoidBlock _Nonnull)makeSceneDelegateWindow;
-(void)appDelegateWindowBlock:(jobsByWindowBlock _Nullable)appDelegateWindowBlock
     sceneDelegateWindowBlock:(jobsByWindowBlock _Nullable)sceneDelegateWindowBlock;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIWindow *_Nullable
jobsMakeAppDelegateWindow(jobsByWindowBlock _Nonnull block){
    UIWindow *data = ((MyAppTools *)MyAppTools.jobsSharedManager()).makeAppDelegateWindow();
    if (data && block) {
        block(data);
    }
    return data;
}
