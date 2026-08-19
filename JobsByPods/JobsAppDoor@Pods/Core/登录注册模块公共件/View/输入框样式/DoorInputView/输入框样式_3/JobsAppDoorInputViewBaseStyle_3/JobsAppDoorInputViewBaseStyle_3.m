//
//  JobsAppDoorInputViewBaseStyle_3.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle_3.h"

@interface JobsAppDoorInputViewBaseStyle_3 ()
/// UI
Prop_strong()UIButton *securityModeBtn;
Prop_strong()UIImageView *leftIMGV;
/// Data
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_3
@interface JobsAppDoorInputViewBaseStyle_3 (JobsPropertyDSLSetterAutogen_f58c3e0b38)
-(void)setDoorInputViewBaseStyleModel:(JobsAppDoorInputViewBaseStyleModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_3

@implementation JobsAppDoorInputViewBaseStyle_3
@synthesize thisViewSize = _thisViewSize;
- (instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.byJobsWidth(1)
                .byLayerCor(Cor3);
        }));
    };return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.byThisViewSize(thisViewSize);
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.byJobsWidth(1)
                .byLayerCor(Cor3);
        }));
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_3.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)configTextField{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.magicTextField.byPlaceholdAnimationable(self.doorInputViewBaseStyleModel.isPlaceholdAnimationable);
        if (isValue(self.doorInputViewBaseStyleModel.inputStr)) {
            self.magicTextField.byText(self.doorInputViewBaseStyleModel.inputStr);
        }
        self.magicTextField.byBackground(self.doorInputViewBaseStyleModel.background);
        self.magicTextField.byBgColor(self.doorInputViewBaseStyleModel.backgroundColor);
        self.magicTextField.byDisabledBackground(self.doorInputViewBaseStyleModel.disabledBackground);
        self.magicTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
        UIImage *leftImage = self.doorInputViewBaseStyleModel.leftViewIMG;
        CGFloat leftOffset = leftImage ? (self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17)) : 0;
        CGFloat placeholderOffset = leftImage ? (self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(35)) : JobsWidth(12);
        self.leftIMGV.byImage(leftImage).byAlpha(leftImage ? 1 : 0);
        self.magicTextField.byLeftView(nil);
        self.magicTextField.byLeftViewMode(UITextFieldViewModeNever);
        self.magicTextField.byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
        self.magicTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
        self.magicTextField.byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType);
        self.magicTextField.byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance);
        self.magicTextField.byUseCustomClearButton(self.doorInputViewBaseStyleModel.useCustomClearButton);
        self.magicTextField.byIsShowDelBtn(self.doorInputViewBaseStyleModel.isShowDelBtn);
        self.magicTextField.byRightViewOffsetX(self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8));
        self.magicTextField.byTextOffset(leftImage ? (self.doorInputViewBaseStyleModel.offset ? : placeholderOffset) : JobsWidth(12));
        self.magicTextField.byPlaceholderColor(self.doorInputViewBaseStyleModel.placeholderColor);
        self.magicTextField.byPlaceholderFont(self.doorInputViewBaseStyleModel.placeholderFont);
        self.magicTextField.byLeftViewOffsetX(leftOffset);
        self.magicTextField.byAnimationColor(self.doorInputViewBaseStyleModel.animationColor ? : Cor3);
        self.magicTextField.byPlaceHolderAlignment(self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft);
        self.magicTextField.byMoveDistance(self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(35));
        self.magicTextField.byPlaceHolderOffset(placeholderOffset);
        self.magicTextField.byFieldEditorOffset(self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50));
        self.textFieldInputModel.byPlaceHolder(self.magicTextField.placeholder);
    };
}

-(void)block:(JobsMagicTextField *)textField
       value:(NSString *)value{
    self.textFieldInputModel.byResString(value);
    self.textFieldInputModel.byPlaceHolder(self.doorInputViewBaseStyleModel.placeholder);
    textField.byRequestParams(self.textFieldInputModel);
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_3.class, @selector(jobsTextFieldShouldBeginEditing)))(self, @selector(jobsTextFieldShouldBeginEditing));
    return action ? action(textField) : NO;
}

-(JobsRetBOOLByUITextFieldBlock _Nonnull)jobsTextFieldShouldBeginEditing{
    @jobs_weakify(self)
    return ^BOOL(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return NO;
        return self.doorInputViewBaseStyleModel.keyboardEnable;
    };
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(345), JobsWidth(30));
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable data) {
        @jobs_strongify(self)
        self.byDoorInputViewBaseStyleModel(data ? : JobsAppDoorInputViewBaseStyleModel.new);
        self.magicTextField.byIsShowDelBtn(self.doorInputViewBaseStyleModel.isShowDelBtn);/// ❎
        self.configTextField();
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_3.class, @selector(jobsChangeTextFieldAnimationColor)))(self, @selector(jobsChangeTextFieldAnimationColor));
    if (action) action(toRegisterBtnSelected);
}

-(jobsByBOOLBlock _Nonnull)jobsChangeTextFieldAnimationColor{
    @jobs_weakify(self)
    return ^(BOOL toRegisterBtnSelected){
        @jobs_strongify(self)
        if (!self) return;
        self.magicTextField.byAnimationColor(toRegisterBtnSelected ? Cor3 : Cor3);
    };
}

-(JobsMagicTextField *_Nullable)getTextField{
    JobsRetJobsMagicTextFieldByVoidBlock action = ((JobsRetJobsMagicTextFieldByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_3.class, @selector(jobsGetTextField)))(self, @selector(jobsGetTextField));
    return action ? action() : nil;
}

-(JobsRetJobsMagicTextFieldByVoidBlock _Nonnull)jobsGetTextField{
    @jobs_weakify(self)
    return ^JobsMagicTextField *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.magicTextField;
    };
}

-(NSString *_Nullable)textFieldValue{
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_3.class, @selector(jobsTextFieldValue)))(self, @selector(jobsTextFieldValue));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsTextFieldValue{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.magicTextField.text;
    };
}

-(JobsRetBtnByVoidBlock _Nonnull)getSecurityModeBtn{
    @jobs_weakify(self)
    return ^UIButton *{
        @jobs_strongify(self)
        if (!self) return nil;
        return _securityModeBtn;
    };
}
#pragma mark —— UITextFieldDelegate
/// 获得焦点成为第一响应者，此时 textField.isEditing == YES
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    ((((jobsByTextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_3.class, @selector(textFieldDidBeginEditing)))(self, @selector(textFieldDidBeginEditing))))(textField);
}
-(jobsByTextFieldBlock _Nonnull)textFieldDidBeginEditing{
    @jobs_weakify(self)
    return ^(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return;
        if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)leftIMGV{
    if (!_leftIMGV) {
        @jobs_weakify(self)
        _leftIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byContentMode(UIViewContentModeScaleAspectFit)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self).offset(JobsWidth(17));
                    make.centerY.equalTo(self);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(16), JobsWidth(16)));
                });
        });
    };return _leftIMGV;
}

-(UIButton *)securityModeBtn{
    if (!_securityModeBtn) {
        @jobs_weakify(self)
        _securityModeBtn = UIButton.jobsInit()
        .selectedStateImageBy(self.doorInputViewBaseStyleModel.selectedSecurityBtnIMG ? : JobsRedColor.jobsImage())
        .jobsResetBtnImage(self.doorInputViewBaseStyleModel.unSelectedSecurityBtnIMG ? : JobsBlueColor.jobsImage())
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            x.byToggleSelected();
            self.magicTextField.bySecureTextEntry(!x.jobs_isSelected);
            if (x.jobs_isSelected && !self.magicTextField.isEditing) {
                self.magicTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
            }
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        })
        .addOn(self)
        .byAdd(^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self);
            make.width.mas_equalTo(JobsWidth(40));
        });
    };return _securityModeBtn;
}
@synthesize magicTextField = _magicTextField;
-(JobsMagicTextField *)magicTextField{
    if (!_magicTextField) {
        /// 先完成按钮懒加载，避免文本信号同步回调重入 getter
        UIButton *securityModeBtn = self.securityModeBtn;
        @jobs_weakify(self)
        _magicTextField = jobsMakeMagicTextField(^(__kindof JobsMagicTextField * _Nullable textField) {
            @jobs_strongify(self)
            textField
                .byDelegate(self)
                .bySecureTextEntry(self.doorInputViewBaseStyleModel.isShowSecurityBtn);
            [textField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
                JobsLog(@"SSS = %@",self.textFieldInputModel.PlaceHolder);
                @jobs_strongify(self)
                return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
            } subscribeNextBlock:^(NSString *_Nullable x) {
                @jobs_strongify(self)
                JobsLog(@"输入的字符为 = %@",x);
                securityModeBtn.byJobsVisible(isValue(x) && self.doorInputViewBaseStyleModel.isShowSecurityBtn);
                if(!x) return;
                if (x.isContainsSpecialSymbolsString(nil)) {
                    @"Do not enter special characters".jobsTr().toast();
                }else{
                    [self block:textField value:x];
                }
            }];
            textField.addOn(self).byAdd(^(MASConstraintMaker *make) {
                make.top.left.bottom.equalTo(self);
                if (self.doorInputViewBaseStyleModel.isShowSecurityBtn) {
                    make.right.equalTo(securityModeBtn.mas_left);
                }else{
                    make.right.equalTo(self);
                }
            });
        });
    };return _magicTextField;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_3
-(JobsRetJobsAppDoorInputViewBaseStyle_3ByJobsAppDoorInputViewBaseStyleModelBlock _Nonnull)byDoorInputViewBaseStyleModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyle_3 * _Nullable(JobsAppDoorInputViewBaseStyleModel * _Nullable data){
        @jobs_strongify(self)
        [self setDoorInputViewBaseStyleModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_3
@end
