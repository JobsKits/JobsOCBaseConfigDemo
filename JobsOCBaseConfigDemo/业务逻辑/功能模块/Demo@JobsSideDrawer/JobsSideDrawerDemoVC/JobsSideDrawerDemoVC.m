//
//  JobsSideDrawerDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月12日，星期日.
//

#import "JobsSideDrawerDemoVC.h"

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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsSideDrawerDemoVC
@interface JobsSideDrawerDemoVC (JobsPropertyDSLSetterAutogen_89065bbf7b)
-(void)setDrawerContentView:(UIView * _Nullable)data;
-(void)setDrawerHostView:(UIView * _Nullable)data;
-(void)setGk_navTitle:(NSString * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsSideDrawerDemoVC

@implementation JobsSideDrawerDemoVC
-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSideDrawerDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.byTitle(@"侧滑方向/比例/跟随模式".jobsTr());
        self.byGk_navTitle(@"侧滑方向/比例/跟随模式".jobsTr());
        self.makeNavByAlpha(1);
        self.view.byBgColor(JobsSystemBackgroundColor);
        [self.view addSubview:self.optionStackView];
    };
}
-(jobsByVoidBlock _Nonnull)preview{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byDrawerHostView(UIApplication.sharedApplication.keyWindow);
        self.byDrawerContentView(self.drawerHostView.subviews.lastObject);
        if (!self.drawerHostView || !self.drawerContentView) return;
        JobsSideDrawerDirection values[] = {JobsSideDrawerDirectionTop, JobsSideDrawerDirectionBottom, JobsSideDrawerDirectionLeft, JobsSideDrawerDirectionRight};
        self.drawerConfig.byDirection(values[self.direction.selectedSegmentIndex]);
        self.drawerConfig.byContentMode(self.mode.selectedSegmentIndex == 0 ? JobsSideDrawerContentModeFollowing : JobsSideDrawerContentModeFixed);
        self.drawerConfig.byPresentedRatio(self.ratio.value);
        self.drawer = [[JobsSideDrawer alloc] initWithHostView:self.drawerHostView
                                                   drawerView:self.drawerMenuView
                                                  contentView:self.drawerContentView
                                                configuration:self.drawerConfig];
        self.drawer.openAnimated(YES);
    };
}

#pragma mark —— LazyLoad
-(UISegmentedControl *)direction{
    if (!_direction) {
        _direction = [[UISegmentedControl alloc] initWithItems:@[@"上".jobsTr(), @"下".jobsTr(), @"左".jobsTr(), @"右".jobsTr()]];
        _direction.bySelectedSegmentIndex(2);
    };return _direction;
}

-(UISegmentedControl *)mode{
    if (!_mode) {
        _mode = [[UISegmentedControl alloc] initWithItems:@[@"跟随".jobsTr(), @"固定".jobsTr()]];
        _mode.bySelectedSegmentIndex(0);
    };return _mode;
}

-(UISlider *)ratio{
    if (!_ratio) {
        _ratio = jobsMakeSlider(^(UISlider *object){});
        _ratio.byMinimumValue(0.2);
        _ratio.byMaximumValue(0.9);
        _ratio.byValue(0.5);
    };return _ratio;
}

-(UIButton *)previewBtn{
    if (!_previewBtn) {
        @jobs_weakify(self)
        _previewBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"立即预览".jobsTr())
                .jobsResetBtnSubTitle(@"支持 UIViewController / UIView".jobsTr())
                .jobsResetBtnTitleCor(JobsWhiteColor)
                .jobsResetBtnSubTitleCor(RGBA_COLOR(255, 255, 255, 0.78))
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(JobsWidth(17)))
                .jobsResetBtnSubTitleFont(UIFontWeightRegularSize(JobsWidth(13)))
                .jobsResetTitlePadding(JobsWidth(4))
                .jobsResetBtnBgCor(HEXCOLOR(0x1677FF))
                .jobsResetBtnCornerRadiusValue(JobsWidth(12))
                .onClickBy(^(UIButton *x){
                    @jobs_strongify(self)
                    self.preview();
                })
                .byAdd(^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(JobsWidth(64));
                });
        });
    };return _previewBtn;
}

-(UIStackView *)optionStackView{
    if (!_optionStackView) {
        _optionStackView = [[UIStackView alloc] initWithArrangedSubviews:@[self.direction,self.mode,self.ratio,self.previewBtn]]
            .byAxis(UILayoutConstraintAxisVertical)
            .bySpacing(24)
            .byFrame(CGRectMake(24, 160, CGRectGetWidth(self.view.bounds) - 48, 220))
            .byAutoresizingMask(UIViewAutoresizingFlexibleWidth);
    };return _optionStackView;
}

-(UIView *)drawerMenuView{
    if (!_drawerMenuView) {
        _drawerMenuView = jobsMakeView(^(UIView *object){})
            .byBgColor(UIColor.systemBlueColor);
    };return _drawerMenuView;
}

-(JobsSideDrawerConfiguration *)drawerConfig{
    if (!_drawerConfig) {
        _drawerConfig = JobsSideDrawerConfiguration.new;
    };return _drawerConfig;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsSideDrawerDemoVC
-(JobsRetJobsSideDrawerDemoVCByUIViewBlock _Nonnull)byDrawerContentView{
    @jobs_weakify(self)
    return ^__kindof JobsSideDrawerDemoVC * _Nullable(UIView * _Nullable data){
        @jobs_strongify(self)
        [self setDrawerContentView:data];
        return self;
    };
}

-(JobsRetJobsSideDrawerDemoVCByUIViewBlock _Nonnull)byDrawerHostView{
    @jobs_weakify(self)
    return ^__kindof JobsSideDrawerDemoVC * _Nullable(UIView * _Nullable data){
        @jobs_strongify(self)
        [self setDrawerHostView:data];
        return self;
    };
}
-(JobsRetJobsSideDrawerDemoVCByNSStringBlock _Nonnull)byGk_navTitle{
    @jobs_weakify(self)
    return ^__kindof JobsSideDrawerDemoVC * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setGk_navTitle:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsSideDrawerDemoVC
@end
