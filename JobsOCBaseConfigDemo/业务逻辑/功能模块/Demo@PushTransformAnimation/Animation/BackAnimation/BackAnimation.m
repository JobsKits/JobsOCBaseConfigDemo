//
//  BackAnimation.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BackAnimation.h"

@implementation BackAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.6;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    A_VC *firstVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    B_VC *secondVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    // 2.在前一个VC上创建一个截图
    UIView *snapShotView = [secondVC.imageView snapshotViewAfterScreenUpdates:NO];
    // 获取firstVC中图片的位置
    MyFansTBVCell *cell = [firstVC.tableView cellForRowAtIndexPath:[firstVC.tableView indexPathForSelectedRow]];
    CGRect firstFrame  = [containerView convertRect:cell.imgView.frame fromView:cell];
    CGRect secondFrame = [containerView convertRect:secondVC.imageView.frame fromView:secondVC.view];
    snapShotView.byFrame(secondFrame);

    secondVC.imageView.byHidden(YES);

    cell.imgView.byHidden(YES);

//    JobsLog(@"firstFrame = %@, secondFrame = %@, secondVC = %@",NSStringFromCGRect(firstFrame),NSStringFromCGRect(secondFrame), NSStringFromCGRect(secondVC.view.frame));
    
    //------
//    UIImageView *imgView = cell.imgView;
    
    // 3.设置firstVC控制器的位置
    firstVC.view.byFrame([transitionContext finalFrameForViewController:firstVC]);//初始化firstVC的位置
    
    
    // 4.把动画前后的两个ViewController加到容器中,顺序很重要,snapShotView在上方  就是截图和secondVC.view之间的动画
    [containerView insertSubview:firstVC.view belowSubview:secondVC.view];//firstVC.view在secondVC.view的下面
    snapShotView.addOn(containerView);
    
    // 5.执行动画。第二个控制器的透明度0~1；让截图SnapShotView的位置更新到最新
    UIView.jobsAnimateWithSpring(0.6,
        0,
        0.6,
        1,
        UIViewAnimationOptionCurveLinear,
        ^{
        secondVC.view.byAlpha(0);

        snapShotView.byFrame(firstFrame);

//        [snapShotView removeFromSuperview];
    },
        ^(BOOL finished) {
        [snapShotView removeFromSuperview];
        secondVC.imageView.byHidden(NO);

        cell.imgView.byHidden(NO);

        [transitionContext completeTransition:YES];
    });
}

@end
