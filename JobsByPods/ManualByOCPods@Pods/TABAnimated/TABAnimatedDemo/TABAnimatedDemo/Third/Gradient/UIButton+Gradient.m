//
//  UIButton+Gradient.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//


#import "UIButton+Gradient.h"

@implementation UIButton (Gradient)

- (UIButton *)gradientButtonWithSize:(CGSize)btnSize colorArray:(NSArray *)clrs percentageArray:(NSArray *)percent gradientType:(GradientType)type {
    
    UIImage *backImage = [[UIImage alloc]createImageWithSize:btnSize gradientColors:clrs percentage:percent gradientType:type];
    
    [self setBackgroundImage:backImage forState:UIControlStateNormal];
    
    return self;
}

@end
