//
//  UISlider+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "UISlider+DSL.h"

@implementation UISlider (DSL)
#pragma mark —— Value
-(JobsRetSliderByFloatBlock _Nonnull)byMinimumValue{
    @jobs_weakify(self)
    return ^__kindof UISlider *_Nullable(float data){
        @jobs_strongify(self)
        self.minimumValue = data;
        return self;
    };
}

-(JobsRetSliderByFloatBlock _Nonnull)byMaximumValue{
    @jobs_weakify(self)
    return ^__kindof UISlider *_Nullable(float data){
        @jobs_strongify(self)
        self.maximumValue = data;
        return self;
    };
}

-(JobsRetSliderByFloatBlock _Nonnull)byValue{
    @jobs_weakify(self)
    return ^__kindof UISlider *_Nullable(float data){
        @jobs_strongify(self)
        self.value = data;
        return self;
    };
}
#pragma mark —— Tint
-(JobsRetSliderByColorBlock _Nonnull)byMinimumTrackTintColor{
    @jobs_weakify(self)
    return ^__kindof UISlider *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.minimumTrackTintColor = color;
        return self;
    };
}

-(JobsRetSliderByColorBlock _Nonnull)byMaximumTrackTintColor{
    @jobs_weakify(self)
    return ^__kindof UISlider *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.maximumTrackTintColor = color;
        return self;
    };
}

-(JobsRetSliderByColorBlock _Nonnull)byThumbTintColor{
    @jobs_weakify(self)
    return ^__kindof UISlider *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.thumbTintColor = color;
        return self;
    };
}

@end
