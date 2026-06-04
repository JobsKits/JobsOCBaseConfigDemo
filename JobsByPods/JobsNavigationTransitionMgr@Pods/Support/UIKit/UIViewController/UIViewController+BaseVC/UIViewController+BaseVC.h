//
//  UIViewController+BaseVC.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BASEVC_6CB4D95905
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BASEVC_6CB4D95905

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsNavigationTransitionMgr/NSObject+Extra.h>
#import <JobsNavigationTransitionMgr/NSObject+image.h>
#import <JobsNavigationTransitionMgr/UIBarButtonItem+Extra.h>
#import <JobsNavigationTransitionMgr/UINavigationController+Extra.h>
#import <JobsNavigationTransitionMgr/UIViewController+BackBtn.h>
#import <JobsNavigationTransitionMgr/UIView+Navigator.h>
#import <JobsNavigationTransitionMgr/UIViewController+GKCustomNavigationBar.h>
#import <JobsNavigationTransitionMgr/NSObject+UsrInfo.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
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

#if __has_include(<JobsNavBar/JobsNavBar.h>)
#import <JobsNavBar/JobsNavBar.h>
#else
#import "JobsNavBar.h"
#endif

#if __has_include(<JobsDebug/JobsDebug.h>)
#import <JobsDebug/JobsDebug.h>
#else
#import "JobsDebug.h"
#endif

#if __has_include(<JobsAppTools/JobsAppTools.h>)
#import <JobsAppTools/JobsAppTools.h>
#else
#import "JobsAppTools.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsViewNavigator/JobsViewNavigator.h>)
#import <JobsViewNavigator/JobsViewNavigator.h>
#else
#import "JobsViewNavigator.h"
#endif

#if __has_include(<JobsLoadingImage/JobsLoadingImage.h>)
#import <JobsLoadingImage/JobsLoadingImage.h>
#else
#import "JobsLoadingImage.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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

/// 用导航控制器进行包装
NS_INLINE __kindof UINavigationController * _Nullable JobsNavCtrl(UIViewController __kindof * _Nonnull viewController){
    return viewController.navigationController ? viewController : [UINavigationController.alloc initWithRootViewController:viewController];
}
NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (BaseVC)
<
BaseViewControllerProtocol
,UIViewModelProtocol
,AppToolsProtocol
>
/**
 ❤️【强制推控制器】❤️
 1、自定义是PUSH还是PRESENT展现控制器，如果自定义PUSH但是navigationController不存在，则换用PRESENT展现控制器
 2、定位于@implementation UINavigationController (SafeTransition)，交换系统的push方法，防止某些情况下系统资源紧张导致的多次推控制器
 @param fromVC 从A控制器（上一个页面）
 @param toVC  推到B控制器 （下一个页面）
 @param comingStyle 自定义展现的方式
 @param presentationStyle  如果是PRESENT情况下的一个系统参数设定
 @param requestParams  A控制器—>B控制器，正向传值
 @param hidesBottomBarWhenPushed 跳转子页面的时候隐藏tabbar
 @param animated  是否动画展现
 @param successBlock 在推控制器之前，反向block(B控制器），以便对B控制器的一些自定义修改
 */
+(instancetype _Nullable)comingFromVC:(UIViewController *_Nonnull)fromVC
                                 toVC:(UIViewController *_Nonnull)toVC
                          comingStyle:(ComingStyle)comingStyle
                    presentationStyle:(UIModalPresentationStyle)presentationStyle
                        requestParams:(id _Nullable)requestParams
             hidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed
                             animated:(BOOL)animated
                              success:(jobsByIDBlock _Nullable)successBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BASEVC_6CB4D95905 */
