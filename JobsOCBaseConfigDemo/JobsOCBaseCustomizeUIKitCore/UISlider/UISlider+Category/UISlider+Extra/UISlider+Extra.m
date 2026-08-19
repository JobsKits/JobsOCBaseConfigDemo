//
//  UISlider+Extra.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2022/7/9.
//

#import "UISlider+Extra.h"

@implementation UISlider (Extra)
-(JobsRetRACDisposableByRACNextBlock _Nonnull)jobsSliderAllTouchEventBlock{
    @jobs_weakify(self)
    return ^RACDisposable *(jobsByIDBlock subscribeNextBlock){
        @jobs_strongify(self)
        if (!self) return nil;
        return [[self rac_signalForControlEvents:UIControlEventAllTouchEvents] subscribeNext:^(__kindof UIButton * _Nullable x) {
            if(subscribeNextBlock) subscribeNextBlock(x);
        }];
    };
}

-(JobsRetRACDisposableByRACNextBlock _Nonnull)jobsSliderValueChangedEventBlock{
    @jobs_weakify(self)
    return ^RACDisposable *(jobsByIDBlock subscribeNextBlock){
        @jobs_strongify(self)
        if (!self) return nil;
        return [[self rac_signalForControlEvents:UIControlEventValueChanged] subscribeNext:^(__kindof UIButton * _Nullable x) {
            if(subscribeNextBlock) subscribeNextBlock(x);
        }];
    };
}

-(RACDisposable *_Nullable)jobsSliderValueChangedEventBlock:(jobsByIDBlock _Nullable)subscribeNextBlock{
    return [self jobsSliderValueChangedEventBlock](subscribeNextBlock);
}

@end
