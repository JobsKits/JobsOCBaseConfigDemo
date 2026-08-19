//
//  UINavigationBar+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UINavigationBar+DSL.h"

static UINavigationBarAppearance *_Nonnull JobsNavigationBarAppearanceByBackgroundColor(UINavigationBarAppearance *_Nullable source,
                                                                                         UIColor *_Nullable color) API_AVAILABLE(ios(13.0), tvos(13.0)){
    UINavigationBarAppearance *appearance = source ? source.copy : UINavigationBarAppearance.new;
    appearance.byBackgroundColor(color);
    return appearance;
}

static UINavigationBarAppearance *_Nonnull JobsNavigationBarAppearanceByShadowImage(UINavigationBarAppearance *_Nullable source,
                                                                                      UIImage *_Nullable image) API_AVAILABLE(ios(13.0), tvos(13.0)){
    UINavigationBarAppearance *appearance = source ? source.copy : UINavigationBarAppearance.new;
    appearance.byShadowImage(image);
    return appearance;
}

static UINavigationBarAppearance *_Nonnull JobsNavigationBarAppearanceByBackgroundImage(UINavigationBarAppearance *_Nullable source,
                                                                                          UIImage *_Nullable image) API_AVAILABLE(ios(13.0), tvos(13.0)){
    UINavigationBarAppearance *appearance = source ? source.copy : UINavigationBarAppearance.new;
    appearance.byBackgroundImage(image);
    return appearance;
}

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
        if (@available(iOS 13.0, tvOS 13.0, *)) {
            self.byStandardAppearance(JobsNavigationBarAppearanceByBackgroundColor(self.standardAppearance, data));
            self.byScrollEdgeAppearance(JobsNavigationBarAppearanceByBackgroundColor(self.scrollEdgeAppearance ?: self.standardAppearance, data));
            self.byCompactAppearance(JobsNavigationBarAppearanceByBackgroundColor(self.compactAppearance ?: self.standardAppearance, data));
            if (@available(iOS 15.0, tvOS 15.0, *)) {
                self.byCompactScrollEdgeAppearance(JobsNavigationBarAppearanceByBackgroundColor(self.compactScrollEdgeAppearance ?: self.compactAppearance, data));
            }
        }else{
            SuppressWdeprecatedDeclarationsWarning(self.barTintColor = data;);
        };return self;
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
        if (@available(iOS 13.0, tvOS 13.0, *)) {
            self.byStandardAppearance(JobsNavigationBarAppearanceByShadowImage(self.standardAppearance, data));
            self.byScrollEdgeAppearance(JobsNavigationBarAppearanceByShadowImage(self.scrollEdgeAppearance ?: self.standardAppearance, data));
            self.byCompactAppearance(JobsNavigationBarAppearanceByShadowImage(self.compactAppearance ?: self.standardAppearance, data));
            if (@available(iOS 15.0, tvOS 15.0, *)) {
                self.byCompactScrollEdgeAppearance(JobsNavigationBarAppearanceByShadowImage(self.compactScrollEdgeAppearance ?: self.compactAppearance, data));
            }
        }else{
            SuppressWdeprecatedDeclarationsWarning(self.shadowImage = data;);
        };return self;
    };
}

-(JobsRetNavigationBarByImageAndBarMetricsBlock _Nonnull)byBackgroundImageForBarMetrics{
    @jobs_weakify(self)
    return ^__kindof UINavigationBar *_Nullable(UIImage *_Nullable image, UIBarMetrics barMetrics){
        @jobs_strongify(self)
        if (@available(iOS 13.0, tvOS 13.0, *)) {
            if (barMetrics == UIBarMetricsDefault) {
                self.byStandardAppearance(JobsNavigationBarAppearanceByBackgroundImage(self.standardAppearance, image));
                self.byScrollEdgeAppearance(JobsNavigationBarAppearanceByBackgroundImage(self.scrollEdgeAppearance ?: self.standardAppearance, image));
            }else{
                self.byCompactAppearance(JobsNavigationBarAppearanceByBackgroundImage(self.compactAppearance ?: self.standardAppearance, image));
                if (@available(iOS 15.0, tvOS 15.0, *)) {
                    self.byCompactScrollEdgeAppearance(JobsNavigationBarAppearanceByBackgroundImage(self.compactScrollEdgeAppearance ?: self.compactAppearance, image));
                }
            }
        }else{
            SuppressWdeprecatedDeclarationsWarning([self setBackgroundImage:image forBarMetrics:barMetrics];);
        };return self;
    };
}

@end
