//
//  UIGestureRecognizer+DSL.h
//  JobsOCBaseConfigDemo
//
#ifndef JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_DSL
#define JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_DSL

#import <UIKit/UIKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

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

@end
NS_ASSUME_NONNULL_END
#endif
