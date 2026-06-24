//
//  NSString+Extra.m
//  JobsDropDownListView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^NSMutableString *_Nullable(NSString *_Nonnull str) {
        @jobs_strongify(self)
        if(!str) str = JobsEmpty;
        // 系统的stringByAppendingString方法在参数为nil的时候会崩溃
        return JobsMutableString([self stringByAppendingString:str]); // 原始字符串不会改变，输出一个新的字符串
    };
}
#pragma mark —— 动画相关
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
