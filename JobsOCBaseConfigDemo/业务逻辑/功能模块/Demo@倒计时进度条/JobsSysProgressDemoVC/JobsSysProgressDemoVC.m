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

@implementation JobsSysProgressDemoVC

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
    [self stopTimerResetUI:NO];
}

- (void)loadView {
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if (self.viewModel.pushOrPresent != ComingStyle_Unknown) {
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"系统进度条".tr)
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byBgCor(HEXCOLOR(0xF4F5F8))
        .byNavBgCor(HEXCOLOR(0xF4F5F8));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.progressMode = JobsSysProgressDemoModeCountUp;
    self.view.byBgColor(HEXCOLOR(0xF4F5F8));
    self.makeNavByAlpha(1);
    [self setupSubviews];
    [self updateIdleProgress];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat top = CGRectGetMaxY(self.gk_navigationBar.frame) + JobsWidth(44);
    self.timeLab.frame = CGRectMake(JobsWidth(24), top, width - JobsWidth(48), JobsWidth(56));
    self.progressView.frame = CGRectMake(JobsWidth(32),
                                         CGRectGetMaxY(self.timeLab.frame) + JobsWidth(28),
                                         width - JobsWidth(64),
                                         JobsWidth(8));
    self.durationSegment.frame = CGRectMake(JobsWidth(24),
                                            CGRectGetMaxY(self.progressView.frame) + JobsWidth(44),
                                            width - JobsWidth(48),
                                            JobsWidth(36));
    CGFloat buttonTop = CGRectGetMaxY(self.durationSegment.frame) + JobsWidth(24);
    CGFloat buttonWidth = (width - JobsWidth(64)) / 3.0;
    self.modeButton.frame = CGRectMake(JobsWidth(24), buttonTop, buttonWidth, JobsWidth(46));
    self.startButton.frame = CGRectMake(CGRectGetMaxX(self.modeButton.frame) + JobsWidth(8), buttonTop, buttonWidth, JobsWidth(46));
    self.cancelButton.frame = CGRectMake(CGRectGetMaxX(self.startButton.frame) + JobsWidth(8), buttonTop, buttonWidth, JobsWidth(46));
    self.tipsLab.frame = CGRectMake(JobsWidth(24),
                                    CGRectGetMaxY(self.startButton.frame) + JobsWidth(26),
                                    width - JobsWidth(48),
                                    JobsWidth(120));
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self stopTimerResetUI:NO];
}

#pragma mark —— UI

- (void)setupSubviews {
    [self.view addSubview:self.timeLab];
    [self.view addSubview:self.progressView];
    [self.view addSubview:self.durationSegment];
    [self.view addSubview:self.modeButton];
    [self.view addSubview:self.startButton];
    [self.view addSubview:self.cancelButton];
    [self.view addSubview:self.tipsLab];
}

- (void)toggleProgressMode {
    self.progressMode = self.progressMode == JobsSysProgressDemoModeCountUp ? JobsSysProgressDemoModeCountDown : JobsSysProgressDemoModeCountUp;
    [self.modeButton setTitle:[self modeButtonTitle] forState:UIControlStateNormal];
    [self updateIdleProgress];
}

- (NSString *)modeButtonTitle {
    return self.progressMode == JobsSysProgressDemoModeCountUp ? @"正向".tr : @"倒向".tr;
}

- (CGFloat)selectedDuration {
    switch (self.durationSegment.selectedSegmentIndex) {
        case 1:
            return 6;
        case 2:
            return 10;
        default:
            return 3;
    }
}

- (void)startCountdown {
    [self stopTimerResetUI:NO];
    self.totalSeconds = [self selectedDuration];
    self.startButton.enabled = NO;
    self.durationSegment.enabled = NO;
    [self.startButton setTitle:@"运行中".tr forState:UIControlStateNormal];
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
                 [self updateProgressWithRemaining:time];
             })
             .byOnFinish(^(JobsTimer * _Nullable timer) {
                 @jobs_strongify(self)
                 [self finishCountdown];
             });
    });
    [self updateProgressWithRemaining:self.totalSeconds];
    [self.countdownTimer start];
}

- (void)finishCountdown {
    [_countdownTimer stop];
    _countdownTimer = nil;
    CGFloat finishedProgress = self.progressMode == JobsSysProgressDemoModeCountUp ? 1 : 0;
    [self.progressView setProgress:finishedProgress animated:YES];
    self.timeLab.byText(@"倒计时完成".tr);
    self.startButton.enabled = YES;
    self.durationSegment.enabled = YES;
    [self.startButton setTitle:@"开始".tr forState:UIControlStateNormal];
}

- (void)cancelCountdown {
    [self stopTimerResetUI:YES];
}

- (void)stopTimerResetUI:(BOOL)resetUI {
    if (_countdownTimer) {
        [_countdownTimer stop];
        _countdownTimer = nil;
    }
    self.startButton.enabled = YES;
    self.durationSegment.enabled = YES;
    [self.startButton setTitle:@"开始".tr forState:UIControlStateNormal];
    if (resetUI) [self updateIdleProgress];
}

- (void)updateIdleProgress {
    CGFloat initialProgress = self.progressMode == JobsSysProgressDemoModeCountUp ? 0 : 1;
    [self.progressView setProgress:initialProgress animated:NO];
    self.timeLab.byText(@"选择时长后开始系统进度条倒计时".tr);
}

- (void)updateProgressWithRemaining:(CGFloat)remaining {
    CGFloat safeRemaining = MAX(remaining, 0);
    CGFloat elapsed = MAX(self.totalSeconds - safeRemaining, 0);
    CGFloat countUpProgress = self.totalSeconds <= 0 ? 0 : elapsed / self.totalSeconds;
    CGFloat countDownProgress = self.totalSeconds <= 0 ? 1 : safeRemaining / self.totalSeconds;
    CGFloat displayProgress = self.progressMode == JobsSysProgressDemoModeCountUp ? countUpProgress : countDownProgress;
    [self.progressView setProgress:displayProgress animated:YES];
    self.timeLab.byText([NSString stringWithFormat:@"剩余 %.1f 秒 / 进度 %.0f%%".tr,safeRemaining,displayProgress * 100.0]);
}

- (UIButton *)buttonWithTitle:(NSString *)title action:(SEL)action {
    UIButton *button = UIButton.jobsInit();
    button.backgroundColor = HEXCOLOR(0x111827);
    button.titleLabel.font = UIFontWeightSemiboldSize(15);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:JobsWhiteColor forState:UIControlStateNormal];
    [button setTitleColor:[JobsWhiteColor colorWithAlphaComponent:0.45] forState:UIControlStateDisabled];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = JobsWidth(10);
    return button;
}

#pragma mark —— Lazy

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = UILabel.new;
        _timeLab.textAlignment = NSTextAlignmentCenter;
        _timeLab.numberOfLines = 2;
        _timeLab.font = UIFontWeightBoldSize(22);
        _timeLab.textColor = HEXCOLOR(0x111827);
    };return _timeLab;
}

- (UIProgressView *)progressView {
    if (!_progressView) {
        _progressView = [UIProgressView.alloc initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.trackTintColor = HEXCOLOR(0xD9DDE5);
        _progressView.progressTintColor = HEXCOLOR(0x00C853);
        _progressView.transform = CGAffineTransformMakeScale(1, JobsWidth(3));
        _progressView.layer.cornerRadius = JobsWidth(4);
        _progressView.clipsToBounds = YES;
    };return _progressView;
}

- (UISegmentedControl *)durationSegment {
    if (!_durationSegment) {
        _durationSegment = [UISegmentedControl.alloc initWithItems:@[@"3s",@"6s",@"10s"]];
        _durationSegment.selectedSegmentIndex = 0;
    };return _durationSegment;
}

- (UIButton *)modeButton {
    if (!_modeButton) {
        _modeButton = [self buttonWithTitle:[self modeButtonTitle] action:@selector(toggleProgressMode)];
        _modeButton.backgroundColor = HEXCOLOR(0x465A69);
    };return _modeButton;
}

- (UIButton *)startButton {
    if (!_startButton) {
        _startButton = [self buttonWithTitle:@"开始".tr action:@selector(startCountdown)];
        _startButton.backgroundColor = HEXCOLOR(0x00A651);
    };return _startButton;
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [self buttonWithTitle:@"重置".tr action:@selector(cancelCountdown)];
        _cancelButton.backgroundColor = HEXCOLOR(0xFF8F1F);
    };return _cancelButton;
}

- (UILabel *)tipsLab {
    if (!_tipsLab) {
        _tipsLab = UILabel.new;
        _tipsLab.numberOfLines = 0;
        _tipsLab.font = UIFontWeightRegularSize(14);
        _tipsLab.textColor = HEXCOLOR(0x5F6B7A);
        _tipsLab.text = @"这个 Demo 使用系统 UIProgressView 承载进度显示，JobsOCTimer 负责 DisplayLink 级别倒计时。正向模式从 0% 到 100%，倒向模式从 100% 到 0%。".tr;
    };return _tipsLab;
}

@end
