//
//  UIPanGestureRecognizer+DSL.h
//  JobsOCDSL
//
#ifndef JOBS_HEADER_GUARD_UIPANGESTURERECOGNIZER_DSL
#define JOBS_HEADER_GUARD_UIPANGESTURERECOGNIZER_DSL

#import "UIGestureRecognizer+DSL.h"

NS_ASSUME_NONNULL_BEGIN
@interface UIPanGestureRecognizer (JobsChain)

-(JobsRetPanGestureRecognizerByNSUIntegerBlock _Nonnull)byMinimumNumberOfTouches;
-(JobsRetPanGestureRecognizerByNSUIntegerBlock _Nonnull)byMaximumNumberOfTouches;

@end
NS_ASSUME_NONNULL_END
#endif
