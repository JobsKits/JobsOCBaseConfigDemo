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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN HotRefreshVC
@interface HotRefreshVC (JobsPropertyDSLSetterAutogen_c41b970d3c)
-(void)setSimulatedProgress:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END HotRefreshVC

@implementation HotRefreshVC
- (void)dealloc{
    self.restoreHotPatchIfNeeded();
    self.stopProgressTimer();
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(HotRefreshVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                data
                    .byTextCor(JobsLabelColor)
                    .byText(@"热更新演示".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(JobsSystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor)
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(HotRefreshVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.buildDemoUI();
        self.resetDemoUI();
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(HotRefreshVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.resetDemoUI();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(HotRefreshVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.restoreHotPatchIfNeeded();
        self.stopProgressTimer();
        self.resetDemoUI();
    };
}
#pragma mark —— Action
-(jobsByVoidBlock _Nonnull)startHotRefreshDemo{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.restoreHotPatchIfNeeded();
        self.stopProgressTimer();
        self.resetDemoUI();
        if (self.hotRefreshBtn) self.hotRefreshBtn.byEnabled(NO);
        self.bySimulatedProgress(0);
        self.statusLab.byText(@"正在加载本地预置补丁...".jobsTr());
        self.progressView
            .byProgress(0)
            .byHidden(NO);
        @jobs_weakify(self)
        [JobsTimerMgr.shared() upsertTimerWithIdentifier:JobsHotRefreshProgressTimerID
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
            self.handleProgressTimerTick();
        }];
    };
}

-(jobsByVoidBlock _Nonnull)handleProgressTimerTick{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.simulatedProgress += 0.025;
        self.progressView.byProgressAnimated(MIN(self.simulatedProgress, 1), YES);
        if (self.simulatedProgress >= 1) {
            self.stopProgressTimer();
            self.installLocalRuntimePatch();
            self.applyPatchPayload(self.hotRefreshPatchPayload);
        }
    };
}
#pragma mark —— Runtime Patch
-(NSDictionary *)hotRefreshPatchPayload{
    JobsRetDicByVoidBlock action = ((JobsRetDicByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(HotRefreshVC.class, @selector(jobsHotRefreshPatchPayload)))(self, @selector(jobsHotRefreshPatchPayload));
    return action ? action() : nil;
}

-(JobsRetDicByVoidBlock _Nonnull)jobsHotRefreshPatchPayload{
    @jobs_weakify(self)
    return ^NSDictionary *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @{};
    };
}

-(jobsByVoidBlock _Nonnull)installLocalRuntimePatch{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSDictionary *localPatch = @{
            @"title": @"Runtime Patch 已生效",
            @"subTitle": @"这份数据原本可以来自服务端；Demo 中改为本地预置，点击后临时替换方法实现并刷新 UI。",
            @"status": @"补丁加载完成：当前页面 UI 已被本地补丁接管",
            @"buttonTitle": @"重新演示热更新",
            @"cardHex": @"#FEE715",
            @"titleHex": @"#101820",
            @"subTitleHex": @"#243447",
            @"progressHex": @"#34C759"
        };
        (JobsOCPatchMgr.shared()).installPayloadPatch([JobsOCPatchModel patchWithIdentifier:JobsHotRefreshPatchID
                                                                               targetCls:self.class
                                                                                selector:@selector(hotRefreshPatchPayload)
                                                                                 payload:localPatch]);
    };
}

-(jobsByVoidBlock _Nonnull)restoreHotPatchIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsOCPatchMgr.shared().rollbackPatchByIdentifier(JobsHotRefreshPatchID);
    };
}

-(jobsByDicBlock _Nonnull)applyPatchPayload{
    @jobs_weakify(self)
    return ^(NSDictionary * payload){
        @jobs_strongify(self)
        if (!self) return;
        if (![payload isKindOfClass:NSDictionary.class] || !payload.count) return;
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.patchCardView.byBgColor([self colorByHexString:payload[@"cardHex"]
                                               defaultColor:JobsSecondarySystemBackgroundColor]);
        self.titleLab
            .byText(payload[@"title"] ? : @"")
            .byTextCor([self colorByHexString:payload[@"titleHex"]
                                 defaultColor:JobsLabelColor]);
        self.subTitleLab
            .byText(payload[@"subTitle"] ? : @"")
            .byTextCor([self colorByHexString:payload[@"subTitleHex"]
                                 defaultColor:JobsSecondaryLabelColor]);
        self.statusLab
            .byText(payload[@"status"] ? : @"")
            .byTextCor([self colorByHexString:payload[@"titleHex"]
                                 defaultColor:JobsLabelColor]);
        self.progressView.byProgressTintColor([self colorByHexString:payload[@"progressHex"]
                                                        defaultColor:HEXCOLOR(0x34C759)]);
        self.hotRefreshBtn
            .byTitle(payload[@"buttonTitle"] ? : @"")
            .byEnabled(YES);
    };
}

-(jobsByVoidBlock _Nonnull)resetDemoUI{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.patchCardView.byBgColor(JobsSecondarySystemBackgroundColor);
        self.titleLab
            .byText(@"iOS 热更新 Demo".jobsTr())
            .byTextCor(JobsLabelColor);
        self.subTitleLab
            .byText(@"点击按钮后模拟下载进度；进度结束后读取本地预置补丁数据，通过 Runtime 临时改变当前页面 UI。".jobsTr())
            .byTextCor(JobsSecondaryLabelColor);
        self.statusLab
            .byText(@"等待开始".jobsTr())
            .byTextCor(JobsTertiaryLabelColor);
        self.progressView
            .byProgress(0)
            .byProgressTintColor(HEXCOLOR(0x007AFF))
            .byHidden(YES);
        self.hotRefreshBtn
            .byTitle(@"开始热更新演示".jobsTr())
            .byEnabled(YES);
    };
}
#pragma mark —— UI
-(jobsByVoidBlock _Nonnull)buildDemoUI{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.patchCardView.byVisible(1);
        self.titleLab.byVisible(1);
        self.subTitleLab.byVisible(1);
        self.statusLab.byVisible(1);
        self.progressView.byVisible(1);
        self.hotRefreshBtn.byVisible(1);
    };
}

-(UIView *)patchCardView{
    if (!_patchCardView) {
        _patchCardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsSecondarySystemBackgroundColor)
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
                .byTextCor(JobsLabelColor)
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
                .byTextCor(JobsSecondaryLabelColor)
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
                .byTextCor(JobsSecondaryLabelColor)
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
                .jobsResetBtnTitle(@"")
                .jobsResetBtnTitleFont(UIFontWeightMediumSize(15))
                .jobsResetBtnTitleCor(JobsSystemBackgroundColor)
                .jobsResetBtnBgCor(JobsLabelColor)
                .jobsResetBtnCornerRadiusValue(JobsWidth(8))
                .onClickBy(^(UIButton *x) {
                    @jobs_strongify(self)
                    self.startHotRefreshDemo();
                })
                .addOn(self.patchCardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.progressView.mas_bottom).offset(JobsWidth(24));
                    make.left.right.equalTo(self.titleLab);
                    make.height.mas_equalTo(JobsWidth(44));
                    make.bottom.equalTo(self.patchCardView).offset(JobsWidth(-24));
                });
        });
    };return _hotRefreshBtn;
}
#pragma mark —— Tools
-(jobsByVoidBlock _Nonnull)stopProgressTimer{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsTimerMgr.shared().stopAndRemove(JobsHotRefreshProgressTimerID);
    };
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN HotRefreshVC
-(JobsRetHotRefreshVCByCGFloatBlock _Nonnull)bySimulatedProgress{
    @jobs_weakify(self)
    return ^__kindof HotRefreshVC * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setSimulatedProgress:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END HotRefreshVC
@end
