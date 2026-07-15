//
//  JobsOCKeyboardMgrDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "JobsOCKeyboardMgrDemoVC.h"

@interface JobsOCKeyboardMgrDemoVC ()

Prop_strong()UIView *cardView;
Prop_strong()UILabel *titleLab;
Prop_strong()UIStackView *formStackView;
Prop_strong()UITextField *accountTF;
Prop_strong()UITextField *passwordTF;
Prop_strong()UITextField *accessoryTF;
Prop_strong()UIView *accessoryBar;

@end

@implementation JobsOCKeyboardMgrDemoVC
- (void)dealloc{
    [JobsOCKeyboardMgr.shared clearConfigByOwner:self];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byTextCor(HEXCOLOR(0x263342));
            data.byText(@"JobsOCKeyboardMgr");
            data.byFont(UIFontWeightMediumSize(17));
        })
        .byBgCor(HEXCOLOR(0xF5F7FA))
        .byNavBgCor(HEXCOLOR(0xF5F7FA));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(HEXCOLOR(0xF5F7FA));
    self.cardView.hidden = NO;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self jobs_configKeyboardMgr];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [JobsOCKeyboardMgr.shared clearConfigByOwner:self];
}
#pragma mark —— Config
-(void)jobs_configKeyboardMgr{
    @jobs_weakify(self)
    JobsOCKeyboardMgr.shared.byConfig(jobsMakeOCKeyboardConfig(^(__kindof JobsOCKeyboardConfig * _Nullable data) {
        @jobs_strongify(self)
        data.byOwner(self)
            .byTargetView(self.cardView)
            .byContainerView(self.view)
            .byInputFields(self.jobs_inputFields)
            .byExtraSpacing(JobsWidth(18))
            .byTopSpacing(JobsWidth(16))
            .byShouldFlowByReturnKey(YES)
            .byShouldResignOnTouchOutside(YES)
            .byAccessoryPolicy(JobsOCKeyboardAccessoryPolicyAuto);
    }));
}

-(NSArray <UITextField *>*)jobs_inputFields{
    return @[self.accountTF,self.passwordTF,self.accessoryTF];
}

-(UITextField *)jobs_textFieldByPlaceholder:(NSString *)placeholder
                                     secure:(BOOL)secure{
    UITextField *textField = UITextField.new;
    textField.placeholder = placeholder.tr;
    textField.secureTextEntry = secure;
    textField.textColor = HEXCOLOR(0x263342);
    textField.tintColor = HEXCOLOR(0x1D7FF2);
    textField.font = UIFontWeightRegularSize(16);
    textField.borderStyle = UITextBorderStyleNone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.backgroundColor = HEXCOLOR(0xF0F3F7);
    textField.layer.cornerRadius = JobsWidth(12);
    textField.leftView = [UIView.alloc initWithFrame:CGRectMake(0, 0, JobsWidth(16), JobsWidth(1))];
    textField.leftViewMode = UITextFieldViewModeAlways;
    return textField;
}
#pragma mark —— LazyLoad
-(UIView *)cardView{
    if (!_cardView) {
        @jobs_weakify(self)
        _cardView = UIView.new;
        _cardView.backgroundColor = UIColor.whiteColor;
        _cardView.layer.cornerRadius = JobsWidth(18);
        [self.view addSubview:_cardView];
        [_cardView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.left.equalTo(self.view).offset(JobsWidth(24));
            make.right.equalTo(self.view).offset(-JobsWidth(24));
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(28));
        }];
        _cardView.layer.shadowColor = HEXCOLOR(0xB8C1CC).CGColor;
        _cardView.layer.shadowOpacity = 0.22f;
        _cardView.layer.shadowRadius = JobsWidth(18);
        _cardView.layer.shadowOffset = CGSizeMake(0, JobsWidth(8));
        (void)self.titleLab;
        (void)self.formStackView;
    };return _cardView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = UILabel.new;
        _titleLab.text = @"Keyboard Form";
        _titleLab.textColor = HEXCOLOR(0x263342);
        _titleLab.font = UIFontWeightMediumSize(21);
        [self.cardView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.cardView).offset(JobsWidth(24));
            make.left.right.equalTo(self.cardView).inset(JobsWidth(22));
        }];
    };return _titleLab;
}

-(UIStackView *)formStackView{
    if (!_formStackView) {
        @jobs_weakify(self)
        _formStackView = UIStackView.new;
        _formStackView.axis = UILayoutConstraintAxisVertical;
        _formStackView.distribution = UIStackViewDistributionFill;
        _formStackView.alignment = UIStackViewAlignmentFill;
        _formStackView.spacing = JobsWidth(14);
        [self.cardView addSubview:_formStackView];
        [_formStackView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(20));
            make.left.right.equalTo(self.cardView).inset(JobsWidth(22));
            make.bottom.equalTo(self.cardView).offset(-JobsWidth(24));
        }];
        [_formStackView addArrangedSubview:self.accountTF];
        [_formStackView addArrangedSubview:self.passwordTF];
        [_formStackView addArrangedSubview:self.accessoryTF];
        [self.accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(52));
        }];
        [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(52));
        }];
        [self.accessoryTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsWidth(52));
        }];
    };return _formStackView;
}

-(UITextField *)accountTF{
    if (!_accountTF) {
        _accountTF = [self jobs_textFieldByPlaceholder:@"User" secure:NO];
        _accountTF.returnKeyType = UIReturnKeyNext;
    };return _accountTF;
}

-(UITextField *)passwordTF{
    if (!_passwordTF) {
        _passwordTF = [self jobs_textFieldByPlaceholder:@"Password" secure:YES];
        _passwordTF.returnKeyType = UIReturnKeyNext;
    };return _passwordTF;
}

-(UITextField *)accessoryTF{
    if (!_accessoryTF) {
        _accessoryTF = [self jobs_textFieldByPlaceholder:@"Code" secure:NO];
        _accessoryTF.returnKeyType = UIReturnKeyDone;
        _accessoryTF.inputAccessoryView = self.accessoryBar;
    };return _accessoryTF;
}

-(UIView *)accessoryBar{
    if (!_accessoryBar) {
        UIView *bar = [UIView.alloc initWithFrame:CGRectMake(0, 0, JobsMainScreen_WIDTH(), JobsWidth(56))];
        bar.backgroundColor = HEXCOLOR(0x263342);
        UILabel *label = UILabel.new;
        label.text = @"Input Accessory";
        label.textColor = UIColor.whiteColor;
        label.font = UIFontWeightMediumSize(15);
        [bar addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bar).offset(JobsWidth(18));
            make.centerY.equalTo(bar);
        }];
        UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [doneBtn setTitle:@"Done" forState:UIControlStateNormal];
        doneBtn.titleLabel.font = UIFontWeightMediumSize(15);
        [doneBtn addTarget:self
                    action:@selector(jobs_endEditing)
          forControlEvents:UIControlEventTouchUpInside];
        [bar addSubview:doneBtn];
        [doneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(bar).offset(-JobsWidth(18));
            make.centerY.equalTo(bar);
        }];
        _accessoryBar = bar;
    };return _accessoryBar;
}

-(void)jobs_endEditing{
    [self.view endEditing:YES];
}

@end
