//
//  CAScrollLayer+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#ifndef JOBS_HEADER_GUARD_CASCROLLLAYER_DSL_A6F3C2D1
#define JOBS_HEADER_GUARD_CASCROLLLAYER_DSL_A6F3C2D1

#import "CALayer+DSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAScrollLayer (JobsChain)

#pragma mark —— Geometry

#pragma mark —— Hierarchy

#pragma mark —— Display

#pragma mark —— Visibility

#pragma mark —— Border / Shadow

#pragma mark —— Filters / Rasterize

#pragma mark —— Layout / Action

#pragma mark —— CAScrollLayer
-(JobsRetCAScrollLayerByScrollModeBlock _Nonnull)byScrollMode;
-(JobsRetCAScrollLayerByCGPointBlock _Nonnull)byScrollToPoint;
-(JobsRetCAScrollLayerByCGRectBlock _Nonnull)byScrollToRect;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CASCROLLLAYER_DSL_A6F3C2D1 */
