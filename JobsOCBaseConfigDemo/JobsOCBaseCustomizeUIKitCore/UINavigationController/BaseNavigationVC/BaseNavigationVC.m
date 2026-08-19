//
//  BaseNavigationVC.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseNavigationVC.h"

#import "NSObject+Extra.h"
#import "UIViewController+BaseNavigationBar.h"

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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseNavigationVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.byDelegate(self);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseNavigationVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLoad];
        //    self.navigationBar.hidden = YES;// [self setNavigationBarHidden:YES animated:YES]; 这么写不行
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseNavigationVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewWillAppear:animated];
        //    self.navigationBar.hidden = YES;// [self setNavigationBarHidden:YES animated:YES]; 这么写不行
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseNavigationVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseNavigationVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseNavigationVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseNavigationVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseNavigationVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
    };
}
//在指定的单独的控制器里面更改状态栏的颜色（不是全局统一样式的批量改）
/** 同时在指定的控制器里面实现此方法
 *  资料来源：https://www.jianshu.com/p/25e9c1a864be
 *  - (UIStatusBarStyle)preferredStatusBarStyle {
        return UIStatusBarStyleLightContent;
    }
 */
-(UIViewController *)childViewControllerForStatusBarStyle{
    JobsRetVCByVoidBlock action = ((JobsRetVCByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseNavigationVC.class, @selector(jobsChildViewControllerForStatusBarStyle)))(self, @selector(jobsChildViewControllerForStatusBarStyle));
    return action ? action() : nil;
}

- (JobsRetVCByVoidBlock _Nonnull)jobsChildViewControllerForStatusBarStyle {
    @jobs_weakify(self)
    return ^UIViewController *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.topViewController;
    };
}

-(void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    jobsByNSArrayUIViewControllerBlock action = ((jobsByNSArrayUIViewControllerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseNavigationVC.class, @selector(jobsSetViewControllers)))(self, @selector(jobsSetViewControllers));
    if (action) action(viewControllers);
}

-(jobsByNSArrayUIViewControllerBlock _Nonnull)jobsSetViewControllers{
    @jobs_weakify(self)
    return ^(NSArray<__kindof UIViewController *> * viewControllers){
        @jobs_strongify(self)
        if (!self) return;
        [self setViewControllers:viewControllers
                        animated:YES];
    };
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
    viewController.byHidesBottomBarWhenPushed(self.viewControllers.count);
    [super pushViewController:viewController animated:animated];
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
/// 在 UINavigationController 中适配横屏
-(BOOL)shouldAutorotate{
    return (((JobsRetBOOLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseNavigationVC.class, @selector(jobsShouldAutorotate)))(self, @selector(jobsShouldAutorotate)))();
}

- (JobsRetBOOLByVoidBlock _Nonnull)jobsShouldAutorotate {
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return YES;
    };
}
#pragma clang diagnostic pop
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    JobsRetUIInterfaceOrientationMaskByVoidBlock action = ((JobsRetUIInterfaceOrientationMaskByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseNavigationVC.class, @selector(jobsSupportedInterfaceOrientations)))(self, @selector(jobsSupportedInterfaceOrientations));
    return action ? action() : (UIInterfaceOrientationMask){0};
}

-(JobsRetUIInterfaceOrientationMaskByVoidBlock _Nonnull)jobsSupportedInterfaceOrientations{
    @jobs_weakify(self)
    return ^UIInterfaceOrientationMask{
        @jobs_strongify(self)
        if (!self) return (UIInterfaceOrientationMask){0};
        return [self.topViewController supportedInterfaceOrientations];
    };
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
    self.interactivePopGestureRecognizer.byDelegate((id)viewController);
}
#pragma mark —— 一些私有方法
/// 如果用系统的navigationBar，而并非自定义👇
-(void)自定义navigationBar{
    self.navigationBar.byTranslucent(NO);
    [self.navigationBar setBackgroundImage:@"启动页SLOGAN".img forBarMetrics:UIBarMetricsDefault]; // 仅仅是 navigationBar 背景
//    [self.navigationBar setShadowImage:@"启动页SLOGAN".img];// 图片大了会全屏
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) { // 设置NavgationBar的背景图片
        [self.navigationBar setBarTintColor:JobsRedColor]; // 一般的业务是全局设置，因为一个App里面只有一个主题
        self.navigationBar.byTintColor(JobsBlackColor);    // 系统的组件着色（返回按钮——箭头图标 和 上面的字）
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
            shadow
                .byShadowColor(RGBA_COLOR(0,0,0,0.8))
                .byShadowOffset(CGSizeZero);
        });
    };return _shadow;
}

@end
