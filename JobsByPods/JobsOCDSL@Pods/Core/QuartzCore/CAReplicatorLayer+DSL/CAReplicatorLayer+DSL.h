//
//  CAReplicatorLayer+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#ifndef JOBS_HEADER_GUARD_CAREPLICATORLAYER_DSL_A6F3C2D1
#define JOBS_HEADER_GUARD_CAREPLICATORLAYER_DSL_A6F3C2D1

#import "CALayer+DSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAReplicatorLayer (JobsChain)

#pragma mark —— Geometry

#pragma mark —— Hierarchy

#pragma mark —— Display

#pragma mark —— Visibility

#pragma mark —— Border / Shadow

#pragma mark —— Filters / Rasterize

#pragma mark —— Layout / Action

#pragma mark —— CAReplicatorLayer
-(JobsRetCAReplicatorLayerByNSIntegerBlock _Nonnull)byInstanceCount;
-(JobsRetCAReplicatorLayerByBOOLBlock _Nonnull)byPreservesDepth;
-(JobsRetCAReplicatorLayerByCFTimeIntervalBlock _Nonnull)byInstanceDelay;
-(JobsRetCAReplicatorLayerByCATransform3DBlock _Nonnull)byInstanceTransform;
-(JobsRetCAReplicatorLayerByCGColorRefBlock _Nonnull)byInstanceColor;
-(JobsRetCAReplicatorLayerByUIColorBlock _Nonnull)byInstanceColorUIColor;
-(JobsRetCAReplicatorLayerByCGFloatBlock _Nonnull)byInstanceRedOffset;
-(JobsRetCAReplicatorLayerByCGFloatBlock _Nonnull)byInstanceGreenOffset;
-(JobsRetCAReplicatorLayerByCGFloatBlock _Nonnull)byInstanceBlueOffset;
-(JobsRetCAReplicatorLayerByCGFloatBlock _Nonnull)byInstanceAlphaOffset;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CAREPLICATORLAYER_DSL_A6F3C2D1 */
