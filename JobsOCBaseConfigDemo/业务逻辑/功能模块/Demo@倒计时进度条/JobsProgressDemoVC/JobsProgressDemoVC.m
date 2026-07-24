//
//  JobsProgressDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsProgressDemoVC.h"

@interface JobsProgressDemoVC ()<UITextFieldDelegate>

Prop_strong()UILabel *titleLab;
Prop_strong()JobsProgressBar *progressBar;
Prop_strong()UISlider *slider;
Prop_strong()UITextField *percentTextField;
Prop_strong()UISegmentedControl *directionSegment;
Prop_strong()UISegmentedControl *modeSegment;
Prop_strong()UIButton *autoButton;
Prop_strong()UIButton *resetButton;
Prop_strong()UILabel *stateLab;
Prop_assign()BOOL autoRunning;

@end

@implementation JobsProgressDemoVC
- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
    [self.progressBar stopAutoProgress];
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
            data.byText(@"自定义进度条".tr)
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byBgCor(HEXCOLOR(0xF4F5F8))
        .byNavBgCor(HEXCOLOR(0xF4F5F8));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xF4F5F8));
    self.makeNavByAlpha(1);
    [self setupSubviews];
    [self.progressBar setDisplayPercent:35 animated:NO duration:0];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat top = CGRectGetMaxY(self.gk_navigationBar.frame) + JobsWidth(24);
    self.titleLab.frame = CGRectMake(JobsWidth(24), top, width - JobsWidth(48), JobsWidth(38));
    self.directionSegment.frame = CGRectMake(JobsWidth(20),
                                             CGRectGetMaxY(self.titleLab.frame) + JobsWidth(12),
                                             width - JobsWidth(40),
                                             JobsWidth(34));
    self.modeSegment.frame = CGRectMake(JobsWidth(20),
                                        CGRectGetMaxY(self.directionSegment.frame) + JobsWidth(12),
                                        width - JobsWidth(40),
                                        JobsWidth(34));
    BOOL vertical = self.progressBar.direction == JobsProgressBarDirectionTopToBottom || self.progressBar.direction == JobsProgressBarDirectionBottomToTop;
    CGFloat progressTop = CGRectGetMaxY(self.modeSegment.frame) + JobsWidth(20);
    if (vertical) {
        self.progressBar.frame = CGRectMake((width - JobsWidth(96)) / 2.0,
                                            progressTop,
                                            JobsWidth(96),
                                            JobsWidth(250));
    } else {
        self.progressBar.frame = CGRectMake(JobsWidth(24),
                                            progressTop,
                                            width - JobsWidth(48),
                                            JobsWidth(84));
    }
    CGFloat sliderTop = CGRectGetMaxY(self.progressBar.frame) + JobsWidth(24);
    self.slider.frame = CGRectMake(JobsWidth(24), sliderTop, width - JobsWidth(48), JobsWidth(34));
    self.percentTextField.frame = CGRectMake(JobsWidth(24),
                                             CGRectGetMaxY(self.slider.frame) + JobsWidth(14),
                                             width - JobsWidth(48),
                                             JobsWidth(44));
    CGFloat buttonTop = CGRectGetMaxY(self.percentTextField.frame) + JobsWidth(16);
    CGFloat buttonWidth = (width - JobsWidth(56)) / 2.0;
    self.autoButton.frame = CGRectMake(JobsWidth(24), buttonTop, buttonWidth, JobsWidth(46));
    self.resetButton.frame = CGRectMake(CGRectGetMaxX(self.autoButton.frame) + JobsWidth(8), buttonTop, buttonWidth, JobsWidth(46));
    self.stateLab.frame = CGRectMake(JobsWidth(24),
                                     CGRectGetMaxY(self.autoButton.frame) + JobsWidth(18),
                                     width - JobsWidth(48),
                                     JobsWidth(76));
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self stopAutoProgressUI];
}

#pragma mark —— UI

- (void)setupSubviews {
    [self.view addSubview:self.titleLab];
    [self.view addSubview:self.directionSegment];
    [self.view addSubview:self.modeSegment];
    [self.view addSubview:self.progressBar];
    [self.view addSubview:self.slider];
    [self.view addSubview:self.percentTextField];
    [self.view addSubview:self.autoButton];
    [self.view addSubview:self.resetButton];
    [self.view addSubview:self.stateLab];
}

- (void)directionChanged {
    switch (self.directionSegment.selectedSegmentIndex) {
        /// 处理 数值 1 分支
        case 1:
            self.progressBar.byDirection(JobsProgressBarDirectionRightToLeft);
            break;
        /// 处理 数值 2 分支
        case 2:
            self.progressBar.byDirection(JobsProgressBarDirectionTopToBottom);
            break;
        /// 处理 数值 3 分支
        case 3:
            self.progressBar.byDirection(JobsProgressBarDirectionBottomToTop);
            break;
        /// 未匹配已知分支时执行兜底处理
        default:
            self.progressBar.byDirection(JobsProgressBarDirectionLeftToRight);
            break;
    }
    self.stateLab.byText(@"方向已切换，当前进度值保持不变。".tr);
    [self.view setNeedsLayout];
}

- (void)modeChanged {
    self.progressBar.byValueMode(self.modeSegment.selectedSegmentIndex == 0 ? JobsProgressBarValueModeCountUp : JobsProgressBarValueModeCountDown);
    [self.progressBar setDisplayPercent:self.slider.value animated:NO duration:0];
    self.stateLab.byText(@"进度值显示模式已切换。".tr);
}

- (void)sliderChanged {
    [self stopAutoProgressUI];
    [self.progressBar setDisplayPercent:self.slider.value animated:YES duration:0.16];
    self.stateLab.byText(@"Slider 正在驱动 JobsProgressBar。".tr);
}

- (void)percentTextEditingDidEnd {
    CGFloat percent = [self clampedPercentFromString:self.percentTextField.text];
    self.slider.value = percent;
    [self stopAutoProgressUI];
    [self.progressBar setDisplayPercent:percent animated:YES duration:0.18];
    self.stateLab.byText(@"输入框已同步到自定义进度条。".tr);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (CGFloat)clampedPercentFromString:(NSString *)string {
    CGFloat value = string.doubleValue;
    return MIN(MAX(value, 0), 100);
}

- (void)toggleAutoProgress {
    if (self.autoRunning) {
        [self stopAutoProgressUI];
        self.stateLab.byText(@"自动进度已停止。".tr);
    } else {
        if (self.modeSegment.selectedSegmentIndex != 0) {
            self.modeSegment.selectedSegmentIndex = 0;
            self.progressBar.byValueMode(JobsProgressBarValueModeCountUp);
        }
        self.autoRunning = YES;
        [self.autoButton setTitle:@"停止自动".tr forState:UIControlStateNormal];
        self.slider.value = 0;
        [self.progressBar setDisplayPercent:0 animated:NO duration:0];
        [self.progressBar startAutoProgressFromZero:YES step:0.01 interval:0.03 animated:YES];
        self.stateLab.byText(@"自动进度运行中，可随时拖动滑块或进度条接管。".tr);
    }
}

- (void)resetProgress {
    [self stopAutoProgressUI];
    self.slider.value = 35;
    [self.progressBar setDisplayPercent:35 animated:YES duration:0.18];
    self.stateLab.byText(@"已重置到 35%。".tr);
}

- (void)stopAutoProgressUI {
    self.autoRunning = NO;
    [self.progressBar stopAutoProgress];
    [self.autoButton setTitle:@"自动进度".tr forState:UIControlStateNormal];
}

- (void)syncPercentViewsWithRawProgress:(CGFloat)progress {
    CGFloat displayProgress = self.progressBar.valueMode == JobsProgressBarValueModeCountDown ? 1.0 - progress : progress;
    CGFloat percent = MIN(MAX(displayProgress * 100.0, 0), 100);
    self.slider.value = percent;
    self.percentTextField.text = [NSString stringWithFormat:@"%.0f",percent];
    if (percent >= 100 && self.autoRunning) {
        [self stopAutoProgressUI];
        self.stateLab.byText(@"自动进度完成。".tr);
    }
}

- (UIButton *)buttonWithTitle:(NSString *)title action:(SEL)action {
    UIButton *button = UIButton.jobsInit();
    button.backgroundColor = HEXCOLOR(0x111827);
    button.titleLabel.font = UIFontWeightSemiboldSize(15);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:JobsWhiteColor forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = JobsWidth(10);
    return button;
}

#pragma mark —— Lazy

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.font = UIFontWeightBoldSize(18);
        _titleLab.textColor = HEXCOLOR(0x111827);
        _titleLab.text = @"进度值 + 前进方向".tr;
    };return _titleLab;
}

- (JobsProgressBar *)progressBar {
    if (!_progressBar) {
        @jobs_weakify(self)
        _progressBar = JobsProgressBar.alloc.init;
        _progressBar.byDirection(JobsProgressBarDirectionLeftToRight)
                    .byValueMode(JobsProgressBarValueModeCountUp)
                    .byTrackTintColor(HEXCOLOR(0xD9DDE5))
                    .byProgressTintColor(HEXCOLOR(0x00C853))
                    .byTrackThickness(JobsWidth(14))
                    .byTrackHorizontalInset(JobsWidth(12))
                    .byTrackVerticalInset(JobsWidth(8))
                    .byProgressLabelPlacement(JobsProgressBarLabelPlacementTop)
                    .byProgressLabelSpacing(JobsWidth(4))
                    .byThumbSize(CGSizeMake(JobsWidth(30), JobsWidth(30)))
                    .byThumbCornerRadius(JobsWidth(15))
                    .byThumbBackgroundColor(JobsWhiteColor)
                    .byThumbBorderColor(HEXCOLOR(0x00C853))
                    .byThumbBorderWidth(JobsWidth(2))
                    .byThumbShadowOpacity(0.16)
                    .byThumbShadowRadius(JobsWidth(5))
                    .byThumbShadowOffset(CGSizeMake(0, JobsWidth(2)))
                    .byDraggable(YES)
                    .byOnProgressChanged(^(CGFloat progress) {
                        @jobs_strongify(self)
                        [self syncPercentViewsWithRawProgress:progress];
                    })
                    .byOnDragBegan(^(CGFloat progress) {
                        @jobs_strongify(self)
                        [self stopAutoProgressUI];
                        self.stateLab.byText(@"开始拖动自定义进度条。".tr);
                    })
                    .byOnDragChanged(^(CGFloat progress) {
                        @jobs_strongify(self)
                        self.stateLab.byText(@"拖动中：进度条正在反向同步 Slider 和输入框。".tr);
                    })
                    .byOnDragEnded(^(CGFloat progress) {
                        @jobs_strongify(self)
                        self.stateLab.byText(@"拖动结束。".tr);
                    });
    };return _progressBar;
}

- (UISlider *)slider {
    if (!_slider) {
        _slider = UISlider.new;
        _slider.minimumValue = 0;
        _slider.maximumValue = 100;
        _slider.value = 35;
        _slider.minimumTrackTintColor = HEXCOLOR(0x00C853);
        _slider.maximumTrackTintColor = HEXCOLOR(0xD9DDE5);
        [_slider addTarget:self action:@selector(sliderChanged) forControlEvents:UIControlEventValueChanged];
    };return _slider;
}

- (UITextField *)percentTextField {
    if (!_percentTextField) {
        _percentTextField = UITextField.new;
        _percentTextField.delegate = self;
        _percentTextField.keyboardType = UIKeyboardTypeDecimalPad;
        _percentTextField.returnKeyType = UIReturnKeyDone;
        _percentTextField.textAlignment = NSTextAlignmentCenter;
        _percentTextField.font = UIFontWeightSemiboldSize(17);
        _percentTextField.textColor = HEXCOLOR(0x111827);
        _percentTextField.text = @"35";
        _percentTextField.placeholder = @"0 ~ 100".tr;
        _percentTextField.backgroundColor = JobsWhiteColor;
        _percentTextField.layer.cornerRadius = JobsWidth(10);
        _percentTextField.layer.borderColor = HEXCOLOR(0xD9DDE5).CGColor;
        _percentTextField.layer.borderWidth = 1;
        [_percentTextField addTarget:self action:@selector(percentTextEditingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
    };return _percentTextField;
}

- (UISegmentedControl *)directionSegment {
    if (!_directionSegment) {
        _directionSegment = [UISegmentedControl.alloc initWithItems:@[@"左->右",@"右->左",@"上->下",@"下->上"]];
        _directionSegment.selectedSegmentIndex = 0;
        [_directionSegment addTarget:self action:@selector(directionChanged) forControlEvents:UIControlEventValueChanged];
    };return _directionSegment;
}

- (UISegmentedControl *)modeSegment {
    if (!_modeSegment) {
        _modeSegment = [UISegmentedControl.alloc initWithItems:@[@"正向值",@"倒向值"]];
        _modeSegment.selectedSegmentIndex = 0;
        [_modeSegment addTarget:self action:@selector(modeChanged) forControlEvents:UIControlEventValueChanged];
    };return _modeSegment;
}

- (UIButton *)autoButton {
    if (!_autoButton) {
        _autoButton = [self buttonWithTitle:@"自动进度".tr action:@selector(toggleAutoProgress)];
        _autoButton.backgroundColor = HEXCOLOR(0x00A651);
    };return _autoButton;
}

- (UIButton *)resetButton {
    if (!_resetButton) {
        _resetButton = [self buttonWithTitle:@"重置".tr action:@selector(resetProgress)];
        _resetButton.backgroundColor = HEXCOLOR(0xFF8F1F);
    };return _resetButton;
}

- (UILabel *)stateLab {
    if (!_stateLab) {
        _stateLab = UILabel.new;
        _stateLab.numberOfLines = 0;
        _stateLab.font = UIFontWeightRegularSize(14);
        _stateLab.textColor = HEXCOLOR(0x5F6B7A);
        _stateLab.text = @"JobsProgressBar 来自 OC 本地 Pod：支持方向、显示值模式、拖动和自动进度。".tr;
    };return _stateLab;
}

@end
