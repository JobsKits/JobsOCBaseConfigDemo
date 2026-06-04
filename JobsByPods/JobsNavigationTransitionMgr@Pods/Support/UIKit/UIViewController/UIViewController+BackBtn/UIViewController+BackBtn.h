//
//  UIViewController+BackBtn.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BACKBTN_D58D0DC41B
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BACKBTN_D58D0DC41B

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsNavigationTransitionMgr/UIButton+ImageTitleSpacing.h>
#import <JobsNavigationTransitionMgr/UIButton+UI.h>
#import <JobsNavigationTransitionMgr/NSObject+image.h>
#import <JobsNavigationTransitionMgr/NSObject+Extra.h>
#import <JobsNavigationTransitionMgr/UIBarButtonItem+Extra.h>

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsLoadingImage/JobsLoadingImage.h>)
#import <JobsLoadingImage/JobsLoadingImage.h>
#else
#import "JobsLoadingImage.h"
#endif

#if __has_include(<JobsBaseUI/BaseButton.h>)
#import <JobsBaseUI/BaseButton.h>
#else
#import "BaseButton.h"
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

@interface UIViewController (BackBtn)<BaseViewControllerProtocol>

#pragma mark —— BaseVC+BackBtn
Prop_strong()BaseButton *backBtnCategory;
Prop_strong()UIBarButtonItem *backBtnCategoryItem;
/// GKNavigationBar 返回按钮点击方法
///【子类需要覆写 】创建返回键的点击事件
-(jobsByBtnBlock _Nonnull)backBtnClickEvent;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BACKBTN_D58D0DC41B */
