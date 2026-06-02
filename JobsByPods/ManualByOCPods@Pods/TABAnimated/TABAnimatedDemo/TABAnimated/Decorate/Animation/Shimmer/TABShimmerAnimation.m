//
//  TABShimmerAnimation.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABShimmerAnimation.h"

@implementation TABShimmerAnimation

- (instancetype)init {
    if (self = [super init]) {
        _shimmerBackColor = tab_kShimmerBackColor;
        _shimmerBackColorInDarkMode = tab_kDarkBackColor;
        
        _shimmerBrightness = 0.92;
        _shimmerBrightnessInDarkMode = 0.5;
        
        _shimmerDuration = 1.0;
    }
    return self;
}

@end
