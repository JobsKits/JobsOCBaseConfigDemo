//
//  CABasicAnimation+DSL.h
//  JobsOCBaseConfigDemo
//
#ifndef JOBS_HEADER_GUARD_CABASICANIMATION_DSL
#define JOBS_HEADER_GUARD_CABASICANIMATION_DSL

#import "CAPropertyAnimation+DSL.h"

NS_ASSUME_NONNULL_BEGIN
@interface CABasicAnimation (JobsChain)

-(JobsRetCABasicAnimationByIDBlock _Nonnull)byFromValue;
-(JobsRetCABasicAnimationByIDBlock _Nonnull)byToValue;
-(JobsRetCABasicAnimationByIDBlock _Nonnull)byByValue;

@end
NS_ASSUME_NONNULL_END
#endif
