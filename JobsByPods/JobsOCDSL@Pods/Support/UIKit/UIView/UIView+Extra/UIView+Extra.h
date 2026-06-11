//
//  UIView+Extra.h
//  JobsOCDSL Support
//
//  Migrated from JobsByOCPods on 2026年6月10日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_EXTRA_C5021B868B
#define JOBS_HEADER_GUARD_UIVIEW_EXTRA_C5021B868B

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extra)

-(JobsRetViewByGestureRecognizer _Nonnull)addGesture;
-(JobsReturnGestureByGesture _Nonnull)addGestureRecognizer;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_EXTRA_C5021B868B */
