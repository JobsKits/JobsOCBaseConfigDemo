//
//  CAPropertyAnimation+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_CAPROPERTYANIMATION_EXTRA_80967BAF0C
#define JOBS_HEADER_GUARD_CAPROPERTYANIMATION_EXTRA_80967BAF0C

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

@interface CAPropertyAnimation (Extra)

-(JobsRetCAPropertyAnimationByStrBlock _Nonnull)keyPathBy;
-(JobsRetCAPropertyAnimationByBOOLBlock _Nonnull)additiveBy;
-(JobsRetCAPropertyAnimationByBOOLBlock _Nonnull)cumulativeBy;
-(JobsRetCAPropertyAnimationByCAValueFunctionBlock _Nonnull)valueFunctionBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CAPROPERTYANIMATION_EXTRA_80967BAF0C */
