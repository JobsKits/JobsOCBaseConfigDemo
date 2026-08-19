//
//  UISwitch+UI.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UISwitch+UI.h"

@implementation UISwitch (UI)
-(JobsRetRACDisposableByRACNextBlock _Nonnull)jobsSwitchClickEventBlock{
    @jobs_weakify(self)
    return ^RACDisposable *(jobsByIDBlock subscribeNextBlock){
        @jobs_strongify(self)
        if (!self) return nil;
        return [[self rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIButton * _Nullable x) {
            if(subscribeNextBlock) subscribeNextBlock(x);
        }];
    };
}

@end
