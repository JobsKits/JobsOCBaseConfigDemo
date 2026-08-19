//
//  JobsCountdownLayerDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsCountdownLayerDemoVC.h"

@interface JobsCountdownLayerDemoVC ()

Prop_strong()UIView *demoButtonContainer;
Prop_strong()UIButton *demoButton;
Prop_strong()UILabel *stateLab;
Prop_strong()UILabel *detailLab;
Prop_strong()JobsTimer *countdownTimer;
Prop_assign()CGFloat totalSeconds;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsCountdownLayerDemoVC
@interface JobsCountdownLayerDemoVC (JobsPropertyDSLSetterAutogen_77dae88a11)
-(void)setTotalSeconds:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsCountdownLayerDemoVC

@implementation JobsCountdownLayerDemoVC

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
    self.stopCountdownAnimated(NO);
}

- (void)loadView {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCountdownLayerDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
            if (self.viewModel.pushOrPresent != ComingStyle_Unknown) {
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"导火索倒计时".jobsTr())
                    .byFont(UIFontWeightRegularSize(16))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(HEXCOLOR(0xF4F5F8))
            .byNavBgCor(HEXCOLOR(0xF4F5F8));
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCountdownLayerDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.byTotalSeconds(6);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.makeNavByAlpha(1);
        self.setupSubviews();
    };
}

- (void)viewDidLayoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCountdownLayerDemoVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        CGFloat width = CGRectGetWidth(self.view.bounds);
        CGFloat top = CGRectGetMaxY(self.gk_navigationBar.frame) + JobsWidth(44);
        self.demoButtonContainer.byFrame(CGRectMake((width - JobsWidth(188)) / 2.0,
                                                    top,
                                                    JobsWidth(188),
                                                    JobsWidth(188)));
        self.demoButton.byFrame(self.demoButtonContainer.bounds);
        self.demoButton
            .jobsResetBtnCornerRadiusValue(CGRectGetWidth(self.demoButton.bounds) / 2.0)
            .byClipsToBounds(YES);
        self.demoButtonContainer.byLayer(^(__kindof CALayer * _Nullable layer) {
            layer.byShadowPath(UIBezierPath.byBezierPathWithOvalInRect(self.demoButtonContainer.bounds).CGPath);
        });
        self.stateLab.byFrame(CGRectMake(JobsWidth(24),
                                         CGRectGetMaxY(self.demoButtonContainer.frame) + JobsWidth(28),
                                         width - JobsWidth(48),
                                         JobsWidth(44)));
        self.detailLab.byFrame(CGRectMake(JobsWidth(24),
                                          CGRectGetMaxY(self.stateLab.frame) + JobsWidth(18),
                                          width - JobsWidth(48),
                                          JobsWidth(112)));
        self.demoButtonContainer.byFuseOuterRingLayoutIfNeeded();
    };
}

- (void)viewWillDisappear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCountdownLayerDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.stopCountdownAnimated(NO);
    };
}

#pragma mark —— UI

- (jobsByVoidBlock _Nonnull)setupSubviews {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.demoButtonContainer.addOn(self.view);
        self.demoButton.addOn(self.demoButtonContainer);
        self.stateLab.addOn(self.view);
        self.detailLab.addOn(self.view);
    };
}

- (jobsByVoidBlock _Nonnull)startOrStopCountdown {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.countdownTimer.isRunning) {
            self.stopCountdownAnimated(YES);
        } else {
            self.startCountdown();
        }
    };
}

- (jobsByVoidBlock _Nonnull)startCountdown {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.stopCountdownAnimated(NO);
        self.updateCountdownWithRemaining(self.totalSeconds);
        JobsFuseOuterRingConfig *config = JobsFuseOuterRingConfig.config()
            .byLineWidth(JobsWidth(5))
            .byStrokeColor(HEXCOLOR(0xFF5A5F))
            .byTrackColor([HEXCOLOR(0x111827) colorWithAlphaComponent:0.12])
            .byFillColor(UIColor.clearColor)
            .byFromOpacity(0.95)
            .byToOpacity(1.0)
            .byGrowDuration(self.totalSeconds)
            .byTimerInterval(1.0 / 60.0)
            .byRepeatsWhileHolding(NO)
            .byRetreatDuration(0.18)
            .byFadeOutDuration(0.12)
            .byInset(JobsWidth(2))
            .byStartsFromTop(YES);
        self.demoButtonContainer.byFuseOuterRingStart(config);
        [self.demoButtonContainer byFusePressScaleStart:1.05 duration:0.16];
        @jobs_weakify(self)
        self.countdownTimer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            @jobs_strongify(self)
            timer.byTimerType(JobsTimerTypeDisplayLink)
                 .byTimerStyle(TimerStyle_anticlockwise)
                 .byTimeInterval(1.0 / 60.0)
                 .byStartTime(self.totalSeconds)
                 .byTime(self.totalSeconds)
                 .byQueue(dispatch_get_main_queue())
                 .byTimerState(JobsTimerStateIdle)
                 .byOnTick(^(CGFloat time) {
                     @jobs_strongify(self)
                     self.updateCountdownWithRemaining(time);
                 })
                 .byOnFinish(^(JobsTimer * _Nullable timer) {
                     @jobs_strongify(self)
                     self.finishCountdown();
                 });
        });
        self.countdownTimer.start();
    };
}

-(jobsByBOOLBlock _Nonnull)stopCountdownAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        if (_countdownTimer) {
            _countdownTimer.jobsStop();
            _countdownTimer = nil;
        }
        self.demoButtonContainer.byFuseOuterRingStop(animated);
        [self.demoButtonContainer byFusePressScaleStop:animated duration:0.18 damping:0.72 velocity:0.4];
        self.demoButton.jobsResetBtnTitle(@"点我开始".jobsTr());
        self.stateLab.byText(@"点击按钮，任意 UIView.layer 都可以挂一圈导火索倒计时。".jobsTr());
    };
}

- (jobsByVoidBlock _Nonnull)finishCountdown {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (_countdownTimer) _countdownTimer.jobsStop();
        _countdownTimer = nil;
        self.demoButtonContainer.byFuseOuterRingStop(YES);
        [self.demoButtonContainer byFusePressScaleStop:YES duration:0.18 damping:0.72 velocity:0.4];
        self.demoButtonContainer.byFuseTapScale();
        self.demoButton.jobsResetBtnTitle(@"完成".jobsTr());
        self.stateLab.byText(@"倒计时完成，外圈导火索自动收口。".jobsTr());
    };
}

-(jobsByCGFloatBlock _Nonnull)updateCountdownWithRemaining{
    @jobs_weakify(self)
    return ^(CGFloat remaining){
        @jobs_strongify(self)
        if (!self) return;
        CGFloat safeRemaining = MAX(remaining, 0);
        self.demoButton.jobsResetBtnTitle([NSString stringWithFormat:@"%.1fs",safeRemaining]);
        self.stateLab.byText([NSString stringWithFormat:@"剩余 %.1f 秒，Layer 外圈按 DisplayLink 进度增长。".jobsTr(),safeRemaining]);
    };
}

#pragma mark —— Lazy

- (UIView *)demoButtonContainer {
    if (!_demoButtonContainer) {
        _demoButtonContainer = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.clearColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byShadowColor(HEXCOLOR(0x111827).CGColor)
                        .byShadowOpacity(0.18)
                        .byShadowRadius(JobsWidth(18))
                        .byShadowOffset(CGSizeMake(0, JobsWidth(10)))
                        .byMasksToBounds(NO);
                });
        });
    };return _demoButtonContainer;
}

- (UIButton *)demoButton {
    if (!_demoButton) {
        @jobs_weakify(self)
        _demoButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"点我开始".jobsTr())
                .jobsResetBtnTitleCor(JobsWhiteColor)
                .jobsResetBtnTitleFont(UIFontWeightBoldSize(26))
                .jobsResetBtnBgCor(HEXCOLOR(0x111827))
                .jobsResetBtnCornerRadiusValue(JobsWidth(94))
                .onClickBy(^(__unused UIButton *button) {
                    weak_self.startOrStopCountdown();
                })
                .byClipsToBounds(YES);
        });
    };return _demoButton;
}

- (UILabel *)stateLab {
    if (!_stateLab) {
        _stateLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"点击按钮，任意 UIView.layer 都可以挂一圈导火索倒计时。".jobsTr())
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightRegularSize(15))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2);
        });
    };return _stateLab;
}

- (UILabel *)detailLab {
    if (!_detailLab) {
        _detailLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"这个 Demo 复用 OC Pod JobsFuseAnimation：UIView 分类只负责 Layer 外圈动画，页面里的 JobsTimer 负责倒计时文案和结束态。按钮只是示例，换成任意 UIView 也可以。".jobsTr())
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(14))
                .byTextAlignment(NSTextAlignmentLeft)
                .byNumberOfLines(0);
        });
    };return _detailLab;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsCountdownLayerDemoVC
-(JobsRetJobsCountdownLayerDemoVCByCGFloatBlock _Nonnull)byTotalSeconds{
    @jobs_weakify(self)
    return ^__kindof JobsCountdownLayerDemoVC * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setTotalSeconds:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsCountdownLayerDemoVC
@end
