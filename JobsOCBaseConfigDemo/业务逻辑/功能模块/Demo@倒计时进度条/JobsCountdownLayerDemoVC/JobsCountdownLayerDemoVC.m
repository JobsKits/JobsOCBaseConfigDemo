//
//  JobsCountdownLayerDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsCountdownLayerDemoVC.h"

@interface JobsCountdownLayerDemoVC ()

Prop_strong()UIButton *demoButton;
Prop_strong()UILabel *stateLab;
Prop_strong()UILabel *detailLab;
Prop_strong()JobsTimer *countdownTimer;
Prop_assign()CGFloat totalSeconds;

@end

@implementation JobsCountdownLayerDemoVC

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
    [self stopCountdownAnimated:NO];
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
            data.byText(@"导火索倒计时".tr)
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byBgCor(HEXCOLOR(0xF4F5F8))
        .byNavBgCor(HEXCOLOR(0xF4F5F8));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.totalSeconds = 6;
    self.view.byBgColor(HEXCOLOR(0xF4F5F8));
    self.makeNavByAlpha(1);
    [self setupSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat top = CGRectGetMaxY(self.gk_navigationBar.frame) + JobsWidth(44);
    self.demoButton.frame = CGRectMake((width - JobsWidth(188)) / 2.0,
                                       top,
                                       JobsWidth(188),
                                       JobsWidth(188));
    self.demoButton.layer.cornerRadius = CGRectGetWidth(self.demoButton.bounds) / 2.0;
    self.stateLab.frame = CGRectMake(JobsWidth(24),
                                     CGRectGetMaxY(self.demoButton.frame) + JobsWidth(28),
                                     width - JobsWidth(48),
                                     JobsWidth(44));
    self.detailLab.frame = CGRectMake(JobsWidth(24),
                                      CGRectGetMaxY(self.stateLab.frame) + JobsWidth(18),
                                      width - JobsWidth(48),
                                      JobsWidth(112));
    [self.demoButton byFuseOuterRingLayoutIfNeeded];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self stopCountdownAnimated:NO];
}

#pragma mark —— UI

- (void)setupSubviews {
    [self.view addSubview:self.demoButton];
    [self.view addSubview:self.stateLab];
    [self.view addSubview:self.detailLab];
}

- (void)startOrStopCountdown {
    if (self.countdownTimer.isRunning) {
        [self stopCountdownAnimated:YES];
    } else {
        [self startCountdown];
    }
}

- (void)startCountdown {
    [self stopCountdownAnimated:NO];
    [self updateCountdownWithRemaining:self.totalSeconds];
    JobsFuseOuterRingConfig *config = JobsFuseOuterRingConfig.config
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
    [self.demoButton byFuseOuterRingStart:config];
    [self.demoButton byFusePressScaleStart:1.05 duration:0.16];
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
                 [self updateCountdownWithRemaining:time];
             })
             .byOnFinish(^(JobsTimer * _Nullable timer) {
                 @jobs_strongify(self)
                 [self finishCountdown];
             });
    });
    [self.countdownTimer start];
}

- (void)stopCountdownAnimated:(BOOL)animated {
    if (_countdownTimer) {
        [_countdownTimer stop];
        _countdownTimer = nil;
    }
    [self.demoButton byFuseOuterRingStop:animated];
    [self.demoButton byFusePressScaleStop:animated duration:0.18 damping:0.72 velocity:0.4];
    [self.demoButton setTitle:@"点我开始".tr forState:UIControlStateNormal];
    self.stateLab.byText(@"点击按钮，任意 UIView.layer 都可以挂一圈导火索倒计时。".tr);
}

- (void)finishCountdown {
    [_countdownTimer stop];
    _countdownTimer = nil;
    [self.demoButton byFuseOuterRingStop:YES];
    [self.demoButton byFusePressScaleStop:YES duration:0.18 damping:0.72 velocity:0.4];
    [self.demoButton byFuseTapScale];
    [self.demoButton setTitle:@"完成".tr forState:UIControlStateNormal];
    self.stateLab.byText(@"倒计时完成，外圈导火索自动收口。".tr);
}

- (void)updateCountdownWithRemaining:(CGFloat)remaining {
    CGFloat safeRemaining = MAX(remaining, 0);
    [self.demoButton setTitle:[NSString stringWithFormat:@"%.1fs",safeRemaining] forState:UIControlStateNormal];
    self.stateLab.byText([NSString stringWithFormat:@"剩余 %.1f 秒，Layer 外圈按 DisplayLink 进度增长。".tr,safeRemaining]);
}

#pragma mark —— Lazy

- (UIButton *)demoButton {
    if (!_demoButton) {
        _demoButton = UIButton.jobsInit();
        _demoButton.backgroundColor = HEXCOLOR(0x111827);
        _demoButton.titleLabel.font = UIFontWeightBoldSize(26);
        [_demoButton setTitleColor:JobsWhiteColor forState:UIControlStateNormal];
        [_demoButton setTitle:@"点我开始".tr forState:UIControlStateNormal];
        [_demoButton addTarget:self action:@selector(startOrStopCountdown) forControlEvents:UIControlEventTouchUpInside];
        _demoButton.layer.shadowColor = HEXCOLOR(0x111827).CGColor;
        _demoButton.layer.shadowOpacity = 0.18;
        _demoButton.layer.shadowRadius = JobsWidth(18);
        _demoButton.layer.shadowOffset = CGSizeMake(0, JobsWidth(10));
    };return _demoButton;
}

- (UILabel *)stateLab {
    if (!_stateLab) {
        _stateLab = UILabel.new;
        _stateLab.textAlignment = NSTextAlignmentCenter;
        _stateLab.numberOfLines = 2;
        _stateLab.font = UIFontWeightRegularSize(15);
        _stateLab.textColor = HEXCOLOR(0x3D4A58);
        _stateLab.text = @"点击按钮，任意 UIView.layer 都可以挂一圈导火索倒计时。".tr;
    };return _stateLab;
}

- (UILabel *)detailLab {
    if (!_detailLab) {
        _detailLab = UILabel.new;
        _detailLab.numberOfLines = 0;
        _detailLab.textAlignment = NSTextAlignmentLeft;
        _detailLab.font = UIFontWeightRegularSize(14);
        _detailLab.textColor = HEXCOLOR(0x5F6B7A);
        _detailLab.text = @"这个 Demo 复用 OC Pod JobsFuseAnimation：UIView 分类只负责 Layer 外圈动画，页面里的 JobsTimer 负责倒计时文案和结束态。按钮只是示例，换成任意 UIView 也可以。".tr;
    };return _detailLab;
}

@end
