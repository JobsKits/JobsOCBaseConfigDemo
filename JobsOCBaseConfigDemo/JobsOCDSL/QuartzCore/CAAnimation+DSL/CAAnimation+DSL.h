//
//  CAAnimation+DSL.h
//  JobsOCBaseConfigDemo
//

#ifndef JOBS_HEADER_GUARD_CAANIMATION_DSL
#define JOBS_HEADER_GUARD_CAANIMATION_DSL

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
@interface CAAnimation (JobsChain)

+(JobsRetCAAnimationByVoidBlock _Nonnull)byAnimation;
+(JobsRetIDByStrBlock _Nonnull)byDefaultValueForKey;
-(JobsRetCAAnimationByCAMediaTimingFunctionBlock _Nonnull)byTimingFunction;
-(JobsRetCAAnimationByDelegateBlock _Nonnull)byDelegate;
-(JobsRetCAAnimationByBOOLBlock _Nonnull)byRemovedOnCompletion;
-(JobsRetBOOLByStrBlock _Nonnull)byShouldArchiveValueForKey;
-(JobsRetCAAnimationByCFTimeIntervalBlock _Nonnull)byBeginTime;
-(JobsRetCAAnimationByCFTimeIntervalBlock _Nonnull)byDuration;
-(JobsRetCAAnimationByFloatBlock _Nonnull)bySpeed;
-(JobsRetCAAnimationByCFTimeIntervalBlock _Nonnull)byTimeOffset;
-(JobsRetCAAnimationByFloatBlock _Nonnull)byRepeatCount;
-(JobsRetCAAnimationByCFTimeIntervalBlock _Nonnull)byRepeatDuration;
-(JobsRetCAAnimationByBOOLBlock _Nonnull)byAutoreverses;
-(JobsRetCAAnimationByCAMediaTimingFillModeBlock _Nonnull)byFillMode;

@end
NS_ASSUME_NONNULL_END
#endif
