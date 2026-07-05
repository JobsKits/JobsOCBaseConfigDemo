//
//  UIViewController+BackBtn.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BACKBTN_D0EE395176
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BACKBTN_D0EE395176

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsByOCPods/UIButton+ImageTitleSpacing.h>
#import <JobsByOCPods/UIButton+SimplyMake.h>
#import <JobsByOCPods/UIButton+UI.h>
#import <JobsByOCPods/NSObject+image.h>
#import <JobsByOCPods/NSObject+Extra.h>
#import <JobsByOCPods/UIBarButtonItem+Extra.h>

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

#if __has_include(<JobsLoadingImage/JobsLoadingImageHeader.h>)
#import <JobsLoadingImage/JobsLoadingImageHeader.h>
#else
#import "JobsLoadingImageHeader.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
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
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BACKBTN_D0EE395176 */
