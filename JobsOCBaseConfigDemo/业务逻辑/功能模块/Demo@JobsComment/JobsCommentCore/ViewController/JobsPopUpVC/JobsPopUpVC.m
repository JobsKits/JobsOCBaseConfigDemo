//
//  JobsPopUpVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsPopUpVC.h"

@interface JobsPopUpVC ()

@end

@implementation JobsPopUpVC

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}
#pragma mark —— Lifecycle
-(instancetype)init{
    if (self = [super init]) {
        
    };return self;
}

-(void)loadView{
    [super loadView];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(JobsRedColor);

    self.isHiddenNavigationBar = YES;//禁用系统的导航栏
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UITabBar *tabBar = self.getTabBar;
    if (tabBar) tabBar.byHidden(YES);

    self.view.mj_y = self.popUpHeight;// 只能用present方式退出界面，否则无效
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    UITabBar *tabBar = self.getTabBar;
    if (tabBar) tabBar.byHidden(NO);

}
#pragma mark —— lazyLoad
-(CGFloat)popUpHeight{
    if (_popUpHeight == 0) {
        _popUpHeight = 200;//默认弹出高度300
    };return _popUpHeight;
}

@end
