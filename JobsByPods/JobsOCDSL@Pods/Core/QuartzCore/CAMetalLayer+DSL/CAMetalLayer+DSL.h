//
//  CAMetalLayer+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#ifndef JOBS_HEADER_GUARD_CAMETALLAYER_DSL_A6F3C2D1
#define JOBS_HEADER_GUARD_CAMETALLAYER_DSL_A6F3C2D1

#import <QuartzCore/CAMetalLayer.h>
#import "CALayer+DSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAMetalLayer (JobsChain)

#pragma mark —— Geometry

#pragma mark —— Hierarchy

#pragma mark —— Display

#pragma mark —— Visibility

#pragma mark —— Border / Shadow

#pragma mark —— Filters / Rasterize

#pragma mark —— Layout / Action

#pragma mark —— CAMetalLayer
-(JobsRetCAMetalLayerByIDBlock _Nonnull)byDevice;
-(JobsRetCAMetalLayerByNSUIntegerBlock _Nonnull)byPixelFormat;
-(JobsRetCAMetalLayerByBOOLBlock _Nonnull)byFramebufferOnly;
-(JobsRetCAMetalLayerByCGSizeBlock _Nonnull)byDrawableSize;
-(JobsRetCAMetalLayerByBOOLBlock _Nonnull)byPresentsWithTransaction;
-(JobsRetCAMetalLayerByNSUIntegerBlock _Nonnull)byMaximumDrawableCount;
-(JobsRetCAMetalLayerByCGColorSpaceRefBlock _Nonnull)byColorspace;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CAMETALLAYER_DSL_A6F3C2D1 */
