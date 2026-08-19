//
//  UIGestureRecognizer+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_5BD3133397
#define JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_5BD3133397

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface UIGestureRecognizer (Extra)<BaseProtocol>

-(JobsRetUIGestureRecognizerByjobsByVoidBlockBlock _Nonnull)gestureActionBy;
-(JobsRetUIGestureRecognizerByjobsByGestureRecognizerBlockBlock _Nonnull)GestureActionBy;

-(jobsBySELBlock _Nonnull)removeAction;
-(jobsBySELBlock _Nonnull)addAction;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_5BD3133397 */
