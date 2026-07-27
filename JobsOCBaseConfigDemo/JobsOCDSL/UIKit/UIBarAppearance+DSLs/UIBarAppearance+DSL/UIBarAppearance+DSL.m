//
//  UIBarAppearance+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UIBarAppearance+DSL.h"

@implementation UIBarAppearance (DSL)
-(JobsRetBarAppearanceByVoidBlock _Nonnull)byConfigureWithDefaultBackground{
    @jobs_weakify(self)
    return ^__kindof UIBarAppearance *_Nullable(void){
        @jobs_strongify(self)
        [self configureWithDefaultBackground];
        return self;
    };
}

-(JobsRetBarAppearanceByVoidBlock _Nonnull)byConfigureWithOpaqueBackground{
    @jobs_weakify(self)
    return ^__kindof UIBarAppearance *_Nullable(void){
        @jobs_strongify(self)
        [self configureWithOpaqueBackground];
        return self;
    };
}

-(JobsRetBarAppearanceByVoidBlock _Nonnull)byConfigureWithTransparentBackground{
    @jobs_weakify(self)
    return ^__kindof UIBarAppearance *_Nullable(void){
        @jobs_strongify(self)
        [self configureWithTransparentBackground];
        return self;
    };
}

-(JobsRetBarAppearanceByVisualEffectBlock _Nonnull)byBackgroundEffect{
    @jobs_weakify(self)
    return ^__kindof UIBarAppearance *_Nullable(UIVisualEffect *_Nullable data){
        @jobs_strongify(self)
        self.backgroundEffect = data;
        return self;
    };
}

-(JobsRetBarAppearanceByCorBlock _Nonnull)byBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof UIBarAppearance *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.backgroundColor = color;
        return self;
    };
}

-(JobsRetBarAppearanceByImageBlock _Nonnull)byBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIBarAppearance *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.backgroundImage = data;
        return self;
    };
}

-(JobsRetBarAppearanceByNSIntegerBlock _Nonnull)byBackgroundImageContentMode{
    @jobs_weakify(self)
    return ^__kindof UIBarAppearance *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.backgroundImageContentMode = data;
        return self;
    };
}

-(JobsRetBarAppearanceByCorBlock _Nonnull)byShadowColor{
    @jobs_weakify(self)
    return ^__kindof UIBarAppearance *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.shadowColor = data;
        return self;
    };
}

-(JobsRetBarAppearanceByImageBlock _Nonnull)byShadowImage{
    @jobs_weakify(self)
    return ^__kindof UIBarAppearance *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.shadowImage = data;
        return self;
    };
}

@end
