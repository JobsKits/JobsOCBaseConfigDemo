//
//  CAShapeLayer+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_CASHAPELAYER_EXTRA_D858C7968C
#define JOBS_HEADER_GUARD_CASHAPELAYER_EXTRA_D858C7968C

#import <QuartzCore/QuartzCore.h> // 提供 Core Animation 和 CALayer 能力，用于动画、图层和视觉渲染。

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAShapeLayer (Extra)
/// 迎合链式语法而做的封装
-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)lineWidthBy;
-(JobsRetCAShapeLayerByCorBlock _Nonnull)strokeColorBy;
-(JobsRetCAShapeLayerByCGCorRefBlock _Nonnull)strokeColorByCGColorRef;
-(JobsRetCAShapeLayerByBezierPathBlock _Nonnull)pathByBezierPath;
-(JobsRetCAShapeLayerByCGPathRefBlock _Nonnull)pathByPathRef;
-(JobsRetCAShapeLayerByCorBlock _Nonnull)fillColorBy;
-(JobsRetCAShapeLayerByCGCorRefBlock _Nonnull)fillColorByGColorRef;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CASHAPELAYER_EXTRA_D858C7968C */
