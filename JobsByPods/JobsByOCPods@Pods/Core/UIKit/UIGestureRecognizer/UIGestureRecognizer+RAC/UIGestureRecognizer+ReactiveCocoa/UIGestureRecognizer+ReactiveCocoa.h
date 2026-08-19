//
//  UIGestureRecognizer+ReactiveCocoa.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_REACTIVECOCOA_3D8FB27E61
#define JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_REACTIVECOCOA_3D8FB27E61

#import <objc/runtime.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <UIKit/UIKit.h>
#import <JobsByOCPods/RACGestureRecognizerActionHandler.h>
#import <JobsByOCPods/UIGestureRecognizer+ReactiveCocoaProtected.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@class RACSignal;
// TODO: To make them private, separate them into a category.
@interface UIGestureRecognizer (ReactiveCocoa)

+(JobsRetIDByVoidBlock _Nonnull)rac_recognizer;
-(JobsRetRACSignalByVoidBlock _Nonnull)rac_signal;

@end
#endif /* JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_REACTIVECOCOA_3D8FB27E61 */
