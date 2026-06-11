//
//  CAEmitterCell+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月9日，星期二.
//

#ifndef JOBS_HEADER_GUARD_CAEMITTERCELL_DSL
#define JOBS_HEADER_GUARD_CAEMITTERCELL_DSL

#import <QuartzCore/QuartzCore.h>
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

@interface CAEmitterCell (JobsChain)

#pragma mark —— Factory / KVC
+(JobsRetCAEmitterCellByVoidBlock _Nonnull)byEmitterCell;
+(JobsRetIDByStrBlock _Nonnull)byDefaultValueForKey;
-(JobsRetBOOLByStrBlock _Nonnull)byShouldArchiveValueForKey;

#pragma mark —— CAMediaTiming
-(JobsRetCAEmitterCellByCFTimeIntervalBlock _Nonnull)byBeginTime;
-(JobsRetCAEmitterCellByCFTimeIntervalBlock _Nonnull)byDuration;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)bySpeed;
-(JobsRetCAEmitterCellByCFTimeIntervalBlock _Nonnull)byTimeOffset;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byRepeatCount;
-(JobsRetCAEmitterCellByCFTimeIntervalBlock _Nonnull)byRepeatDuration;
-(JobsRetCAEmitterCellByBOOLBlock _Nonnull)byAutoreverses;
-(JobsRetCAEmitterCellByCAMediaTimingFillModeBlock _Nonnull)byFillMode;

#pragma mark —— CAEmitterCell
-(JobsRetCAEmitterCellByStringBlock _Nonnull)byName;
-(JobsRetCAEmitterCellByBOOLBlock _Nonnull)byEnabled;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byBirthRate;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byLifetime;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byLifetimeRange;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byEmissionLatitude;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byEmissionLongitude;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byEmissionRange;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byVelocity;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byVelocityRange;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byXAcceleration;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byYAcceleration;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byZAcceleration;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byScale;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byScaleRange;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byScaleSpeed;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)bySpin;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)bySpinRange;
-(JobsRetCAEmitterCellByCGColorRefBlock _Nonnull)byColor;
-(JobsRetCAEmitterCellByUIColorBlock _Nonnull)byColorUIColor;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byRedRange;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byGreenRange;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byBlueRange;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byAlphaRange;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byRedSpeed;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byGreenSpeed;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byBlueSpeed;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byAlphaSpeed;
-(JobsRetCAEmitterCellByIDBlock _Nonnull)byContents;
-(JobsRetCAEmitterCellByCGRectBlock _Nonnull)byContentsRect;
-(JobsRetCAEmitterCellByCGFloatBlock _Nonnull)byContentsScale;
-(JobsRetCAEmitterCellByCALayerContentsFilterBlock _Nonnull)byMinificationFilter;
-(JobsRetCAEmitterCellByCALayerContentsFilterBlock _Nonnull)byMagnificationFilter;
-(JobsRetCAEmitterCellByFloatBlock _Nonnull)byMinificationFilterBias;
-(JobsRetCAEmitterCellByArrBlock _Nonnull)byEmitterCells;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CAEMITTERCELL_DSL */
