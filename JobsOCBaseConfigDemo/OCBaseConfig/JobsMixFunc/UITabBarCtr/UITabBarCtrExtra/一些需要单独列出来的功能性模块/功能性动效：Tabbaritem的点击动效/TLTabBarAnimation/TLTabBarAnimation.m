//
//  TLTabBarAnimation.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TLTabBarAnimation.h"

#pragma mark —— 功能函数
/// 反转数组
NSArray *reversedArray(NSArray *arr) {
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:arr.count];
    for (NSInteger i = arr.count - 1; i >= 0; i--) {
        [temp addObject:arr[i]];
    };return [temp copy];
}
/// 创建CAKeyframeAnimation动画
CAKeyframeAnimation * createAnimation(NSString *keyPath,
                                      NSArray *values,
                                      CGFloat duration) {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    animation.byValues(values);
    animation.byDuration(kDuration);
    animation.byCalculationMode(@"cubic");
    return animation;
}
/// 播放贞动画
void playFrameAnimation(UIImageView *icon,
                        NSArray <CIImage *>*images) {
    CAKeyframeAnimation *animation = createAnimation(kAnimationKeyPathKeyFrame,
                                                     images,
                                                     kDuration);
    animation.byCalculationMode(@"discrete");
    animation.byRepeatCount(1);
    animation.byRemovedOnCompletion(NO);
    animation.byFillMode(kCAFillModeForwards);
    [icon.layer addAnimation:animation forKey:nil];
}
/// 植入烟花动画，并播放
void playFireworksAnimation(UIView *view,
                            UIImage *img,
                            CGFloat scale,
                            CGFloat scaleRange) {
    BOOL __block clipsToBounds = view.clipsToBounds;
    view.byClipsToBounds(NO);
    CGPoint center = CGPointMake(CGRectGetMidX(view.bounds),
                                 CGRectGetMidY(view.bounds));
    CAEmitterCell *explosionCell = [CAEmitterCell emitterCell];
    explosionCell.byName(@"explosion");
    explosionCell.byAlphaRange(0.20);
    explosionCell.byAlphaSpeed(-1.0);
    explosionCell.byLifetime(0.7);
    explosionCell.byLifetimeRange(0.3);
    explosionCell.byBirthRate(0);
    explosionCell.byVelocity(40.00);
    explosionCell.byVelocityRange(10.00);
    explosionCell.byContents((id)[img CGImage]);
    explosionCell.byScale(scale);
    explosionCell.byScaleRange(scaleRange);
    CAEmitterLayer __block *explosionLayer = [CAEmitterLayer layer];
    explosionLayer.byName(@"emitterLayer");
    explosionLayer.byEmitterShape(kCAEmitterLayerCircle);
    explosionLayer.byEmitterMode(kCAEmitterLayerOutline);
    explosionLayer.byEmitterSize(CGSizeMake(JobsWidth(25), 0));
    explosionLayer.byEmitterCells(@[explosionCell]);
    explosionLayer.byRenderMode(kCAEmitterLayerOldestFirst);
    explosionLayer.byMasksToBounds(NO);
    explosionLayer.bySeed(1366128504);
    explosionLayer.byEmitterPosition(center);
    [view.layer addSublayer:explosionLayer];
    CAEmitterCell *chargeCell = [CAEmitterCell emitterCell];
    chargeCell.byName(@"charge");
    chargeCell.byAlphaRange(0.20);
    chargeCell.byAlphaSpeed(-1.0);
    chargeCell.byLifetime(0.3);
    chargeCell.byLifetimeRange(0.1);
    chargeCell.byBirthRate(0);
    chargeCell.byVelocity(-40.0);
    chargeCell.byVelocityRange(0.00);
    chargeCell.byContents((id)[img CGImage]);
    chargeCell.byScale(scale);
    chargeCell.byScaleRange(scaleRange);
    CAEmitterLayer __block *chargeLayer = [CAEmitterLayer layer];
    chargeLayer.byName(@"emitterLayer");
    chargeLayer.byEmitterShape(kCAEmitterLayerCircle);
    chargeLayer.byEmitterMode(kCAEmitterLayerOutline);
    chargeLayer.byEmitterSize(CGSizeMake(JobsWidth(25), 0));
    chargeLayer.byEmitterCells(@[chargeCell]);
    chargeLayer.byRenderMode(kCAEmitterLayerOldestFirst);
    chargeLayer.byMasksToBounds(NO);
    chargeLayer.bySeed(1366128504);
    chargeLayer.byEmitterPosition(center);
    [view.layer addSublayer:chargeLayer];
    chargeLayer.byBeginTime(CACurrentMediaTime());
    [chargeLayer setValue:@100 forKeyPath:@"emitterCells.charge.birthRate"];
    NSTimeInterval time = kDuration * NSEC_PER_SEC;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, time), dispatch_get_main_queue(), ^{
        [chargeLayer setValue:@0 forKeyPath:@"emitterCells.charge.birthRate"];
        [chargeLayer removeFromSuperlayer];
        explosionLayer.byBeginTime(CACurrentMediaTime());
        [explosionLayer setValue:@300 forKeyPath:@"emitterCells.explosion.birthRate"];
        NSTimeInterval time = 0.3 * NSEC_PER_SEC;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, time), dispatch_get_main_queue(), ^{
            [explosionLayer setValue:@0 forKeyPath:@"emitterCells.explosion.birthRate"];
            [explosionLayer removeFromSuperlayer];
            view.byClipsToBounds(clipsToBounds);
        });
    });
}
#pragma mark —— TLBounceAnimation 弹性动画
@implementation TLBounceAnimation
- (void)playSelectAnimationWhitTabBarButton:(UIView *)button
                            buttonImageView:(UIImageView *)imageView
                            buttonTextLabel:(UILabel *)textLabel{
    CAKeyframeAnimation *bounceAnimation = createAnimation(kAnimationKeyPathScale, @[@1.0,
                                                                                     @0.85,
                                                                                     @1.15,
                                                                                     @0.95,
                                                                                     @1.02,
                                                                                     @1.0],
                                                           kDuration);
    [imageView.layer addAnimation:bounceAnimation forKey:nil];
    if(_isPlayFireworksAnimation) {
        UIImage *img = @"yanhua".img;
        playFireworksAnimation(imageView, img, 0.08, 0.03);
    }
}

- (void)playDeselectAnimationWhitTabBarButton:(UIView *)button
                              buttonImageView:(UIImageView *)imageView
                              buttonTextLabel:(UILabel *)textLabel{
}

@end
#pragma mark —— TLFumeAnimation 仿烟动画
@implementation TLFumeAnimation
- (void)playSelectAnimationWhitTabBarButton:(UIView *)button
                            buttonImageView:(UIImageView *)imageView
                            buttonTextLabel:(UILabel *)textLabel{
    playMoveIconAnimation(imageView,@[@(imageView.center.y),
                                      @(imageView.center.y + 4.0)]);
    playSelectLabelAnimation(textLabel);
}

- (void)playDeselectAnimationWhitTabBarButton:(UIView *)button
                              buttonImageView:(UIImageView *)imageView
                              buttonTextLabel:(UILabel *)textLabel{
    playMoveIconAnimation(imageView,@[@(imageView.center.y + 4.0),
                                      @(imageView.center.y)]);
    playDeselectLabelAnimation(textLabel);
}

void playMoveIconAnimation(UIImageView *icon,
                           NSArray *values) {
    CAKeyframeAnimation *animation = createAnimation(kAnimationKeyPathPositionY,
                                                     values,
                                                     kDuration / 2);
    animation.byFillMode(kCAFillModeForwards);
    animation.byRemovedOnCompletion(NO);
    [icon.layer addAnimation:animation forKey:nil];
}

void playSelectLabelAnimation(UILabel *textLabel) {
    CAKeyframeAnimation *animation = createAnimation(kAnimationKeyPathPositionY,
                                                     @[@(textLabel.center.y),@(textLabel.center.y - 60.0)],
                                                     kDuration);
    animation.byFillMode(kCAFillModeRemoved);
    [textLabel.layer addAnimation:animation forKey:nil];
    CAKeyframeAnimation *scaleAnimation = createAnimation(kAnimationKeyPathScale,
                                                          @[@1.0,@2.0],
                                                          kDuration);
    scaleAnimation.byFillMode(kCAFillModeRemoved);
    [textLabel.layer addAnimation:scaleAnimation forKey:nil];
    CAKeyframeAnimation * opacityAnimation = createAnimation(kAnimationKeyPathOpacity,
                                                             @[@1.0,@0.0],
                                                             kDuration);
    [textLabel.layer addAnimation:opacityAnimation forKey:nil];
    textLabel.byAlpha(0);
}

void playDeselectLabelAnimation(UILabel *textLabel) {
    CAKeyframeAnimation *animation = createAnimation(kAnimationKeyPathPositionY,
                                                     @[@(textLabel.center.y + 15),@(textLabel.center.y)],
                                                     kDuration);
    [textLabel.layer addAnimation:animation forKey:nil];
    CAKeyframeAnimation * opacityAnimation = createAnimation(kAnimationKeyPathOpacity,
                                                             @[@0.0, @1.0],
                                                             kDuration);
    [textLabel.layer addAnimation:opacityAnimation forKey:nil];
    textLabel.byAlpha(1);
}

@end
#pragma mark —— TLRotationAnimation 旋转动画
@implementation TLRotationAnimation
- (void)playSelectAnimationWhitTabBarButton:(UIView *)button
                            buttonImageView:(UIImageView *)imageView
                            buttonTextLabel:(UILabel *)textLabel{
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:kAnimationKeyPathRotation];
    rotateAnimation.byFromValue(@0.0);
    rotateAnimation.byToValue(@(-M_PI * 2));
    rotateAnimation.byDuration(kDuration);
    [imageView.layer addAnimation:rotateAnimation forKey:nil];
}

- (void)playDeselectAnimationWhitTabBarButton:(UIView *)button
                              buttonImageView:(UIImageView *)imageView
                              buttonTextLabel:(UILabel *)textLabel{
}

@end
#pragma mark —— TLFrameAnimation Frame动画
@implementation TLFrameAnimation
- (void)playSelectAnimationWhitTabBarButton:(UIView *)button
                            buttonImageView:(UIImageView *)imageView
                            buttonTextLabel:(UILabel *)textLabel{
    if (self.images.count > 0) {
        playFrameAnimation(imageView, self.images);
        if(_isPlayFireworksAnimation) {
            UIImage *img = @"yanhua".img;
            playFireworksAnimation(imageView,
                                   img,
                                   0.08,
                                   0.03);
        }
    }
}

- (void)playDeselectAnimationWhitTabBarButton:(UIView *)button
                              buttonImageView:(UIImageView *)imageView
                              buttonTextLabel:(UILabel *)textLabel{
    if (self.images.count > 0) {
        playFrameAnimation(imageView, reversedArray(self.images));
    }
}

@end
#pragma mark —— TLTransitionAniamtion 翻转动画
@implementation TLTransitionAniamtion
- (void)playSelectAnimationWhitTabBarButton:(UIView *)button
                            buttonImageView:(UIImageView *)imageView
                            buttonTextLabel:(UILabel *)textLabel{
    if(self.direction <= 0) self.direction = 1;
    if(self.direction > 6) self.direction = 6;
    NSUInteger opts = [@[@1,
                         @2,
                         @6,
                         @7,
                         @3,
                         @4][self.direction - 1] integerValue] << 20;
    [UIView transitionWithView:imageView
                      duration:kDuration
                       options:opts
                    animations:nil
                    completion:nil];
}

- (void)playDeselectAnimationWhitTabBarButton:(UIView *)button
                              buttonImageView:(UIImageView *)imageView
                              buttonTextLabel:(UILabel *)textLabel{
    if(_disableDeselectAnimation) return;
    NSUInteger index = self.direction % 2 == 0 ? self.direction - 1 : self.direction + 1;
    NSUInteger opts = [@[@1,
                         @2,
                         @6,
                         @7,
                         @3,
                         @4][index - 1] integerValue] << 20;
    [UIView transitionWithView:imageView
                      duration:kDuration
                       options:opts
                    animations:nil
                    completion:nil];
}

@end
