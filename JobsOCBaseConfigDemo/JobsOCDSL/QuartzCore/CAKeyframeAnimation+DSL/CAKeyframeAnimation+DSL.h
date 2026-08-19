//
//  CAKeyframeAnimation+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#ifndef JOBS_HEADER_GUARD_CAKEYFRAMEANIMATION_DSL
#define JOBS_HEADER_GUARD_CAKEYFRAMEANIMATION_DSL

#import "CAPropertyAnimation+DSL.h"

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
@interface CAKeyframeAnimation (JobsChain)

-(JobsRetCAKeyframeAnimationByArrBlock _Nonnull)byValues;
-(JobsRetCAKeyframeAnimationByCGPathRefBlock _Nonnull)byPath;
-(JobsRetCAKeyframeAnimationByArrBlock _Nonnull)byKeyTimes;
-(JobsRetCAKeyframeAnimationByArrBlock _Nonnull)byTimingFunctions;
-(JobsRetCAKeyframeAnimationByCAAnimationCalculationModeBlock _Nonnull)byCalculationMode;
-(JobsRetCAKeyframeAnimationByArrBlock _Nonnull)byTensionValues;
-(JobsRetCAKeyframeAnimationByArrBlock _Nonnull)byContinuityValues;
-(JobsRetCAKeyframeAnimationByArrBlock _Nonnull)byBiasValues;
-(JobsRetCAKeyframeAnimationByCAAnimationRotationModeBlock _Nonnull)byRotationMode;

@end
NS_ASSUME_NONNULL_END
#endif
