//
//  JobsOCGraphicCaptchaDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsOCGraphicCaptchaDemoVC.h"

@interface JobsOCGraphicCaptchaDemoVC ()

Prop_strong()UIView *contentView;
Prop_strong()JobsOCGraphicCaptchaView *captchaView;
Prop_strong()UISegmentedControl *modeControl;
Prop_strong()UISegmentedControl *mixedTwoControl;
Prop_strong()UISegmentedControl *mixedThreeControl;
Prop_strong()UISegmentedControl *mixedFullControl;
Prop_strong()UILabel *lengthLab;
Prop_strong()UIStepper *lengthStepper;
Prop_strong()UITextField *inputTF;
Prop_strong()UIButton *refreshBtn;
Prop_strong()UIButton *validateBtn;
Prop_strong()UILabel *resultLab;

@end

@implementation JobsOCGraphicCaptchaDemoVC

- (void)dealloc{
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
            data.byTextCor(HEXCOLOR(0x263342));
            data.byText(@"JobsOCGraphicCaptcha");
            data.byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(HEXCOLOR(0xF5F7FA))
        .byNavBgCor(HEXCOLOR(0xF5F7FA));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(HEXCOLOR(0xF5F7FA));
    self.contentView.byHidden(NO);
    [self applyCurrentConfig];
}
#pragma mark —— Actions
-(JobsOCGraphicCaptchaCharacterUnit)currentMixedCharacterUnits{
    switch (self.mixedTwoControl.jobs_selectedSegmentIndex) {
        case 0:
            return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter | JobsOCGraphicCaptchaCharacterUnitLowercaseLetter;
        case 1:
            return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter | JobsOCGraphicCaptchaCharacterUnitNumber;
        case 2:
            return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter | JobsOCGraphicCaptchaCharacterUnitChinese;
        case 3:
            return JobsOCGraphicCaptchaCharacterUnitLowercaseLetter | JobsOCGraphicCaptchaCharacterUnitNumber;
        case 4:
            return JobsOCGraphicCaptchaCharacterUnitLowercaseLetter | JobsOCGraphicCaptchaCharacterUnitChinese;
        case 5:
            return JobsOCGraphicCaptchaCharacterUnitNumber | JobsOCGraphicCaptchaCharacterUnitChinese;
        default:
            break;
    }
    switch (self.mixedThreeControl.jobs_selectedSegmentIndex) {
        case 0:
            return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter | JobsOCGraphicCaptchaCharacterUnitLowercaseLetter | JobsOCGraphicCaptchaCharacterUnitNumber;
        case 1:
            return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter | JobsOCGraphicCaptchaCharacterUnitLowercaseLetter | JobsOCGraphicCaptchaCharacterUnitChinese;
        case 2:
            return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter | JobsOCGraphicCaptchaCharacterUnitNumber | JobsOCGraphicCaptchaCharacterUnitChinese;
        case 3:
            return JobsOCGraphicCaptchaCharacterUnitLowercaseLetter | JobsOCGraphicCaptchaCharacterUnitNumber | JobsOCGraphicCaptchaCharacterUnitChinese;
        default:
            break;
    }
    if (self.mixedFullControl.jobs_selectedSegmentIndex == 0) {
        return JobsOCGraphicCaptchaCharacterUnitUppercaseLetter |
               JobsOCGraphicCaptchaCharacterUnitLowercaseLetter |
               JobsOCGraphicCaptchaCharacterUnitNumber |
               JobsOCGraphicCaptchaCharacterUnitChinese;
    };return 0;
}

-(NSUInteger)mixedGroupCountByCharacterUnits:(JobsOCGraphicCaptchaCharacterUnit)characterUnits{
    NSUInteger count = 0;
    if (characterUnits & JobsOCGraphicCaptchaCharacterUnitUppercaseLetter) count++;
    if (characterUnits & JobsOCGraphicCaptchaCharacterUnitLowercaseLetter) count++;
    if (characterUnits & JobsOCGraphicCaptchaCharacterUnitNumber) count++;
    if (characterUnits & JobsOCGraphicCaptchaCharacterUnitChinese) count++;
    return count;
}

-(void)applyCurrentConfig{
    JobsOCGraphicCaptchaConfig *config = nil;
    JobsOCGraphicCaptchaCharacterUnit mixedUnits = [self currentMixedCharacterUnits];
    NSUInteger mixedGroupCount = [self mixedGroupCountByCharacterUnits:mixedUnits];
    if (mixedGroupCount) {
        config = JobsOCGraphicCaptchaConfig.defaultConfig;
        config.characterUnits = mixedUnits;
        config.caseSensitive = YES;
        config.mixedGroupCount = mixedGroupCount;
        if (self.lengthStepper.value < mixedGroupCount) {
            self.lengthStepper.value = mixedGroupCount;
        }
    } else {
        switch (self.modeControl.jobs_selectedSegmentIndex) {
            case 0:
                config = JobsOCGraphicCaptchaConfig.letterCaseSensitiveConfig;
                break;
            case 1:
                config = JobsOCGraphicCaptchaConfig.letterCaseInsensitiveConfig;
                break;
            case 2:
                config = JobsOCGraphicCaptchaConfig.numberConfig;
                break;
            case 3:
                config = JobsOCGraphicCaptchaConfig.chineseConfig;
                break;
            default:
                config = JobsOCGraphicCaptchaConfig.letterCaseSensitiveConfig;
                self.modeControl.bySelectedSegmentIndex(0);
                break;
        }
    }
    config.length = (NSUInteger)self.lengthStepper.value;
    self.lengthLab.byText([NSString stringWithFormat:@"长度：%.0f",self.lengthStepper.value]);
    self.captchaView.config = config;
    self.inputTF.byText(@"");
    self.resultLab
        .byText(@"等待输入校验".tr)
        .byTextCor(HEXCOLOR(0x6B7280));
}

-(void)modeChanged{
    self.mixedTwoControl.bySelectedSegmentIndex(UISegmentedControlNoSegment);
    self.mixedThreeControl.bySelectedSegmentIndex(UISegmentedControlNoSegment);
    self.mixedFullControl.bySelectedSegmentIndex(UISegmentedControlNoSegment);
    [self applyCurrentConfig];
}

-(void)mixedTwoChanged{
    self.modeControl.bySelectedSegmentIndex(UISegmentedControlNoSegment);
    self.mixedThreeControl.bySelectedSegmentIndex(UISegmentedControlNoSegment);
    self.mixedFullControl.bySelectedSegmentIndex(UISegmentedControlNoSegment);
    [self applyCurrentConfig];
}

-(void)mixedThreeChanged{
    self.modeControl.bySelectedSegmentIndex(UISegmentedControlNoSegment);
    self.mixedTwoControl.bySelectedSegmentIndex(UISegmentedControlNoSegment);
    self.mixedFullControl.bySelectedSegmentIndex(UISegmentedControlNoSegment);
    [self applyCurrentConfig];
}

-(void)mixedFullChanged{
    self.modeControl.bySelectedSegmentIndex(UISegmentedControlNoSegment);
    self.mixedTwoControl.bySelectedSegmentIndex(UISegmentedControlNoSegment);
    self.mixedThreeControl.bySelectedSegmentIndex(UISegmentedControlNoSegment);
    [self applyCurrentConfig];
}

-(void)lengthChanged{
    [self applyCurrentConfig];
}

-(void)refreshCaptcha{
    [self.captchaView refreshCaptcha];
    self.inputTF.byText(@"");
    self.resultLab
        .byText(@"已刷新".tr)
        .byTextCor(HEXCOLOR(0x1D7FF2));
}

-(void)validateCaptcha{
    BOOL passed = [self.captchaView validateInput:self.inputTF.text];
    self.resultLab
        .byText(passed ? @"校验通过".tr : @"校验失败".tr)
        .byTextCor(passed ? HEXCOLOR(0x159947) : HEXCOLOR(0xD14343));
}

-(UIButton *)buttonByTitle:(NSString *)title
                    action:(SEL)action{
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title.tr)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(15))
            .jobsResetBtnTitleCor(UIColor.whiteColor)
            .jobsResetBtnBgCor(HEXCOLOR(0x263342))
            .byAddTarget(self, action, UIControlEventTouchUpInside)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer
                    .byCornerRadius(JobsWidth(8))
                    .byMasksToBounds(YES);
            });
    });
}
#pragma mark —— LazyLoad
-(UIView *)contentView{
    if (!_contentView) {
        @jobs_weakify(self)
        _contentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.whiteColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(10))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.right.equalTo(self.view).inset(JobsWidth(20));
                    make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(JobsWidth(28));
                });
        });
        self.captchaView.byHidden(NO);
        self.modeControl.byHidden(NO);
        self.mixedTwoControl.byHidden(NO);
        self.mixedThreeControl.byHidden(NO);
        self.mixedFullControl.byHidden(NO);
        self.lengthLab.byHidden(NO);
        self.lengthStepper.byHidden(NO);
        self.inputTF.byHidden(NO);
        self.refreshBtn.byHidden(NO);
        self.validateBtn.byHidden(NO);
        self.resultLab.byHidden(NO);
    };return _contentView;
}

-(JobsOCGraphicCaptchaView *)captchaView{
    if (!_captchaView) {
        @jobs_weakify(self)
        _captchaView = JobsOCGraphicCaptchaView.new;
        _captchaView.captchaBackgroundColor = HEXCOLOR(0xFFF7EA);
        _captchaView.byFont(UIFontWeightSemiboldSize(24));
        _captchaView.refreshBlock = ^(NSString *captchaText) {
            JobsLog(@"当前图形验证码 = %@",captchaText);
        };
        _captchaView.addOn(self.contentView);
        [_captchaView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.contentView).offset(JobsWidth(22));
            make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(88));
        }];
        _captchaView.layer
            .byCornerRadius(JobsWidth(8))
            .byMasksToBounds(YES);
    };return _captchaView;
}

-(UISegmentedControl *)modeControl{
    if (!_modeControl) {
        @jobs_weakify(self)
        _modeControl = jobsMakeSegmentedControl(@[@"Aa",@"aA",@"123",@"汉字"], ^(__kindof UISegmentedControl * _Nullable segmentedControl) {
            segmentedControl
                .bySelectedSegmentIndex(UISegmentedControlNoSegment)
                .byAddTarget(self, @selector(modeChanged), UIControlEventValueChanged)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.captchaView.mas_bottom).offset(JobsWidth(18));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
                    make.height.mas_equalTo(JobsWidth(34));
                });
        });
    };return _modeControl;
}

-(UISegmentedControl *)mixedTwoControl{
    if (!_mixedTwoControl) {
        @jobs_weakify(self)
        _mixedTwoControl = jobsMakeSegmentedControl(@[@"大+小",@"大+数",@"大+汉",@"小+数",@"小+汉",@"数+汉"], ^(__kindof UISegmentedControl * _Nullable segmentedControl) {
            segmentedControl
                .bySelectedSegmentIndex(UISegmentedControlNoSegment)
                .byAddTarget(self, @selector(mixedTwoChanged), UIControlEventValueChanged)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.modeControl.mas_bottom).offset(JobsWidth(10));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
                    make.height.mas_equalTo(JobsWidth(34));
                });
        });
    };return _mixedTwoControl;
}

-(UISegmentedControl *)mixedThreeControl{
    if (!_mixedThreeControl) {
        @jobs_weakify(self)
        _mixedThreeControl = jobsMakeSegmentedControl(@[@"大+小+数",@"大+小+汉",@"大+数+汉",@"小+数+汉"], ^(__kindof UISegmentedControl * _Nullable segmentedControl) {
            segmentedControl
                .bySelectedSegmentIndex(UISegmentedControlNoSegment)
                .byAddTarget(self, @selector(mixedThreeChanged), UIControlEventValueChanged)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.mixedTwoControl.mas_bottom).offset(JobsWidth(10));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
                    make.height.mas_equalTo(JobsWidth(34));
                });
        });
    };return _mixedThreeControl;
}

-(UISegmentedControl *)mixedFullControl{
    if (!_mixedFullControl) {
        @jobs_weakify(self)
        _mixedFullControl = jobsMakeSegmentedControl(@[@"大+小+数+汉"], ^(__kindof UISegmentedControl * _Nullable segmentedControl) {
            segmentedControl
                .bySelectedSegmentIndex(0)
                .byAddTarget(self, @selector(mixedFullChanged), UIControlEventValueChanged)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.mixedThreeControl.mas_bottom).offset(JobsWidth(10));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
                    make.height.mas_equalTo(JobsWidth(34));
                });
        });
    };return _mixedFullControl;
}

-(UILabel *)lengthLab{
    if (!_lengthLab) {
        @jobs_weakify(self)
        _lengthLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor(HEXCOLOR(0x263342))
                .byFont(UIFontWeightRegularSize(15))
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.equalTo(self.contentView).offset(JobsWidth(22));
                    make.top.equalTo(self.mixedFullControl.mas_bottom).offset(JobsWidth(18));
                    make.height.mas_equalTo(JobsWidth(32));
                });
        });
    };return _lengthLab;
}

-(UIStepper *)lengthStepper{
    if (!_lengthStepper) {
        @jobs_weakify(self)
        _lengthStepper = UIStepper.new;
        _lengthStepper.minimumValue = 1;
        _lengthStepper.maximumValue = 8;
        _lengthStepper.value = 4;
        _lengthStepper.byAddTarget(self, @selector(lengthChanged), UIControlEventValueChanged);
        _lengthStepper.addOn(self.contentView);
        [_lengthStepper mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.right.equalTo(self.contentView).offset(-JobsWidth(22));
            make.centerY.equalTo(self.lengthLab);
        }];
    };return _lengthStepper;
}

-(UITextField *)inputTF{
    if (!_inputTF) {
        @jobs_weakify(self)
        _inputTF = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byPlaceholder(@"输入图形验证码".tr)
                .byTextCor(HEXCOLOR(0x263342))
                .byFont(UIFontWeightRegularSize(16))
                .byBorderStyle(UITextBorderStyleNone)
                .byClearButtonMode(UITextFieldViewModeWhileEditing)
                .byAutocorrectionType(UITextAutocorrectionTypeNo)
                .byAutocapitalizationType(UITextAutocapitalizationTypeNone)
                .byLeftView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    view.byFrame(CGRectMake(0, 0, JobsWidth(14), 1));
                }))
                .byLeftViewMode(UITextFieldViewModeAlways)
                .byTintColor(HEXCOLOR(0x1D7FF2))
                .byBgColor(HEXCOLOR(0xF0F3F7))
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer.byCornerRadius(JobsWidth(8));
                })
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.lengthLab.mas_bottom).offset(JobsWidth(18));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
                    make.height.mas_equalTo(JobsWidth(46));
                });
        });
    };return _inputTF;
}

-(UIButton *)refreshBtn{
    if (!_refreshBtn) {
        @jobs_weakify(self)
        _refreshBtn = [self buttonByTitle:@"刷新"
                                    action:@selector(refreshCaptcha)];
        _refreshBtn.addOn(self.contentView);
        [_refreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.inputTF.mas_bottom).offset(JobsWidth(18));
            make.left.equalTo(self.contentView).offset(JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(42));
        }];
    };return _refreshBtn;
}

-(UIButton *)validateBtn{
    if (!_validateBtn) {
        @jobs_weakify(self)
        _validateBtn = [self buttonByTitle:@"校验"
                                     action:@selector(validateCaptcha)];
        _validateBtn.addOn(self.contentView);
        [_validateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.width.height.equalTo(self.refreshBtn);
            make.left.equalTo(self.refreshBtn.mas_right).offset(JobsWidth(14));
            make.right.equalTo(self.contentView).offset(-JobsWidth(22));
        }];
    };return _validateBtn;
}

-(UILabel *)resultLab{
    if (!_resultLab) {
        @jobs_weakify(self)
        _resultLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextAlignment(NSTextAlignmentCenter)
                .byFont(UIFontWeightMediumSize(15))
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.refreshBtn.mas_bottom).offset(JobsWidth(18));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
                    make.bottom.equalTo(self.contentView).offset(-JobsWidth(22));
                    make.height.mas_equalTo(JobsWidth(24));
                });
        });
    };return _resultLab;
}

@end
