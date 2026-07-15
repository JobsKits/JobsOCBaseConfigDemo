//
//  CheckMemFreeVC.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CheckMemFreeVC.h"
#import "NSString+Toast.h"

@interface CheckMemFreeVC ()

@end

@implementation CheckMemFreeVC
-(void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    @"检查者出栈".tr.toast();
}

-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    @"检查者进栈".tr.toast();
    self.view.byBgColor(JobsRandomColor);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"%@",JobsLocalFunc);
}

@end
