//
//  JobsCNIDDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsCNIDDemoVC.h"

@interface JobsCNIDDemoVC ()

Prop_strong()UIView *contentView;
Prop_strong()UITextField *inputTF;
Prop_strong()UIButton *exampleBtn;
Prop_strong()UIButton *validateBtn;
Prop_strong()UILabel *resultLab;

@end

@implementation JobsCNIDDemoVC
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
            data.byText(@"身份证校验 Demo".tr);
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
}

#pragma mark —— Actions
-(void)fillExample{
    self.inputTF.text = @"510105199307315321";
    [self updateResult:@"已填入示例号码" success:YES];
}

-(void)validateIDCard{
    NSError *error = nil;
    NSString *normalized = [NSObject jobs_validateCNID:self.inputTF.text error:&error];
    if (normalized.length) {
        [self updateResult:[NSString stringWithFormat:@"校验成功\n标准化结果：%@",normalized] success:YES];
    } else {
        [self updateResult:error.localizedDescription ?: @"校验失败" success:NO];
    }
}

-(void)updateResult:(NSString *)text
            success:(BOOL)success{
    self.resultLab.text = text.tr;
    self.resultLab.textColor = success ? HEXCOLOR(0x159947) : HEXCOLOR(0xD14343);
    self.resultLab.backgroundColor = success ? HEXCOLOR(0xEAF8EF) : HEXCOLOR(0xFFF0F0);
}

-(UIButton *)buttonByTitle:(NSString *)title
                    action:(SEL)action
           backgroundColor:(UIColor *)backgroundColor{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title.tr forState:UIControlStateNormal];
    button.titleLabel.font = UIFontWeightMediumSize(15);
    button.backgroundColor = backgroundColor;
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
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(JobsWidth(64));
        }];
        self.inputTF.hidden = NO;
        self.exampleBtn.hidden = NO;
        self.validateBtn.hidden = NO;
        self.resultLab.hidden = NO;
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.bottom.equalTo(self.resultLab.mas_bottom).offset(JobsWidth(24));
        }];
    };return _contentView;
}

-(UITextField *)inputTF{
    if (!_inputTF) {
        @jobs_weakify(self)
        _inputTF = UITextField.new;
        _inputTF.placeholder = @"请输入身份证号码".tr;
        _inputTF.textColor = HEXCOLOR(0x263342);
        _inputTF.tintColor = HEXCOLOR(0x1D7FF2);
        _inputTF.font = UIFontWeightRegularSize(16);
        _inputTF.borderStyle = UITextBorderStyleNone;
        _inputTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _inputTF.autocorrectionType = UITextAutocorrectionTypeNo;
        _inputTF.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
        _inputTF.backgroundColor = HEXCOLOR(0xF0F3F7);
        _inputTF.layer.cornerRadius = JobsWidth(8);
        _inputTF.leftView = [UIView.alloc initWithFrame:CGRectMake(0, 0, JobsWidth(14), 1)];
        _inputTF.leftViewMode = UITextFieldViewModeAlways;
        [self.contentView addSubview:_inputTF];
        [_inputTF mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.contentView).offset(JobsWidth(24));
            make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(46));
        }];
    };return _inputTF;
}

-(UIButton *)exampleBtn{
    if (!_exampleBtn) {
        @jobs_weakify(self)
        _exampleBtn = [self buttonByTitle:@"填入示例"
                                    action:@selector(fillExample)
                           backgroundColor:HEXCOLOR(0x263342)];
        [self.contentView addSubview:_exampleBtn];
        [_exampleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.inputTF.mas_bottom).offset(JobsWidth(18));
            make.left.equalTo(self.contentView).offset(JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(42));
        }];
    };return _exampleBtn;
}

-(UIButton *)validateBtn{
    if (!_validateBtn) {
        @jobs_weakify(self)
        _validateBtn = [self buttonByTitle:@"校验"
                                     action:@selector(validateIDCard)
                            backgroundColor:HEXCOLOR(0x1D7FF2)];
        [self.contentView addSubview:_validateBtn];
        [_validateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.width.height.equalTo(self.exampleBtn);
            make.left.equalTo(self.exampleBtn.mas_right).offset(JobsWidth(12));
            make.right.equalTo(self.contentView).offset(-JobsWidth(22));
            make.width.equalTo(self.exampleBtn);
        }];
    };return _validateBtn;
}

-(UILabel *)resultLab{
    if (!_resultLab) {
        @jobs_weakify(self)
        _resultLab = UILabel.new;
        _resultLab.text = @"等待输入校验".tr;
        _resultLab.textColor = HEXCOLOR(0x6B7280);
        _resultLab.font = UIFontWeightRegularSize(15);
        _resultLab.numberOfLines = 0;
        _resultLab.textAlignment = NSTextAlignmentCenter;
        _resultLab.backgroundColor = HEXCOLOR(0xF0F3F7);
        _resultLab.layer.cornerRadius = JobsWidth(8);
        _resultLab.layer.masksToBounds = YES;
        [self.contentView addSubview:_resultLab];
        [_resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.exampleBtn.mas_bottom).offset(JobsWidth(18));
            make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
            make.height.mas_greaterThanOrEqualTo(JobsWidth(72));
        }];
    };return _resultLab;
}

@end
