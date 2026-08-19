//
//  UICollectionViewCell+ShakeAnimation.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2021/1/1.
//

#import "UICollectionViewCell+ShakeAnimation.h"

@implementation UICollectionViewCell (ShakeAnimation)
/// 实现cell抖动方法
-(jobsByVoidBlock _Nonnull)beginShake{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CAKeyframeAnimation *anim = CAKeyframeAnimation.animation;
        anim.byKeyPath(@"transform.rotation");
        anim.byDuration(0.2);
        anim.byRepeatCount(MAXFLOAT);
        anim.values = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            data
                .add(@(-0.03))
                .add(@(0.03))
                .add(@(-0.03));
        });
        anim.byRemovedOnCompletion(NO);
        anim.byFillMode(kCAFillModeForwards);
        [self.layer addAnimation:anim forKey:@"shake"];
    };
}
/// 实现cell停止抖动方法
-(jobsByVoidBlock _Nonnull)stopShake{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.layer removeAllAnimations];
    };
}

@end
