//
//  UIScreenEdgePanGestureRecognizer+DSL.h
//  JobsOCBaseConfigDemo
//
#ifndef JOBS_HEADER_GUARD_UISCREENEDGEPANGESTURERECOGNIZER_DSL
#define JOBS_HEADER_GUARD_UISCREENEDGEPANGESTURERECOGNIZER_DSL

#import "UIGestureRecognizer+DSL.h"

NS_ASSUME_NONNULL_BEGIN
@interface UIScreenEdgePanGestureRecognizer (JobsChain)

-(JobsRetScreenEdgePanGestureRecognizerByUIRectEdgeBlock _Nonnull)byEdges;

@end
NS_ASSUME_NONNULL_END
#endif
