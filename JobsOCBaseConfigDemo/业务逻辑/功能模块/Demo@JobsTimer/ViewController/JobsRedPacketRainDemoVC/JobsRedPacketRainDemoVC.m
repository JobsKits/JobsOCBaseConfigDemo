//
//  JobsRedPacketRainDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsRedPacketRainDemoVC.h"

@interface JobsRedPacketRainDemoVC ()

Prop_assign()BOOL raining;
Prop_strong()JobsRedPacketRainView *rainView;
Prop_strong()UILabel *countLab;
Prop_strong()UIButton *toggleBtn;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsRedPacketRainDemoVC
@interface JobsRedPacketRainDemoVC (JobsPropertyDSLSetterAutogen_9098fdbafd)
-(void)setRaining:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsRedPacketRainDemoVC

@implementation JobsRedPacketRainDemoVC
-(void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    self.rainView.stopWithClear(YES);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsRedPacketRainDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"红包雨".jobsTr())
                    .byFont(UIFontWeightRegularSize(16))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsRedPacketRainDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.makeNavByAlpha(1);
        self.rainView.byVisible(YES);
        self.countLab.byVisible(YES);
        self.toggleBtn.byVisible(YES);
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsRedPacketRainDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.rainView.stopWithClear(YES);
        self.byRaining(NO);
        self.toggleBtn.jobsResetBtnTitle(@"开始红包雨".jobsTr())
            .jobsResetBtnBgCor(HEXCOLOR(0x17A05D));
    };
}
#pragma mark —— lazyLoad
-(JobsRedPacketRainView *)rainView{
    if (!_rainView) {
        @jobs_weakify(self)
        _rainView = JobsRedPacketRainView.rainViewWithConfig(jobsMakeRedPacketRainConfig(^(__kindof JobsRedPacketRainConfig * _Nullable config) {
            config
                .bySpawnInterval(0.2)
                .byMinFallDuration(5.5)
                .byMaxFallDuration(8.0)
                .byPacketSize(CGSizeMake(44, 54))
                .byMaxConcurrentCount(80)
                .bySpawnInsets(UIEdgeInsetsMake(0, 10, 0, 10))
                .byTapEnabled(YES);
        }));
        _rainView.onPacketTap(^(__kindof JobsRedPacketRainView *rainView, NSUInteger tappedCount) {
            @jobs_strongify(self)
            self.countLab.byText([NSString stringWithFormat:@"已抢到：%lu 个".jobsTr(),(unsigned long)tappedCount]);
        });
        _rainView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.edges.equalTo(self.view);
        });
    };return _rainView;
}

-(UILabel *)countLab{
    if (!_countLab) {
        @jobs_weakify(self)
        _countLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"已抢到：0 个".jobsTr())
                .byFont(UIFontWeightMediumSize(18))
                .byTextCor(JobsWhiteColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byBgColor(RGBA_COLOR(0, 0, 0, 0.42))
                .byCornerRadius(JobsWidth(8))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(12));
                    make.height.mas_equalTo(JobsWidth(36));
                    make.width.mas_greaterThanOrEqualTo(JobsWidth(180));
                });
        });
    };return _countLab;
}

-(UIButton *)toggleBtn{
    if (!_toggleBtn) {
        @jobs_weakify(self)
        _toggleBtn = UIButton.jobsInit()
            .jobsResetBtnBgCor(HEXCOLOR(0x17A05D))
            .jobsResetBtnTitle(@"开始红包雨".jobsTr())
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(16))
            .jobsResetBtnCornerRadiusValue(JobsWidth(8))
            .onClickBy(^(UIButton *sender) {
                @jobs_strongify(self)
                self.byRaining(!self.raining);
                if (self.raining) {
                    self.rainView.start();
                    sender.jobsResetBtnTitle(@"停止红包雨".jobsTr())
                        .jobsResetBtnBgCor(HEXCOLOR(0xD93B35));
                }else{
                    self.rainView.stopWithClear(NO);
                    sender.jobsResetBtnTitle(@"开始红包雨".jobsTr())
                        .jobsResetBtnBgCor(HEXCOLOR(0x17A05D));
                }
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.centerX.equalTo(self.view);
                make.bottom.equalTo(self.view).offset(-(JobsBottomSafeAreaHeight() + JobsWidth(32)));
                make.height.mas_equalTo(JobsWidth(44));
                make.width.mas_equalTo(JobsWidth(160));
            });
    };return _toggleBtn;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsRedPacketRainDemoVC
-(JobsRetJobsRedPacketRainDemoVCByBOOLBlock _Nonnull)byRaining{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setRaining:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsRedPacketRainDemoVC
@end
