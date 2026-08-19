//
//  UITabBar+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UITabBar+DSL.h"

@implementation UITabBar (DSL)
+(jobsByTabBarAppearanceBlock _Nonnull)jobsApplyStandardAppearance{
    return ^(UITabBarAppearance *_Nonnull appearance){
        [UITabBar.appearance setStandardAppearance:appearance];
    };
}

+(jobsByTabBarAppearanceBlock _Nonnull)jobsApplyScrollEdgeAppearance{
    return ^(UITabBarAppearance *_Nullable appearance){
        [UITabBar.appearance setScrollEdgeAppearance:appearance];
    };
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
            standardAppearance.byBackgroundColor(data);
            self.byStandardAppearance(standardAppearance);
            if (@available(iOS 15.0, tvOS 15.0, *)) {
                UITabBarAppearance *scrollEdgeAppearance = self.scrollEdgeAppearance
                    ? self.scrollEdgeAppearance.copy
                    : standardAppearance.copy;
                scrollEdgeAppearance.byBackgroundColor(data);
                self.byScrollEdgeAppearance(scrollEdgeAppearance);
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
