//
//  JobsNavigationTransitionTestContext.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsNavigationTransitionMgrStabilityTests.h"

@interface JobsNavigationTransitionTestContext : NSObject<UIViewControllerContextTransitioning>

Prop_strong()UIView *containerView;
Prop_strong()UIViewController *fromController;
Prop_strong()UIViewController *toController;
Prop_assign()BOOL transitionWasCancelled;
Prop_assign()BOOL completed;
Prop_assign()BOOL completionValue;
Prop_copy(nullable)jobsByVoidBlock onCompletion;

@end
