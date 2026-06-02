//
//  UIGestureRecognizer+Extra.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIGestureRecognizer+Extra.h"

@implementation UIGestureRecognizer (Extra)

-(__kindof UIGestureRecognizer *)gestureActionBy:(jobsByVoidBlock _Nonnull)block{
    [self.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable gesture) {
        if(block) block();
    }];return self;
}

@end
