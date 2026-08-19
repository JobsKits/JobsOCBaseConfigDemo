//
//  JobsAppDoorForgotCodeContentView.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorForgotCodeContentView.h"

@interface JobsAppDoorForgotCodeContentView ()
/// UI
Prop_strong()UILabel *titleLab;                             // 标题
Prop_strong()BaseButton *backToLoginBtn;                    // 返回登录
Prop_strong()JobsAppDoorInputViewBaseStyle_3 *passwordInputView;
Prop_strong()JobsAppDoorInputViewBaseStyle_3 *confirmPasswordInputView;
Prop_strong()BaseButton *confirmBtn;
Prop_strong()BaseButton *backHomeBtn;
Prop_strong()BaseButton *contactCustomerServiceBtn;         // 联系客服按钮

-(jobsByVoidBlock _Nonnull)jobs_updateConfirmBtnState;
-(JobsRetBOOLByVoidBlock _Nonnull)jobs_canConfirmPassword;
-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)jobs_passwordInputModelWithPlaceholder;

@end

@implementation JobsAppDoorForgotCodeContentView
#pragma mark —— Lifecycle
- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(Cor2);
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorForgotCodeContentView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
#pragma mark —— BaseViewProtocol
/// 外层数据渲染
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable data) {
        @jobs_strongify(self)
        self.backToLoginBtn.byAlpha(0.7f);
        self.titleLab.byAlpha(1);
        self.passwordInputView.byAlpha(1);
        self.confirmPasswordInputView.byAlpha(1);
        self.confirmBtn.byAlpha(1);
        self.backHomeBtn.byAlpha(1);
        self.contactCustomerServiceBtn.byAlpha(1);
        self.jobs_updateConfirmBtnState();
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)jobs_updateConfirmBtnState{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        BOOL enabled = self.jobs_canConfirmPassword();
        self.confirmBtn
            .byEnabled(enabled)
            .byUserInteractionEnabled(enabled)
            .byAlpha(enabled ? 1 : 0.45f);
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)jobs_canConfirmPassword{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSString *password = self.passwordInputView.textFieldValue ? : @"";
        NSString *confirmPassword = self.confirmPasswordInputView.textFieldValue ? : @"";
        return password.length && confirmPassword.length && [password isEqualToString:confirmPassword];
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)jobs_passwordInputModelWithPlaceholder{
    @jobs_weakify(self)
    return ^JobsAppDoorInputViewBaseStyleModel *(NSString * placeholder){
        @jobs_strongify(self)
        if (!self) return nil;
        UIImage *lockIcon = JobsAppDoorImageNamed(@"Lock") ? : JobsAppDoorImageNamed(@"codeDecode");
        return jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable data) {
            data
                .byLeftViewIMG(lockIcon)
                .byPlaceholder(placeholder)
                .byIsShowDelBtn(YES)
                .byShowSecurityBtn(YES)
                .byUseCustomClearButton(YES)
                .byReturnKeyType(UIReturnKeyDone)
                .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                .byKeyboardEnable(YES)
                .bySelectedSecurityBtnIMG(JobsAppDoorImageNamed(@"codeEncode"))
                .byUnSelectedSecurityBtnIMG(JobsAppDoorImageNamed(@"codeDecode"))
                .byLeftViewMode(UITextFieldViewModeAlways)
                .byPlaceholderColor(JobsWhiteColor)
                .byTitleStrCor(JobsWhiteColor)
                .byRightViewOffsetX(-JobsWidth(8))
                .byPlaceHolderOffset(JobsWidth(35))
                .byOffset(JobsWidth(0));
        });
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)backToLoginBtn{
    if (!_backToLoginBtn) {
        @jobs_weakify(self)
        _backToLoginBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
            .jobsResetImagePadding(JobsWidth(8))
            .jobsResetBtnImage(JobsAppDoorImageNamed(@"AppDoorBackLogin") ? : JobsAppDoorImageNamed(@"Lock"))
            .jobsResetBtnTitleCor(Cor1)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(13))
            .jobsResetBtnTitle(Title1)
            .byTitleLabel(^(UILabel *label) {
                label
                    .byNumberOfLines(0);
            })
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self endEditing:YES];
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.left.bottom.equalTo(self);
                make.width.mas_equalTo(RegisterBtnWidth);
            });
    };return _backToLoginBtn;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(Title3)
                .byTextAlignment(NSTextAlignmentCenter)
                .byTextCor(JobsWhiteColor)
                .byFont(UIFontWeightRegularSize(20))
                .makeLabelByShowingType(UILabelShowingType_03)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.backToLoginBtn.mas_right);
                    make.right.equalTo(self);
                    make.top.equalTo(self).offset(JobsWidth(20));
                    make.height.mas_equalTo(JobsWidth(28));
                });
        });
    };return _titleLab;
}

-(JobsAppDoorInputViewBaseStyle_3 *)passwordInputView{
    if (!_passwordInputView) {
        @jobs_weakify(self)
        _passwordInputView = (JobsAppDoorInputViewBaseStyle_3 *)JobsAppDoorInputViewBaseStyle_3.new
            .byViewBlock(^(__kindof UIView *view) {
                @jobs_strongify(self)
                JobsAppDoorInputViewBaseStyle_3 *inputView = (JobsAppDoorInputViewBaseStyle_3 *)view;
                /// 初始渲染可能同步触发文本信号，必须先于外部回调绑定完成
                inputView.jobsRichViewByModel(self.jobs_passwordInputModelWithPlaceholder(@"密码".jobsTr()));
                @jobs_weakify(self)
                inputView.actionObjBlock(^(id data) {
                    @jobs_strongify(self)
                    self.jobs_updateConfirmBtnState();
                });
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.left.equalTo(self.backToLoginBtn.mas_right).offset(JobsWidth(20));
                make.right.equalTo(self).offset(-JobsWidth(20));
                make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(24));
                make.height.mas_equalTo(ThingsHeight);
            })
            .byCornerRadius(ThingsHeight / 2)
            .byLayer(^(CALayer *layer) {
                layer.byMasksToBounds(YES);
            });
    };return _passwordInputView;
}

-(JobsAppDoorInputViewBaseStyle_3 *)confirmPasswordInputView{
    if (!_confirmPasswordInputView) {
        @jobs_weakify(self)
        _confirmPasswordInputView = (JobsAppDoorInputViewBaseStyle_3 *)JobsAppDoorInputViewBaseStyle_3.new
            .byViewBlock(^(__kindof UIView *view) {
                @jobs_strongify(self)
                JobsAppDoorInputViewBaseStyle_3 *inputView = (JobsAppDoorInputViewBaseStyle_3 *)view;
                /// 初始渲染可能同步触发文本信号，必须先于外部回调绑定完成
                inputView.jobsRichViewByModel(self.jobs_passwordInputModelWithPlaceholder(@"确认密码".jobsTr()));
                @jobs_weakify(self)
                inputView.actionObjBlock(^(id data) {
                    @jobs_strongify(self)
                    self.jobs_updateConfirmBtnState();
                });
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.left.right.height.equalTo(self.passwordInputView);
                make.top.equalTo(self.passwordInputView.mas_bottom).offset(InputViewOffset);
            })
            .byCornerRadius(ThingsHeight / 2)
            .byLayer(^(CALayer *layer) {
                layer.byMasksToBounds(YES);
            });
    };return _confirmPasswordInputView;
}

-(BaseButton *)confirmBtn{
    if (!_confirmBtn) {
        @jobs_weakify(self)
        _confirmBtn = (BaseButton *)BaseButton.jobsInit()
            .bgColorBy(Cor4)
            .jobsResetBtnTitleCor(Cor5)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(16))
            .jobsResetBtnTitle(@"确认".jobsTr())
            .jobsResetBtnCornerRadiusValue(ThingsHeight / 2)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self endEditing:YES];
                if (!self.jobs_canConfirmPassword()) {
                    toastBy(@"两次密码输入不一致".jobsTr());
                    return;
                }
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.left.right.height.equalTo(self.passwordInputView);
                make.top.equalTo(self.confirmPasswordInputView.mas_bottom).offset(JobsWidth(24));
            });
        self.jobs_updateConfirmBtnState();
    };return _confirmBtn;
}

-(BaseButton *)backHomeBtn{
    if (!_backHomeBtn) {
        @jobs_weakify(self)
        _backHomeBtn = (BaseButton *)BaseButton.jobsInit()
            .bgColorBy(JobsClearColor)
            .jobsResetBtnTitleCor(Cor4)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(18))
            .jobsResetBtnTitle(Title4)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self endEditing:YES];
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.centerX.equalTo(self.confirmBtn);
                make.top.equalTo(self.confirmBtn.mas_bottom).offset(JobsWidth(12));
                make.size.mas_equalTo(CGSizeMake(JobsWidth(150), JobsWidth(30)));
            });
    };return _backHomeBtn;
}

-(BaseButton *)contactCustomerServiceBtn{
    if (!_contactCustomerServiceBtn) {
        @jobs_weakify(self)
        CGSize customerIconSize = CGSizeMake(JobsWidth(18), JobsWidth(18));
        UIImage *customerImage = JobsAppDoorCustomerServiceIconImage();
        customerImage = customerImage ? customerImage.dw_RescaleImageToSize(customerIconSize) : JobsAppDoorImageNamed(@"用户名称");
        _contactCustomerServiceBtn = BaseButton.jobsInit()
            .bgColorBy(Cor1)
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(JobsWidth(5))
            .jobsResetBtnImage(customerImage)
            .jobsResetBtnTitle(Title8)
            .jobsResetBtnTitleCor(Cor4)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(10))
            .jobsResetBtnLayerBorderCor(Cor4)
            .jobsResetBtnLayerBorderWidth(2)
            .jobsResetBtnCornerRadiusValue(JobsWidth(19))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self endEditing:YES];
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.centerX.equalTo(self.backHomeBtn);
                make.top.equalTo(self.backHomeBtn.mas_bottom).offset(JobsWidth(14));
                make.size.mas_equalTo(CGSizeMake(JobsWidth(118), JobsWidth(38)));
            })
            .byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button.byClipsToBounds(YES);
                button.imageView.byContentMode(UIViewContentModeScaleAspectFit);
                button.titleLabel
                    .byNumberOfLines(2)
                    .byTextAlignment(NSTextAlignmentCenter)
                    .byAdjustsFontSizeToFitWidth(NO)
                    .byLineBreakMode(NSLineBreakByWordWrapping);
            });
    };return _contactCustomerServiceBtn;
}

@end
