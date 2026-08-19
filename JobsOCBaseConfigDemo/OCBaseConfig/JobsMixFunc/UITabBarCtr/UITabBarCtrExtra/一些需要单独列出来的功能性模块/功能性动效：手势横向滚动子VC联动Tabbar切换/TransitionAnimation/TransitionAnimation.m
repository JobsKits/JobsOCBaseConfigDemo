//
//  TransitionAnimation.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TransitionAnimation.h"

@implementation TransitionAnimation
- (instancetype)initWithTargetEdge:(UIRectEdge)targetEdge{
    if (self = [self init]) {
        _targetEdge = targetEdge;
    };return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    JobsRetNSTimeIntervalByIDUIViewControllerContextTransitioningBlock action = ((JobsRetNSTimeIntervalByIDUIViewControllerContextTransitioningBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TransitionAnimation.class, @selector(jobsTransitionDuration)))(self, @selector(jobsTransitionDuration));
    return action ? action(transitionContext) : (NSTimeInterval){0};
}

-(JobsRetNSTimeIntervalByIDUIViewControllerContextTransitioningBlock _Nonnull)jobsTransitionDuration{
    @jobs_weakify(self)
    return ^NSTimeInterval(id<UIViewControllerContextTransitioning> transitionContext){
        @jobs_strongify(self)
        if (!self) return (NSTimeInterval){0};
        return 0.35;
    };
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    ((((jobsByIDUIViewControllerContextTransitioningBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TransitionAnimation.class, @selector(animateTransition)))(self, @selector(animateTransition))))(transitionContext);
}
-(jobsByIDUIViewControllerContextTransitioningBlock _Nonnull)animateTransition{
    @jobs_weakify(self)
    return ^(id<UIViewControllerContextTransitioning> transitionContext){
        @jobs_strongify(self)
        if (!self) return;
        UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        CGRect fromFrame = [transitionContext initialFrameForViewController:fromViewController];
        CGRect toFrame = [transitionContext finalFrameForViewController:toViewController];
        CGVector offset;
        if (self.targetEdge == UIRectEdgeLeft){
            offset = CGVectorMake(-1.f, 0.f);
        }else if (self.targetEdge == UIRectEdgeRight){
            offset = CGVectorMake(1.f, 0.f);
        }else{
            NSAssert(NO, @"targetEdge must be one of UIRectEdgeLeft, or UIRectEdgeRight.");
        }
        fromView.byFrame(fromFrame);
        toView.frame = CGRectOffset(toFrame,
                                    toFrame.size.width * offset.dx * -1,
                                    toFrame.size.height * offset.dy * -1);
        [transitionContext.containerView addSubview:toView];
        NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
        [UIView animateWithDuration:transitionDuration animations:^{
            fromView.frame = CGRectOffset(fromFrame,
                                          fromFrame.size.width * offset.dx,
                                          fromFrame.size.height * offset.dy);
            toView.byFrame(toFrame);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    };
}

@end
