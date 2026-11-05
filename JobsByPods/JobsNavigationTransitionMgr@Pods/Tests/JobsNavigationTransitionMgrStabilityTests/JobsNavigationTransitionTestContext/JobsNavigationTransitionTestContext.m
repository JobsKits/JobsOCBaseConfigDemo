//
//  JobsNavigationTransitionTestContext.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsNavigationTransitionTestContext.h"

// 用途：实现测试替身（fixture）；实现可控转场上下文，记录完成结果并模拟容器尺寸与取消状态。
// 运行：由 JobsNavigationTransitionMgr-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@implementation JobsNavigationTransitionTestContext

-(BOOL)isAnimated{
    return YES;
}

-(BOOL)isInteractive{
    return YES;
}

-(UIModalPresentationStyle)presentationStyle{
    return UIModalPresentationFullScreen;
}

-(CGAffineTransform)targetTransform{
    return CGAffineTransformIdentity;
}

-(UIViewController *)viewControllerForKey:(UITransitionContextViewControllerKey)key{
    return [key isEqualToString:UITransitionContextFromViewControllerKey] ? self.fromController : self.toController;
}

-(UIView *)viewForKey:(UITransitionContextViewKey)key{
    return [key isEqualToString:UITransitionContextFromViewKey] ? self.fromController.view : self.toController.view;
}

-(CGRect)initialFrameForViewController:(UIViewController *)controller{
    return controller.view.frame;
}

-(CGRect)finalFrameForViewController:(UIViewController *)controller{
    return self.containerView.bounds;
}

-(void)updateInteractiveTransition:(CGFloat)percentComplete{
}

-(void)finishInteractiveTransition{
}

-(void)cancelInteractiveTransition{
}

-(void)pauseInteractiveTransition{
}

-(void)completeTransition:(BOOL)didComplete{
    self.completed = YES;
    self.completionValue = didComplete;
    if (self.onCompletion) self.onCompletion();
}

@end
