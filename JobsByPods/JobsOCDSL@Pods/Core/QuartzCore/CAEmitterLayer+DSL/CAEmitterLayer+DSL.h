//
//  CAEmitterLayer+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#ifndef JOBS_HEADER_GUARD_CAEMITTERLAYER_DSL_A6F3C2D1
#define JOBS_HEADER_GUARD_CAEMITTERLAYER_DSL_A6F3C2D1

#import "CALayer+DSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAEmitterLayer (JobsChain)

#pragma mark —— Geometry

#pragma mark —— Hierarchy

#pragma mark —— Display

#pragma mark —— Visibility

#pragma mark —— Border / Shadow

#pragma mark —— Filters / Rasterize

#pragma mark —— Layout / Action

#pragma mark —— CAEmitterLayer
-(JobsRetCAEmitterLayerByArrBlock _Nonnull)byEmitterCells;
-(JobsRetCAEmitterLayerByFloatBlock _Nonnull)byBirthRate;
-(JobsRetCAEmitterLayerByFloatBlock _Nonnull)byLifetime;
-(JobsRetCAEmitterLayerByCGPointBlock _Nonnull)byEmitterPosition;
-(JobsRetCAEmitterLayerByCGFloatBlock _Nonnull)byEmitterZPosition;
-(JobsRetCAEmitterLayerByCGSizeBlock _Nonnull)byEmitterSize;
-(JobsRetCAEmitterLayerByCGFloatBlock _Nonnull)byEmitterDepth;
-(JobsRetCAEmitterLayerByEmitterShapeBlock _Nonnull)byEmitterShape;
-(JobsRetCAEmitterLayerByEmitterModeBlock _Nonnull)byEmitterMode;
-(JobsRetCAEmitterLayerByRenderModeBlock _Nonnull)byRenderMode;
-(JobsRetCAEmitterLayerByBOOLBlock _Nonnull)byPreservesDepth;
-(JobsRetCAEmitterLayerByFloatBlock _Nonnull)byVelocity;
-(JobsRetCAEmitterLayerByFloatBlock _Nonnull)byScale;
-(JobsRetCAEmitterLayerByFloatBlock _Nonnull)bySpin;
-(JobsRetCAEmitterLayerByUnsignedIntBlock _Nonnull)bySeed;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CAEMITTERLAYER_DSL_A6F3C2D1 */
