//
//  UIView+Gesture.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_GESTURE_8362163577
#define JOBS_HEADER_GUARD_UIVIEW_GESTURE_8362163577

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsSuspend/NSObject+Extra.h>
#import <JobsSuspend/UIGestureRecognizer+Extra.h>

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Gesture)

Prop_assign()NSUInteger minimumNumberOfTouches;
Prop_strong(nullable)UIPanGestureRecognizer *panGR;
Prop_strong(nullable)JobsSEL_IMP *panGR_SelImp;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_GESTURE_8362163577 */
