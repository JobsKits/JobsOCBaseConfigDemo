//
//  UIView+Navigator.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_NAVIGATOR_EB706BA4D3
#define JOBS_HEADER_GUARD_UIVIEW_NAVIGATOR_EB706BA4D3

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsNavigationTransitionMgr/UIView+Extra.h>

#if __has_include(<JobsViewNavigator/JobsViewNavigator.h>)
#import <JobsViewNavigator/JobsViewNavigator.h>
#else
#import "JobsViewNavigator.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Navigator)

Prop_strong()JobsViewNavigator *navigator;
#pragma mark —— 汇总方法
/// 推页面
-(jobsByViewBlock _Nonnull)pushTo;
/// 退回到上一个页面
-(jobsByBOOLBlock _Nonnull)popViewAnimated;
/// 退回到根页面
-(jobsByBOOLBlock _Nonnull)popToRootViewAnimated;
#pragma mark —— 配置
-(jobsByViewBlock _Nonnull)configViewNavigatorBySuperview;
-(jobsByViewBlock _Nonnull)configViewNavigatorBySuperview_;
-(jobsByViewBlock _Nonnull)configViewNavigatorByPushview;
-(jobsByViewBlock _Nonnull)configViewNavigatorByPushview_;
-(jobsByView2Block _Nonnull)configViewNavigatorBySuperviewAndView;
-(jobsByView2Block _Nonnull)configViewNavigatorBySuperviewAndView_;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_NAVIGATOR_EB706BA4D3 */
