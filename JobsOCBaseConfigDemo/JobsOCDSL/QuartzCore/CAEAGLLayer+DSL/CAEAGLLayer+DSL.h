//
//  CAEAGLLayer+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#ifndef JOBS_HEADER_GUARD_CAEAGLLAYER_DSL_A6F3C2D1
#define JOBS_HEADER_GUARD_CAEAGLLAYER_DSL_A6F3C2D1

#import "CALayer+DSL.h"
#import <QuartzCore/CAEAGLLayer.h>

NS_ASSUME_NONNULL_BEGIN

#if __has_include(<QuartzCore/CAEAGLLayer.h>)
@interface CAEAGLLayer (JobsChain)

#pragma mark —— Geometry

#pragma mark —— Hierarchy

#pragma mark —— Display

#pragma mark —— Visibility

#pragma mark —— Border / Shadow

#pragma mark —— Filters / Rasterize

#pragma mark —— Layout / Action

#pragma mark —— CAEAGLLayer
-(JobsRetCAEAGLLayerByNSDictionaryBlock _Nonnull)byDrawableProperties;
-(JobsRetCAEAGLLayerByBOOLBlock _Nonnull)byPresentsWithTransaction;

@end
#endif /* __has_include(<QuartzCore/CAEAGLLayer.h>) */

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CAEAGLLAYER_DSL_A6F3C2D1 */
