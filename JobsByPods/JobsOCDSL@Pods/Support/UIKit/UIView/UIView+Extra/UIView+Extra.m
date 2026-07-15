//
//  UIView+Extra.m
//  JobsOCDSL Support
//
//  Migrated from JobsByOCPods on 2026年6月10日，星期三.
//

#import "UIView+Extra.h"

@implementation UIView (Extra)
-(JobsRetViewByGestureRecognizer _Nonnull)addGesture{
    __weak typeof(self) weakSelf = self;
    return ^__kindof UIView *_Nullable(__kindof UIGestureRecognizer *_Nullable gesture) {
        __strong typeof(weakSelf) self = weakSelf;
        if(gesture) self.addGestureRecognizer(gesture);
        return self;
    };
}

-(JobsRetGestureByGesture _Nonnull)addGestureRecognizer{
    __weak typeof(self) weakSelf = self;
    return ^__kindof UIGestureRecognizer *_Nullable(__kindof UIGestureRecognizer *_Nullable gesture) {
        __strong typeof(weakSelf) self = weakSelf;
        if(gesture) [self addGestureRecognizer:gesture];
        return gesture;
    };
}

@end
