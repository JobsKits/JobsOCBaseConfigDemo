//
//  UIView+Extra.m
//  JobsOCDSL Support
//
//  Created by Jobs on 2026年6月10日，星期三.
//

#import "UIView+Extra.h"

@implementation UIView (Extra)
-(JobsRetViewByGestureRecognizer _Nonnull)addGesture{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIGestureRecognizer *_Nullable gesture) {
        @jobs_strongify(self)
        if(gesture) self.addGestureRecognizer(gesture);
        return self;
    };
}

-(JobsRetGestureByGesture _Nonnull)addGestureRecognizer{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(__kindof UIGestureRecognizer *_Nullable gesture) {
        @jobs_strongify(self)
        if(gesture) [self addGestureRecognizer:gesture];
        return gesture;
    };
}

@end
