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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

-(BOOL)jobs_isSkeletonShowing;
-(BOOL)jobs_isSkeletonable;
-(void)jobs_startSkeleton;
-(void)jobs_startSkeletonWithConfig:(nullable JobsOCSkeletonConfig *)config;
-(void)jobs_stopSkeleton;
-(void)jobs_updateSkeletonLayout;
-(void)jobs_setSkeletonMask:(nullable CALayer *)maskLayer;
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
