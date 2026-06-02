//
//  CABasicAnimation+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_CABASICANIMATION_EXTRA_2E24D14B56
#define JOBS_HEADER_GUARD_CABASICANIMATION_EXTRA_2E24D14B56

#import <QuartzCore/QuartzCore.h> // 提供 Core Animation 和 CALayer 能力，用于动画、图层和视觉渲染。

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

@interface CABasicAnimation (Extra)

+(JobsRetCABasicAnimationByStrBlock _Nonnull)animationByKeyPath;

-(JobsRetCABasicAnimationByIDBlock _Nonnull)fromValueBy;
-(JobsRetCABasicAnimationByIDBlock _Nonnull)toValueBy;
-(JobsRetCABasicAnimationByIDBlock _Nonnull)valueBy;
-(JobsRetCABasicAnimationByCFTimeIntervalBlock _Nonnull)beginTimeBy;
-(JobsRetCABasicAnimationByCFTimeIntervalBlock _Nonnull)durationBy;
-(JobsRetCABasicAnimationByFloatBlock _Nonnull)speedBy;
-(JobsRetCABasicAnimationByCFTimeIntervalBlock _Nonnull)timeOffsetBy;
-(JobsRetCABasicAnimationByFloatBlock _Nonnull)repeatCountBy;
-(JobsRetCABasicAnimationByBOOLBlock _Nonnull)autoreversesBy;
-(JobsRetCABasicAnimationByCAMediaTimingFillModeBlock _Nonnull)fillModeBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CABASICANIMATION_EXTRA_2E24D14B56 */
