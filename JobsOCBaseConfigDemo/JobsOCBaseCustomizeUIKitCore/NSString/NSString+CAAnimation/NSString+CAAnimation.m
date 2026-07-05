//
//  NSString+CAAnimation.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+CAAnimation.h"

@implementation NSString (CAAnimation)
/// 创建CABasicAnimation
-(CABasicAnimation *)basicAnimation{
    return jobsMakeCABasicAnimationBy(self);
}
/// 创建CAKeyframeAnimation（关键帧动画）
-(CAKeyframeAnimation *)keyframeAnimation{
    return [CAKeyframeAnimation animationWithKeyPath:self];
}

-(CAMediaTimingFunction *)makeCAMediaTimingFunction{
    return [CAMediaTimingFunction functionWithName:self];
}

-(CAKeyframeAnimation *)makeCAKeyframeAnimationByBlock:(jobsByCAKeyframeAnimationBlock _Nonnull)block{
    CAKeyframeAnimation *animation = self.keyframeAnimation;
    if(block) block(animation);
    return animation;
}

-(CABasicAnimation *)makeCABasicAnimationByBlock:(jobsByCABasicAnimationBlock _Nonnull)block{
    CABasicAnimation *animation = jobsMakeCABasicAnimationBy(self);
    if(block) block(animation);
    return animation;
}

@end
