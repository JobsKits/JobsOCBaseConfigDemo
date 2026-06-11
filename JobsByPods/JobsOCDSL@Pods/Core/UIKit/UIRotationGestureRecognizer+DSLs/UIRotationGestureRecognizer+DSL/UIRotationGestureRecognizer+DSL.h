//
//  UIRotationGestureRecognizer+DSL.h
//  JobsOCDSL
//
#ifndef JOBS_HEADER_GUARD_UIROTATIONGESTURERECOGNIZER_DSL
#define JOBS_HEADER_GUARD_UIROTATIONGESTURERECOGNIZER_DSL

#import "UIGestureRecognizer+DSL.h"

NS_ASSUME_NONNULL_BEGIN
@interface UIRotationGestureRecognizer (JobsChain)

-(JobsRetRotationGestureRecognizerByCGFloatBlock _Nonnull)byRotation;

@end
NS_ASSUME_NONNULL_END
#endif
