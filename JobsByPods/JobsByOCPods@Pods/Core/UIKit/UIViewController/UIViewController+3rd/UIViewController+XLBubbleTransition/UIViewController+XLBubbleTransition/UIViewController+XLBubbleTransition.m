//
//  UIViewController+XLBubbleTransition.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+XLBubbleTransition.h"

@implementation UIViewController (XLBubbleTransition)
#pragma mark —— Navigation的Push和Pop转场动画设置
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                 animationControllerForOperation:(UINavigationControllerOperation)operation
                                              fromViewController:(UIViewController *)fromVC
                                                toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush ) {//&& [fromVC isEqual:self]
        return self.xl_pushTranstion;
    }else if(operation == UINavigationControllerOperationPop ) {//&& [toVC isEqual:self]
        return self.xl_popTranstion;
    }else return nil;
}
#pragma mark —— Present和Dismiss转场动画
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                 presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return (id<UIViewControllerAnimatedTransitioning>)self.xl_presentTranstion;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return (id<UIViewControllerAnimatedTransitioning>)self.xl_dismissTranstion;
}

#pragma mark —— @property(nonatomic,retain) XLBubbleTransition *xl_pushTranstion;
JobsKey(_xl_pushTranstion)
@dynamic xl_pushTranstion;
- (XLBubbleTransition *)xl_pushTranstion {
    return Jobs_getAssociatedObject(_xl_pushTranstion);
}

- (void)setXl_pushTranstion:(XLBubbleTransition *)xl_pushTranstion{
    if (xl_pushTranstion) {
        xl_pushTranstion.transitionType = XLBubbleTransitionTypeShow;
        self.navigationController.byDelegate(self);
    }else {
        self.navigationController.byDelegate(nil);
    }
    Jobs_setAssociatedRETAIN_NONATOMIC(_xl_pushTranstion, xl_pushTranstion)
}
#pragma mark —— @property(nonatomic,retain)XLBubbleTransition *xl_popTranstion;
JobsKey(_xl_popTranstion)
@dynamic xl_popTranstion;
- (XLBubbleTransition *)xl_popTranstion{
    return Jobs_getAssociatedObject(_xl_popTranstion);
}

- (void)setXl_popTranstion:(XLBubbleTransition *)xl_popTranstion {
    if (xl_popTranstion) {
        xl_popTranstion.transitionType = XLBubbleTransitionTypeHide;
        self.navigationController.byDelegate(self);
    }else {
        self.navigationController.byDelegate(nil);
    }
    Jobs_setAssociatedRETAIN_NONATOMIC(_xl_popTranstion, xl_popTranstion)
}
#pragma mark —— @property(nonatomic,retain)XLBubbleTransition *xl_presentTranstion;
JobsKey(_xl_presentTranstion)
@dynamic xl_presentTranstion;
- (XLBubbleTransition *)xl_presentTranstion {
    return Jobs_getAssociatedObject(_xl_presentTranstion);
}

- (void)setXl_presentTranstion:(XLBubbleTransition *)xl_presentTranstion{
    if (xl_presentTranstion) {
        xl_presentTranstion.transitionType = XLBubbleTransitionTypeShow;
        self.transitioningDelegate = self;
    }else {
        self.transitioningDelegate = nil;
    }
    Jobs_setAssociatedRETAIN_NONATOMIC(_xl_presentTranstion, xl_presentTranstion)
}
#pragma mark —— @property(nonatomic,retain)XLBubbleTransition *xl_dismissTranstion;
JobsKey(_xl_dismissTranstion)
@dynamic xl_dismissTranstion;
- (XLBubbleTransition *)xl_dismissTranstion {
    return Jobs_getAssociatedObject(_xl_dismissTranstion);
}

- (void)setXl_dismissTranstion:(XLBubbleTransition *)xl_dismissTranstion {
    if (xl_dismissTranstion) {
        xl_dismissTranstion.transitionType = XLBubbleTransitionTypeHide;
        self.transitioningDelegate = self;
    }else {
        self.transitioningDelegate = nil;
    }
    Jobs_setAssociatedRETAIN_NONATOMIC(_xl_dismissTranstion, xl_dismissTranstion)
}

@end
