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
    self.cardView.byHidden(NO);
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
    return jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
        textField
            .byPlaceholder(placeholder.tr)
            .bySecureTextEntry(secure)
            .byTextCor(HEXCOLOR(0x263342))
            .byFont(UIFontWeightRegularSize(16))
            .byBorderStyle(UITextBorderStyleNone)
            .byClearButtonMode(UITextFieldViewModeWhileEditing)
            .byLeftView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                view.byFrame(CGRectMake(0, 0, JobsWidth(16), JobsWidth(1)));
            }))
            .byLeftViewMode(UITextFieldViewModeAlways)
            .byTintColor(HEXCOLOR(0x1D7FF2))
            .byBgColor(HEXCOLOR(0xF0F3F7))
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer.byCornerRadius(JobsWidth(12));
            });
    });
}
#pragma mark —— LazyLoad
-(UIView *)cardView{
    if (!_cardView) {
        @jobs_weakify(self)
        _cardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.whiteColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(18))
                        .byShadowColor(HEXCOLOR(0xB8C1CC).CGColor)
                        .byShadowOpacity(0.22f)
                        .byShadowRadius(JobsWidth(18))
                        .byShadowOffset(CGSizeMake(0, JobsWidth(8)));
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.equalTo(self.view).offset(JobsWidth(24));
                    make.right.equalTo(self.view).offset(-JobsWidth(24));
                    make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(28));
                });
        });
        (void)self.titleLab;
        (void)self.formStackView;
    };return _cardView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"Keyboard Form".tr)
                .byTextCor(HEXCOLOR(0x263342))
                .byFont(UIFontWeightMediumSize(21))
                .addOn(self.cardView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.cardView).offset(JobsWidth(24));
                    make.left.right.equalTo(self.cardView).inset(JobsWidth(22));
                });
        });
    };return _titleLab;
}

-(UIStackView *)formStackView{
    if (!_formStackView) {
        @jobs_weakify(self)
        _formStackView = jobsMakeStackView(^(__kindof UIStackView * _Nullable stackView) {
            stackView
                .byAxis(UILayoutConstraintAxisVertical)
                .byDistribution(UIStackViewDistributionFill)
                .byAlignment(UIStackViewAlignmentFill)
                .bySpacing(JobsWidth(14))
                .addOn(self.cardView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(20));
                    make.left.right.equalTo(self.cardView).inset(JobsWidth(22));
                    make.bottom.equalTo(self.cardView).offset(-JobsWidth(24));
                });
        });
        _formStackView.add(self.accountTF);
        _formStackView.add(self.passwordTF);
        _formStackView.add(self.accessoryTF);
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
        _accountTF.byReturnKeyType(UIReturnKeyNext);
    };return _accountTF;
}

-(UITextField *)passwordTF{
    if (!_passwordTF) {
        _passwordTF = [self jobs_textFieldByPlaceholder:@"Password" secure:YES];
        _passwordTF.byReturnKeyType(UIReturnKeyNext);
    };return _passwordTF;
}

-(UITextField *)accessoryTF{
    if (!_accessoryTF) {
        _accessoryTF = [self jobs_textFieldByPlaceholder:@"Code" secure:NO];
        _accessoryTF
            .byReturnKeyType(UIReturnKeyDone)
            .byInputAccessoryView(self.accessoryBar);
    };return _accessoryTF;
}

-(UIView *)accessoryBar{
    if (!_accessoryBar) {
        UIView *bar = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byFrame(CGRectMake(0, 0, JobsMainScreen_WIDTH(), JobsWidth(56)))
                .byBgColor(HEXCOLOR(0x263342));
        });
        jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"Input Accessory".tr)
                .byTextCor(UIColor.whiteColor)
                .byFont(UIFontWeightMediumSize(15))
                .addOn(bar)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(bar).offset(JobsWidth(18));
                    make.centerY.equalTo(bar);
                });
        });
        jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"Done".tr)
                .jobsResetBtnTitleFont(UIFontWeightMediumSize(15))
                .byAddTarget(self, @selector(jobs_endEditing), UIControlEventTouchUpInside)
                .addOn(bar)
                .byAdd(^(MASConstraintMaker *make) {
                    make.right.equalTo(bar).offset(-JobsWidth(18));
                    make.centerY.equalTo(bar);
                });
        });
        _accessoryBar = bar;
    };return _accessoryBar;
}

-(void)jobs_endEditing{
    self.view.byEndEditing(YES);
}

@end
