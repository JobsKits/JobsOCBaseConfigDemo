//
//  UIView+Measure.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_MEASURE_6932936BEF
#define JOBS_HEADER_GUARD_UIVIEW_MEASURE_6932936BEF

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Measure)

Prop_assign()CGFloat x;
Prop_assign()CGFloat y;
Prop_assign()CGFloat width;
Prop_assign()CGFloat height;

-(JobsRetViewByFrameBlock _Nonnull)byFrame;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginX;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginY;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetWidth;
-(JobsRetFrameByCGFloatBlock _Nonnull)resetHeight;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_MEASURE_6932936BEF */
