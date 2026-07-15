//
//  GKNavigationBarConfigure+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "GKNavigationBarConfigure+DSL.h"

@implementation GKNavigationBarConfigure (DSL)
+(__kindof GKNavigationBarConfigure *_Nonnull)bySetupDefault{
    GKNavigationBarConfigure *configure = GKNavigationBarConfigure.sharedInstance;
    [configure setupDefaultConfigure];
    return configure;
}

+(JobsRetGKNavConfigureByConfigureBlock _Nonnull)bySetup{
    return ^__kindof GKNavigationBarConfigure *_Nullable(void (^ _Nullable block)(GKNavigationBarConfigure *configure)){
        GKNavigationBarConfigure *configure = GKNavigationBarConfigure.sharedInstance;
        [configure setupCustomConfigure:^(GKNavigationBarConfigure * _Nonnull data){
            if (block) block(data);
        }];
        return configure;
    };
}

+(JobsRetGKNavConfigureByConfigureBlock _Nonnull)byUpdate{
    return ^__kindof GKNavigationBarConfigure *_Nullable(void (^ _Nullable block)(GKNavigationBarConfigure *configure)){
        GKNavigationBarConfigure *configure = GKNavigationBarConfigure.sharedInstance;
        [configure updateConfigure:^(GKNavigationBarConfigure * _Nonnull data){
            if (block) block(data);
        }];
        return configure;
    };
}

-(__kindof GKNavigationBarConfigure *_Nonnull)byCommit{
    [self updateConfigure:^(__kindof GKNavigationBarConfigure * _Nonnull data){}];
    return self;
}

-(JobsRetGKNavConfigureByConfigureBlock _Nonnull)dsl{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(void (^ _Nullable block)(GKNavigationBarConfigure *configure)){
        @jobs_strongify(self)
        if (block) block(self);
        return self;
    };
}

-(JobsRetGKNavConfigureByColorBlock _Nonnull)byBackground{
    return self.byBackgroundColor;
}

-(JobsRetGKNavConfigureByColorBlock _Nonnull)byBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.backgroundColor = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByImageBlock _Nonnull)byBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.backgroundImage = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByImageBlock _Nonnull)byDarkBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.darkBackgroundImage = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByColorBlock _Nonnull)byLine{
    return self.byLineColor;
}

-(JobsRetGKNavConfigureByColorBlock _Nonnull)byLineColor{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.lineColor = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByLineBlock _Nonnull)byLinePreset{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIImage *_Nullable image, UIImage *_Nullable darkImage, UIColor *_Nullable color, NSNumber *_Nullable hidden){
        @jobs_strongify(self)
        self.lineImage = image;
        self.darkLineImage = darkImage;
        if (color) self.lineColor = color;
        if (hidden) self.lineHidden = hidden.boolValue;
        return self;
    };
}

-(JobsRetGKNavConfigureByImageBlock _Nonnull)byLineImage{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.lineImage = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByImageBlock _Nonnull)byDarkLineImage{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.darkLineImage = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByBOOLBlock _Nonnull)byLineHidden{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.lineHidden = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByColorBlock _Nonnull)byTitleCor{
    return self.byTitleColor;
}

-(JobsRetGKNavConfigureByColorBlock _Nonnull)byTitleColor{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.titleColor = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByFontBlock _Nonnull)byTitleFont{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIFont *_Nullable data){
        @jobs_strongify(self)
        self.titleFont = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByTitleBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIColor *_Nullable color, UIFont *_Nullable font){
        @jobs_strongify(self)
        self.titleColor = color;
        self.titleFont = font;
        return self;
    };
}

-(JobsRetGKNavConfigureByImageBlock _Nonnull)byBack{
    return self.byBackImage;
}

-(JobsRetGKNavConfigureByImageBlock _Nonnull)byBackImage{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.backImage = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByImageBlock _Nonnull)byBackDarkImage{
    return self.byDarkBackImage;
}

-(JobsRetGKNavConfigureByImageBlock _Nonnull)byDarkBackImage{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.darkBackImage = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByBackImagesBlock _Nonnull)byBackImages{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIImage *_Nullable blackImage, UIImage *_Nullable whiteImage){
        @jobs_strongify(self)
        self.blackBackImage = blackImage;
        self.whiteBackImage = whiteImage;
        return self;
    };
}

-(JobsRetGKNavConfigureByImageBlock _Nonnull)byBlackBackImage{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.blackBackImage = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByImageBlock _Nonnull)byWhiteBackImage{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.whiteBackImage = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByBackStyleBlock _Nonnull)byBackStyle{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(GKNavigationBarBackStyle data){
        @jobs_strongify(self)
        self.backStyle = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByBackPresetBlock _Nonnull)byBackPreset{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIImage *_Nullable image, UIImage *_Nullable darkImage, UIImage *_Nullable blackImage, UIImage *_Nullable whiteImage, NSNumber *_Nullable style){
        @jobs_strongify(self)
        if (image) self.backImage = image;
        if (darkImage) self.darkBackImage = darkImage;
        if (blackImage) self.blackBackImage = blackImage;
        if (whiteImage) self.whiteBackImage = whiteImage;
        if (style) self.backStyle = style.integerValue;
        return self;
    };
}

-(JobsRetGKNavConfigureByFixSpaceBlock _Nonnull)byFixSpace{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(NSNumber *_Nullable disable, NSNumber *_Nullable openSystemFixSpace, NSNumber *_Nullable left, NSNumber *_Nullable right){
        @jobs_strongify(self)
        if (disable) self.gk_disableFixSpace = disable.boolValue;
        if (openSystemFixSpace) self.openSystemFixSpace = openSystemFixSpace.boolValue;
        if (left) self.gk_navItemLeftSpace = left.doubleValue;
        if (right) self.gk_navItemRightSpace = right.doubleValue;
        return self;
    };
}

-(JobsRetGKNavConfigureByBOOLBlock _Nonnull)byDisableFixSpace{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.gk_disableFixSpace = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByBOOLBlock _Nonnull)byOpenSystemFixSpace{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.openSystemFixSpace = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByNavItemSpacingBlock _Nonnull)byNavItemSpacing{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(NSNumber *_Nullable left, NSNumber *_Nullable right){
        @jobs_strongify(self)
        if (left) self.gk_navItemLeftSpace = left.doubleValue;
        if (right) self.gk_navItemRightSpace = right.doubleValue;
        return self;
    };
}

-(JobsRetGKNavConfigureByCGFloatBlock _Nonnull)byNavItemLeftSpace{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.gk_navItemLeftSpace = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByCGFloatBlock _Nonnull)byNavItemRightSpace{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.gk_navItemRightSpace = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByBOOLBlock _Nonnull)byStatusBarHidden{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.statusBarHidden = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByStatusBarStyleBlock _Nonnull)byStatusBarStyle{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIStatusBarStyle data){
        @jobs_strongify(self)
        self.statusBarStyle = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByBOOLBlock _Nonnull)byRestoreSystemNavBar{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.gk_restoreSystemNavBar = data;
        return self;
    };
}

-(JobsRetGKNavConfigureByPresetBlock _Nonnull)byPreset{
    @jobs_weakify(self)
    return ^__kindof GKNavigationBarConfigure *_Nullable(UIColor *_Nullable backgroundColor, UIImage *_Nullable backgroundImage, UIImage *_Nullable darkBackgroundImage, UIColor *_Nullable titleColor, UIFont *_Nullable titleFont, NSNumber *_Nullable backStyle){
        @jobs_strongify(self)
        if (backgroundColor) self.backgroundColor = backgroundColor;
        if (backgroundImage) self.backgroundImage = backgroundImage;
        if (darkBackgroundImage) self.darkBackgroundImage = darkBackgroundImage;
        if (titleColor) self.titleColor = titleColor;
        if (titleFont) self.titleFont = titleFont;
        if (backStyle) self.backStyle = backStyle.integerValue;
        return self;
    };
}

@end
