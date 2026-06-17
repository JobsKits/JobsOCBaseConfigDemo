//
//  CAPropertyAnimation+DSL.h
//  JobsOCBaseConfigDemo
//

#ifndef JOBS_HEADER_GUARD_CAPROPERTYANIMATION_DSL
#define JOBS_HEADER_GUARD_CAPROPERTYANIMATION_DSL

#import "CAAnimation+DSL.h"

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
