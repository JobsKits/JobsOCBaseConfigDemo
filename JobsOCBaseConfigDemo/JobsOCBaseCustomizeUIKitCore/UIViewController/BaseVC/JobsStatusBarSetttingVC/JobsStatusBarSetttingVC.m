//
//  JobsStatusBarSetttingVC.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsStatusBarSetttingVC.h"

#import "NSArray+Extra.h"
#import "NSObject+Extra.h"

@interface JobsStatusBarSetttingVC ()

@end

@implementation JobsStatusBarSetttingVC
#pragma mark —— BaseViewControllerProtocol
BaseViewControllerProtocol_synthesize
-(void)didReceiveMemoryWarning{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsStatusBarSetttingVC.class, @selector(jobsDidReceiveMemoryWarning)))(self, @selector(jobsDidReceiveMemoryWarning));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsDidReceiveMemoryWarning {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super didReceiveMemoryWarning];
    };
}

-(void)dealloc{
    JobsRemoveNotification(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsStatusBarSetttingVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
    };
}

-(void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsStatusBarSetttingVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
    };
}

-(void)viewWillAppear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsStatusBarSetttingVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsStatusBarSetttingVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsStatusBarSetttingVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
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

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsStatusBarSetttingVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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

- (void)viewWillDisappear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsStatusBarSetttingVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewWillDisappear:animated];
        //    self.restoreStatusBarCor(nil);
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsStatusBarSetttingVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
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
/**

     iOS 状态栏颜色的修改
     【全局修改】
      1、在Info.plist里面加入如下键值对：
         1.1、View controller-based status bar appearance : NO
         1.2、Status bar style : Light Content

      2、UIApplication.sharedApplication.statusBarStyle = UIStatusBarStyleLightContent;// iOS 13 后方法被标注废弃

      1.2 和 2 任意选一个即可

     【局部修改】
      1、在Info.plist里面加入如下键值对：
      View controller-based status bar appearance ： YES //全局是NO、局部是YES
      2、@ interface BaseNavigationVC : UINavigationController
         2.1、在 BaseNavigationVC.m里面写入：
         - (UIViewController *)childViewControllerForStatusBarStyle {
                 return self.topViewController;
         }
         2.2、在具体的需要修改的VC.m里面写入：
         -(UIStatusBarStyle)preferredStatusBarStyle{
             return UIStatusBarStyleLightContent;
         }
 */
-(UIStatusBarStyle)preferredStatusBarStyle{
    JobsRetUIStatusBarStyleByVoidBlock action = ((JobsRetUIStatusBarStyleByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsStatusBarSetttingVC.class, @selector(jobsPreferredStatusBarStyle)))(self, @selector(jobsPreferredStatusBarStyle));
    return action ? action() : (UIStatusBarStyle){0};
}

-(JobsRetUIStatusBarStyleByVoidBlock _Nonnull)jobsPreferredStatusBarStyle{
    @jobs_weakify(self)
    return ^UIStatusBarStyle{
        @jobs_strongify(self)
        if (!self) return (UIStatusBarStyle){0};
        return UIStatusBarStyleLightContent;
    };
}
#pragma mark —— 一些公有方法<BaseViewControllerProtocol>
/// 恢复状态栏颜色
-(jobsByCorBlock _Nonnull)restoreStatusBarCor{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable cor) {
        @jobs_strongify(self)
        if (@available(iOS 13.0, *)) {
            if (!jobsGetMainWindow().subviews.containsObject(self.statusBar)) {
                [self.statusBar removeFromSuperview];
            }
            if(!cor) cor = JobsWhiteColor;
            self.statusBar.byBgColor(cor);
        } else {
            self.changeStatusBarCor(JobsClearColor);
        }
    };
}
/// 更新状态栏颜色为自定义的颜色
-(jobsByCorBlock _Nonnull)updateStatusBarCor{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable cor) {
        @jobs_strongify(self)
        if(!cor)cor = JobsRedColor;
        if (@available(iOS 13.0, *)) {
            if (!self.view.subviews.containsObject(self.statusBar)) {
                [self.view addSubview:self.statusBar];
            }self.statusBar.backgroundColor = cor;
        } else {
            self.changeStatusBarCor(cor);
        }
    };
}
#pragma mark —— 一些私有方法
-(jobsByCorBlock _Nonnull)changeStatusBarCor{
    return ^(UIColor *_Nullable data){
        UIView *statusBar = [UIApplication.sharedApplication.valueForKey(@"statusBarWindow") valueForKey:@"statusBar"];
        if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
            statusBar.byBgColor(data);
        }[self setNeedsStatusBarAppearanceUpdate];// 手动触发 preferredStatusBarStyle 更新状态栏颜色
    };
}
#pragma mark —— lazyLoad
-(UIView *)statusBar{
    if (!_statusBar) {
        _statusBar = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byFrame(jobsGetMainWindowWithSize().windowScene.statusBarManager.statusBarFrame);
        });
    };return _statusBar;
}

@end
