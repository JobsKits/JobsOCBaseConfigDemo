//
//  UIImageView+JobsOCSkeletonView.h
//  JobsOCSkeletonView
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#if __has_include(<JobsOCSkeletonView/UIView+JobsOCSkeletonView.h>)
#import <JobsOCSkeletonView/UIView+JobsOCSkeletonView.h>
#else
#import "UIView+JobsOCSkeletonView.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (JobsOCSkeletonView)

-(jobsByVoidBlock _Nonnull)jobs_beginShimmerLoading;
-(jobsByJobsOCSkeletonConfigBlock _Nonnull)jobs_beginShimmerLoadingWithConfig;
-(jobsByVoidBlock _Nonnull)jobs_endShimmerLoading;
-(instancetype)jobs_setImage:(nullable UIImage *)image
                    fallback:(nullable UIImage *)fallback
               shimmerConfig:(nullable JobsOCSkeletonConfig *)shimmerConfig
                        fade:(NSTimeInterval)fade;

@end

NS_ASSUME_NONNULL_END
