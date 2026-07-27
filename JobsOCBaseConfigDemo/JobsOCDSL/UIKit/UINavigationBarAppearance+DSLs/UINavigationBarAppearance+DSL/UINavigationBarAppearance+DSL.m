//
//  UINavigationBarAppearance+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UINavigationBarAppearance+DSL.h"

@implementation UINavigationBarAppearance (DSL)
-(JobsRetNavigationBarAppearanceByDictionaryBlock _Nonnull)byTitleTextAttributes{
    @jobs_weakify(self)
    return ^__kindof UINavigationBarAppearance *_Nullable(NSDictionary<NSAttributedStringKey,id> *_Nullable data){
        @jobs_strongify(self)
        self.titleTextAttributes = data ?: @{};
        return self;
    };
}

-(JobsRetNavigationBarAppearanceByDictionaryBlock _Nonnull)byLargeTitleTextAttributes{
    @jobs_weakify(self)
    return ^__kindof UINavigationBarAppearance *_Nullable(NSDictionary<NSAttributedStringKey,id> *_Nullable data){
        @jobs_strongify(self)
        self.largeTitleTextAttributes = data ?: @{};
        return self;
    };
}

-(JobsRetNavigationBarAppearanceByOffsetBlock _Nonnull)byTitlePositionAdjustment{
    @jobs_weakify(self)
    return ^__kindof UINavigationBarAppearance *_Nullable(UIOffset data){
        @jobs_strongify(self)
        self.titlePositionAdjustment = data;
        return self;
    };
}

-(JobsRetNavigationBarAppearanceByButtonItemAppearanceBlock _Nonnull)byButtonAppearance{
    @jobs_weakify(self)
    return ^__kindof UINavigationBarAppearance *_Nullable(UIBarButtonItemAppearance *_Nonnull data){
        @jobs_strongify(self)
        self.buttonAppearance = data;
        return self;
    };
}

-(JobsRetNavigationBarAppearanceByButtonItemAppearanceBlock _Nonnull)byDoneButtonAppearance{
    @jobs_weakify(self)
    return ^__kindof UINavigationBarAppearance *_Nullable(UIBarButtonItemAppearance *_Nonnull data){
        @jobs_strongify(self)
        self.doneButtonAppearance = data;
        return self;
    };
}

-(JobsRetNavigationBarAppearanceByButtonItemAppearanceBlock _Nonnull)byBackButtonAppearance{
    @jobs_weakify(self)
    return ^__kindof UINavigationBarAppearance *_Nullable(UIBarButtonItemAppearance *_Nonnull data){
        @jobs_strongify(self)
        self.backButtonAppearance = data;
        return self;
    };
}

@end
