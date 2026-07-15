//
//  UIScrollView+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UISCROLLVIEW_DSL_04B660F25B
#define JOBS_HEADER_GUARD_UISCROLLVIEW_DSL_04B660F25B

#import <UIKit/UIKit.h>
#import <TargetConditionals.h> // 引入 Apple 平台条件判断宏，用于编译期区分 iOS、macOS、模拟器等目标环境。

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#import "JobsBaseProtocolHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (DSL)<UIScrollViewDSLProtocol>

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

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISCROLLVIEW_DSL_04B660F25B */
