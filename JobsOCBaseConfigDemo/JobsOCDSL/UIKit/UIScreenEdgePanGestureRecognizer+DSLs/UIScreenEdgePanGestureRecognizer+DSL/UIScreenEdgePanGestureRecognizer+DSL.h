//
//  UIScreenEdgePanGestureRecognizer+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#ifndef JOBS_HEADER_GUARD_UISCREENEDGEPANGESTURERECOGNIZER_DSL
#define JOBS_HEADER_GUARD_UISCREENEDGEPANGESTURERECOGNIZER_DSL

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
@interface UIScreenEdgePanGestureRecognizer (JobsChain)

-(JobsRetScreenEdgePanGestureRecognizerByUIRectEdgeBlock _Nonnull)byEdges;

@end
NS_ASSUME_NONNULL_END
#endif
