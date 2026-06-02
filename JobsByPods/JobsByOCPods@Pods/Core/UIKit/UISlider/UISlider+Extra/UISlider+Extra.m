//
//  UISlider+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UISlider+Extra.h"

@implementation UISlider (Extra)

-(RACDisposable *)jobsSliderAllTouchEventBlock:(jobsByIDBlock)subscribeNextBlock{
    return [[self rac_signalForControlEvents:UIControlEventAllTouchEvents] subscribeNext:^(__kindof UIButton * _Nullable x) {
        if(subscribeNextBlock) subscribeNextBlock(x);
    }];
}

-(RACDisposable *)jobsSliderValueChangedEventBlock:(jobsByIDBlock)subscribeNextBlock{
    return [[self rac_signalForControlEvents:UIControlEventValueChanged] subscribeNext:^(__kindof UIButton * _Nullable x) {
        if(subscribeNextBlock) subscribeNextBlock(x);
    }];
}

@end
