//
//  CAPropertyAnimation+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#ifndef JOBS_HEADER_GUARD_CAPROPERTYANIMATION_DSL
#define JOBS_HEADER_GUARD_CAPROPERTYANIMATION_DSL

#import "CAAnimation+DSL.h"

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
@interface CAPropertyAnimation (JobsChain)

+(JobsRetCAPropertyAnimationByStrBlock _Nonnull)byAnimationWithKeyPath;
-(JobsRetCAPropertyAnimationByStrBlock _Nonnull)byKeyPath;
-(JobsRetCAPropertyAnimationByBOOLBlock _Nonnull)byAdditive;
-(JobsRetCAPropertyAnimationByBOOLBlock _Nonnull)byCumulative;
-(JobsRetCAPropertyAnimationByCAValueFunctionBlock _Nonnull)byValueFunction;

@end
NS_ASSUME_NONNULL_END
#endif
