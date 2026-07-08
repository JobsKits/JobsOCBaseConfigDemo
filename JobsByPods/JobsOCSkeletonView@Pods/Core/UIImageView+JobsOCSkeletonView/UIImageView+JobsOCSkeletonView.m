//
//  UIImageView+JobsOCSkeletonView.m
//  JobsOCSkeletonView
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "UIImageView+JobsOCSkeletonView.h"

@implementation UIImageView (JobsOCSkeletonView)

-(void)jobs_beginShimmerLoading{
    [self jobs_beginShimmerLoadingWithConfig:nil];
}

-(void)jobs_beginShimmerLoadingWithConfig:(JobsOCSkeletonConfig *)config{
    self.image = nil;
    self.bySkeletonable(YES);
    [self jobs_startSkeletonWithConfig:config ?: JobsOCSkeletonConfig.defaultConfig];
}

-(void)jobs_endShimmerLoading{
    [self jobs_stopSkeleton];
}

-(instancetype)jobs_setImage:(UIImage *)image
                    fallback:(UIImage *)fallback
               shimmerConfig:(JobsOCSkeletonConfig *)shimmerConfig
                        fade:(NSTimeInterval)fade{
    UIImage *targetImage = image ?: fallback;
    if (!targetImage) {
        [self jobs_beginShimmerLoadingWithConfig:shimmerConfig ?: JobsOCSkeletonConfig.defaultConfig];
        return self;
    }
    [self jobs_endShimmerLoading];
    if (fade <= 0) {
        self.image = targetImage;
        return self;
    }
    [UIView transitionWithView:self
                      duration:fade
                       options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionBeginFromCurrentState
                    animations:^{
        self.image = targetImage;
    } completion:nil];
    return self;
}

@end
