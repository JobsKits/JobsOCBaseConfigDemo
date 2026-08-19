//
//  CATiledLayer+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#ifndef JOBS_HEADER_GUARD_CATILEDLAYER_DSL_A6F3C2D1
#define JOBS_HEADER_GUARD_CATILEDLAYER_DSL_A6F3C2D1

#import "CALayer+DSL.h"

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

@interface CATiledLayer (JobsChain)

#pragma mark —— Geometry

#pragma mark —— Hierarchy

#pragma mark —— Display

#pragma mark —— Visibility

#pragma mark —— Border / Shadow

#pragma mark —— Filters / Rasterize

#pragma mark —— Layout / Action

#pragma mark —— CATiledLayer
-(JobsRetCATiledLayerByNSIntegerBlock _Nonnull)byLevelsOfDetail;
-(JobsRetCATiledLayerByNSIntegerBlock _Nonnull)byLevelsOfDetailBias;
-(JobsRetCATiledLayerByCGSizeBlock _Nonnull)byTileSize;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CATILEDLAYER_DSL_A6F3C2D1 */
