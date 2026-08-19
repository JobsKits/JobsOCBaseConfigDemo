//
//  UIGestureRecognizer+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#ifndef JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_DSL
#define JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_DSL

#import <UIKit/UIKit.h>

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
@interface UIGestureRecognizer (JobsChain)

+(JobsRetGestureByVoidBlock _Nonnull)byGestureRecognizer;
-(JobsRetGestureRecognizerByDelegateBlock _Nonnull)byDelegate;
-(JobsRetGestureRecognizerByBOOLBlock _Nonnull)byEnabled;
-(JobsRetGestureRecognizerByBOOLBlock _Nonnull)byCancelsTouchesInView;
-(JobsRetGestureRecognizerByBOOLBlock _Nonnull)byDelaysTouchesBegan;
-(JobsRetGestureRecognizerByBOOLBlock _Nonnull)byDelaysTouchesEnded;
-(JobsRetGestureRecognizerByArrBlock _Nonnull)byAllowedTouchTypes;
-(JobsRetGestureRecognizerByArrBlock _Nonnull)byAllowedPressTypes;
-(JobsRetGestureRecognizerByBOOLBlock _Nonnull)byRequiresExclusiveTouchType;
-(JobsRetGestureRecognizerByStringBlock _Nonnull)byName API_AVAILABLE(ios(11.0));
-(JobsRetGestureByGesture _Nonnull)byRequireGestureRecognizerToFail;
-(JobsRetCGPointByViewBlock _Nonnull)byLocationInView;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN UIGestureRecognizer
-(JobsRetUIGestureRecognizerByRACGestureRecognizerActionHandlerBlock _Nonnull)byRac_gestureHandler;
-(JobsRetUIGestureRecognizerByRACSubjectBlock _Nonnull)byRac_subject;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END UIGestureRecognizer
@end
NS_ASSUME_NONNULL_END
#endif
