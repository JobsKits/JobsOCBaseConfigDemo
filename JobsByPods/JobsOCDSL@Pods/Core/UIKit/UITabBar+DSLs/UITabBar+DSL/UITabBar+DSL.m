//
//  UITabBar+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UITabBar+DSL.h"

@implementation UITabBar (DSL)

+(void)jobsApplyStandardAppearance:(UITabBarAppearance *_Nonnull)appearance{
    UITabBar.appearance.standardAppearance = appearance;
}

+(void)jobsApplyScrollEdgeAppearance:(UITabBarAppearance *_Nullable)appearance{
    UITabBar.appearance.scrollEdgeAppearance = appearance;
}

-(JobsRetTabBarByAppearanceBlock _Nonnull)byStandardAppearance{
    @jobs_weakify(self)
    return ^__kindof UITabBar *_Nullable(UITabBarAppearance *_Nonnull data){
        @jobs_strongify(self)
        self.standardAppearance = data;
        return self;
    };
}

-(JobsRetTabBarByAppearanceBlock _Nonnull)byScrollEdgeAppearance{
    @jobs_weakify(self)
    return ^__kindof UITabBar *_Nullable(UITabBarAppearance *_Nonnull data){
        @jobs_strongify(self)
        self.scrollEdgeAppearance = data;
        return self;
    };
}

-(JobsRetTabBarByColorBlock _Nonnull)byBarTintColor{
    @jobs_weakify(self)
    return ^__kindof UITabBar *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.barTintColor = data;
        return self;
    };
}

-(JobsRetTabBarByColorBlock _Nonnull)byUnselectedItemTintColor{
    @jobs_weakify(self)
    return ^__kindof UITabBar *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.unselectedItemTintColor = data;
        return self;
    };
}

@end
