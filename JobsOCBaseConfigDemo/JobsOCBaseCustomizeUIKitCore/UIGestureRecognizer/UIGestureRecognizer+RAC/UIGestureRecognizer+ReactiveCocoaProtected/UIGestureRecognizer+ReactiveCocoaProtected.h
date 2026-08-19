//
//  UIGestureRecognizer+ReactiveCocoaProtected.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_REACTIVECOCOAPROTECTED_B02119B4EA

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#define JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_REACTIVECOCOAPROTECTED_B02119B4EA

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#import "JobsBlock.h"
#import "JobsDefines.h"

@class RACSubject;
@class RACGestureRecognizerActionHandler;

@interface UIGestureRecognizer (ReactiveCocoaProtected)
/// private: To retain UIGestureDelegate. The GestureRecognizer's delegate will be
Prop_strong()RACGestureRecognizerActionHandler *rac_gestureHandler;
/// protected: To retain subject while recognizing gestures.
Prop_strong()RACSubject *rac_subject;

@end
#endif /* JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_REACTIVECOCOAPROTECTED_B02119B4EA */
