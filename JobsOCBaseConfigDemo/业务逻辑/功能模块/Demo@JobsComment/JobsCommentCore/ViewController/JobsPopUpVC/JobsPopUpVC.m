//
//  JobsPopUpVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsPopUpVC.h"

@interface JobsPopUpVC ()

-(void)jobs_updatePreferredContentSize;

@end

@implementation JobsPopUpVC
@synthesize popUpHeight = _popUpHeight;

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
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.isHiddenNavigationBar = YES;//禁用系统的导航栏
    [self jobs_updatePreferredContentSize];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UITabBar *tabBar = self.getTabBar;
    if (tabBar) tabBar.byHidden(YES);
    [self jobs_updatePreferredContentSize];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    UITabBar *tabBar = self.getTabBar;
    if (tabBar) tabBar.byHidden(NO);
}
#pragma mark —— lazyLoad
-(void)setPopUpHeight:(CGFloat)popUpHeight{
    _popUpHeight = popUpHeight;
    [self jobs_updatePreferredContentSize];
}

-(CGFloat)popUpHeight{
    if (_popUpHeight <= 0) {
        _popUpHeight = JobsMainScreen_HEIGHT() / 2;//默认弹出高度
    };return _popUpHeight;
}
#pragma mark —— Private
-(void)jobs_updatePreferredContentSize{
    self.preferredContentSize = CGSizeMake(JobsRealWidth(), self.popUpHeight);
}

@end
