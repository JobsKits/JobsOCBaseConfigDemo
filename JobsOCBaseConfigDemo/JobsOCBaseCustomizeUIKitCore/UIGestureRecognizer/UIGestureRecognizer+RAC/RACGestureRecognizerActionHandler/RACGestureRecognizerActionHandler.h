//
//  RACGestureRecognizerActionHandler.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_RACGESTURERECOGNIZERACTIONHANDLER_D348A19E31
#define JOBS_HEADER_GUARD_RACGESTURERECOGNIZERACTIONHANDLER_D348A19E31

#import <Foundation/Foundation.h>
#import "UIGestureRecognizer+ReactiveCocoa.h"
#import "UIGestureRecognizer+ReactiveCocoaProtected.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#import "JobsBlock.h"
#import "JobsDefines.h"

@interface RACGestureRecognizerActionHandler : NSObject

-(jobsByGestureRecognizerBlock _Nonnull)rac_handleGesture;

@end
#endif /* JOBS_HEADER_GUARD_RACGESTURERECOGNIZERACTIONHANDLER_D348A19E31 */
