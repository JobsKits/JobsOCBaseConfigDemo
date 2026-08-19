//
//  UITextField+Animation.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITextField+Animation.h"

@implementation UITextField (Animation)
#pragma mark —— 一些动画
/// 输入的和某个预设定值不一致的时候，抖动动画
-(jobsByStrBlock _Nonnull)isValidate{
    @jobs_weakify(self)
    return ^(NSString * validate){
        @jobs_strongify(self)
        if (!self) return;
        if (![self.text isEqualToString:validate]) {
            self.shakeAnimationForView();
        }
    };
}
/// 输入的为空，抖动动画
-(jobsByVoidBlock _Nonnull)isEmptyText{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (isNull(self.text)) {
            self.shakeAnimationForView();
        }
    };
}

-(jobsByVoidBlock _Nonnull)shakeAnimationForView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CALayer *lay_lb = self.layer;
        CGPoint pos_lb = lay_lb.position;
        CGPoint y = CGPointMake(pos_lb.x - 10, pos_lb.y);
        CGPoint x = CGPointMake(pos_lb.x + 10, pos_lb.y);
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [animation setFromValue:[NSValue valueWithCGPoint:x]];
        [animation setToValue:[NSValue valueWithCGPoint:y]];
        [animation setAutoreverses:YES];
        [animation setDuration:0.08];
        [animation setRepeatCount:3];
        [lay_lb addAnimation:animation forKey:nil];
    };
}

@end
