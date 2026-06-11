//
//  UIViewController+BaseNavigationBar.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BASENAVIGATIONBAR_36F70D6040
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BASENAVIGATIONBAR_36F70D6040

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsByOCPods/UIViewController+BaseVC.h>
#import <JobsByOCPods/NSMutableArray+Extra.h>

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

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsLoadingImage/JobsLoadingImage.h>)
#import <JobsLoadingImage/JobsLoadingImage.h>
#else
#import "JobsLoadingImage.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN
// 自定义 BaseNavigationBar
@interface UIViewController (BaseNavigationBar)

Prop_strong()BaseNavigationBar *navigationBar;
Prop_strong()UIBarButtonItem *leftBarButtonItem_back;
Prop_strong()UINavigationItem *navItem;
Prop_strong()UIColor *bgCor;
Prop_assign()CGFloat jobsNavigationBarHeight;
Prop_assign()BOOL isHiddenNavigationBar;
Prop_assign()BOOL isBarTranslucent;
Prop_strong()UIColor *tintColor;
Prop_strong()UIColor *barTintColor;
Prop_copy()NSString *title;
//titleTextAttributes
Prop_strong()NSShadow *shadow;
Prop_strong()UIColor *shadowCor;
Prop_strong()UIColor *foregroundColorAttributeNameCor;
Prop_strong()UIFont *fontAttributeName;

-(JobsRetVCByIDBlock _Nonnull)goBack;

@end

NS_ASSUME_NONNULL_END
/**
 *  要想隐藏系统的导航栏，这里有2个手段。一个是在UIViewController的基类，一个是在UIViewController的分类
 * 1、如果要在viewDidLoad实现隐藏系统的导航栏，则调用UIViewController基类的父类方法self.setupNavigationBarHidden = YES;
 * 2、如果要在viewWillAppear实现隐藏系统的导航栏，则调用UIViewController分类的方法self.isHiddenNavigationBar = YES;//禁用系统的导航栏
 */
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_BASENAVIGATIONBAR_36F70D6040 */
