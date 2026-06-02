//
//  JobsTabbarCtrlSysEx.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#ifndef JobsTabbarCtrlSysEx_h
#define JobsTabbarCtrlSysEx_h
/// 全局配置文件
#import <JobsOCTools/JobsTabBarItemConfig.h>
/// 构造方法
#import <JobsOCTools/JobsTabBarCtrlConstruction.h>
/// UITabBarItem
#import <JobsOCTools/UITabBarItem+TLAnimation.h>
#import <JobsOCTools/JobsTabBarItem.h>
/// UITabBarController
#import <JobsOCTools/JobsTabBarVC.h>
/// UITabBar
#import <JobsOCTools/UITabBar+TLAnimation.h>
#import <JobsOCTools/JobsTabBar.h>
#import <JobsOCTools/UITabBar+Ex.h>
/// 一些需要单独列出来的功能性模块(可选功能)
/// Telegram动效：在指定位置出现菜单列表
#import <JobsOCTools/JobsPullListAutoSizeView.h>
/// 功能性动效：手势横向滚动子VC联动Tabbar切换
#import <JobsOCTools/TransitionAnimation.h>
#import <JobsOCTools/TransitionController.h>
/// Tabbaritem点击动效
#import <JobsOCTools/TLAnimationProtocol.h>
#import <JobsOCTools/TLTabBarAnimation.h>

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsSuspend/JobsSuspend.h>)
#import <JobsSuspend/JobsSuspend.h>
#else
#import "JobsSuspend.h"
#endif

#endif /* JobsTabbarCtrlSysEx_h */
