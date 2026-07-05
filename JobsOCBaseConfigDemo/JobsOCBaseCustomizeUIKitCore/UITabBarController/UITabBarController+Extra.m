//
//  UITabBarController+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITabBarController+Extra.h"

#import "UIView+Measure.h"

@implementation UITabBarController (Extra)
/// 如果要改变 UITabBarController.viewControllers里面的子控制器的view的frame，会涉及到UITabBarController的自我调整
/// 在self.selectedIndex = index;以后也会让UITabBarController的页面进行自动约束调整
/// 如果一定要进行重排，则画面会有一个一闪而过的调整动画（不是那么友好）
-(jobsByCGFloatBlock _Nonnull)resetSubVCViewHeightBy{
    @jobs_weakify(self)
    return ^(CGFloat height){
        @jobs_strongify(self)
        for (__kindof UIViewController *vc in self.viewControllers) {
            vc.view.resetHeightByOffset(height);
        }
    };
}

-(jobsByVoidBlock _Nonnull)resetSubVCViewHeight{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.resetSubVCViewHeightBy(-50);// AppDelegate.jobsCustomTabBarVC.customTabBar.height
    };
}

@end
