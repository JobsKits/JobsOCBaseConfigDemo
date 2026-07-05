//
//  TransitionAnimation.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_TRANSITIONANIMATION_B5EA48FEED
#define JOBS_HEADER_GUARD_TRANSITIONANIMATION_B5EA48FEED

#import <UIKit/UIKit.h>

#import "JobsDefineProperty.h"

#import "JobsOCDSL.h"

@interface TransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

-(instancetype)initWithTargetEdge:(UIRectEdge)targetEdge;

Prop(readwrite)UIRectEdge targetEdge;

@end
#endif /* JOBS_HEADER_GUARD_TRANSITIONANIMATION_B5EA48FEED */
