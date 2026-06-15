//
//  CAShapeLayer+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#ifndef JOBS_HEADER_GUARD_CASHAPELAYER_DSL_A6F3C2D1
#define JOBS_HEADER_GUARD_CASHAPELAYER_DSL_A6F3C2D1

#import "CALayer+DSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAShapeLayer (JobsChain)

#pragma mark —— Geometry

#pragma mark —— Hierarchy
/// 对 QuartzCore API addSublayer 的二次封装：附着在父图层上
/// 对 QuartzCore API addSublayer 的二次封装：加入子图层

#pragma mark —— Display

#pragma mark —— Visibility

#pragma mark —— Border / Shadow

#pragma mark —— Filters / Rasterize

#pragma mark —— Layout / Action

#pragma mark —— CAShapeLayer
-(JobsRetCAShapeLayerByCGPathRefBlock _Nonnull)byPath;
-(JobsRetCAShapeLayerByCGCorRefBlock _Nonnull)byStrokeColor;
-(JobsRetCAShapeLayerByCorBlock _Nonnull)byStrokeColorUIColor;
-(JobsRetCAShapeLayerByCGCorRefBlock _Nonnull)byFillColor;
-(JobsRetCAShapeLayerByCorBlock _Nonnull)byFillColorUIColor;
-(JobsRetCAShapeLayerByFillRuleBlock _Nonnull)byFillRule;
-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)byLineWidth;
-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)byStrokeStart;
-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)byStrokeEnd;
-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)byMiterLimit;
-(JobsRetCAShapeLayerByLineCapBlock _Nonnull)byLineCap;
-(JobsRetCAShapeLayerByLineJoinBlock _Nonnull)byLineJoin;
-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)byLineDashPhase;
-(JobsRetCAShapeLayerByArrBlock _Nonnull)byLineDashPattern;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CASHAPELAYER_DSL_A6F3C2D1 */
