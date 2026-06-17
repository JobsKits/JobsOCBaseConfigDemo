//
//  UILongPressGestureRecognizer+DSL.h
//  JobsOCBaseConfigDemo
//
#ifndef JOBS_HEADER_GUARD_UILONGPRESSGESTURERECOGNIZER_DSL
#define JOBS_HEADER_GUARD_UILONGPRESSGESTURERECOGNIZER_DSL

#import "UIGestureRecognizer+DSL.h"

NS_ASSUME_NONNULL_BEGIN
@interface UILongPressGestureRecognizer (JobsChain)

-(JobsRetLongPressGestureRecognizerByNSUIntegerBlock _Nonnull)byNumberOfTapsRequired;
-(JobsRetLongPressGestureRecognizerByNSUIntegerBlock _Nonnull)byNumberOfTouchesRequired;
-(JobsRetLongPressGestureRecognizerByNSTimeIntervalBlock _Nonnull)byMinimumPressDuration;
-(JobsRetLongPressGestureRecognizerByCGFloatBlock _Nonnull)byAllowableMovement;

@end
NS_ASSUME_NONNULL_END
#endif
