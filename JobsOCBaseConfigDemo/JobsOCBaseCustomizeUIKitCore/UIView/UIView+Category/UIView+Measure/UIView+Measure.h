//
//  UIView+Measure.h
//  JobsLinkageMenuView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_MEASURE_BD40B2299C
#define JOBS_HEADER_GUARD_UIVIEW_MEASURE_BD40B2299C

#import <UIKit/UIKit.h>
#import "JobsModelDSL.h"
#import "JobsOCDSL.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// JobsByOCPods 侧保留 UIView+Measure 作为历史兼容入口。
///
/// 几何、坐标、Frame、UIScrollView contentSize/contentOffset/contentInset 等通用 Measure DSL
/// 已迁移到 JobsOCDSL/UIView+DSL；本 category 只保留依赖 JobsModelDSL 的能力，
/// 避免与 JobsOCDSL 的 UIView category 发生同名 selector 运行时覆盖。
@interface UIView (Measure)

#pragma mark —— 依据 UIViewModel 所携带的偏移量重塑 Frame
-(JobsRetViewByViewModelBlock _Nonnull)offsetForView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_MEASURE_BD40B2299C */
