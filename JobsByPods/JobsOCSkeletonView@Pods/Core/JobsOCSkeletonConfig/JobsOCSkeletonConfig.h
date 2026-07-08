//
//  JobsOCSkeletonConfig.h
//  JobsOCSkeletonView
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import <UIKit/UIKit.h>

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

+(instancetype)defaultConfig;
+(instancetype)shimmerConfig;
+(instancetype)pulseConfig;
-(instancetype)byBaseColor:(UIColor *)baseColor;
-(instancetype)byHighlightColor:(UIColor *)highlightColor;
-(instancetype)byAnimationDuration:(NSTimeInterval)animationDuration;
-(instancetype)byHighlightWidthRatio:(CGFloat)highlightWidthRatio;
-(instancetype)byCornerRadius:(CGFloat)cornerRadius;
-(instancetype)byAnimationStyle:(JobsOCSkeletonAnimationStyle)animationStyle;

@end

NS_ASSUME_NONNULL_END
