//
//  UICollectionViewCell+ShakeAnimation.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UICollectionViewCell+ShakeAnimation.h"

@implementation UICollectionViewCell (ShakeAnimation)
/// 实现cell抖动方法
-(void)beginShake{
    CAKeyframeAnimation *anim = CAKeyframeAnimation.animation;
    anim.keyPath = @"transform.rotation";
    anim.duration = 0.2;
    anim.repeatCount = MAXFLOAT;
    anim.values = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        data.add(@(-0.03));
        data.add(@(0.03));
        data.add(@(-0.03));
    });
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:anim forKey:@"shake"];
}
/// 实现cell停止抖动方法
-(void)stopShake{
    [self.layer removeAllAnimations];
}

@end
