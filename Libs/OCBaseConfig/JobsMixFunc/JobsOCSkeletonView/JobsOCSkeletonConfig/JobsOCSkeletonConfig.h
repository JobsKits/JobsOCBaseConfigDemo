//
//  JobsOCSkeletonConfig.h
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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JobsOCSkeletonAnimationStyle) {
    JobsOCSkeletonAnimationStyleShimmer,
    JobsOCSkeletonAnimationStylePulse
};

@interface JobsOCSkeletonConfig : NSObject <NSCopying>

Prop_strong()UIColor *baseColor;
Prop_strong()UIColor *highlightColor;
Prop_assign()NSTimeInterval animationDuration;
Prop_assign()CGFloat highlightWidthRatio;
Prop_assign()CGFloat cornerRadius;
Prop_assign()JobsOCSkeletonAnimationStyle animationStyle;

+(JobsRetJobsOCSkeletonConfigByVoidBlock _Nonnull)defaultConfig;
+(JobsRetJobsOCSkeletonConfigByVoidBlock _Nonnull)shimmerConfig;
+(JobsRetJobsOCSkeletonConfigByVoidBlock _Nonnull)pulseConfig;
-(JobsRetIDByUIColorBlock _Nonnull)byBaseColor;
-(JobsRetIDByUIColorBlock _Nonnull)byHighlightColor;
-(JobsRetIDByNSTimeIntervalBlock _Nonnull)byAnimationDuration;
-(JobsRetIDByCGFloatBlock _Nonnull)byHighlightWidthRatio;
-(JobsRetIDByCGFloatBlock _Nonnull)byCornerRadius;
-(JobsRetIDByJobsOCSkeletonAnimationStyleBlock _Nonnull)byAnimationStyle;

@end

NS_ASSUME_NONNULL_END
