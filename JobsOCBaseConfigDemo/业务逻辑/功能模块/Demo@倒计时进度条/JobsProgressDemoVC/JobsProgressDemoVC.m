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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsProgressDemoVC
@interface JobsProgressDemoVC (JobsPropertyDSLSetterAutogen_a36d2f0db0)
-(void)setAutoRunning:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsProgressDemoVC

@implementation JobsProgressDemoVC
- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
    self.progressBar.stopAutoProgress();
}

- (void)loadView {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                data.byText(@"自定义进度条".jobsTr())
                    .byFont(UIFontWeightRegularSize(16))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(HEXCOLOR(0xF4F5F8))
            .byNavBgCor(HEXCOLOR(0xF4F5F8));
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.setupSubviews();
        [self.progressBar setDisplayPercent:35 animated:NO duration:0];
    };
}

- (void)viewDidLayoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressDemoVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        CGFloat width = CGRectGetWidth(self.view.bounds);
        CGFloat top = CGRectGetMaxY(self.gk_navigationBar.frame) + JobsWidth(24);
        self.titleLab.byFrame(CGRectMake(JobsWidth(24), top, width - JobsWidth(48), JobsWidth(38)));
        self.directionSegment.byFrame(CGRectMake(JobsWidth(20),
                                                 CGRectGetMaxY(self.titleLab.frame) + JobsWidth(12),
                                                 width - JobsWidth(40),
                                                 JobsWidth(34)));
        self.modeSegment.byFrame(CGRectMake(JobsWidth(20),
                                            CGRectGetMaxY(self.directionSegment.frame) + JobsWidth(12),
                                            width - JobsWidth(40),
                                            JobsWidth(34)));
        BOOL vertical = self.progressBar.direction == JobsProgressBarDirectionTopToBottom || self.progressBar.direction == JobsProgressBarDirectionBottomToTop;
        CGFloat progressTop = CGRectGetMaxY(self.modeSegment.frame) + JobsWidth(20);
        if (vertical) {
            self.progressBar.byFrame(CGRectMake((width - JobsWidth(96)) / 2.0,
                                                progressTop,
                                                JobsWidth(96),
                                                JobsWidth(250)));
        } else {
            self.progressBar.byFrame(CGRectMake(JobsWidth(24),
                                                progressTop,
                                                width - JobsWidth(48),
                                                JobsWidth(84)));
        }
        CGFloat sliderTop = CGRectGetMaxY(self.progressBar.frame) + JobsWidth(24);
        self.slider.byFrame(CGRectMake(JobsWidth(24), sliderTop, width - JobsWidth(48), JobsWidth(34)));
        self.percentTextField.byFrame(CGRectMake(JobsWidth(24),
                                                 CGRectGetMaxY(self.slider.frame) + JobsWidth(14),
                                                 width - JobsWidth(48),
                                                 JobsWidth(44)));
        CGFloat buttonTop = CGRectGetMaxY(self.percentTextField.frame) + JobsWidth(16);
        CGFloat buttonWidth = (width - JobsWidth(56)) / 2.0;
        self.autoButton.byFrame(CGRectMake(JobsWidth(24), buttonTop, buttonWidth, JobsWidth(46)));
        self.resetButton.byFrame(CGRectMake(CGRectGetMaxX(self.autoButton.frame) + JobsWidth(8), buttonTop, buttonWidth, JobsWidth(46)));
        self.stateLab.byFrame(CGRectMake(JobsWidth(24),
                                         CGRectGetMaxY(self.autoButton.frame) + JobsWidth(18),
                                         width - JobsWidth(48),
                                         JobsWidth(76)));
    };
}

- (void)viewWillDisappear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.stopAutoProgressUI();
    };
}

#pragma mark —— UI

- (jobsByVoidBlock _Nonnull)setupSubviews {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.titleLab.addOn(self.view);
        self.directionSegment.addOn(self.view);
        self.modeSegment.addOn(self.view);
        self.progressBar.addOn(self.view);
        self.slider.addOn(self.view);
        self.percentTextField.addOn(self.view);
        self.autoButton.addOn(self.view);
        self.resetButton.addOn(self.view);
        self.stateLab.addOn(self.view);
    };
}

- (jobsByVoidBlock _Nonnull)directionChanged {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        switch (self.directionSegment.jobs_selectedSegmentIndex()) {
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
        self.stateLab.byText(@"方向已切换，当前进度值保持不变。".jobsTr());
        [self.view setNeedsLayout];
    };
}

- (void)modeChanged {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressDemoVC.class, @selector(jobsModeChanged)))(self, @selector(jobsModeChanged));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsModeChanged{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.progressBar.byValueMode(self.modeSegment.jobs_selectedSegmentIndex() == 0 ? JobsProgressBarValueModeCountUp : JobsProgressBarValueModeCountDown);
        [self.progressBar setDisplayPercent:self.slider.value animated:NO duration:0];
        self.stateLab.byText(@"进度值显示模式已切换。".jobsTr());
    };
}

- (jobsByVoidBlock _Nonnull)sliderChanged {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.stopAutoProgressUI();
        [self.progressBar setDisplayPercent:self.slider.value animated:YES duration:0.16];
        self.stateLab.byText(@"Slider 正在驱动 JobsProgressBar。".jobsTr());
    };
}

- (jobsByVoidBlock _Nonnull)percentTextEditingDidEnd {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat percent = self.clampedPercentFromString(self.percentTextField.text);
        self.slider.byValue(percent);
        self.stopAutoProgressUI();
        [self.progressBar setDisplayPercent:percent animated:YES duration:0.18];
        self.stateLab.byText(@"输入框已同步到自定义进度条。".jobsTr());
    };
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressDemoVC.class, @selector(jobsTextFieldShouldReturn)))(self, @selector(jobsTextFieldShouldReturn));
    return action ? action(textField) : NO;
}

-(JobsRetBOOLByUITextFieldBlock _Nonnull)jobsTextFieldShouldReturn{
    @jobs_weakify(self)
    return ^BOOL(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return NO;
        [textField resignFirstResponder];
        return YES;
    };
}

-(JobsRetCGFloatByNSStringBlock _Nonnull)clampedPercentFromString{
    @jobs_weakify(self)
    return ^CGFloat(NSString * string){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        CGFloat value = string.doubleValue;
        return MIN(MAX(value, 0), 100);
    };
}

- (jobsByVoidBlock _Nonnull)toggleAutoProgress {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.autoRunning) {
            self.stopAutoProgressUI();
            self.stateLab.byText(@"自动进度已停止。".jobsTr());
        } else {
            self.byAutoRunning(YES);
            self.autoButton.jobsResetBtnTitle(@"停止自动".jobsTr());
            [self.progressBar startAutoProgressFromZero:NO step:0.01 interval:0.03 animated:YES];
            self.stateLab.byText(@"从当前进度继续自动播放，可随时拖动滑块或进度条接管。".jobsTr());
        }
    };
}

- (jobsByVoidBlock _Nonnull)resetProgress {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.stopAutoProgressUI();
        self.slider.byValue(35);
        [self.progressBar setDisplayPercent:35 animated:YES duration:0.18];
        self.stateLab.byText(@"已重置到 35%。".jobsTr());
    };
}

- (jobsByVoidBlock _Nonnull)stopAutoProgressUI {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byAutoRunning(NO);
        self.progressBar.stopAutoProgress();
        self.autoButton.jobsResetBtnTitle(@"自动进度".jobsTr());
    };
}

-(jobsByCGFloatBlock _Nonnull)syncPercentViewsWithRawProgress{
    @jobs_weakify(self)
    return ^(CGFloat progress){
        @jobs_strongify(self)
        if (!self) return;
        CGFloat displayProgress = self.progressBar.valueMode == JobsProgressBarValueModeCountDown ? 1.0 - progress : progress;
        CGFloat percent = MIN(MAX(displayProgress * 100.0, 0), 100);
        self.slider.byValue(percent);
        self.percentTextField.byText([NSString stringWithFormat:@"%.0f",percent]);
        if (progress >= 1.0 && self.autoRunning) {
            self.stopAutoProgressUI();
            self.stateLab.byText(@"自动进度完成。".jobsTr());
        }
    };
}

- (UIButton *)buttonWithTitle:(NSString *)title action:(jobsByBtnBlock)action {
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title)
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(15))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(HEXCOLOR(0x111827))
            .onClickBy(action)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer.byCornerRadius(JobsWidth(10));
            });
    });
}

#pragma mark —— Lazy

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"进度值 + 前进方向".jobsTr())
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightBoldSize(18))
                .byTextAlignment(NSTextAlignmentCenter);
        });
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
                        self.syncPercentViewsWithRawProgress(progress);
                    })
                    .byOnDragBegan(^(CGFloat progress) {
                        @jobs_strongify(self)
                        self.stopAutoProgressUI();
                        self.stateLab.byText(@"开始拖动自定义进度条。".jobsTr());
                    })
                    .byOnDragChanged(^(CGFloat progress) {
                        @jobs_strongify(self)
                        self.stateLab.byText(@"拖动中：进度条正在反向同步 Slider 和输入框。".jobsTr());
                    })
                    .byOnDragEnded(^(CGFloat progress) {
                        @jobs_strongify(self)
                        self.stateLab.byText(@"拖动结束。".jobsTr());
                    });
    };return _progressBar;
}

- (UISlider *)slider {
    if (!_slider) {
        @jobs_weakify(self)
        _slider = jobsMakeSlider(^(__kindof UISlider * _Nullable slider) {
            slider
                .byMinimumValue(0)
                .byMaximumValue(100)
                .byValue(35)
                .byMinimumTrackTintColor(HEXCOLOR(0x00C853))
                .byMaximumTrackTintColor(HEXCOLOR(0xD9DDE5))
                .onJobsChange(^(__kindof UIControl * _Nullable control) {
                    weak_self.sliderChanged();
                });
        });
    };return _slider;
}

- (UITextField *)percentTextField {
    if (!_percentTextField) {
        @jobs_weakify(self)
        _percentTextField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byText(@"35")
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightSemiboldSize(17))
                .byTextAlignment(NSTextAlignmentCenter)
                .byPlaceholder(@"0 ~ 100".jobsTr())
                .byDelegate(self)
                .byKeyboardType(UIKeyboardTypeDecimalPad)
                .byReturnKeyType(UIReturnKeyDone)
                .onJobsEvent(UIControlEventEditingDidEnd, ^(__kindof UIControl * _Nullable control) {
                    weak_self.percentTextEditingDidEnd();
                })
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(10))
                        .byBorderColor(HEXCOLOR(0xD9DDE5).CGColor)
                        .byBorderWidth(1);
                });
        });
    };return _percentTextField;
}

- (UISegmentedControl *)directionSegment {
    if (!_directionSegment) {
        @jobs_weakify(self)
        _directionSegment = jobsMakeSegmentedControl(@[@"左->右",@"右->左",@"上->下",@"下->上"], ^(__kindof UISegmentedControl * _Nullable segmentedControl) {
            segmentedControl
                .bySelectedSegmentIndex(0)
                .onJobsChange(^(__kindof UIControl * _Nullable control) {
                    weak_self.directionChanged();
                });
        });
    };return _directionSegment;
}

- (UISegmentedControl *)modeSegment {
    if (!_modeSegment) {
        @jobs_weakify(self)
        _modeSegment = jobsMakeSegmentedControl(@[@"正向值",@"倒向值"], ^(__kindof UISegmentedControl * _Nullable segmentedControl) {
            segmentedControl
                .bySelectedSegmentIndex(0)
                .onJobsChange(^(__kindof UIControl * _Nullable control) {
                    [weak_self modeChanged];
                });
        });
    };return _modeSegment;
}

- (UIButton *)autoButton {
    if (!_autoButton) {
        @jobs_weakify(self)
        _autoButton = [self buttonWithTitle:@"自动进度".jobsTr() action:^(__kindof UIButton * _Nullable button) {
            weak_self.toggleAutoProgress();
        }];
        _autoButton.jobsResetBtnBgCor(HEXCOLOR(0x00A651));
    };return _autoButton;
}

- (UIButton *)resetButton {
    if (!_resetButton) {
        @jobs_weakify(self)
        _resetButton = [self buttonWithTitle:@"重置".jobsTr() action:^(__kindof UIButton * _Nullable button) {
            weak_self.resetProgress();
        }];
        _resetButton.jobsResetBtnBgCor(HEXCOLOR(0xFF8F1F));
    };return _resetButton;
}

- (UILabel *)stateLab {
    if (!_stateLab) {
        _stateLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"JobsProgressBar 来自 OC 本地 Pod：支持方向、显示值模式、拖动和自动进度。".jobsTr())
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(14))
                .byNumberOfLines(0);
        });
    };return _stateLab;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsProgressDemoVC
-(JobsRetJobsProgressDemoVCByBOOLBlock _Nonnull)byAutoRunning{
    @jobs_weakify(self)
    return ^__kindof JobsProgressDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setAutoRunning:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsProgressDemoVC
@end
