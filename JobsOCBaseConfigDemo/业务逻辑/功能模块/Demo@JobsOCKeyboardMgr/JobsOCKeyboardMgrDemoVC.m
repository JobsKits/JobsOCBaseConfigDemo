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
Prop_strong()UILabel *accessoryTitleLab;
Prop_strong()UIButton *accessoryDoneBtn;

@end

@implementation JobsOCKeyboardMgrDemoVC
- (void)dealloc{
    ((JobsOCKeyboardMgr *)JobsOCKeyboardMgr.shared()).clearConfigByOwner(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCKeyboardMgrDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byTextCor(JobsLabelColor)
                    .byText(@"JobsOCKeyboardMgr")
                    .byFont(UIFontWeightMediumSize(17));
            })
            .byBgCor(HEXCOLOR(0xF5F7FA))
            .byNavBgCor(HEXCOLOR(0xF5F7FA));
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCKeyboardMgrDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.cardView.byHidden(NO);
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCKeyboardMgrDemoVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        self.jobs_configKeyboardMgr();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCKeyboardMgrDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        ((JobsOCKeyboardMgr *)JobsOCKeyboardMgr.shared()).clearConfigByOwner(self);
    };
}
#pragma mark —— Config
-(jobsByVoidBlock _Nonnull)jobs_configKeyboardMgr{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        ((JobsOCKeyboardMgr *)JobsOCKeyboardMgr.shared()).byConfig(jobsMakeOCKeyboardConfig(^(__kindof JobsOCKeyboardConfig * _Nullable data) {
            @jobs_strongify(self)
            data.byOwner(self)
                .byTargetView(self.cardView)
                .byContainerView(self.view)
                .byInputFields(self.jobs_inputFields())
                .byExtraSpacing(JobsWidth(18))
                .byTopSpacing(JobsWidth(16))
                .byShouldFlowByReturnKey(YES)
                .byShouldResignOnTouchOutside(YES)
                .byAccessoryPolicy(JobsOCKeyboardAccessoryPolicyAuto);
        }));
    };
}

-(JobsRetNSArrayUITextFieldByVoidBlock _Nonnull)jobs_inputFields{
    @jobs_weakify(self)
    return ^NSArray <UITextField *>*{
        @jobs_strongify(self)
        if (!self) return nil;
        return @[self.accountTF,self.passwordTF,self.accessoryTF];
    };
}

-(UITextField *)jobs_textFieldByPlaceholder:(NSString *)placeholder
                                     secure:(BOOL)secure{
    return jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
        textField
            .byPlaceholder(placeholder.jobsTr())
            .bySecureTextEntry(secure)
            .byTextCor(JobsLabelColor)
            .byFont(UIFontWeightRegularSize(16))
            .byBorderStyle(UITextBorderStyleNone)
            .byClearButtonMode(UITextFieldViewModeWhileEditing)
            .byLeftView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                view.byFrame(CGRectMake(0, 0, JobsWidth(16), JobsWidth(1)));
            }))
            .byLeftViewMode(UITextFieldViewModeAlways)
            .byTintColor(HEXCOLOR(0x1D7FF2))
            .byBgColor(JobsSecondarySystemBackgroundColor)
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
            .byBgColor(JobsSecondarySystemBackgroundColor)
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
                .byText(@"Keyboard Form".jobsTr())
                .byTextCor(JobsLabelColor)
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
        _formStackView
            .byAddArrangedSubview(self.accountTF)
            .byAddArrangedSubview(self.passwordTF)
            .byAddArrangedSubview(self.accessoryTF);
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
        _accessoryBar = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byFrame(CGRectMake(0, 0, JobsMainScreen_WIDTH(), JobsWidth(56)))
                .byBgColor(HEXCOLOR(0x263342));
        });
        self.accessoryTitleLab.addOn(_accessoryBar).byAdd(^(MASConstraintMaker *make) {
            make.left.equalTo(_accessoryBar).offset(JobsWidth(18));
            make.centerY.equalTo(_accessoryBar);
        });
        self.accessoryDoneBtn.addOn(_accessoryBar).byAdd(^(MASConstraintMaker *make) {
            make.right.equalTo(_accessoryBar).offset(-JobsWidth(18));
            make.centerY.equalTo(_accessoryBar);
        });
    };return _accessoryBar;
}

-(UILabel *)accessoryTitleLab{
    if (!_accessoryTitleLab) {
        _accessoryTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"Input Accessory".jobsTr())
                .byTextCor(UIColor.whiteColor)
                .byFont(UIFontWeightMediumSize(15));
        });
    };return _accessoryTitleLab;
}

-(UIButton *)accessoryDoneBtn{
    if (!_accessoryDoneBtn) {
        @jobs_weakify(self)
        _accessoryDoneBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"Done".jobsTr())
                .jobsResetBtnTitleFont(UIFontWeightMediumSize(15))
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    weak_self.jobs_endEditing();
                });
        });
    };return _accessoryDoneBtn;
}

-(jobsByVoidBlock _Nonnull)jobs_endEditing{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.view.byEndEditing(YES);
    };
}

@end
