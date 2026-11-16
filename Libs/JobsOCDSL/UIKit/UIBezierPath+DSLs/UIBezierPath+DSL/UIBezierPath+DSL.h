//
//  UIBezierPath+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#ifndef JOBS_HEADER_GUARD_UIBEZIERPATH_DSL_6F9A8B73D2
#define JOBS_HEADER_GUARD_UIBEZIERPATH_DSL_6F9A8B73D2

#import <UIKit/UIKit.h>

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

@interface UIBezierPath (DSL)

#pragma mark —— Factory
+(JobsRetBezierPathByFrameBlock _Nonnull)byBezierPathWithRect;
+(JobsRetBezierPathByFrameBlock _Nonnull)byBezierPathWithOvalInRect;
+(JobsRetBezierPathByCGPathRefBlock _Nonnull)byBezierPathWithCGPath;
+(JobsRetBezierPathByRoundedRectBlock _Nonnull)byBezierPathWithRoundedRect;
+(JobsRetBezierPathByRoundedCornersBlock _Nonnull)byBezierPathWithRoundedCorners;
+(JobsRetBezierPathByAddArcBlock _Nonnull)byBezierPathWithArcCenter;
#pragma mark —— Path construction
-(JobsRetBezierPathByCGPointBlock _Nonnull)byMoveToPoint;
-(JobsRetBezierPathByCGPointBlock _Nonnull)byAddLineToPoint;
-(JobsRetBezierPathByAddArcBlock _Nonnull)byAddArcWithCenter;
-(JobsRetBezierPathByAddCurveBlock _Nonnull)byAddCurveToPoint;
-(JobsRetBezierPathByAddQuadCurveBlock _Nonnull)byAddQuadCurveToPoint;
-(JobsRetBezierPathByVoidBlock _Nonnull)byClosePath;
-(JobsRetBezierPathByVoidBlock _Nonnull)byRemoveAllPoints;
-(JobsRetBezierPathByBezierPathBlock _Nonnull)byAppendPath;
-(JobsRetBezierPathByCGAffineTransformBlock _Nonnull)byApplyTransform;

#pragma mark —— Short chain aliases
/* JobsOCDSL short chain aliases */
-(JobsRetBezierPathByCGPointBlock _Nonnull)moveTo;
-(JobsRetBezierPathByCGPointBlock _Nonnull)add;
-(JobsRetBezierPathByVoidBlock _Nonnull)close;
-(JobsRetBezierPathByVoidBlock _Nonnull)removeAll;
-(JobsRetBezierPathByBezierPathBlock _Nonnull)append;
-(JobsRetBezierPathByCGAffineTransformBlock _Nonnull)apply;

#pragma mark —— Drawing
-(JobsRetBezierPathByVoidBlock _Nonnull)byAddClip;
-(JobsRetBezierPathByVoidBlock _Nonnull)byFill;
-(JobsRetBezierPathByVoidBlock _Nonnull)byStroke;

#pragma mark —— Properties
-(JobsRetBezierPathByCGPathRefBlock _Nonnull)byCGPath;
-(JobsRetBezierPathByCGFloatBlock _Nonnull)byLineWidth;
-(JobsRetBezierPathByCGLineCapBlock _Nonnull)byLineCapStyle;
-(JobsRetBezierPathByCGLineJoinBlock _Nonnull)byLineJoinStyle;
-(JobsRetBezierPathByCGFloatBlock _Nonnull)byMiterLimit;
-(JobsRetBezierPathByCGFloatBlock _Nonnull)byFlatness;
-(JobsRetBezierPathByBOOLBlock _Nonnull)byUsesEvenOddFillRule;
-(JobsRetBezierPathByLineDashBlock _Nonnull)byLineDash;

#pragma mark —— Query
-(JobsRetBOOLByPointBlock _Nonnull)byContainsPoint;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBEZIERPATH_DSL_6F9A8B73D2 */
