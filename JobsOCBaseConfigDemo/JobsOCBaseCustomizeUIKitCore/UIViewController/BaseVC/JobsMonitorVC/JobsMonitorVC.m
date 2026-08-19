//
//  JobsMonitorVC.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsMonitorVC.h"

#import "NSObject+Extra.h"
#import "NSObject+Notification.h"

@interface JobsMonitorVC ()

@end

@implementation JobsMonitorVC
@synthesize jobsBackBlock = _jobsBackBlock;
-(void)didReceiveMemoryWarning{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMonitorVC.class, @selector(jobsDidReceiveMemoryWarning)))(self, @selector(jobsDidReceiveMemoryWarning));
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
    [self.view endEditing:YES];
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMonitorVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.jobsBackBlock = ^id _Nullable(id _Nullable data) {
            JobsLog(@"退出页面的逻辑");
            return nil;
        };
    };
}

-(void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMonitorVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMonitorVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
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

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMonitorVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        JobsLog(@"SSS = %ld",(long)self.jobsGetDeviceOrientation());
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMonitorVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMonitorVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
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

-(void)viewWillDisappear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMonitorVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMonitorVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
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
#pragma mark —— 在 当前控制器 中适配横屏
/// 适配横屏
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
-(BOOL)shouldAutorotate{
    return (((JobsRetBOOLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMonitorVC.class, @selector(jobsShouldAutorotate)))(self, @selector(jobsShouldAutorotate)))();
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
/// 当前控制器支持的屏幕旋转方向（在具体的控制器子类进行覆写）
/// iPad设备上，默认返回值UIInterfaceOrientationMaskAllButUpSideDwon
/// iPhone设备上，默认返回值是UIInterfaceOrientationMaskAll
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    JobsRetUIInterfaceOrientationMaskByVoidBlock action = ((JobsRetUIInterfaceOrientationMaskByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMonitorVC.class, @selector(jobsSupportedInterfaceOrientations)))(self, @selector(jobsSupportedInterfaceOrientations));
    return action ? action() : (UIInterfaceOrientationMask){0};
}

-(JobsRetUIInterfaceOrientationMaskByVoidBlock _Nonnull)jobsSupportedInterfaceOrientations{
    @jobs_weakify(self)
    return ^UIInterfaceOrientationMask{
        @jobs_strongify(self)
        if (!self) return (UIInterfaceOrientationMask){0};
        return UIInterfaceOrientationMaskAllButUpsideDown;
    };
}
/// 设置进入界面默认支持的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    JobsRetUIInterfaceOrientationByVoidBlock action = ((JobsRetUIInterfaceOrientationByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMonitorVC.class, @selector(jobsPreferredInterfaceOrientationForPresentation)))(self, @selector(jobsPreferredInterfaceOrientationForPresentation));
    return action ? action() : (UIInterfaceOrientation){0};
}

-(JobsRetUIInterfaceOrientationByVoidBlock _Nonnull)jobsPreferredInterfaceOrientationForPresentation{
    @jobs_weakify(self)
    return ^UIInterfaceOrientation{
        @jobs_strongify(self)
        if (!self) return (UIInterfaceOrientation){0};
        return [super preferredInterfaceOrientationForPresentation];
    };
}
#pragma mark —— 一些公有方法
-(jobsByVoidBlock _Nonnull)语言切换的监听{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        [self addNotificationName:语言切换
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                JobsLog(@"SSS = %d",b.boolValue);
            }JobsLog(@"通知传递过来的 = %@",notification.object);
        }];
    };
}

-(jobsByVoidBlock _Nonnull)设备方向的监听{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        [self addNotificationName:UIDeviceOrientationDidChangeNotification
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                JobsLog(@"SSS = %d",b.boolValue);
            }JobsLog(@"通知传递过来的 = %@",notification.object);
            switch (UIDevice.currentDevice.orientation) {
                /// 处理竖屏方向的逻辑
                /// 设备竖直向上，Home 按钮在下方
                case UIDeviceOrientationPortrait:
                    JobsLog(@"系统通知：↓");
                    break;
                /// 设备竖直向下，Home 按钮在上方
                case UIDeviceOrientationPortraitUpsideDown:
                    JobsLog(@"系统通知：↑");
                    break;
                /// 处理横屏方向的逻辑
                /// 设备水平，Home 按钮在右侧
                case UIDeviceOrientationLandscapeLeft:
                    JobsLog(@"系统通知：→");
                    break;
                /// 设备水平，Home 按钮在左侧
                case UIDeviceOrientationLandscapeRight:
                    JobsLog(@"系统通知：←");
                    break;
                /// 未匹配已知分支时执行兜底处理
                default:
                    break;
            }
        }];
    };
}
#pragma mark —— lazyLoad

@end
