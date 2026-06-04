//
//  UIGestureRecognizer+ReactiveCocoaProtected.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_REACTIVECOCOAPROTECTED_B02119B4EA
#define JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_REACTIVECOCOAPROTECTED_B02119B4EA

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

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

@class RACSubject;
@class RACGestureRecognizerActionHandler;

@interface UIGestureRecognizer (ReactiveCocoaProtected)
/// private: To retain UIGestureDelegate. The GestureRecognizer's delegate will be
Prop_strong()RACGestureRecognizerActionHandler *rac_gestureHandler;
/// protected: To retain subject while recognizing gestures.
Prop_strong()RACSubject *rac_subject;

@end
#endif /* JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_REACTIVECOCOAPROTECTED_B02119B4EA */
