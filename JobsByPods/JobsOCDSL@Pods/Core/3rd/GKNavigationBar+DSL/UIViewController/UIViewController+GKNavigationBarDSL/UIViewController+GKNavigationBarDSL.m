//
//  UIViewController+GKNavigationBarDSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月12日，星期日.
//

#import "UIViewController+GKNavigationBarDSL.h"

@implementation UIViewController (GKNavigationBarDSL)
#define JobsGKNavDSLMethod(methodName, blockType, valueType, propertyName) \
-(blockType _Nonnull)methodName{ \
    @jobs_weakify(self) \
    return ^__kindof UIViewController *_Nullable(valueType data){ \
        @jobs_strongify(self) \
        self.propertyName = data; \
        return self; \
    }; \
}

JobsGKNavDSLMethod(byGKStatusBarHidden, JobsRetGKNavVCByBOOLBlock, BOOL, gk_statusBarHidden)
JobsGKNavDSLMethod(byGKStatusBarStyle, JobsRetGKNavVCByStatusBarStyleBlock, UIStatusBarStyle, gk_statusBarStyle)
JobsGKNavDSLMethod(byGKNavBarAlpha, JobsRetGKNavVCByCGFloatBlock, CGFloat, gk_navBarAlpha)
JobsGKNavDSLMethod(byGKBackImage, JobsRetGKNavVCByImageBlock, UIImage *_Nullable, gk_backImage)
JobsGKNavDSLMethod(byGKDarkBackImage, JobsRetGKNavVCByImageBlock, UIImage *_Nullable, gk_darkBackImage)
JobsGKNavDSLMethod(byGKBlackBackImage, JobsRetGKNavVCByImageBlock, UIImage *_Nullable, gk_blackBackImage)
JobsGKNavDSLMethod(byGKWhiteBackImage, JobsRetGKNavVCByImageBlock, UIImage *_Nullable, gk_whiteBackImage)
JobsGKNavDSLMethod(byGKBackStyle, JobsRetGKNavVCByBackStyleBlock, GKNavigationBarBackStyle, gk_backStyle)
JobsGKNavDSLMethod(byGKNavBackgroundImage, JobsRetGKNavVCByImageBlock, UIImage *_Nullable, gk_navBackgroundImage)
JobsGKNavDSLMethod(byGKDarkNavBackgroundImage, JobsRetGKNavVCByImageBlock, UIImage *_Nullable, gk_darkNavBackgroundImage)
JobsGKNavDSLMethod(byGKNavBackgroundColor, JobsRetGKNavVCByColorBlock, UIColor *_Nullable, gk_navBackgroundColor)
JobsGKNavDSLMethod(byGKNavShadowColor, JobsRetGKNavVCByColorBlock, UIColor *_Nullable, gk_navShadowColor)
JobsGKNavDSLMethod(byGKNavShadowImage, JobsRetGKNavVCByImageBlock, UIImage *_Nullable, gk_navShadowImage)
JobsGKNavDSLMethod(byGKDarkNavShadowImage, JobsRetGKNavVCByImageBlock, UIImage *_Nullable, gk_darkNavShadowImage)
JobsGKNavDSLMethod(byGKNavLineHidden, JobsRetGKNavVCByBOOLBlock, BOOL, gk_navLineHidden)
JobsGKNavDSLMethod(byGKNavTitle, JobsRetGKNavVCByStringBlock, NSString *_Nullable, gk_navTitle)
JobsGKNavDSLMethod(byGKNavTitleView, JobsRetGKNavVCByViewBlock, __kindof UIView *_Nullable, gk_navTitleView)
JobsGKNavDSLMethod(byGKNavTitleColor, JobsRetGKNavVCByColorBlock, UIColor *_Nullable, gk_navTitleColor)
JobsGKNavDSLMethod(byGKNavTitleFont, JobsRetGKNavVCByFontBlock, UIFont *_Nullable, gk_navTitleFont)
JobsGKNavDSLMethod(byGKNavLeftBarButtonItem, JobsRetGKNavVCByBarButtonItemBlock, UIBarButtonItem *_Nullable, gk_navLeftBarButtonItem)
JobsGKNavDSLMethod(byGKNavLeftBarButtonItems, JobsRetGKNavVCByBarButtonItemsBlock, NSArray<UIBarButtonItem *> *_Nullable, gk_navLeftBarButtonItems)
JobsGKNavDSLMethod(byGKNavRightBarButtonItem, JobsRetGKNavVCByBarButtonItemBlock, UIBarButtonItem *_Nullable, gk_navRightBarButtonItem)
JobsGKNavDSLMethod(byGKNavRightBarButtonItems, JobsRetGKNavVCByBarButtonItemsBlock, NSArray<UIBarButtonItem *> *_Nullable, gk_navRightBarButtonItems)
JobsGKNavDSLMethod(byGKDisableFixNavItemSpace, JobsRetGKNavVCByBOOLBlock, BOOL, gk_disableFixNavItemSpace)
JobsGKNavDSLMethod(byGKOpenFixNavItemSpace, JobsRetGKNavVCByBOOLBlock, BOOL, gk_openFixNavItemSpace)
JobsGKNavDSLMethod(byGKNavItemLeftSpace, JobsRetGKNavVCByCGFloatBlock, CGFloat, gk_navItemLeftSpace)
JobsGKNavDSLMethod(byGKNavItemRightSpace, JobsRetGKNavVCByCGFloatBlock, CGFloat, gk_navItemRightSpace)

#undef JobsGKNavDSLMethod

-(JobsRetGKNavVCByNavigationBarBlock _Nonnull)byGKNavigationBarBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(jobsByGKCustomNavigationBarBlock _Nullable block){
        @jobs_strongify(self)
        if (block) block(self.gk_navigationBar);
        return self;
    };
}

-(JobsRetVCByVoidBlock _Nonnull)byGKShowNavLine{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(void){
        @jobs_strongify(self)
        [self showNavLine];
        return self;
    };
}

-(JobsRetVCByVoidBlock _Nonnull)byGKHideNavLine{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(void){
        @jobs_strongify(self)
        [self hideNavLine];
        return self;
    };
}

-(JobsRetVCByVoidBlock _Nonnull)byGKRefreshNavBarFrame{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(void){
        @jobs_strongify(self)
        [self refreshNavBarFrame];
        return self;
    };
}

-(JobsRetVCByIDBlock _Nonnull)byGKBackItemClick{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(id _Nullable sender){
        @jobs_strongify(self)
        [self backItemClick:sender];
        return self;
    };
}

@end
