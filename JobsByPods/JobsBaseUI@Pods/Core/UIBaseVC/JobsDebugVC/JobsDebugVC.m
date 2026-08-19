//
//  JobsDebugVC.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsDebugVC.h"

#import <JobsBaseUI/NSString+Extra.h>

NSString *const JobsControllerDeallocTipsEnabledUserDefaultsKey = @"com.jobs.debug.showsControllerDeinitTips";

BOOL JobsControllerDeallocTipsEnabled(void) {
    id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsControllerDeallocTipsEnabledUserDefaultsKey];
    return value ? [value boolValue] : YES;
}

void JobsSetControllerDeallocTipsEnabled(BOOL enabled) {
    [NSUserDefaults.standardUserDefaults setBool:enabled
                                          forKey:JobsControllerDeallocTipsEnabledUserDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

@interface JobsDebugVC ()

@end

@implementation JobsDebugVC
-(void)didReceiveMemoryWarning{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDebugVC.class, @selector(jobsDidReceiveMemoryWarning)))(self, @selector(jobsDidReceiveMemoryWarning));
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
    if (JobsDebug) {
        if (JobsControllerDeallocTipsEnabled()) {
            toastBy(@"成功销毁了控制器".jobsTr().add(NSStringFromClass(self.class)));
        }
        JobsLog(@"%@",JobsLocalFunc);
        PrintRetainCount(self)
    }
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDebugVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.UIViewControllerLifeCycle(JobsLocalFunc);
    };
}

-(void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDebugVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.UIViewControllerLifeCycle(JobsLocalFunc);
    };
}

-(void)viewWillAppear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDebugVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.UIViewControllerLifeCycle(JobsLocalFunc);
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDebugVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
        self.UIViewControllerLifeCycle(JobsLocalFunc);
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDebugVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        self.UIViewControllerLifeCycle(JobsLocalFunc);
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDebugVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        self.UIViewControllerLifeCycle(JobsLocalFunc);
    };
}

- (void)viewWillDisappear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDebugVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.UIViewControllerLifeCycle(JobsLocalFunc);
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDebugVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
        self.UIViewControllerLifeCycle(JobsLocalFunc);
    };
}
#pragma mark —— 一些私有方法
/// 用于检测UIViewController的生命周期
-(jobsByStrBlock _Nonnull)UIViewControllerLifeCycle{
    @jobs_weakify(self)
    return ^(NSString *_Nullable lifeCycle) {
        @jobs_strongify(self)
        UIViewModel *viewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.byData(nil)
                .byRequestParams(lifeCycle);
        });
        if(self.objBlock) self.objBlock(viewModel);
    };
}
#pragma mark —— lazyLoad

@end
