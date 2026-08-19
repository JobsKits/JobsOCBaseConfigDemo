//
//  UIScrollView+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UISCROLLVIEW_DSL_04B660F25B

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#define JOBS_HEADER_GUARD_UISCROLLVIEW_DSL_04B660F25B

#import <UIKit/UIKit.h>
#import <TargetConditionals.h> // 引入 Apple 平台条件判断宏，用于编译期区分 iOS、macOS、模拟器等目标环境。

#import "JobsBaseProtocolHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (DSL)<UIScrollViewDSLProtocol>

-(JobsRetScrollViewByPointBlock _Nonnull)byContentOffset;
-(JobsRetScrollViewBySizeBlock _Nonnull)byContentSize;
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byContentInset;
-(JobsRetScrollViewByPointBlock _Nonnull)byContentAlignmentPoint API_AVAILABLE(ios(26.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetScrollViewByContentInsetAdjustmentBehaviorBlock _Nonnull)byContentInsetAdjustmentBehavior API_AVAILABLE(ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos);
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAutomaticallyAdjustsScrollIndicatorInsets API_AVAILABLE(ios(13.0), tvos(13.0)) API_UNAVAILABLE(watchos);
-(JobsRetScrollViewByBOOLBlock _Nonnull)byDirectionalLockEnabled;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byBounces;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAlwaysBounceVertical;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAlwaysBounceHorizontal;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byPagingEnabled;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollEnabled;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byTransfersHorizontalScrollingToParent API_AVAILABLE(ios(18.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetScrollViewByBOOLBlock _Nonnull)byTransfersVerticalScrollingToParent API_AVAILABLE(ios(18.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetScrollViewByBOOLBlock _Nonnull)byShowsVerticalScrollIndicator;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byShowsHorizontalScrollIndicator;
-(JobsRetScrollViewByIndicatorStyleBlock _Nonnull)byIndicatorStyle;
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byVerticalScrollIndicatorInsets API_AVAILABLE(ios(11.1), tvos(11.1)) API_UNAVAILABLE(watchos);
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byHorizontalScrollIndicatorInsets API_AVAILABLE(ios(11.1), tvos(11.1)) API_UNAVAILABLE(watchos);
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byScrollIndicatorInsets;
-(JobsRetScrollViewByDecelerationRateBlock _Nonnull)byDecelerationRate;
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byIndexDisplayMode API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetScrollViewByBOOLBlock _Nonnull)byDelaysContentTouches;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byCanCancelContentTouches;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byMinimumZoomScale;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byMaximumZoomScale;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byZoomScale;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesZoom;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollsToTop;
-(JobsRetScrollViewByKeyboardDismissModeBlock _Nonnull)byKeyboardDismissMode API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(watchos);
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAllowsKeyboardScrolling API_AVAILABLE(ios(17.0)) API_UNAVAILABLE(tvos, watchos);

-(JobsRetScrollViewByMJRefreshHeaderBlock _Nonnull)byMJ_header;
-(JobsRetScrollViewByMJRefreshFooterBlock _Nonnull)byMJ_footer;
-(JobsRetScrollViewByPointBlock _Nonnull)setContentOffsetByYES;
-(JobsRetScrollViewByPointBlock _Nonnull)setContentOffsetByNO;
#pragma mark —— UIScrollView.contentSize
-(JobsRetScrollViewBySizeBlock _Nonnull)resetContentSize;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentSizeWidth;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentSizeHeight;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentSizeOffsetWidth;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentSizeOffsetHeight;
#pragma mark —— UIScrollView.contentOffset
-(JobsRetScrollViewByPointBlock _Nonnull)resetContentOffset;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentOffsetX;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentOffsetY;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentOffsetX_offset;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentOffsetY_offset;
#pragma mark —— UIScrollView.contentInset
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)resetContentInset;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetTop;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetLeft;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetBottom;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetRight;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetOffsetTop;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetOffsetLeft;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetOffsetBottom;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetOffsetRight;

@end

@interface MJRefreshComponent (JobsOCDSL)

-(JobsRetMJRefreshComponentByBOOLBlock _Nonnull)byAutomaticallyChangeAlpha;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISCROLLVIEW_DSL_04B660F25B */
