//
//  UITapGestureRecognizer+DSL.h
//  JobsOCDSL
//
#ifndef JOBS_HEADER_GUARD_UITAPGESTURERECOGNIZER_DSL
#define JOBS_HEADER_GUARD_UITAPGESTURERECOGNIZER_DSL

#import "UIGestureRecognizer+DSL.h"

NS_ASSUME_NONNULL_BEGIN
@interface UITapGestureRecognizer (JobsChain)

-(JobsRetTapGestureRecognizerByNSUIntegerBlock _Nonnull)byNumberOfTapsRequired;
-(JobsRetTapGestureRecognizerByNSUIntegerBlock _Nonnull)byNumberOfTouchesRequired;

@end
NS_ASSUME_NONNULL_END
#endif
