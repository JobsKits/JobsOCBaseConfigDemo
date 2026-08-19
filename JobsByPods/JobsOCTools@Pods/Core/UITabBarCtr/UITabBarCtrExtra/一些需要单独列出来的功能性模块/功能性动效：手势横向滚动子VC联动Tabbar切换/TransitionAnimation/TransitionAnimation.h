//
//  TransitionAnimation.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_TRANSITIONANIMATION_B5EA48FEED
#define JOBS_HEADER_GUARD_TRANSITIONANIMATION_B5EA48FEED

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefineProperty.h>)
#import <JobsOCDefs/JobsDefineProperty.h>
#else
#import "JobsDefineProperty.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@interface TransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

-(instancetype)initWithTargetEdge:(UIRectEdge)targetEdge;

Prop(readwrite)UIRectEdge targetEdge;

@end
#endif /* JOBS_HEADER_GUARD_TRANSITIONANIMATION_B5EA48FEED */
