//
//  NSString+CAAnimation.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+CAAnimation.h"

@implementation NSString (CAAnimation)
/// 创建CABasicAnimation
-(JobsRetCABasicAnimationByVoidBlock _Nonnull)basicAnimation{
    @jobs_weakify(self)
    return ^CABasicAnimation *{
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeCABasicAnimationBy(self);
    };
}
/// 创建CAKeyframeAnimation（关键帧动画）
-(JobsRetCAKeyframeAnimationByVoidBlock _Nonnull)keyframeAnimation{
    @jobs_weakify(self)
    return ^CAKeyframeAnimation *{
        @jobs_strongify(self)
        if (!self) return nil;
        return [CAKeyframeAnimation animationWithKeyPath:self];
    };
}

-(JobsRetCAMediaTimingFunctionByVoidBlock _Nonnull)makeCAMediaTimingFunction{
    @jobs_weakify(self)
    return ^CAMediaTimingFunction *{
        @jobs_strongify(self)
        if (!self) return nil;
        return [CAMediaTimingFunction functionWithName:self];
    };
}

-(JobsRetCAKeyframeAnimationByjobsByCAKeyframeAnimationBlockBlock _Nonnull)makeCAKeyframeAnimationByBlock{
    @jobs_weakify(self)
    return ^CAKeyframeAnimation *(jobsByCAKeyframeAnimationBlock _Nonnull block){
        @jobs_strongify(self)
        if (!self) return nil;
        CAKeyframeAnimation *animation = self.keyframeAnimation();
        if(block) block(animation);
        return animation;
    };
}

-(JobsRetCABasicAnimationByjobsByCABasicAnimationBlockBlock _Nonnull)makeCABasicAnimationByBlock{
    @jobs_weakify(self)
    return ^CABasicAnimation *(jobsByCABasicAnimationBlock _Nonnull block){
        @jobs_strongify(self)
        if (!self) return nil;
        CABasicAnimation *animation = jobsMakeCABasicAnimationBy(self);
        if(block) block(animation);
        return animation;
    };
}

@end
