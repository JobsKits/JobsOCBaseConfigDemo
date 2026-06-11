//
//  AppDelegate+TabBarCtr.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate.h"
#import "AppDelegate+Func.h"
#import "NSObject+MyAppTools.h"
#import "MyAppTools.h"
#import "JobsTabBarVC.h"
#import "JobsCustomTabBarVC.h"
#import "ViewController@1.h"
#import "ViewController@2.h"
#import "ViewController@3.h"
#import "ViewController@4.h"
#import "ViewController@5.h"

#if __has_include(<JobsAppTools/JobsAppTools.h>)
#import <JobsAppTools/JobsAppTools.h>
#else
#import "JobsAppTools.h"
#endif

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

#ifndef JobsCustomTabBarConfig_appDelegate
#define JobsCustomTabBarConfig_appDelegate AppDelegate.jobsCustomTabBarConfig
#endif /* JobsCustomTabBarConfig_appDelegate */

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (TabBarCtr)
#pragma mark —— 配置一些普通的控制器
Prop_strong(class)JobsTabBarVC *tabBarVC;
Prop_strong(class)JobsCustomTabBarVC *jobsCustomTabBarVC;
Prop_strong(class)LZTabBarController *lZTabBarCtrl;
#pragma mark —— 配置一些导航控制器
Prop_strong(class)__kindof UINavigationController *tabBarNavCtrl;
Prop_strong(class)__kindof UINavigationController *jobsCustomTabBarNavCtrl;
Prop_strong(class)__kindof UINavigationController *lZTabBarNavCtrl;
#pragma mark —— 数据源
Prop_strong(class)LZTabBarConfig *lZTabBarConfig;
Prop_strong(class)JobsCustomTabBarConfig *jobsCustomTabBarConfig;
Prop_strong(class)NSMutableArray <JobsTabBarItemConfig *>*tabBarItemConfigMutArr;
Prop_strong(class)NSMutableArray <__kindof UIButton *>*tabBarItemMutArr;
Prop_strong(class)NSMutableArray <__kindof NSString *>*tabBarItemTitleMutArr;
Prop_strong(class)NSMutableArray <__kindof NSString *>*imageSelectedNameMutArr;
Prop_strong(class)NSMutableArray <__kindof NSString *>*imageUnselectedNameMutArr;
Prop_strong(class)NSMutableArray <__kindof UIImage *>*imageSelectedMutArr;
Prop_strong(class)NSMutableArray <__kindof UIImage *>*imageUnSelectedMutArr;
Prop_strong(class)NSMutableArray <__kindof UIViewController *>*viewCtrlByTabBarCtrlConfigMutArr;//【从配置TabBarCtrl信息添加的】Tabbar管理的，不含导航的根控制器
Prop_strong(class)NSMutableArray <__kindof UIViewController *>*viewCtrlMutArr;//【手动添加的】Tabbar管理的，不含导航的根控制器
Prop_strong(class)NSMutableArray <__kindof UINavigationController *>*navCtrMutArr;
#pragma mark —— 一些公有方法
/// 切换控制器
+(void)button:(__kindof UIButton *)button index:(NSUInteger)index;
+(jobsByNSUIntegerBlock _Nonnull)switchByIndex;
/// 刷新 TabBarTitle
-(void)refreshTabBarTitle;

@end

NS_ASSUME_NONNULL_END
