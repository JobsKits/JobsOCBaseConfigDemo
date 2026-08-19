//
//  UILongPressGestureRecognizer+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#ifndef JOBS_HEADER_GUARD_UILONGPRESSGESTURERECOGNIZER_DSL
#define JOBS_HEADER_GUARD_UILONGPRESSGESTURERECOGNIZER_DSL

#import "UIGestureRecognizer+DSL.h"

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
@interface UILongPressGestureRecognizer (JobsChain)

-(JobsRetLongPressGestureRecognizerByNSUIntegerBlock _Nonnull)byNumberOfTapsRequired;
-(JobsRetLongPressGestureRecognizerByNSUIntegerBlock _Nonnull)byNumberOfTouchesRequired;
-(JobsRetLongPressGestureRecognizerByNSTimeIntervalBlock _Nonnull)byMinimumPressDuration;
-(JobsRetLongPressGestureRecognizerByCGFloatBlock _Nonnull)byAllowableMovement;

@end
NS_ASSUME_NONNULL_END
#endif
