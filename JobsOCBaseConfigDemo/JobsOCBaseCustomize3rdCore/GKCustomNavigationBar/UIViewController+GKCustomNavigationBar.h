//
//  UIViewController+GKCustomNavigationBar.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GKCUSTOMNAVIGATIONBAR_9379508809
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GKCUSTOMNAVIGATIONBAR_9379508809

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

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

#import "JobsModelDSL.h"

#import "JobsBaseUI.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 针对 GKNavigationBar的标题只能是文字的一种拓展性操作，使之兼容图片
@interface UIViewController (GKCustomNavigationBar)

Prop_strong(nullable)__kindof UIButtonModel *gk_navTitleBtnModel;
Prop_strong(nullable)__kindof UIButton *gk_navTitleBtn;

-(JobsRetGKNavBarByButtonModelBlock _Nonnull)gk_navTitleBtnBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GKCUSTOMNAVIGATIONBAR_9379508809 */
