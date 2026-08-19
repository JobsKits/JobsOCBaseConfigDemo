//
//  UIView+Animation.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+Animation.h"

static NSString *const JobsSpinAnimationKey = @"jobs.spin";
JobsKey(JobsSpinPausedAngleKey)
JobsKey(JobsSpinRevolutionsPerSecondKey)

@implementation UIView (Animation)
#pragma mark —— 一些功能方法
-(JobsRetViewByBOOLBlock _Nonnull)抖动动画{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL open) {
        @jobs_strongify(self)
        open ? [self.layer addAnimation:self.shakeAnim forKey:@"shake"] : [self.layer removeAnimationForKey:@"shake"];
        return self;
    };
}
/// 一直不停地旋转
-(JobsRetViewByBOOLBlock _Nonnull)旋转动画{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL start) {
        @jobs_strongify(self)
        if (start) {
            // 获取结束时的角度
            CGAffineTransform endAngle = CGAffineTransformMakeRotation(self.currentAngle * (M_PI / 180.0f));
            // 动画部分
            [UIView animateWithDuration:self.durationTime
                                  delay:self.delayTime
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                @jobs_strongify(self)
                self.byTransform(endAngle);
            } completion:^(BOOL finished) {
                @jobs_strongify(self)
                // 增加角度
                self.currentAngle += self.rotateChangeAngle;
                // 判断是否继续旋转
                if (!self.isStopRotateAnimation) {
                    // 递归调用旋转动画
                    self.旋转动画(YES);
                }
            }];
        } else {
            // 停止旋转
            self.byStopRotateAnimation(!self.isStopRotateAnimation);
        };return self;
    };
}
/// 持续旋转 sublayers，不改变 UIView.transform，避免干扰拖拽与点击回弹
-(JobsRetViewByVoidBlock _Nonnull)bySpinStart{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void) {
        @jobs_strongify(self)
        return self.bySpinStartBy(1.0);
    };
}
/// 按每秒圈数持续旋转 sublayers
-(JobsRetViewByCGFloatBlock _Nonnull)bySpinStartBy{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat revolutionsPerSecond) {
        @jobs_strongify(self)
        CGFloat speed = MAX(0.001, revolutionsPerSecond);
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsSpinRevolutionsPerSecondKey, @(speed))
        if (self.jobs_isSpinning()) return self;
        NSNumber *pausedAngle = Jobs_getAssociatedObject(JobsSpinPausedAngleKey);
        CGFloat startAngle = pausedAngle ? pausedAngle.doubleValue : 0;
        self.layer.bySublayerTransform(CATransform3DMakeRotation(startAngle, 0, 0, 1));
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"sublayerTransform.rotation.z"];
        animation.fromValue = @(startAngle);
        animation.toValue = @(startAngle + M_PI * 2);
        animation.byDuration(1.0 / speed);
        animation.byRepeatCount(INFINITY);
        animation.removedOnCompletion = NO;
        animation.byFillMode(kCAFillModeForwards);
        [self.layer addAnimation:animation forKey:JobsSpinAnimationKey];
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsSpinPausedAngleKey, nil)
        return self;
    };
}
/// 暂停旋转并冻结当前角度
-(JobsRetViewByVoidBlock _Nonnull)bySpinPause{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void) {
        @jobs_strongify(self)
        if (!self.jobs_isSpinning()) return self;
        CALayer *presentationLayer = self.layer.presentationLayer;
        CATransform3D currentTransform = presentationLayer ? presentationLayer.sublayerTransform : self.layer.sublayerTransform;
        self.layer.bySublayerTransform(currentTransform);
        CGFloat currentAngle = atan2(currentTransform.m12, currentTransform.m11);
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsSpinPausedAngleKey, @(currentAngle))
        [self.layer removeAnimationForKey:JobsSpinAnimationKey];
        return self;
    };
}
/// 从暂停角度继续旋转
-(JobsRetViewByVoidBlock _Nonnull)bySpinResume{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void) {
        @jobs_strongify(self)
        NSNumber *speed = Jobs_getAssociatedObject(JobsSpinRevolutionsPerSecondKey);
        return self.bySpinStartBy(speed ? speed.doubleValue : 1.0);
    };
}
/// 停止旋转并恢复初始角度
-(JobsRetViewByVoidBlock _Nonnull)bySpinStop{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(void) {
        @jobs_strongify(self)
        [self.layer removeAnimationForKey:JobsSpinAnimationKey];
        self.layer.bySublayerTransform(CATransform3DIdentity);
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsSpinPausedAngleKey, nil)
        return self;
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)jobs_isSpinning{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return [self.layer animationForKey:JobsSpinAnimationKey] != nil;
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)jobs_isSpinPaused{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return !self.jobs_isSpinning() && Jobs_getAssociatedObject(JobsSpinPausedAngleKey) != nil;
    };
}
/// 旋转一定时间之后停止下来
-(JobsRetViewByFloatBlock _Nonnull)旋转动画By{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(float data) {
        @jobs_strongify(self)
        // 设置目标角度（例如：旋转360度）
        CGFloat angleInRadians = self.currentAngle * (M_PI / 180.0f);
        CGAffineTransform endTransform = CGAffineTransformMakeRotation(angleInRadians);
        [UIView animateWithDuration:data // 只旋转data秒
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
            @jobs_strongify(self)
            self.byTransform(endTransform);
        } completion:^(BOOL finished) {
            // 动画完成后不再递归调用
        }];return self;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)图片从小放大{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable() {
        @jobs_strongify(self)
        CAKeyframeAnimation *popAnimation = @"transform".keyframeAnimation();
        popAnimation.byDuration(1);
        popAnimation.values = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data
                .add([NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f,0.01f,1.0f)])
                .add([NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f,1.1f,1.0f)])
                .add([NSValue valueWithCATransform3D:CATransform3DIdentity]);
        });
        popAnimation.keyTimes = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data
                .add(@0.0f)
                .add(@0.5f)
                .add(@0.75f)
                .add(@1.0f);
        });
        popAnimation.timingFunctions = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data
                .add(kCAMediaTimingFunctionEaseInEaseOut.makeCAMediaTimingFunction())
                .add(kCAMediaTimingFunctionEaseInEaseOut.makeCAMediaTimingFunction())
                .add(kCAMediaTimingFunctionEaseInEaseOut.makeCAMediaTimingFunction());
        });
        [self.layer addAnimation:popAnimation forKey:nil];
        return self;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)视图上下一直来回跳动的动画{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable() {
        @jobs_strongify(self)
        CABasicAnimation *hover = @"position".basicAnimation();
        hover.byAdditive(YES);
        hover.byFromValue([NSValue valueWithCGPoint:CGPointZero]);
        hover.byToValue([NSValue valueWithCGPoint:CGPointMake(0.0, -10.0)]);
        hover.byAutoreverses(YES);
        hover.byDuration(0.5);
        hover.byRepeatCount(INFINITY);
        hover.byRemovedOnCompletion(NO);
        [self.layer addAnimation:hover forKey:@"myHoverAnimation"];
        return self;
    };
}
/// 点击放大再缩小
-(jobsByjobsByIDBlockBlock _Nonnull)addViewAnimationWithCompletionBlock{
    @jobs_weakify(self)
    return ^(jobsByIDBlock _Nullable completionBlock){
        @jobs_strongify(self)
        if (!self) return;
        self.byTransform(CGAffineTransformIdentity);
        [UIView animateKeyframesWithDuration:0.5
                                       delay:0
                                     options:0
                                  animations:^{
            @jobs_weakify(self)
            [UIView addKeyframeWithRelativeStartTime:0
                                    relativeDuration:1 / 3.0
                                          animations:^{
                @jobs_strongify(self)
                self.byTransform(CGAffineTransformMakeScale(1.5, 1.5));
            }];
            [UIView addKeyframeWithRelativeStartTime:1/3.0
                                    relativeDuration:1/3.0
                                          animations:^{
                @jobs_strongify(self)
                self.byTransform(CGAffineTransformMakeScale(0.8, 0.8));
            }];
            [UIView addKeyframeWithRelativeStartTime:2/3.0
                                    relativeDuration:1/3.0
                                          animations:^{
                @jobs_strongify(self)
                self.byTransform(CGAffineTransformMakeScale(1.0, 1.0));
            }];
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@1);
        }];
    };
}
/// 逐渐显示
-(void)graduallyShowWithAnimationBlock:(jobsByIDBlock _Nullable)animationBlock
                       completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    self.byAlpha(0.0);
    @jobs_weakify(self)
    [UIView animateWithDuration:0.3
                          delay:0.05
                        options:0
                     animations:^{
        @jobs_strongify(self)
        self.byAlpha(1.0);
        if (animationBlock) animationBlock(@(1));
    } completion:^(BOOL finished) {
        if (completionBlock) completionBlock(@(1));
    }];
}
/// 逐渐消退
-(void)graduallyDisappearWithAnimationBlock:(jobsByIDBlock _Nullable)animationBlock
                            completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    @jobs_weakify(self)
    [UIView animateWithDuration:0.3
                          delay:0.05
                        options:0
                     animations:^{
        @jobs_strongify(self)
        self.byAlpha(0.0);
        if (animationBlock) animationBlock(@(1));
    } completion:^(BOOL finished) {
        if (completionBlock) completionBlock(@(1));
    }];
}
/// 重力弹跳动画效果
-(void)shakerAnimationWithDuration:(NSTimeInterval)duration
                            height:(float)height{
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    CGFloat currentTx = self.transform.ty;
    animation.byDuration(duration);
    animation.values = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        data
            .add(@(currentTx))
            .add(@(currentTx + height))
            .add(@(currentTx - height / 3 * 2))
            .add(@(currentTx + height / 3 * 2))
            .add(@(currentTx - height / 3))
            .add(@(currentTx + height / 3))
            .add(@(currentTx));
    });
    animation.keyTimes = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        data
            .add(@(0))
            .add(@(0.225))
            .add(@(0.425))
            .add(@(0.6))
            .add(@(0.75))
            .add(@(0.875))
            .add(@(1));
    });
    animation.byTimingFunction([CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]);
    [self.layer addAnimation:animation forKey:@"kViewShakerAnimationKey"];
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
    if (DurationTime == 0) {
        DurationTime = 0.1;//缺省值
    };return DurationTime;
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
        DelayTime = 0.01;//缺省值
        Jobs_setAssociatedRETAIN_NONATOMIC(_delayTime, @(DelayTime))
    };return DelayTime;
}

-(void)setDelayTime:(CGFloat)delayTime{
    Jobs_setAssociatedRETAIN_NONATOMIC(_delayTime, @(delayTime))
}
#pragma mark —— Prop_assign()BOOL isStopRotateAnimation;// 默认值为NO（一直旋转）
JobsKey(_isStopRotateAnimation)
@dynamic isStopRotateAnimation;
-(BOOL)isStopRotateAnimation{
    return [Jobs_getAssociatedObject(_isStopRotateAnimation) boolValue];
}

-(void)setIsStopRotateAnimation:(BOOL)isStopRotateAnimation{
    Jobs_setAssociatedRETAIN_NONATOMIC(_isStopRotateAnimation, @(isStopRotateAnimation))
}
#pragma mark —— Prop_strong()CAKeyframeAnimation *shakeAnim;
JobsKey(_shakeAnim)
@dynamic shakeAnim;
-(CAKeyframeAnimation *)shakeAnim{
    CAKeyframeAnimation *ShakeAnim = Jobs_getAssociatedObject(_shakeAnim);
    if (!ShakeAnim) {
        #define Angle2Radian(angle) ((angle) / 180.0 * M_PI)
        jobsMakeCAKeyframeAnimation(^(__kindof CAKeyframeAnimation * _Nullable animation) {
            animation
                .byKeyPath(@"transform.rotation")
                .byDuration(0.25)
                .byRepeatCount(MAXFLOAT)
                .byRemovedOnCompletion(NO)
                .byFillMode(kCAFillModeForwards);
            animation.values = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
                arr.add(@(Angle2Radian(-baseRandomContainBorderValue(7))))
                .add(@(Angle2Radian(baseRandomContainBorderValue(7))))
                .add(@(Angle2Radian(-baseRandomContainBorderValue(7))));
            });
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_shakeAnim, ShakeAnim)
    };return ShakeAnim;
}

-(void)setShakeAnim:(CAKeyframeAnimation *)shakeAnim{
    Jobs_setAssociatedRETAIN_NONATOMIC(_shakeAnim, shakeAnim)
}

@end
