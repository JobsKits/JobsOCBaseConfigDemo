//
//  PushAnimation.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PushAnimation.h"

@implementation PushAnimation
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.6;
}
/**
 1、 - (UIView *)containerView;  //转场动画发生的容器
 
 2、 - (UIViewController *)viewControllerForKey:(NSString *)key;
 // 我们可以通过它拿到过渡的两个 ViewController。
 3、 - (CGRect)initialFrameForViewController:(UIViewController *)vc;
 - (CGRect)finalFrameForViewController:(UIViewController *)vc;
 // 通过这两个方法，可以获得过度动画前后两个ViewController的frame。
 */
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    // 1.获取两个VC 和 动画发生的容器
    A_VC *firstVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    B_VC *secondVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];  // 此处容器大小即为屏幕大小 self.view
    // 2.创建一个 Cell 中 imageView 的截图，并把 imageView 隐藏，造成使用户以为移动的就是 imageView 的假象
    MyFansTBVCell *cell = [firstVC.tableView cellForRowAtIndexPath:[firstVC.tableView indexPathForSelectedRow]];
    firstVC.indexPath = [firstVC.tableView indexPathForSelectedRow];
    /** 截图 */
    UIView *snapShotView = [cell.imgView snapshotViewAfterScreenUpdates:NO];
    CGRect firstFrame  = [containerView convertRect:cell.imgView.frame fromView:cell];
    CGRect secondFrame = [containerView convertRect:secondVC.imageView.frame fromView:secondVC.view];
    snapShotView.byFrame(firstFrame);
    cell.imgView.byHidden(YES);
    // 3.设置第二个控制器的位置、透明度，并把透明度设为0，在后面的动画中慢慢显示出来变为1
    secondVC.view.byFrame([transitionContext finalFrameForViewController:secondVC]);//初始化secondVC的位置,否则约束无效
    secondVC.view.byAlpha(0);
    secondVC.imageView.byHidden(YES);
    // 4.把动画前后的两个ViewController加到容器中,顺序很重要,snapShotView在上方 就是截图和secondVC.view之间的动画
    secondVC.view.addOn(containerView);
    snapShotView.addOn(containerView);
    // 5.执行动画。第二个控制器的透明度0~1；让截图SnapShotView的位置更新到最新 弹性       弹性比例        最初的       速度(时间)
    UIView.jobsAnimateWithSpring(0.6,
        0,
        0.6,
        1,
        UIViewAnimationOptionCurveLinear,
        ^{
        [containerView layoutIfNeeded];
        secondVC.view.byAlpha(1);
        snapShotView.byFrame(secondFrame);
        // ====
        snapShotView.byClipsToBounds(NO);
    },
        ^(BOOL finished) {
        //为了让回来的时候，cell上的图片显示，必须要让cell上的图片显示出来
        cell.imgView.byHidden(NO);
        secondVC.imageView.byHidden(NO);
        [snapShotView removeFromSuperview];
        //告诉系统动画结束 一定要记得动画完成后执行此方法，让系统管理 navigation
        [transitionContext completeTransition:YES];
    });
}

@end
