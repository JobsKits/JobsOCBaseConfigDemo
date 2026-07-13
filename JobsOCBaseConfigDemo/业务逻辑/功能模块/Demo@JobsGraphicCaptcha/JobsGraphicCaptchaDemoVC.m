//
//  JobsGraphicCaptchaDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsGraphicCaptchaDemoVC.h"

@interface JobsGraphicCaptchaDemoVC ()

Prop_strong()UIView *contentView;
Prop_strong()JobsGraphicCaptchaView *captchaView;
Prop_strong()UISegmentedControl *modeControl;
Prop_strong()UISegmentedControl *mixedModeControl;
Prop_strong()UILabel *lengthLab;
Prop_strong()UIStepper *lengthStepper;
Prop_strong()UITextField *inputTF;
Prop_strong()UIButton *refreshBtn;
Prop_strong()UIButton *validateBtn;
Prop_strong()UILabel *resultLab;

@end

@implementation JobsGraphicCaptchaDemoVC

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
            data.byText(@"JobsGraphicCaptcha");
            data.byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(HEXCOLOR(0xF5F7FA))
        .byNavBgCor(HEXCOLOR(0xF5F7FA));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(HEXCOLOR(0xF5F7FA));
    self.contentView.hidden = NO;
    [self applyCurrentConfig];
}
#pragma mark —— Actions
-(NSUInteger)currentMixedGroupCount{
    switch (self.mixedModeControl.selectedSegmentIndex) {
        case 0:
            return 2;
        case 1:
            return 3;
        case 2:
            return 4;
        default:
            return 0;
    }
}

-(void)applyCurrentConfig{
    JobsGraphicCaptchaConfig *config = nil;
    NSUInteger mixedGroupCount = [self currentMixedGroupCount];
    if (mixedGroupCount) {
        switch (mixedGroupCount) {
            case 2:
                config = JobsGraphicCaptchaConfig.twoMixedConfig;
                break;
            case 3:
                config = JobsGraphicCaptchaConfig.threeMixedConfig;
                break;
            default:
                config = JobsGraphicCaptchaConfig.fullMixedConfig;
                break;
        }
        if (self.lengthStepper.value < mixedGroupCount) {
            self.lengthStepper.value = mixedGroupCount;
        }
    } else {
        switch (self.modeControl.selectedSegmentIndex) {
            case 0:
                config = JobsGraphicCaptchaConfig.letterCaseSensitiveConfig;
                break;
            case 1:
                config = JobsGraphicCaptchaConfig.letterCaseInsensitiveConfig;
                break;
            case 2:
                config = JobsGraphicCaptchaConfig.numberConfig;
                break;
            case 3:
                config = JobsGraphicCaptchaConfig.chineseConfig;
                break;
            default:
                config = JobsGraphicCaptchaConfig.letterCaseSensitiveConfig;
                self.modeControl.selectedSegmentIndex = 0;
                break;
        }
    }
    config.length = (NSUInteger)self.lengthStepper.value;
    self.lengthLab.text = [NSString stringWithFormat:@"长度：%.0f",self.lengthStepper.value];
    self.captchaView.config = config;
    self.inputTF.text = @"";
    self.resultLab.text = @"等待输入校验".tr;
    self.resultLab.textColor = HEXCOLOR(0x6B7280);
}

-(void)modeChanged{
    self.mixedModeControl.selectedSegmentIndex = UISegmentedControlNoSegment;
    [self applyCurrentConfig];
}

-(void)mixedModeChanged{
    self.modeControl.selectedSegmentIndex = UISegmentedControlNoSegment;
    [self applyCurrentConfig];
}

-(void)lengthChanged{
    [self applyCurrentConfig];
}

-(void)refreshCaptcha{
    [self.captchaView refreshCaptcha];
    self.inputTF.text = @"";
    self.resultLab.text = @"已刷新".tr;
    self.resultLab.textColor = HEXCOLOR(0x1D7FF2);
}

-(void)validateCaptcha{
    BOOL passed = [self.captchaView validateInput:self.inputTF.text];
    self.resultLab.text = passed ? @"校验通过".tr : @"校验失败".tr;
    self.resultLab.textColor = passed ? HEXCOLOR(0x159947) : HEXCOLOR(0xD14343);
}

-(UIButton *)buttonByTitle:(NSString *)title
                    action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title.tr forState:UIControlStateNormal];
    button.titleLabel.font = UIFontWeightMediumSize(15);
    button.backgroundColor = HEXCOLOR(0x263342);
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    button.layer.cornerRadius = JobsWidth(8);
    button.layer.masksToBounds = YES;
    [button addTarget:self
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    return button;
}
#pragma mark —— LazyLoad
-(UIView *)contentView{
    if (!_contentView) {
        @jobs_weakify(self)
        _contentView = UIView.new;
        _contentView.backgroundColor = UIColor.whiteColor;
        _contentView.layer.cornerRadius = JobsWidth(10);
        _contentView.layer.masksToBounds = YES;
        [self.view addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.left.right.equalTo(self.view).inset(JobsWidth(20));
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(JobsWidth(28));
        }];
        self.captchaView.hidden = NO;
        self.modeControl.hidden = NO;
        self.mixedModeControl.hidden = NO;
        self.lengthLab.hidden = NO;
        self.lengthStepper.hidden = NO;
        self.inputTF.hidden = NO;
        self.refreshBtn.hidden = NO;
        self.validateBtn.hidden = NO;
        self.resultLab.hidden = NO;
    };return _contentView;
}

-(JobsGraphicCaptchaView *)captchaView{
    if (!_captchaView) {
        @jobs_weakify(self)
        _captchaView = JobsGraphicCaptchaView.new;
        _captchaView.captchaBackgroundColor = HEXCOLOR(0xFFF7EA);
        _captchaView.font = UIFontWeightSemiboldSize(24);
        _captchaView.refreshBlock = ^(NSString *captchaText) {
            JobsLog(@"当前图形验证码 = %@",captchaText);
        };
        [self.contentView addSubview:_captchaView];
        [_captchaView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.contentView).offset(JobsWidth(22));
            make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(88));
        }];
        _captchaView.layer.cornerRadius = JobsWidth(8);
        _captchaView.layer.masksToBounds = YES;
    };return _captchaView;
}

-(UISegmentedControl *)modeControl{
    if (!_modeControl) {
        @jobs_weakify(self)
        _modeControl = [UISegmentedControl.alloc initWithItems:@[@"Aa",@"aA",@"123",@"汉字"]];
        _modeControl.selectedSegmentIndex = UISegmentedControlNoSegment;
        [_modeControl addTarget:self
                         action:@selector(modeChanged)
               forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:_modeControl];
        [_modeControl mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.captchaView.mas_bottom).offset(JobsWidth(18));
            make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(34));
        }];
    };return _modeControl;
}

-(UISegmentedControl *)mixedModeControl{
    if (!_mixedModeControl) {
        @jobs_weakify(self)
        _mixedModeControl = [UISegmentedControl.alloc initWithItems:@[@"两两混合",@"三三混合",@"全部混合"]];
        _mixedModeControl.selectedSegmentIndex = 0;
        [_mixedModeControl addTarget:self
                              action:@selector(mixedModeChanged)
                    forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:_mixedModeControl];
        [_mixedModeControl mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.modeControl.mas_bottom).offset(JobsWidth(10));
            make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(34));
        }];
    };return _mixedModeControl;
}

-(UILabel *)lengthLab{
    if (!_lengthLab) {
        @jobs_weakify(self)
        _lengthLab = UILabel.new;
        _lengthLab.textColor = HEXCOLOR(0x263342);
        _lengthLab.font = UIFontWeightRegularSize(15);
        [self.contentView addSubview:_lengthLab];
        [_lengthLab mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.left.equalTo(self.contentView).offset(JobsWidth(22));
            make.top.equalTo(self.mixedModeControl.mas_bottom).offset(JobsWidth(18));
            make.height.mas_equalTo(JobsWidth(32));
        }];
    };return _lengthLab;
}

-(UIStepper *)lengthStepper{
    if (!_lengthStepper) {
        @jobs_weakify(self)
        _lengthStepper = UIStepper.new;
        _lengthStepper.minimumValue = 1;
        _lengthStepper.maximumValue = 8;
        _lengthStepper.value = 4;
        [_lengthStepper addTarget:self
                           action:@selector(lengthChanged)
                 forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:_lengthStepper];
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
        _inputTF = UITextField.new;
        _inputTF.placeholder = @"输入图形验证码".tr;
        _inputTF.textColor = HEXCOLOR(0x263342);
        _inputTF.tintColor = HEXCOLOR(0x1D7FF2);
        _inputTF.font = UIFontWeightRegularSize(16);
        _inputTF.borderStyle = UITextBorderStyleNone;
        _inputTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _inputTF.autocorrectionType = UITextAutocorrectionTypeNo;
        _inputTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _inputTF.backgroundColor = HEXCOLOR(0xF0F3F7);
        _inputTF.layer.cornerRadius = JobsWidth(8);
        _inputTF.leftView = [UIView.alloc initWithFrame:CGRectMake(0, 0, JobsWidth(14), 1)];
        _inputTF.leftViewMode = UITextFieldViewModeAlways;
        [self.contentView addSubview:_inputTF];
        [_inputTF mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.lengthLab.mas_bottom).offset(JobsWidth(18));
            make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(46));
        }];
    };return _inputTF;
}

-(UIButton *)refreshBtn{
    if (!_refreshBtn) {
        @jobs_weakify(self)
        _refreshBtn = [self buttonByTitle:@"刷新"
                                    action:@selector(refreshCaptcha)];
        [self.contentView addSubview:_refreshBtn];
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
        [self.contentView addSubview:_validateBtn];
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
        _resultLab = UILabel.new;
        _resultLab.textAlignment = NSTextAlignmentCenter;
        _resultLab.font = UIFontWeightMediumSize(15);
        [self.contentView addSubview:_resultLab];
        [_resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.refreshBtn.mas_bottom).offset(JobsWidth(18));
            make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
            make.bottom.equalTo(self.contentView).offset(-JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(24));
        }];
    };return _resultLab;
}

@end
