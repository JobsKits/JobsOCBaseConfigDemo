//
//  UIView+JobsOCSkeletonView.h
//  JobsOCSkeletonView
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCSkeletonView/JobsOCSkeletonConfig.h>)
#import <JobsOCSkeletonView/JobsOCSkeletonConfig.h>
#else
#import "JobsOCSkeletonConfig.h"
#endif

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

@interface UIView (JobsOCSkeletonView)

-(JobsRetBOOLByVoidBlock _Nonnull)jobs_isSkeletonShowing;
-(JobsRetBOOLByVoidBlock _Nonnull)jobs_isSkeletonable;
-(jobsByVoidBlock _Nonnull)jobs_startSkeleton;
-(jobsByJobsOCSkeletonConfigBlock _Nonnull)jobs_startSkeletonWithConfig;
-(jobsByVoidBlock _Nonnull)jobs_stopSkeleton;
-(jobsByVoidBlock _Nonnull)jobs_updateSkeletonLayout;
-(jobsByCALayerBlock _Nonnull)jobs_setSkeletonMask;
-(JobsRetViewByBOOLBlock _Nonnull)bySkeletonable;
-(JobsRetViewByCGFloatBlock _Nonnull)bySkeletonCornerRadius;
-(instancetype)bySkeletonWithEnabled:(BOOL)enabled
                        cornerRadius:(nullable NSNumber *)cornerRadius;
-(JobsRetViewByVoidBlock _Nonnull)byShowGradientSkeleton;
-(instancetype)byShowGradientSkeletonWithBaseColor:(UIColor *)baseColor
                                        transition:(NSTimeInterval)transition;
-(JobsRetViewByVoidBlock _Nonnull)byShowSolidSkeleton;
-(instancetype)byShowSolidSkeletonWithBaseColor:(UIColor *)baseColor
                                     transition:(NSTimeInterval)transition;
-(JobsRetViewByVoidBlock _Nonnull)byHideSkeleton;
-(instancetype)byShimmering:(BOOL)enabled
                     config:(nullable JobsOCSkeletonConfig *)config;
-(instancetype)byShimmerColorsWithBase:(UIColor *)baseColor
                             highlight:(UIColor *)highlightColor;

@end

@interface UITableView (JobsOCSkeletonView)

-(JobsRetTableViewByVoidBlock _Nonnull)byHideSkeletonAndReload;

@end

@interface UICollectionView (JobsOCSkeletonView)

-(JobsRetCollectionViewByVoidBlock _Nonnull)byHideSkeletonAndReload;

@end

@interface UILabel (JobsOCSkeletonView)

-(JobsRetLabelByNSIntegerBlock _Nonnull)bySkeletonLinesCornerRadius;
-(JobsRetLabelByNSIntegerBlock _Nonnull)bySkeletonLastLineFillPercent;

@end

NS_ASSUME_NONNULL_END
