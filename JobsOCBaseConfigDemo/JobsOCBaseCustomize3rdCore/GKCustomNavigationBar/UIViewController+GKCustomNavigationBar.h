//
//  UIViewController+GKCustomNavigationBar.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GKCUSTOMNAVIGATIONBAR_9379508809

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GKCUSTOMNAVIGATIONBAR_9379508809

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#import "JobsModelDSL.h"
#import "JobsBaseUI.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 在 GKNavigationBar 的通用 titleView 能力之上，补齐 Jobs 标题按钮与主/副标题组件。
@interface UIViewController (GKCustomNavigationBar)

Prop_strong(nullable)__kindof UIButtonModel *gk_navTitleBtnModel;
Prop_strong(nullable)__kindof UIButton *gk_navTitleBtn;
Prop_strong(nullable)__kindof UILabel *gk_navMainTitleLab;
Prop_strong(nullable)__kindof UILabel *gk_navSubTitleLab;

-(JobsRetGKNavBarByButtonModelBlock _Nonnull)gk_navTitleBtnBy;
/// data.textModel 为主标题，data.subTextModel 为副标题；创建后同步写入 gk_navTitleView。
-(JobsRetViewByViewModelBlock _Nonnull)gk_navTitleViewBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GKCUSTOMNAVIGATIONBAR_9379508809 */
