//
//  UIImageView+JobsOCSkeletonView.h
//  JobsOCSkeletonView
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCSkeletonView/UIView+JobsOCSkeletonView.h>)
#import <JobsOCSkeletonView/UIView+JobsOCSkeletonView.h>
#else
#import "UIView+JobsOCSkeletonView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (JobsOCSkeletonView)

-(void)jobs_beginShimmerLoading;
-(void)jobs_beginShimmerLoadingWithConfig:(nullable JobsOCSkeletonConfig *)config;
-(void)jobs_endShimmerLoading;
-(instancetype)jobs_setImage:(nullable UIImage *)image
                    fallback:(nullable UIImage *)fallback
               shimmerConfig:(nullable JobsOCSkeletonConfig *)shimmerConfig
                        fade:(NSTimeInterval)fade;

@end

NS_ASSUME_NONNULL_END
