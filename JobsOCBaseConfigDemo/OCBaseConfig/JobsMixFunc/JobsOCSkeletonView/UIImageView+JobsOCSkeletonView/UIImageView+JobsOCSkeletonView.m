//
//  UIImageView+JobsOCSkeletonView.m
//  JobsOCSkeletonView
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "UIImageView+JobsOCSkeletonView.h"

@implementation UIImageView (JobsOCSkeletonView)
-(jobsByVoidBlock _Nonnull)jobs_beginShimmerLoading{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.jobs_beginShimmerLoadingWithConfig(nil);
    };
}

-(jobsByJobsOCSkeletonConfigBlock _Nonnull)jobs_beginShimmerLoadingWithConfig{
    @jobs_weakify(self)
    return ^(JobsOCSkeletonConfig * config){
        @jobs_strongify(self)
        if (!self) return;
        self.byImage(nil);
        self.bySkeletonable(YES);
        self.jobs_startSkeletonWithConfig(config ?: JobsOCSkeletonConfig.defaultConfig());
    };
}

-(jobsByVoidBlock _Nonnull)jobs_endShimmerLoading{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.jobs_stopSkeleton();
    };
}

-(instancetype)jobs_setImage:(UIImage *)image
                    fallback:(UIImage *)fallback
               shimmerConfig:(JobsOCSkeletonConfig *)shimmerConfig
                        fade:(NSTimeInterval)fade{
    UIImage *targetImage = image ?: fallback;
    if (!targetImage) {
        self.jobs_beginShimmerLoadingWithConfig(shimmerConfig ?: JobsOCSkeletonConfig.defaultConfig());
        return self;
    }
    self.jobs_endShimmerLoading();
    if (fade <= 0) {
        self.byImage(targetImage);
        return self;
    }
    [UIView transitionWithView:self
                      duration:fade
                       options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionBeginFromCurrentState
                    animations:^{
        self.byImage(targetImage);
    } completion:nil];
    return self;
}

@end
