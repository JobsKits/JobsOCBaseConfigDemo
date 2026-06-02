//
//  TABAnimationMethod.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABAnimationMethod.h"

@implementation TABAnimationMethod

NSString *tab_NSStringFromIndex(NSInteger index) {
    return [NSString stringWithFormat:@"%ld", index];
}

+ (void)addEaseOutAnimation:(UIView *)view {
    CATransition *animation = [CATransition animation];
    animation.duration = 0.2;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionFade;
    [view.layer addAnimation:animation forKey:@"animation"];
}

+ (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

@end
