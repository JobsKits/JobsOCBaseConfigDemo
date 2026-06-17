//
//  CAGradientLayer+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#ifndef JOBS_HEADER_GUARD_CAGRADIENTLAYER_DSL_A6F3C2D1
#define JOBS_HEADER_GUARD_CAGRADIENTLAYER_DSL_A6F3C2D1

#import "CALayer+DSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAGradientLayer (JobsChain)

#pragma mark —— Geometry

#pragma mark —— Hierarchy

#pragma mark —— Display

#pragma mark —— Visibility

#pragma mark —— Border / Shadow

#pragma mark —— Filters / Rasterize

#pragma mark —— Layout / Action

#pragma mark —— CAGradientLayer
-(JobsRetCAGradientLayerByArrBlock _Nonnull)byColors;
-(JobsRetCAGradientLayerByArrBlock _Nonnull)byLocations;
-(JobsRetCAGradientLayerByCGPointBlock _Nonnull)byStartPoint;
-(JobsRetCAGradientLayerByCGPointBlock _Nonnull)byEndPoint;
-(JobsRetCAGradientLayerByTypeBlock _Nonnull)byType;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CAGRADIENTLAYER_DSL_A6F3C2D1 */
