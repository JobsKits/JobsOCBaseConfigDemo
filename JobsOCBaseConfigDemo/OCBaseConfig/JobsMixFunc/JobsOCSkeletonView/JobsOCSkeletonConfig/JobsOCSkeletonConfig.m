//
//  JobsOCSkeletonConfig.m
//  JobsOCSkeletonView
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsOCSkeletonConfig.h"

@implementation JobsOCSkeletonConfig
+(JobsRetJobsOCSkeletonConfigByVoidBlock _Nonnull)defaultConfig{
    return ^JobsOCSkeletonConfig *{
        return self.shimmerConfig();
    };
}

+(JobsRetJobsOCSkeletonConfigByVoidBlock _Nonnull)shimmerConfig{
    return ^JobsOCSkeletonConfig *{
        JobsOCSkeletonConfig *config = self.new;
        config.byAnimationStyle(JobsOCSkeletonAnimationStyleShimmer);
        return config;
    };
}

+(JobsRetJobsOCSkeletonConfigByVoidBlock _Nonnull)pulseConfig{
    return ^JobsOCSkeletonConfig *{
        JobsOCSkeletonConfig *config = self.new;
        config.byAnimationStyle(JobsOCSkeletonAnimationStylePulse);
        config.byAnimationDuration(0.9);
        return config;
    };
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
    config.byBaseColor(self.baseColor);
    config.byHighlightColor(self.highlightColor);
    config.byAnimationDuration(self.animationDuration);
    config.byHighlightWidthRatio(self.highlightWidthRatio);
    config.byCornerRadius(self.cornerRadius);
    config.byAnimationStyle(self.animationStyle);
    return config;
}

-(JobsRetIDByUIColorBlock _Nonnull)byBaseColor{
    @jobs_weakify(self)
    return ^id(UIColor * baseColor){
        @jobs_strongify(self)
        if (!self) return nil;
        self.baseColor = baseColor;
        return self;
    };
}

-(JobsRetIDByUIColorBlock _Nonnull)byHighlightColor{
    @jobs_weakify(self)
    return ^id(UIColor * highlightColor){
        @jobs_strongify(self)
        if (!self) return nil;
        self.highlightColor = highlightColor;
        return self;
    };
}

-(JobsRetIDByNSTimeIntervalBlock _Nonnull)byAnimationDuration{
    @jobs_weakify(self)
    return ^id(NSTimeInterval animationDuration){
        @jobs_strongify(self)
        if (!self) return nil;
        self.animationDuration = MAX(animationDuration, 0.01);
        return self;
    };
}

-(JobsRetIDByCGFloatBlock _Nonnull)byHighlightWidthRatio{
    @jobs_weakify(self)
    return ^id(CGFloat highlightWidthRatio){
        @jobs_strongify(self)
        if (!self) return nil;
        self.highlightWidthRatio = MIN(MAX(highlightWidthRatio, 0), 1);
        return self;
    };
}

-(JobsRetIDByCGFloatBlock _Nonnull)byCornerRadius{
    @jobs_weakify(self)
    return ^id(CGFloat cornerRadius){
        @jobs_strongify(self)
        if (!self) return nil;
        self.cornerRadius = cornerRadius;
        return self;
    };
}

-(JobsRetIDByJobsOCSkeletonAnimationStyleBlock _Nonnull)byAnimationStyle{
    @jobs_weakify(self)
    return ^id(JobsOCSkeletonAnimationStyle animationStyle){
        @jobs_strongify(self)
        if (!self) return nil;
        self.animationStyle = animationStyle;
        return self;
    };
}

@end
