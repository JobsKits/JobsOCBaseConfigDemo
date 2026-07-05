//
//  UIScrollViewDSLProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UISCROLLVIEWDSLPROTOCOL_AE92BC2B00
#define JOBS_HEADER_GUARD_UISCROLLVIEWDSLPROTOCOL_AE92BC2B00

#import <Foundation/Foundation.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UIScrollViewDSLProtocol <NSObject>
@optional
-(JobsRetScrollViewByDelegateBlock _Nonnull)byDelegate;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byShowsVerticalScrollIndicator;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byShowsHorizontalScrollIndicator;
-(JobsRetScrollViewBySizeBlock _Nonnull)byContentSize;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byContentWidth;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byContentHeight;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollEnabled;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byBounces;
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byContentInset;
-(JobsRetScrollViewByMJRefreshHeaderBlock _Nonnull)byMJRefreshHeader;
-(JobsRetScrollViewByMJRefreshFooterBlock _Nonnull)byMJRefreshFooter;
/// mj_header / mj_footer 属性别名
-(JobsRetScrollViewByMJRefreshHeaderBlock _Nonnull)byMJ_header;
-(JobsRetScrollViewByMJRefreshFooterBlock _Nonnull)byMJ_footer;
/// Content
-(JobsRetScrollViewByPointBlock _Nonnull)byContentOffset;
/// 对系统方法 -setContentOffset:animated: 的二次封装，animated 固定为 YES / NO
-(JobsRetScrollViewByPointBlock _Nonnull)setContentOffsetByYES;
-(JobsRetScrollViewByPointBlock _Nonnull)setContentOffsetByNO;
#if defined(__IPHONE_17_4) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_17_4)
-(JobsRetScrollViewByPointBlock _Nonnull)byContentAlignmentPoint;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAlwaysBounceHorizontal;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byPagingEnabled;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesHorizontally;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesVertically;
#endif
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byContentInsetAdjustmentBehavior;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAutomaticallyAdjustsScrollIndicatorInsets;/// Scroll Behavior / Bounce
-(JobsRetScrollViewByBOOLBlock _Nonnull)byDirectionalLockEnabled;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAlwaysBounceVertical;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byTransfersHorizontalScrollingToParent;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byTransfersVerticalScrollingToParent;
/// Indicator / Deceleration
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byIndicatorStyle;
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byVerticalScrollIndicatorInsets;
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byHorizontalScrollIndicatorInsets;
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byScrollIndicatorInsets;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byDecelerationRate;
/// Touch Behavior
-(JobsRetScrollViewByBOOLBlock _Nonnull)byDelaysContentTouches;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byCanCancelContentTouches;
/// Zoom
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byMinimumZoomScale;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byMaximumZoomScale;
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byZoomScale;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesZoom;
/// StatusBar / Keyboard
-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollsToTop;
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byKeyboardDismissMode;
/// Refresh / Keyboard Scrolling
-(JobsRetScrollViewByUIRefreshControlBlock _Nonnull)byRefreshControl;
-(JobsRetScrollViewByBOOLBlock _Nonnull)byAllowsKeyboardScrolling;
/// tvOS / visionOS
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byIndexDisplayMode;
-(JobsRetScrollViewByNSUIntegerBlock _Nonnull)byLookToScrollAxes;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISCROLLVIEWDSLPROTOCOL_AE92BC2B00 */
