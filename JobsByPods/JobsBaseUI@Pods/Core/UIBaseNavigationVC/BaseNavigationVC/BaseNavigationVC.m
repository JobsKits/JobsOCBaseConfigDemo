//
//  BaseNavigationVC.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseNavigationVC.h"
#import <JobsBaseUI/NSObject+Extra.h>
#import <JobsBaseUI/UIViewController+BaseNavigationBar.h>

@interface BaseNavigationVC ()

Prop_strong()NSShadow *shadow;

@end

@implementation BaseNavigationVC

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        // [self 自定义navigationBar];
    };return self;
}

-(void)loadView{
    [super loadView];
    self.delegate = self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
//    self.navigationBar.hidden = YES;// [self setNavigationBarHidden:YES animated:YES]; 这么写不行
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationBar.hidden = YES;// [self setNavigationBarHidden:YES animated:YES]; 这么写不行
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
//在指定的单独的控制器里面更改状态栏的颜色（不是全局统一样式的批量改）
/** 同时在指定的控制器里面实现此方法
 *  资料来源：https://www.jianshu.com/p/25e9c1a864be
 *  - (UIStatusBarStyle)preferredStatusBarStyle {
        return UIStatusBarStyleLightContent;
    }
 */
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    [self setViewControllers:viewControllers
                    animated:YES];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers
                  animated:(BOOL)animated{
    for(NSInteger index = 1; index < viewControllers.count; index ++){
        viewControllers[index].hidesBottomBarWhenPushed = YES;
    }
    [super setViewControllers:viewControllers animated:animated];
}

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed = self.viewControllers.count;// push 的时候把 tabBar 隐藏了
    [super pushViewController:viewController animated:animated];
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
/// 在 UINavigationController 中适配横屏
- (BOOL)shouldAutorotate {
    return YES;
}
#pragma clang diagnostic pop
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}
#pragma mark —— UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated{
    self.navigationBar.byHidden(self.isHiddenNavigationBar);// 全局隐藏系统的导航栏，这一句是手势返回的时候，再次隐藏
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated{
    self.interactivePopGestureRecognizer.delegate = (id)viewController;
}
#pragma mark —— 一些私有方法
/// 如果用系统的navigationBar，而并非自定义👇
-(void)自定义navigationBar{
    self.navigationBar.translucent = NO;
    [self.navigationBar setBackgroundImage:@"启动页SLOGAN".img forBarMetrics:UIBarMetricsDefault]; // 仅仅是 navigationBar 背景
//    [self.navigationBar setShadowImage:@"启动页SLOGAN".img];// 图片大了会全屏

    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) { // 设置NavgationBar的背景图片
        [self.navigationBar setBarTintColor:JobsRedColor]; // 一般的业务是全局设置，因为一个App里面只有一个主题
        self.navigationBar.tintColor = JobsBlackColor;     // 系统的组件着色（返回按钮——箭头图标 和 上面的字）
    }
    /// 设置导航上的title显示样式
    self.navigationBar.titleTextAttributes = jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable dic) {
        dic[NSForegroundColorAttributeName] = JobsBlackColor;
        dic[NSShadowAttributeName] = self.shadow;
        dic[NSFontAttributeName] = JobsFontRegular(18);
    });
}
#pragma mark —— lazyLoad
-(NSShadow *)shadow{
    if (!_shadow) {
        _shadow = jobsMakeShadow(^(__kindof NSShadow * _Nullable shadow) {
            shadow.shadowColor = RGBA_COLOR(0,0,0,0.8);
            shadow.shadowOffset = CGSizeZero;
        });
    };return _shadow;
}

@end
