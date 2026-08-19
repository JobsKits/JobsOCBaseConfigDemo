//
//  UIGestureRecognizer+Extra.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIGestureRecognizer+Extra.h"

@implementation UIGestureRecognizer (Extra)
-(JobsRetUIGestureRecognizerByjobsByVoidBlockBlock _Nonnull)gestureActionBy{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *(jobsByVoidBlock _Nonnull block){
        @jobs_strongify(self)
        if (!self) return nil;
        [self.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable gesture) {
            if(block) block();
        }];return self;
    };
}

@end
