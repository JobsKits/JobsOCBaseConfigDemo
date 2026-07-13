//
//  UIViewController+GKNavigationBarDSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月12日，星期日.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GKNAVIGATIONBAR_DSL_0712
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_GKNAVIGATIONBAR_DSL_0712

#import <UIKit/UIKit.h>

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
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

@interface UIViewController (GKNavigationBarDSL)

-(JobsRetGKNavVCByBOOLBlock _Nonnull)byGKStatusBarHidden;
-(JobsRetGKNavVCByStatusBarStyleBlock _Nonnull)byGKStatusBarStyle;
-(JobsRetGKNavVCByCGFloatBlock _Nonnull)byGKNavBarAlpha;
-(JobsRetGKNavVCByImageBlock _Nonnull)byGKBackImage;
-(JobsRetGKNavVCByImageBlock _Nonnull)byGKDarkBackImage;
-(JobsRetGKNavVCByImageBlock _Nonnull)byGKBlackBackImage;
-(JobsRetGKNavVCByImageBlock _Nonnull)byGKWhiteBackImage;
-(JobsRetGKNavVCByBackStyleBlock _Nonnull)byGKBackStyle;
-(JobsRetGKNavVCByImageBlock _Nonnull)byGKNavBackgroundImage;
-(JobsRetGKNavVCByImageBlock _Nonnull)byGKDarkNavBackgroundImage;
-(JobsRetGKNavVCByColorBlock _Nonnull)byGKNavBackgroundColor;
-(JobsRetGKNavVCByColorBlock _Nonnull)byGKNavShadowColor;
-(JobsRetGKNavVCByImageBlock _Nonnull)byGKNavShadowImage;
-(JobsRetGKNavVCByImageBlock _Nonnull)byGKDarkNavShadowImage;
-(JobsRetGKNavVCByBOOLBlock _Nonnull)byGKNavLineHidden;
-(JobsRetGKNavVCByStringBlock _Nonnull)byGKNavTitle;
-(JobsRetGKNavVCByViewBlock _Nonnull)byGKNavTitleView;
-(JobsRetGKNavVCByColorBlock _Nonnull)byGKNavTitleColor;
-(JobsRetGKNavVCByFontBlock _Nonnull)byGKNavTitleFont;
-(JobsRetGKNavVCByBarButtonItemBlock _Nonnull)byGKNavLeftBarButtonItem;
-(JobsRetGKNavVCByBarButtonItemsBlock _Nonnull)byGKNavLeftBarButtonItems;
-(JobsRetGKNavVCByBarButtonItemBlock _Nonnull)byGKNavRightBarButtonItem;
-(JobsRetGKNavVCByBarButtonItemsBlock _Nonnull)byGKNavRightBarButtonItems;
-(JobsRetGKNavVCByBOOLBlock _Nonnull)byGKDisableFixNavItemSpace;
-(JobsRetGKNavVCByBOOLBlock _Nonnull)byGKOpenFixNavItemSpace;
-(JobsRetGKNavVCByCGFloatBlock _Nonnull)byGKNavItemLeftSpace;
-(JobsRetGKNavVCByCGFloatBlock _Nonnull)byGKNavItemRightSpace;
-(JobsRetGKNavVCByNavigationBarBlock _Nonnull)byGKNavigationBarBlock;
-(JobsRetVCByVoidBlock _Nonnull)byGKShowNavLine;
-(JobsRetVCByVoidBlock _Nonnull)byGKHideNavLine;
-(JobsRetVCByVoidBlock _Nonnull)byGKRefreshNavBarFrame;
-(JobsRetVCByIDBlock _Nonnull)byGKBackItemClick;

@end

NS_ASSUME_NONNULL_END
#endif
