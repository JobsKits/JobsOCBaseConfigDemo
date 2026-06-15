//
//  JobsDebugVC.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsDebugVC.h"
#import <JobsBaseUI/NSString+Extra.h>

@interface JobsDebugVC ()

@end

@implementation JobsDebugVC

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)dealloc{
    JobsRemoveNotification(self);
    if (JobsDebug) {
        toastBy(@"成功销毁了控制器".tr.add(NSStringFromClass(self.class)));
        JobsLog(@"%@",JobsLocalFunc);
        PrintRetainCount(self)
    }
}

-(void)loadView{
    [super loadView];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.UIViewControllerLifeCycle(JobsLocalFunc);
}
#pragma mark —— 一些私有方法
/// 用于检测UIViewController的生命周期
-(jobsByStrBlock)UIViewControllerLifeCycle{
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
