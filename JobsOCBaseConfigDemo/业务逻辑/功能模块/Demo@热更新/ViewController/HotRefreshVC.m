//
//  HotRefreshVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "HotRefreshVC.h"

@interface HotRefreshVC ()
/// UI
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *subTitleLab;
Prop_strong()UILabel *statusLab;
Prop_strong()UIButton *hotRefreshBtn;
Prop_strong()UIProgressView *progressView;
Prop_strong()UIView *patchCardView;
/// Data
Prop_assign()CGFloat simulatedProgress;

@end

static NSString *const JobsHotRefreshProgressTimerID = @"com.jobs.demo.hotrefresh.progress";
static NSString *const JobsHotRefreshPatchID = @"com.jobs.demo.hotrefresh.payload";

@implementation HotRefreshVC
- (void)dealloc{
    [self restoreHotPatchIfNeeded];
    [self stopProgressTimer];
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
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
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(@"热更新演示".tr);
            data.byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(RGBA_COLOR(246, 248, 251, 1))
        .byNavBgCor(RGBA_COLOR(246, 248, 251, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(RGBA_COLOR(246, 248, 251, 1));
    self.makeNavByAlpha(1);
    [self buildDemoUI];
    [self resetDemoUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self resetDemoUI];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self restoreHotPatchIfNeeded];
    [self stopProgressTimer];
    [self resetDemoUI];
}
#pragma mark —— Action
-(void)startHotRefreshDemo{
    [self restoreHotPatchIfNeeded];
    [self stopProgressTimer];
    [self resetDemoUI];
    self.hotRefreshBtn.byEnabled(NO);
    self.simulatedProgress = 0;
    self.statusLab.byText(@"正在加载本地预置补丁...".tr);
    self.progressView
        .byProgress(0)
        .byHidden(NO);
    @jobs_weakify(self)
    [JobsTimerMgr.shared upsertTimerWithIdentifier:JobsHotRefreshProgressTimerID
                                         timerType:JobsTimerTypeNSTimer
                                            policy:JobsTimerBackgroundPolicyCancel
                                  startImmediately:YES
                                             build:^(JobsTimer * _Nullable timer) {
        timer.byTimerStyle(TimerStyle_clockwise)
            .byTimeInterval(0.03)
            .byTimeSecIntervalSinceDate(0)
            .byQueue(dispatch_get_main_queue());
    } handler:^{
        @jobs_strongify(self)
        [self handleProgressTimerTick];
    }];
}

-(void)handleProgressTimerTick{
    self.simulatedProgress += 0.025;
    self.progressView.byProgressAnimated(MIN(self.simulatedProgress, 1), YES);
    if (self.simulatedProgress >= 1) {
        [self stopProgressTimer];
        [self installLocalRuntimePatch];
        [self applyPatchPayload:self.hotRefreshPatchPayload];
    }
}
#pragma mark —— Runtime Patch
-(NSDictionary *)hotRefreshPatchPayload{
    return @{};
}

-(void)installLocalRuntimePatch{
    NSDictionary *localPatch = @{
        @"title": @"Runtime Patch 已生效",
        @"subTitle": @"这份数据原本可以来自服务端；Demo 中改为本地预置，点击后临时替换方法实现并刷新 UI。",
        @"status": @"补丁加载完成：当前页面 UI 已被本地补丁接管",
        @"buttonTitle": @"重新演示热更新",
        @"backgroundHex": @"#101820",
        @"cardHex": @"#FEE715",
        @"titleHex": @"#101820",
        @"subTitleHex": @"#243447",
        @"progressHex": @"#34C759"
    };
    [JobsOCPatchMgr.shared installPayloadPatch:[JobsOCPatchModel patchWithIdentifier:JobsHotRefreshPatchID
                                                                           targetCls:self.class
                                                                            selector:@selector(hotRefreshPatchPayload)
                                                                             payload:localPatch]];
}

-(void)restoreHotPatchIfNeeded{
    [JobsOCPatchMgr.shared rollbackPatchByIdentifier:JobsHotRefreshPatchID];
}

-(void)applyPatchPayload:(NSDictionary *)payload{
    if (![payload isKindOfClass:NSDictionary.class] || !payload.count) return;
    self.view.byBgColor([self colorByHexString:payload[@"backgroundHex"]
                                  defaultColor:RGBA_COLOR(246, 248, 251, 1)]);
    self.patchCardView.byBgColor([self colorByHexString:payload[@"cardHex"]
                                           defaultColor:JobsWhiteColor]);
    self.titleLab
        .byText(payload[@"title"] ? : @"")
        .byTextCor([self colorByHexString:payload[@"titleHex"]
                             defaultColor:HEXCOLOR(0x1E2A36)]);
    self.subTitleLab
        .byText(payload[@"subTitle"] ? : @"")
        .byTextCor([self colorByHexString:payload[@"subTitleHex"]
                             defaultColor:HEXCOLOR(0x5F6C7B)]);
    self.statusLab
        .byText(payload[@"status"] ? : @"")
        .byTextCor([self colorByHexString:payload[@"titleHex"]
                             defaultColor:HEXCOLOR(0x1E2A36)]);
    self.progressView.byProgressTintColor([self colorByHexString:payload[@"progressHex"]
                                                    defaultColor:HEXCOLOR(0x34C759)]);
    self.hotRefreshBtn
        .byTitle(payload[@"buttonTitle"] ? : @"")
        .byEnabled(YES);
}

-(void)resetDemoUI{
    self.view.byBgColor(RGBA_COLOR(246, 248, 251, 1));
    self.patchCardView.byBgColor(JobsWhiteColor);
    self.titleLab
        .byText(@"iOS 热更新 Demo".tr)
        .byTextCor(HEXCOLOR(0x1E2A36));
    self.subTitleLab
        .byText(@"点击按钮后模拟下载进度；进度结束后读取本地预置补丁数据，通过 Runtime 临时改变当前页面 UI。".tr)
        .byTextCor(HEXCOLOR(0x5F6C7B));
    self.statusLab
        .byText(@"等待开始".tr)
        .byTextCor(HEXCOLOR(0x7B8794));
    self.progressView
        .byProgress(0)
        .byProgressTintColor(HEXCOLOR(0x007AFF))
        .byHidden(YES);
    self.hotRefreshBtn
        .byTitle(@"开始热更新演示".tr)
        .byEnabled(YES);
}
#pragma mark —— UI
-(void)buildDemoUI{
    self.patchCardView.byVisible(1);
    self.titleLab.byVisible(1);
    self.subTitleLab.byVisible(1);
    self.statusLab.byVisible(1);
    self.progressView.byVisible(1);
    self.hotRefreshBtn.byVisible(1);
}

-(UIView *)patchCardView{
    if (!_patchCardView) {
        _patchCardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsWhiteColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(24));
                    make.left.equalTo(self.view).offset(JobsWidth(20));
                    make.right.equalTo(self.view).offset(JobsWidth(-20));
                });
        });
        _patchCardView.layer
            .byCornerRadius(JobsWidth(12))
            .byShadowColor(UIColor.blackColor.CGColor)
            .byShadowOpacity(0.08)
            .byShadowRadius(JobsWidth(12))
            .byShadowOffset(CGSizeMake(0, JobsWidth(6)));
    };return _patchCardView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"")
                .byFont(UIFontWeightMediumSize(24))
                .byTextCor(HEXCOLOR(0x1E2A36))
                .byNumberOfLines(0)
                .addOn(self.patchCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.patchCardView).offset(JobsWidth(24));
                    make.left.equalTo(self.patchCardView).offset(JobsWidth(20));
                    make.right.equalTo(self.patchCardView).offset(JobsWidth(-20));
                });
        });
    };return _titleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"")
                .byFont(UIFontWeightRegularSize(14))
                .byTextCor(HEXCOLOR(0x5F6C7B))
                .byNumberOfLines(0)
                .addOn(self.patchCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(12));
                    make.left.right.equalTo(self.titleLab);
                });
        });
    };return _subTitleLab;
}

-(UILabel *)statusLab{
    if (!_statusLab) {
        _statusLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"")
                .byFont(UIFontWeightRegularSize(13))
                .byTextCor(HEXCOLOR(0x7B8794))
                .byNumberOfLines(0)
                .addOn(self.patchCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.subTitleLab.mas_bottom).offset(JobsWidth(22));
                    make.left.right.equalTo(self.titleLab);
                });
        });
    };return _statusLab;
}

-(UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = jobsMakeProgressView(^(__kindof UIProgressView * _Nullable progressView) {
            progressView
                .byProgressViewStyle(UIProgressViewStyleDefault)
                .byProgress(0)
                .byProgressTintColor(HEXCOLOR(0x007AFF))
                .byTrackTintColor(RGBA_COLOR(210, 216, 224, 1))
                .addOn(self.patchCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.statusLab.mas_bottom).offset(JobsWidth(18));
                    make.left.right.equalTo(self.titleLab);
                    make.height.mas_equalTo(JobsWidth(4));
                });
        });
    };return _progressView;
}

-(UIButton *)hotRefreshBtn{
    if (!_hotRefreshBtn) {
        @jobs_weakify(self)
        _hotRefreshBtn = jobsMakeButton(^(__kindof UIButton * _Nullable btn) {
            btn
                .byTitle(@"")
                .byTitleFont(UIFontWeightMediumSize(15))
                .byTitleCor(JobsWhiteColor)
                .onClickBy(^(UIButton *x) {
                    @jobs_strongify(self)
                    [self startHotRefreshDemo];
                })
                .byBgColor(HEXCOLOR(0x1E2A36))
                .addOn(self.patchCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.progressView.mas_bottom).offset(JobsWidth(24));
                    make.left.right.equalTo(self.titleLab);
                    make.height.mas_equalTo(JobsWidth(44));
                    make.bottom.equalTo(self.patchCardView).offset(JobsWidth(-24));
                });
            btn.layer.byCornerRadius(JobsWidth(8));
        });
    };return _hotRefreshBtn;
}
#pragma mark —— Tools
-(void)stopProgressTimer{
    [JobsTimerMgr.shared stopAndRemove:JobsHotRefreshProgressTimerID];
}

-(UIColor *)colorByHexString:(NSString *)hexString
                defaultColor:(UIColor *)defaultColor{
    if (![hexString isKindOfClass:NSString.class] || !hexString.length) return defaultColor;
    NSString *cleanString = [[hexString stringByReplacingOccurrencesOfString:@"#"
                                                                  withString:@""] uppercaseString];
    if (cleanString.length != 6) return defaultColor;
    unsigned int value = 0;
    NSScanner *scanner = [NSScanner scannerWithString:cleanString];
    if (![scanner scanHexInt:&value]) return defaultColor;
    return RGBA_COLOR((value >> 16) & 0xFF,
                      (value >> 8) & 0xFF,
                      value & 0xFF,
                      1);
}

@end
