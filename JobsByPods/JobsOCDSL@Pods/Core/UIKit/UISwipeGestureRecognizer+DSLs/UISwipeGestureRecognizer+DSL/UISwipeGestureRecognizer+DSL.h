//
//  UISwipeGestureRecognizer+DSL.h
//  JobsOCDSL
//
#ifndef JOBS_HEADER_GUARD_UISWIPEGESTURERECOGNIZER_DSL
#define JOBS_HEADER_GUARD_UISWIPEGESTURERECOGNIZER_DSL

#import "UIGestureRecognizer+DSL.h"

NS_ASSUME_NONNULL_BEGIN
@interface UISwipeGestureRecognizer (JobsChain)

-(JobsRetSwipeGestureRecognizerByNSUIntegerBlock _Nonnull)byNumberOfTouchesRequired;
-(JobsRetSwipeGestureRecognizerByDirectionBlock _Nonnull)byDirection;

@end
NS_ASSUME_NONNULL_END
#endif
