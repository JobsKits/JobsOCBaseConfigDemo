//
//  UINavigationBar+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UINavigationBar+DSL.h"

@implementation UINavigationBar (DSL)
-(JobsRetNavigationBarByAppearanceBlock _Nonnull)byStandardAppearance{
    @jobs_weakify(self)
    return ^__kindof UINavigationBar *_Nullable(UINavigationBarAppearance *_Nullable data){
        @jobs_strongify(self)
        if (data) self.standardAppearance = data;
        return self;
    };
}

-(JobsRetNavigationBarByAppearanceBlock _Nonnull)byScrollEdgeAppearance{
    @jobs_weakify(self)
    return ^__kindof UINavigationBar *_Nullable(UINavigationBarAppearance *_Nullable data){
        @jobs_strongify(self)
        self.scrollEdgeAppearance = data;
        return self;
    };
}

-(JobsRetNavigationBarByAppearanceBlock _Nonnull)byCompactAppearance{
    @jobs_weakify(self)
    return ^__kindof UINavigationBar *_Nullable(UINavigationBarAppearance *_Nullable data){
        @jobs_strongify(self)
        self.compactAppearance = data;
        return self;
    };
}

-(JobsRetNavigationBarByAppearanceBlock _Nonnull)byCompactScrollEdgeAppearance{
    @jobs_weakify(self)
    return ^__kindof UINavigationBar *_Nullable(UINavigationBarAppearance *_Nullable data){
        @jobs_strongify(self)
        self.compactScrollEdgeAppearance = data;
        return self;
    };
}

-(JobsRetNavigationBarByColorBlock _Nonnull)byBarTintColor{
    @jobs_weakify(self)
    return ^__kindof UINavigationBar *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.barTintColor = data;
        return self;
    };
}

-(JobsRetNavigationBarByBOOLBlock _Nonnull)byTranslucent{
    @jobs_weakify(self)
    return ^__kindof UINavigationBar *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.translucent = data;
        return self;
    };
}

-(JobsRetNavigationBarByDictionaryBlock _Nonnull)byTitleTextAttributes{
    @jobs_weakify(self)
    return ^__kindof UINavigationBar *_Nullable(NSDictionary<NSAttributedStringKey,id> *_Nullable data){
        @jobs_strongify(self)
        self.titleTextAttributes = data;
        return self;
    };
}

-(JobsRetNavigationBarByBOOLBlock _Nonnull)byPrefersLargeTitles{
    @jobs_weakify(self)
    return ^__kindof UINavigationBar *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.prefersLargeTitles = data;
        return self;
    };
}

-(JobsRetNavigationBarByImageBlock _Nonnull)byShadowImage{
    @jobs_weakify(self)
    return ^__kindof UINavigationBar *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.shadowImage = data;
        return self;
    };
}

-(JobsRetNavigationBarByImageAndBarMetricsBlock _Nonnull)byBackgroundImageForBarMetrics{
    @jobs_weakify(self)
    return ^__kindof UINavigationBar *_Nullable(UIImage *_Nullable image, UIBarMetrics barMetrics){
        @jobs_strongify(self)
        [self setBackgroundImage:image forBarMetrics:barMetrics];
        return self;
    };
}

@end
