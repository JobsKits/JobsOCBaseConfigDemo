//
//  CAPropertyAnimation+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_CAPROPERTYANIMATION_EXTRA_80967BAF0C
#define JOBS_HEADER_GUARD_CAPROPERTYANIMATION_EXTRA_80967BAF0C

#import <QuartzCore/QuartzCore.h> // 提供 Core Animation 和 CALayer 能力，用于动画、图层和视觉渲染。

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAPropertyAnimation (Extra)

-(JobsRetCAPropertyAnimationByStrBlock _Nonnull)keyPathBy;
-(JobsRetCAPropertyAnimationByBOOLBlock _Nonnull)additiveBy;
-(JobsRetCAPropertyAnimationByBOOLBlock _Nonnull)cumulativeBy;
-(JobsRetCAPropertyAnimationByCAValueFunctionBlock _Nonnull)valueFunctionBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CAPROPERTYANIMATION_EXTRA_80967BAF0C */
