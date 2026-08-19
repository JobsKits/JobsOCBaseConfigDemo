//
//  JobsSysProgressDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsSysProgressDemoVC.h"

typedef NS_ENUM(NSUInteger, JobsSysProgressDemoMode) {
    JobsSysProgressDemoModeCountUp,
    JobsSysProgressDemoModeCountDown
};

@interface JobsSysProgressDemoVC ()

Prop_strong()UILabel *timeLab;
Prop_strong()UIProgressView *progressView;
Prop_strong()UISegmentedControl *durationSegment;
Prop_strong()UIButton *modeButton;
Prop_strong()UIButton *startButton;
Prop_strong()UIButton *cancelButton;
Prop_strong()UILabel *tipsLab;
Prop_strong()JobsTimer *countdownTimer;
Prop_assign()CGFloat totalSeconds;
Prop_assign()JobsSysProgressDemoMode progressMode;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsSysProgressDemoVC
@interface JobsSysProgressDemoVC (JobsPropertyDSLSetterAutogen_69247eeaf9)
-(void)setProgressMode:(JobsSysProgressDemoMode)data;
-(void)setTotalSeconds:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsSysProgressDemoVC

@implementation JobsSysProgressDemoVC
- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
    self.stopTimerResetUI(NO);
}

- (void)loadView {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSysProgressDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                data.byText(@"系统进度条".jobsTr())
                    .byFont(UIFontWeightRegularSize(16))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(HEXCOLOR(0xF4F5F8))
            .byNavBgCor(HEXCOLOR(0xF4F5F8));
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSysProgressDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.byProgressMode(JobsSysProgressDemoModeCountUp);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.makeNavByAlpha(1);
        self.setupSubviews();
        self.updateIdleProgress();
    };
}

- (void)viewDidLayoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSysProgressDemoVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
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
        self.timeLab.byFrame(CGRectMake(JobsWidth(24), top, width - JobsWidth(48), JobsWidth(56)));
        self.progressView.byFrame(CGRectMake(JobsWidth(32),
                                             CGRectGetMaxY(self.timeLab.frame) + JobsWidth(28),
                                             width - JobsWidth(64),
                                             JobsWidth(8)));
        self.durationSegment.byFrame(CGRectMake(JobsWidth(24),
                                                CGRectGetMaxY(self.progressView.frame) + JobsWidth(44),
                                                width - JobsWidth(48),
                                                JobsWidth(36)));
        CGFloat buttonTop = CGRectGetMaxY(self.durationSegment.frame) + JobsWidth(24);
        CGFloat buttonWidth = (width - JobsWidth(64)) / 3.0;
        self.modeButton.byFrame(CGRectMake(JobsWidth(24), buttonTop, buttonWidth, JobsWidth(46)));
        self.startButton.byFrame(CGRectMake(CGRectGetMaxX(self.modeButton.frame) + JobsWidth(8), buttonTop, buttonWidth, JobsWidth(46)));
        self.cancelButton.byFrame(CGRectMake(CGRectGetMaxX(self.startButton.frame) + JobsWidth(8), buttonTop, buttonWidth, JobsWidth(46)));
        self.tipsLab.byFrame(CGRectMake(JobsWidth(24),
                                        CGRectGetMaxY(self.startButton.frame) + JobsWidth(26),
                                        width - JobsWidth(48),
                                        JobsWidth(120)));
    };
}

- (void)viewWillDisappear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSysProgressDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.stopTimerResetUI(NO);
    };
}

#pragma mark —— UI

- (jobsByVoidBlock _Nonnull)setupSubviews {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.timeLab.addOn(self.view);
        self.progressView.addOn(self.view);
        self.durationSegment.addOn(self.view);
        self.modeButton.addOn(self.view);
        self.startButton.addOn(self.view);
        self.cancelButton.addOn(self.view);
        self.tipsLab.addOn(self.view);
    };
}

- (jobsByVoidBlock _Nonnull)toggleProgressMode {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byProgressMode(self.progressMode == JobsSysProgressDemoModeCountUp ? JobsSysProgressDemoModeCountDown : JobsSysProgressDemoModeCountUp);
        self.modeButton.jobsResetBtnTitle(self.modeButtonTitle());
        self.updateIdleProgress();
    };
}

- (JobsRetStrByVoidBlock _Nonnull)modeButtonTitle {
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.progressMode == JobsSysProgressDemoModeCountUp ? @"正向".jobsTr() : @"倒向".jobsTr();
    };
}

- (JobsRetCGFloatByVoidBlock _Nonnull)selectedDuration {
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        switch (self.durationSegment.jobs_selectedSegmentIndex()) {
            /// 处理 数值 1 分支
            case 1:
                return 6;
            /// 处理 数值 2 分支
            case 2:
                return 10;
            /// 未匹配已知分支时执行兜底处理
            default:
                return 3;
        }
    };
}

- (jobsByVoidBlock _Nonnull)startCountdown {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.stopTimerResetUI(NO);
        self.byTotalSeconds(self.selectedDuration());
        if (self.startButton) self.startButton.byEnabled(NO);
        if (self.durationSegment) self.durationSegment.byEnabled(NO);
        self.startButton.jobsResetBtnTitle(@"运行中".jobsTr());
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
                     self.updateProgressWithRemaining(time);
                 })
                 .byOnFinish(^(JobsTimer * _Nullable timer) {
                     @jobs_strongify(self)
                     self.finishCountdown();
                 });
        });
        self.updateProgressWithRemaining(self.totalSeconds);
        self.countdownTimer.start();
    };
}

- (jobsByVoidBlock _Nonnull)finishCountdown {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (_countdownTimer) _countdownTimer.jobsStop();
        _countdownTimer = nil;
        CGFloat finishedProgress = self.progressMode == JobsSysProgressDemoModeCountUp ? 1 : 0;
        [self.progressView setProgress:finishedProgress animated:YES];
        self.timeLab.byText(@"倒计时完成".jobsTr());
        if (self.startButton) self.startButton.byEnabled(YES);
        if (self.durationSegment) self.durationSegment.byEnabled(YES);
        self.startButton.jobsResetBtnTitle(@"开始".jobsTr());
    };
}

- (jobsByVoidBlock _Nonnull)cancelCountdown {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.stopTimerResetUI(YES);
    };
}

-(jobsByBOOLBlock _Nonnull)stopTimerResetUI{
    @jobs_weakify(self)
    return ^(BOOL resetUI){
        @jobs_strongify(self)
        if (!self) return;
        if (_countdownTimer) {
            _countdownTimer.jobsStop();
            _countdownTimer = nil;
        }
        if (self.startButton) self.startButton.byEnabled(YES);
        if (self.durationSegment) self.durationSegment.byEnabled(YES);
        self.startButton.jobsResetBtnTitle(@"开始".jobsTr());
        if (resetUI) self.updateIdleProgress();
    };
}

- (jobsByVoidBlock _Nonnull)updateIdleProgress {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat initialProgress = self.progressMode == JobsSysProgressDemoModeCountUp ? 0 : 1;
        [self.progressView setProgress:initialProgress animated:NO];
        self.timeLab.byText(@"选择时长后开始系统进度条倒计时".jobsTr());
    };
}

-(jobsByCGFloatBlock _Nonnull)updateProgressWithRemaining{
    @jobs_weakify(self)
    return ^(CGFloat remaining){
        @jobs_strongify(self)
        if (!self) return;
        CGFloat safeRemaining = MAX(remaining, 0);
        CGFloat elapsed = MAX(self.totalSeconds - safeRemaining, 0);
        CGFloat countUpProgress = self.totalSeconds <= 0 ? 0 : elapsed / self.totalSeconds;
        CGFloat countDownProgress = self.totalSeconds <= 0 ? 1 : safeRemaining / self.totalSeconds;
        CGFloat displayProgress = self.progressMode == JobsSysProgressDemoModeCountUp ? countUpProgress : countDownProgress;
        [self.progressView setProgress:displayProgress animated:YES];
        self.timeLab.byText([NSString stringWithFormat:@"剩余 %.1f 秒 / 进度 %.0f%%".jobsTr(),safeRemaining,displayProgress * 100.0]);
    };
}

- (UIButton *)buttonWithTitle:(NSString *)title action:(jobsByBtnBlock)action {
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title)
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(15))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .disabledStateTitleColorBy([JobsWhiteColor colorWithAlphaComponent:0.45])
            .jobsResetBtnBgCor(HEXCOLOR(0x111827))
            .onClickBy(action)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer.byCornerRadius(JobsWidth(10));
            });
    });
}

#pragma mark —— Lazy

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightBoldSize(22))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2);
        });
    };return _timeLab;
}

- (UIProgressView *)progressView {
    if (!_progressView) {
        _progressView = jobsMakeProgressView(^(__kindof UIProgressView * _Nullable progressView) {
            progressView
                .byProgressViewStyle(UIProgressViewStyleDefault)
                .byTrackTintColor(HEXCOLOR(0xD9DDE5))
                .byProgressTintColor(HEXCOLOR(0x00C853))
                .byTransform(CGAffineTransformMakeScale(1, JobsWidth(3)))
                .byCornerRadius(JobsWidth(4))
                .byClipsToBounds(YES);
        });
    };return _progressView;
}

- (UISegmentedControl *)durationSegment {
    if (!_durationSegment) {
        _durationSegment = jobsMakeSegmentedControl(@[@"3s",@"6s",@"10s"], ^(__kindof UISegmentedControl * _Nullable segmentedControl) {
            segmentedControl.bySelectedSegmentIndex(0);
        });
    };return _durationSegment;
}

- (UIButton *)modeButton {
    if (!_modeButton) {
        @jobs_weakify(self)
        _modeButton = [self buttonWithTitle:self.modeButtonTitle() action:^(__kindof UIButton * _Nullable button) {
            weak_self.toggleProgressMode();
        }];
        _modeButton.jobsResetBtnBgCor(HEXCOLOR(0x465A69));
    };return _modeButton;
}

- (UIButton *)startButton {
    if (!_startButton) {
        @jobs_weakify(self)
        _startButton = [self buttonWithTitle:@"开始".jobsTr() action:^(__kindof UIButton * _Nullable button) {
            weak_self.startCountdown();
        }];
        _startButton.jobsResetBtnBgCor(HEXCOLOR(0x00A651));
    };return _startButton;
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        @jobs_weakify(self)
        _cancelButton = [self buttonWithTitle:@"重置".jobsTr() action:^(__kindof UIButton * _Nullable button) {
            weak_self.cancelCountdown();
        }];
        _cancelButton.jobsResetBtnBgCor(HEXCOLOR(0xFF8F1F));
    };return _cancelButton;
}

- (UILabel *)tipsLab {
    if (!_tipsLab) {
        _tipsLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"这个 Demo 使用系统 UIProgressView 承载进度显示，JobsOCTimer 负责 DisplayLink 级别倒计时。正向模式从 0% 到 100%，倒向模式从 100% 到 0%。".jobsTr())
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(14))
                .byNumberOfLines(0);
        });
    };return _tipsLab;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsSysProgressDemoVC
-(JobsRetJobsSysProgressDemoVCByCGFloatBlock _Nonnull)byTotalSeconds{
    @jobs_weakify(self)
    return ^__kindof JobsSysProgressDemoVC * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setTotalSeconds:data];
        return self;
    };
}

-(JobsRetJobsSysProgressDemoVCByJobsSysProgressDemoModeBlock _Nonnull)byProgressMode{
    @jobs_weakify(self)
    return ^__kindof JobsSysProgressDemoVC * _Nullable(JobsSysProgressDemoMode data){
        @jobs_strongify(self)
        [self setProgressMode:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsSysProgressDemoVC
@end
