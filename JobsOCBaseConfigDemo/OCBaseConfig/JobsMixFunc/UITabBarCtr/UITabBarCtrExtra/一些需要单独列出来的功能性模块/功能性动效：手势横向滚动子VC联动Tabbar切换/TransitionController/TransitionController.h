//
//  TransitionController.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_TRANSITIONCONTROLLER_E2B09297EB
#define JOBS_HEADER_GUARD_TRANSITIONCONTROLLER_E2B09297EB

#import <UIKit/UIKit.h>

#import "JobsDefines.h"

@interface TransitionController : UIPercentDrivenInteractiveTransition

-(instancetype)initWithGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer NS_DESIGNATED_INITIALIZER;
-(instancetype)init NS_UNAVAILABLE;

@end
#endif /* JOBS_HEADER_GUARD_TRANSITIONCONTROLLER_E2B09297EB */
