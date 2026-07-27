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
        if (@available(iOS 13.0, tvOS 13.0, *)) {
            UITabBarAppearance *standardAppearance = self.standardAppearance.copy;
            standardAppearance.backgroundColor = data;
            self.standardAppearance = standardAppearance;
            if (@available(iOS 15.0, tvOS 15.0, *)) {
                UITabBarAppearance *scrollEdgeAppearance = self.scrollEdgeAppearance
                    ? self.scrollEdgeAppearance.copy
                    : standardAppearance.copy;
                scrollEdgeAppearance.backgroundColor = data;
                self.scrollEdgeAppearance = scrollEdgeAppearance;
            }
        }else{
            SuppressWdeprecatedDeclarationsWarning(self.barTintColor = data;);
        };return self;
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
