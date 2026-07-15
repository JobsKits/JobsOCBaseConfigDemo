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

@implementation JobsRedPacketRainDemoVC
-(void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    [self.rainView stopWithClear:YES];
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"红包雨".tr)
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xF4F5F8));
    self.makeNavByAlpha(1);
    self.rainView.byVisible(YES);
    self.countLab.byVisible(YES);
    self.toggleBtn.byVisible(YES);
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.rainView stopWithClear:YES];
    self.raining = NO;
    self.toggleBtn.jobsResetBtnTitle(@"开始红包雨".tr)
        .jobsResetBtnBgCor(HEXCOLOR(0x17A05D));
}
#pragma mark —— lazyLoad
-(JobsRedPacketRainView *)rainView{
    if (!_rainView) {
        @jobs_weakify(self)
        _rainView = [JobsRedPacketRainView rainViewWithConfig:jobsMakeRedPacketRainConfig(^(__kindof JobsRedPacketRainConfig * _Nullable config) {
            config.spawnInterval = 0.2;
            config.minFallDuration = 5.5;
            config.maxFallDuration = 8.0;
            config.packetSize = CGSizeMake(44, 54);
            config.maxConcurrentCount = 80;
            config.spawnInsets = UIEdgeInsetsMake(0, 10, 0, 10);
            config.tapEnabled = YES;
        })];
        [_rainView onPacketTap:^(__kindof JobsRedPacketRainView *rainView, NSUInteger tappedCount) {
            @jobs_strongify(self)
            self.countLab.byText([NSString stringWithFormat:@"已抢到：%lu 个".tr,(unsigned long)tappedCount]);
        }];
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
            label.byText(@"已抢到：0 个".tr)
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
            .jobsResetBtnTitle(@"开始红包雨".tr)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(16))
            .jobsResetBtnCornerRadiusValue(JobsWidth(8))
            .onClickBy(^(UIButton *sender) {
                @jobs_strongify(self)
                self.raining = !self.raining;
                if (self.raining) {
                    [self.rainView start];
                    sender.jobsResetBtnTitle(@"停止红包雨".tr)
                        .jobsResetBtnBgCor(HEXCOLOR(0xD93B35));
                }else{
                    [self.rainView stopWithClear:NO];
                    sender.jobsResetBtnTitle(@"开始红包雨".tr)
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

@end
