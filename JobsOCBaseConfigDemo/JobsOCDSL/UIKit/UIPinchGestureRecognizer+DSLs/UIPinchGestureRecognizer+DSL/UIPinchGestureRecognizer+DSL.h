//
//  UIPinchGestureRecognizer+DSL.h
//  JobsOCBaseConfigDemo
//
#ifndef JOBS_HEADER_GUARD_UIPINCHGESTURERECOGNIZER_DSL
#define JOBS_HEADER_GUARD_UIPINCHGESTURERECOGNIZER_DSL

#import "UIGestureRecognizer+DSL.h"

NS_ASSUME_NONNULL_BEGIN
@interface UIPinchGestureRecognizer (JobsChain)

-(JobsRetPinchGestureRecognizerByCGFloatBlock _Nonnull)byScale;

@end
NS_ASSUME_NONNULL_END
#endif
