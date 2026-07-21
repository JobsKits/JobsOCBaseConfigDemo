//
//  JobsSideDrawerDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月12日，星期日.
//

#import "JobsSideDrawerDemoVC.h"
#import <JobsViewPush/JobsViewPush.h>
#import "JobsLanMgr.h"

@interface JobsSideDrawerDemoVC ()
@property(nonatomic,strong)UISegmentedControl *direction;
@property(nonatomic,strong)UISegmentedControl *mode;
@property(nonatomic,strong)UISlider *ratio;
@property(nonatomic,strong)JobsSideDrawer *drawer;

@end

@implementation JobsSideDrawerDemoVC
-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"侧滑抽屉".tr;
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    self.direction = [[UISegmentedControl alloc] initWithItems:@[@"上".tr, @"下".tr, @"左".tr, @"右".tr]];
    self.direction.selectedSegmentIndex = 2;
    self.mode = [[UISegmentedControl alloc] initWithItems:@[@"跟随".tr, @"固定".tr]];
    self.mode.selectedSegmentIndex = 0;
    self.ratio = UISlider.new;
    self.ratio.minimumValue = 0.2;
    self.ratio.maximumValue = 0.9;
    self.ratio.value = 0.5;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"立即预览（支持 UIViewController / UIView）".tr forState:UIControlStateNormal];
    [button addTarget:self action:@selector(preview) forControlEvents:UIControlEventTouchUpInside];
    UIStackView *stack = [[UIStackView alloc] initWithArrangedSubviews:@[self.direction, self.mode, self.ratio, button]];
    stack.axis = UILayoutConstraintAxisVertical;
    stack.spacing = 24;
    stack.frame = CGRectMake(24, 160, CGRectGetWidth(self.view.bounds) - 48, 220);
    stack.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:stack];
}
-(void)preview{
    UIView *host = UIApplication.sharedApplication.keyWindow;
    UIView *content = host.subviews.lastObject;
    if (!host || !content) return;
    UIView *menu = UIView.new;
    menu.backgroundColor = UIColor.systemBlueColor;
    JobsSideDrawerConfiguration *config = JobsSideDrawerConfiguration.new;
    JobsSideDrawerDirection values[] = {JobsSideDrawerDirectionTop, JobsSideDrawerDirectionBottom, JobsSideDrawerDirectionLeft, JobsSideDrawerDirectionRight};
    config.direction = values[self.direction.selectedSegmentIndex];
    config.contentMode = self.mode.selectedSegmentIndex == 0 ? JobsSideDrawerContentModeFollowing : JobsSideDrawerContentModeFixed;
    config.presentedRatio = self.ratio.value;
    self.drawer = [[JobsSideDrawer alloc] initWithHostView:host drawerView:menu contentView:content configuration:config];
    [self.drawer openAnimated:YES];
}

@end
