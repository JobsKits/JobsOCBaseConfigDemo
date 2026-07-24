//
//  UIViewController+BaseNavigationBar.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BASENAVIGATIONBAR_BE6E5E2007
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BASENAVIGATIONBAR_BE6E5E2007

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (BaseNavigationBar)

Prop_assign()BOOL isHiddenNavigationBar;

/// 为 Demo 导航子页面注入全局主题切换按钮，并保留已有右侧业务按钮。
-(void)jobs_ensureDemoThemeButton;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BASENAVIGATIONBAR_BE6E5E2007 */
