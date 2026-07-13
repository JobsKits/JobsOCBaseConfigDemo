//
//  JobsOCSkeletonConfig.m
//  JobsOCSkeletonView
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsOCSkeletonConfig.h"

@implementation JobsOCSkeletonConfig

+(instancetype)defaultConfig{
    return self.shimmerConfig;
}

+(instancetype)shimmerConfig{
    JobsOCSkeletonConfig *config = self.new;
    config.animationStyle = JobsOCSkeletonAnimationStyleShimmer;
    return config;
}

+(instancetype)pulseConfig{
    JobsOCSkeletonConfig *config = self.new;
    config.animationStyle = JobsOCSkeletonAnimationStylePulse;
    config.animationDuration = 0.9;
    return config;
}

-(instancetype)init{
    if (self = [super init]) {
        _baseColor = [UIColor colorWithWhite:0.90 alpha:1];
        _highlightColor = [UIColor colorWithWhite:1.0 alpha:0.92];
        _animationDuration = 1.4;
        _highlightWidthRatio = 0.35;
        _cornerRadius = -1;
        _animationStyle = JobsOCSkeletonAnimationStyleShimmer;
    };return self;
}

-(id)copyWithZone:(NSZone *)zone{
    JobsOCSkeletonConfig *config = [[[self class] allocWithZone:zone] init];
    config.baseColor = self.baseColor;
    config.highlightColor = self.highlightColor;
    config.animationDuration = self.animationDuration;
    config.highlightWidthRatio = self.highlightWidthRatio;
    config.cornerRadius = self.cornerRadius;
    config.animationStyle = self.animationStyle;
    return config;
}

-(instancetype)byBaseColor:(UIColor *)baseColor{
    self.baseColor = baseColor;
    return self;
}

-(instancetype)byHighlightColor:(UIColor *)highlightColor{
    self.highlightColor = highlightColor;
    return self;
}

-(instancetype)byAnimationDuration:(NSTimeInterval)animationDuration{
    self.animationDuration = MAX(animationDuration, 0.01);
    return self;
}

-(instancetype)byHighlightWidthRatio:(CGFloat)highlightWidthRatio{
    self.highlightWidthRatio = MIN(MAX(highlightWidthRatio, 0), 1);
    return self;
}

-(instancetype)byCornerRadius:(CGFloat)cornerRadius{
    self.cornerRadius = cornerRadius;
    return self;
}

-(instancetype)byAnimationStyle:(JobsOCSkeletonAnimationStyle)animationStyle{
    self.animationStyle = animationStyle;
    return self;
}

@end
