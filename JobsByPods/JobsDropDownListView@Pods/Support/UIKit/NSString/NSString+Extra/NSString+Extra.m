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
