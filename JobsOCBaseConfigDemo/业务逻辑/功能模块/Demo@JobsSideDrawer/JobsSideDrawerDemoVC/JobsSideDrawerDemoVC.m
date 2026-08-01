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

Prop_strong()UISegmentedControl *direction;
Prop_strong()UISegmentedControl *mode;
Prop_strong()UISlider *ratio;
Prop_strong()UIButton *previewBtn;
Prop_strong()UIStackView *optionStackView;
Prop_weak()UIView *drawerHostView;
Prop_weak()UIView *drawerContentView;
Prop_strong()UIView *drawerMenuView;
Prop_strong()JobsSideDrawerConfiguration *drawerConfig;
Prop_strong()JobsSideDrawer *drawer;

@end

@implementation JobsSideDrawerDemoVC
-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"侧滑方向/比例/跟随模式".tr;
    self.gk_navTitle = @"侧滑方向/比例/跟随模式".tr;
    self.makeNavByAlpha(1);
    self.view.byBgColor(JobsSystemBackgroundColor);
    [self.view addSubview:self.optionStackView];
}
-(void)preview{
    self.drawerHostView = UIApplication.sharedApplication.keyWindow;
    self.drawerContentView = self.drawerHostView.subviews.lastObject;
    if (!self.drawerHostView || !self.drawerContentView) return;
    JobsSideDrawerDirection values[] = {JobsSideDrawerDirectionTop, JobsSideDrawerDirectionBottom, JobsSideDrawerDirectionLeft, JobsSideDrawerDirectionRight};
    self.drawerConfig.direction = values[self.direction.selectedSegmentIndex];
    self.drawerConfig.contentMode = self.mode.selectedSegmentIndex == 0 ? JobsSideDrawerContentModeFollowing : JobsSideDrawerContentModeFixed;
    self.drawerConfig.presentedRatio = self.ratio.value;
    self.drawer = [[JobsSideDrawer alloc] initWithHostView:self.drawerHostView
                                               drawerView:self.drawerMenuView
                                              contentView:self.drawerContentView
                                            configuration:self.drawerConfig];
    [self.drawer openAnimated:YES];
}

#pragma mark —— LazyLoad
-(UISegmentedControl *)direction{
    if (!_direction) {
        _direction = [[UISegmentedControl alloc] initWithItems:@[@"上".tr, @"下".tr, @"左".tr, @"右".tr]];
        _direction.selectedSegmentIndex = 2;
    };return _direction;
}

-(UISegmentedControl *)mode{
    if (!_mode) {
        _mode = [[UISegmentedControl alloc] initWithItems:@[@"跟随".tr, @"固定".tr]];
        _mode.selectedSegmentIndex = 0;
    };return _mode;
}

-(UISlider *)ratio{
    if (!_ratio) {
        _ratio = UISlider.new;
        _ratio.minimumValue = 0.2;
        _ratio.maximumValue = 0.9;
        _ratio.value = 0.5;
    };return _ratio;
}

-(UIButton *)previewBtn{
    if (!_previewBtn) {
        @jobs_weakify(self)
        _previewBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"立即预览".tr)
                .jobsResetBtnSubTitle(@"支持 UIViewController / UIView".tr)
                .jobsResetBtnTitleCor(JobsWhiteColor)
                .jobsResetBtnSubTitleCor(RGBA_COLOR(255, 255, 255, 0.78))
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(JobsWidth(17)))
                .jobsResetBtnSubTitleFont(UIFontWeightRegularSize(JobsWidth(13)))
                .jobsResetTitlePadding(JobsWidth(4))
                .jobsResetBtnBgCor(HEXCOLOR(0x1677FF))
                .jobsResetBtnCornerRadiusValue(JobsWidth(12))
                .onClickBy(^(UIButton *x){
                    @jobs_strongify(self)
                    [self preview];
                })
                .byAdd(^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(JobsWidth(64));
                });
        });
    };return _previewBtn;
}

-(UIStackView *)optionStackView{
    if (!_optionStackView) {
        _optionStackView = [[UIStackView alloc] initWithArrangedSubviews:@[self.direction,self.mode,self.ratio,self.previewBtn]];
        _optionStackView.axis = UILayoutConstraintAxisVertical;
        _optionStackView.spacing = 24;
        _optionStackView.frame = CGRectMake(24, 160, CGRectGetWidth(self.view.bounds) - 48, 220);
        _optionStackView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    };return _optionStackView;
}

-(UIView *)drawerMenuView{
    if (!_drawerMenuView) {
        _drawerMenuView = UIView.new;
        _drawerMenuView.backgroundColor = UIColor.systemBlueColor;
    };return _drawerMenuView;
}

-(JobsSideDrawerConfiguration *)drawerConfig{
    if (!_drawerConfig) {
        _drawerConfig = JobsSideDrawerConfiguration.new;
    };return _drawerConfig;
}

@end
