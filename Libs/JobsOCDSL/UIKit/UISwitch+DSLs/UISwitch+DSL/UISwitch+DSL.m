//
//  UISwitch+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UISwitch+DSL.h"

@implementation UISwitch (DSL)

-(BOOL)jobs_isOn{
    return self.isOn;
}

-(JobsRetSwitchByBOOLBlock _Nonnull)byOn{
    @jobs_weakify(self)
    return ^__kindof UISwitch *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.on = data;
        return self;
    };
}

-(JobsRetSwitchByOnAnimatedBlock _Nonnull)byOnAnimated{
    @jobs_weakify(self)
    return ^__kindof UISwitch *_Nullable(BOOL on, BOOL animated){
        @jobs_strongify(self)
        [self setOn:on animated:animated];
        return self;
    };
}

-(JobsRetSwitchByColorBlock _Nonnull)byOnTintColor{
    @jobs_weakify(self)
    return ^__kindof UISwitch *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.onTintColor = data;
        return self;
    };
}

-(JobsRetSwitchByColorBlock _Nonnull)byThumbTintColor{
    @jobs_weakify(self)
    return ^__kindof UISwitch *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.thumbTintColor = data;
        return self;
    };
}

-(JobsRetSwitchByStyleBlock _Nonnull)byPreferredStyle API_AVAILABLE(ios(14.0)){
    @jobs_weakify(self)
    return ^__kindof UISwitch *_Nullable(UISwitchStyle data){
        @jobs_strongify(self)
        self.preferredStyle = data;
        return self;
    };
}

-(JobsRetSwitchByStringBlock _Nonnull)byTitle API_AVAILABLE(ios(14.0)){
    @jobs_weakify(self)
    return ^__kindof UISwitch *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetSwitchByImageBlock _Nonnull)byOnImage{
    @jobs_weakify(self)
    return ^__kindof UISwitch *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.onImage = data;
        return self;
    };
}

-(JobsRetSwitchByImageBlock _Nonnull)byOffImage{
    @jobs_weakify(self)
    return ^__kindof UISwitch *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.offImage = data;
        return self;
    };
}

@end
