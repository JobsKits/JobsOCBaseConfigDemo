//
//  UIPinchGestureRecognizer+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#ifndef JOBS_HEADER_GUARD_UIPINCHGESTURERECOGNIZER_DSL
#define JOBS_HEADER_GUARD_UIPINCHGESTURERECOGNIZER_DSL

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
@interface UIPinchGestureRecognizer (JobsChain)

-(JobsRetPinchGestureRecognizerByCGFloatBlock _Nonnull)byScale;

@end
NS_ASSUME_NONNULL_END
#endif
