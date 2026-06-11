//
//  UIView+Extra.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+Extra.h"

@implementation UIView (Extra)

-(JobsRetViewByFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float cornerRadiusValue) {
        @jobs_strongify(self)
        self.layer.cornerRadius = cornerRadiusValue;
        self.layer.masksToBounds = YES;
        return self;
    };
}

-(JobsRetViewByCorBlock _Nonnull)layerByBorderCor{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIColor *_Nullable layerBorderCor) {
        @jobs_strongify(self)
        self.layer.borderColor = layerBorderCor.CGColor;
        return self;
    };
}

-(JobsRetViewByFloatBlock _Nonnull)layerByBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float borderWidth) {
        @jobs_strongify(self)
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = CAShapeLayer.layer;
    maskLayer.frame = self.bounds;

    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

-(JobsRetViewByGestureRecognizer _Nonnull)addGesture{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(UIGestureRecognizer *_Nullable gesture) {
        @jobs_strongify(self)
        if(gesture) [self addGestureRecognizer:gesture];
        return self;
    };
}

-(JobsRetViewByBOOLBlock _Nonnull)旋转动画{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL start) {
        @jobs_strongify(self)
        if (start) {
            CGAffineTransform endAngle = CGAffineTransformMakeRotation(self.currentAngle * (M_PI / 180.0f));
            [UIView animateWithDuration:self.durationTime
                                  delay:self.delayTime
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                @jobs_strongify(self)
                self.transform = endAngle;
            } completion:^(BOOL finished) {
                @jobs_strongify(self)
                self.currentAngle += self.rotateChangeAngle;
                if (!self.isStopRotateAnimation) self.旋转动画(YES);
            }];
        } else {
            self.isStopRotateAnimation = !self.isStopRotateAnimation;
        };return self;
    };
}

-(JobsRetViewByViewBlock _Nonnull)addSubview{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView) {
        @jobs_strongify(self)
        if(!subView) return nil;
        [self addSubview:subView];
        return subView;
    };
}
#pragma mark —— Prop_assign()CGFloat rotateChangeAngle;
JobsKey(_rotateChangeAngle)
@dynamic rotateChangeAngle;
-(CGFloat)rotateChangeAngle{
    CGFloat RotateChangeAngle = [Jobs_getAssociatedObject(_rotateChangeAngle) floatValue];
    if (RotateChangeAngle == 0) {
        RotateChangeAngle = 20;
        Jobs_setAssociatedRETAIN_NONATOMIC(_rotateChangeAngle, @(RotateChangeAngle))
    };return RotateChangeAngle;
}

-(void)setRotateChangeAngle:(CGFloat)rotateChangeAngle{
    Jobs_setAssociatedRETAIN_NONATOMIC(_rotateChangeAngle, @(rotateChangeAngle))
}
#pragma mark —— Prop_assign()__block CGFloat currentAngle;
JobsKey(_currentAngle)
@dynamic currentAngle;
-(CGFloat)currentAngle{
    return [Jobs_getAssociatedObject(_currentAngle) floatValue];
}

-(void)setCurrentAngle:(CGFloat)currentAngle{
    Jobs_setAssociatedRETAIN_NONATOMIC(_currentAngle, @(currentAngle))
}
#pragma mark —— Prop_assign()CGFloat durationTime;
JobsKey(_durationTime)
@dynamic durationTime;
-(CGFloat)durationTime{
    CGFloat DurationTime = [Jobs_getAssociatedObject(_durationTime) floatValue];
    return DurationTime == 0 ? 0.1 : DurationTime;
}

-(void)setDurationTime:(CGFloat)durationTime{
    Jobs_setAssociatedRETAIN_NONATOMIC(_durationTime, @(durationTime))
}
#pragma mark —— Prop_assign()CGFloat delayTime;
JobsKey(_delayTime)
@dynamic delayTime;
-(CGFloat)delayTime{
    CGFloat DelayTime = [Jobs_getAssociatedObject(_delayTime) floatValue];
    if (DelayTime == 0) {
        DelayTime = 0.01;
        Jobs_setAssociatedRETAIN_NONATOMIC(_delayTime, @(DelayTime))
    };return DelayTime;
}

-(void)setDelayTime:(CGFloat)delayTime{
    Jobs_setAssociatedRETAIN_NONATOMIC(_delayTime, @(delayTime))
}
#pragma mark —— Prop_assign()BOOL isStopRotateAnimation;
JobsKey(_isStopRotateAnimation)
@dynamic isStopRotateAnimation;
-(BOOL)isStopRotateAnimation{
    return [Jobs_getAssociatedObject(_isStopRotateAnimation) boolValue];
}

-(void)setIsStopRotateAnimation:(BOOL)isStopRotateAnimation{
    Jobs_setAssociatedRETAIN_NONATOMIC(_isStopRotateAnimation, @(isStopRotateAnimation))
}

@end
