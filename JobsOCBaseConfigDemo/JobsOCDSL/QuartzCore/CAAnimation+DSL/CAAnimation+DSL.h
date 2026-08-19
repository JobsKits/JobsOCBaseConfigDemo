//
//  CAAnimation+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#ifndef JOBS_HEADER_GUARD_CAANIMATION_DSL
#define JOBS_HEADER_GUARD_CAANIMATION_DSL

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

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
