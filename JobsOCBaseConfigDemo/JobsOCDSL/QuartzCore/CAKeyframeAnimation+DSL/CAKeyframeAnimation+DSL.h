//
//  CAKeyframeAnimation+DSL.h
//  JobsOCBaseConfigDemo
//
#ifndef JOBS_HEADER_GUARD_CAKEYFRAMEANIMATION_DSL
#define JOBS_HEADER_GUARD_CAKEYFRAMEANIMATION_DSL

#import "CAPropertyAnimation+DSL.h"

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
