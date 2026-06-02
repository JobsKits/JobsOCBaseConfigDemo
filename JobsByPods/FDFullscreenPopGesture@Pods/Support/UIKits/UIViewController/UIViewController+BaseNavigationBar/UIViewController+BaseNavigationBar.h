//
//  UIViewController+BaseNavigationBar.h
//  FDFullscreenPopGesture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BASENAVIGATIONBAR_34457B6D27
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BASENAVIGATIONBAR_34457B6D27

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (BaseNavigationBar)

Prop_assign()BOOL isHiddenNavigationBar;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BASENAVIGATIONBAR_34457B6D27 */
