//
//  UIViewController+GKCustomNavigationBar.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GKCUSTOMNAVIGATIONBAR_3A0C625D01
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GKCUSTOMNAVIGATIONBAR_3A0C625D01

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsNavigationTransitionMgr/UIView+Extra.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

/// 针对 GKNavigationBar 的标题只能是文字的一种拓展性操作，使之兼容图片
@interface UIViewController (GKCustomNavigationBar)

Prop_strong(nullable)__kindof UIButtonModel *gk_navTitleBtnModel;
Prop_strong(nullable)__kindof UIButton *gk_navTitleBtn;

-(JobsRetGKNavBarByButtonModelBlock _Nonnull)gk_navTitleBtnBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GKCUSTOMNAVIGATIONBAR_3A0C625D01 */
