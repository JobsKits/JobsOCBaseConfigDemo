//
//  UIView+DSL.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_DSL_556F4879E9
#define JOBS_HEADER_GUARD_UIVIEW_DSL_556F4879E9

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

@interface UIView (JobsChain)
#pragma mark —— Geometry
- (JobsRetViewByFrameBlock _Nonnull)byFrame;
- (JobsRetViewByFrameBlock _Nonnull)byBounds;
- (JobsRetViewByCGPointBlock _Nonnull)byCenterPoint;
- (JobsRetViewByCGAffineTransformBlock _Nonnull)byTransform;
- (JobsRetViewByCATransform3DBlock _Nonnull)byTransform3D;
- (JobsRetViewByCGFloatBlock _Nonnull)byContentScaleFactor;
- (JobsRetViewByCGPointBlock _Nonnull)byAnchorPoint API_AVAILABLE(ios(16.0));
#pragma mark —— Identity
- (JobsRetViewByNSIntegerBlock _Nonnull)byTag;
- (JobsRetViewByBOOLBlock _Nonnull)byUserInteractionEnabled;
- (JobsRetViewByBOOLBlock _Nonnull)byMultipleTouchEnabled API_UNAVAILABLE(tvos);
- (JobsRetViewByBOOLBlock _Nonnull)byExclusiveTouch API_UNAVAILABLE(tvos);
#pragma mark —— Rendering
- (JobsRetViewByCGFloatBlock _Nonnull)byCornerRadius;
- (JobsRetViewByBOOLBlock _Nonnull)byClipsToBounds;
- (JobsRetViewByCorBlock _Nonnull)byBgColor;
- (JobsRetViewByCGFloatBlock _Nonnull)byAlpha;
- (JobsRetViewByBOOLBlock _Nonnull)byOpaque;
- (JobsRetViewByBOOLBlock _Nonnull)byClearsContextBeforeDrawing;
- (JobsRetViewByBOOLBlock _Nonnull)byHidden;
- (JobsRetViewByNSIntegerBlock _Nonnull)byContentMode;
- (JobsRetViewByViewBlock _Nonnull)byMaskView;
- (JobsRetViewByCorBlock _Nonnull)byTintColor;
- (JobsRetViewByNSIntegerBlock _Nonnull)byTintAdjustmentMode;
#pragma mark —— Semantics / RTL
- (JobsRetViewByNSIntegerBlock _Nonnull)bySemanticContentAttribute;
#pragma mark —— Layout behaviors
- (JobsRetViewByBOOLBlock _Nonnull)byAutoresizesSubviews;
- (JobsRetViewByNSUIntegerBlock _Nonnull)byAutoresizingMask;
- (JobsRetViewByUIEdgeInsetBlock _Nonnull)byLayoutMargins API_AVAILABLE(ios(8.0));
- (JobsRetViewByNSDirectionalEdgeInsetsBlock _Nonnull)byDirectionalLayoutMargins API_AVAILABLE(ios(11.0));
- (JobsRetViewByBOOLBlock _Nonnull)byPreservesSuperviewLayoutMargins API_AVAILABLE(ios(8.0));
- (JobsRetViewByBOOLBlock _Nonnull)byInsetsLayoutMarginsFromSafeArea API_AVAILABLE(ios(11.0));
#pragma mark —— UIUserInterfaceStyle
- (JobsRetViewByUIUserInterfaceStyleBlock _Nonnull)byOverrideUserInterfaceStyle API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos);
#pragma mark —— Dynamic Type limits
- (JobsRetViewByStringBlock _Nonnull)byMinimumContentSizeCategory API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(watchos);
- (JobsRetViewByStringBlock _Nonnull)byMaximumContentSizeCategory API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(watchos);
#pragma mark —— Focus
- (JobsRetViewByStringBlock _Nonnull)byFocusGroupIdentifier API_AVAILABLE(ios(14.0)) API_UNAVAILABLE(tvos, watchos);
- (JobsRetViewByNSIntegerBlock _Nonnull)byFocusGroupPriority API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(tvos, watchos);
- (JobsRetViewByIDBlock _Nonnull)byFocusEffect API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(tvos, watchos);
#pragma mark —— iOS 26+
#if defined(__IPHONE_26_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_26_0)
- (JobsRetViewByCornerConfigBlock _Nonnull)byCornerConfiguration API_AVAILABLE(ios(26.0), tvos(26.0), visionos(26.0)) API_UNAVAILABLE(watchos);
#endif

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_DSL_556F4879E9 */
