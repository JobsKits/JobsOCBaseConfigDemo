//
//  JobsAppDoorInputViewBaseStyle_8.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle_8.h"

@interface JobsAppDoorInputViewBaseStyle_8 ()
/// UI
Prop_strong()BaseButton *securityModelBtn;
Prop_strong()UILabel *titleLab;
/// Data
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_8
@interface JobsAppDoorInputViewBaseStyle_8 (JobsPropertyDSLSetterAutogen_61901b5bd3)
-(void)setDoorInputViewBaseStyleModel:(JobsAppDoorInputViewBaseStyleModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_8

@implementation JobsAppDoorInputViewBaseStyle_8
-(instancetype)init{
    if (self = [super init]) {
    };return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.byBgColor(JobsClearColor);
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.byJobsWidth(1)
                .byLayerCor(Cor3);
        }));
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_8.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
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
        if (isValue(self.doorInputViewBaseStyleModel.inputStr)) {
            self.zyTextField.byText(self.doorInputViewBaseStyleModel.inputStr);
        }
        self.zyTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
        self.zyTextField.byBackground(self.doorInputViewBaseStyleModel.background);
        self.zyTextField.byBgColor(self.doorInputViewBaseStyleModel.backgroundColor);
        self.zyTextField.byDisabledBackground(self.doorInputViewBaseStyleModel.disabledBackground);
        self.zyTextField
            .byLeftView(jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView
                    .byImage(self.doorInputViewBaseStyleModel.leftViewIMG)
                    .byUserInteractionEnabled(NO);
            }))
            .byLeftViewMode(self.doorInputViewBaseStyleModel.leftViewMode);
        self.zyTextField.byBackground(self.doorInputViewBaseStyleModel.background);
        self.zyTextField.byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
        self.zyTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
        self.zyTextField.byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType);
        self.zyTextField.byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance);
        self.zyTextField.byUseCustomClearButton(self.doorInputViewBaseStyleModel.useCustomClearButton);
        self.zyTextField.byIsShowDelBtn(self.doorInputViewBaseStyleModel.isShowDelBtn);
        self.zyTextField.byRightViewOffsetX(self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8));
        self.zyTextField.byPlaceHolderAlignment(self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft);
        self.zyTextField.byPlaceHolderOffset(self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(20));
        self.zyTextField.byPlaceholderColor(self.doorInputViewBaseStyleModel.placeholderColor);
        self.zyTextField.byPlaceholderFont(self.doorInputViewBaseStyleModel.placeholderFont);
        self.zyTextField.byRequestParams(self.textFieldInputModel);
        self.zyTextField.byLeftViewOffsetX(self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17));
        self.zyTextField.byFieldEditorOffset(self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50));
    };
}

-(void)block:(ZYTextField *)textField
       value:(NSString *)value{
    self.textFieldInputModel.byResString(value);
    self.textFieldInputModel.byPlaceHolder(self.doorInputViewBaseStyleModel.placeholder);
    textField.byRequestParams(self.textFieldInputModel);
    if (self.objBlock) self.objBlock(textField);
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_8.class, @selector(jobsTextFieldShouldBeginEditing)))(self, @selector(jobsTextFieldShouldBeginEditing));
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
        return CGSizeMake(JobsWidth(345), JobsWidth(50));
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.byDoorInputViewBaseStyleModel(doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new);
        self.titleLab.byAlpha(1);
        self.securityModelBtn.byAlpha(1);
        self.zyTextField.byAlpha(1);
        self.configTextField();
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(ZYTextField *_Nullable)getTextField{
    JobsRetZYTextFieldByVoidBlock action = ((JobsRetZYTextFieldByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_8.class, @selector(jobsGetTextField)))(self, @selector(jobsGetTextField));
    return action ? action() : nil;
}

-(JobsRetZYTextFieldByVoidBlock _Nonnull)jobsGetTextField{
    @jobs_weakify(self)
    return ^ZYTextField *{
        @jobs_strongify(self)
        if (!self) return nil;
        return _zyTextField;
    };
}

-(NSString *_Nullable)textFieldValue{
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_8.class, @selector(jobsTextFieldValue)))(self, @selector(jobsTextFieldValue));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsTextFieldValue{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return _zyTextField.text;
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)securityModelBtn{
    if (!_securityModelBtn) {
        @jobs_weakify(self)
        _securityModelBtn = BaseButton
            .initByNormalImage(self.doorInputViewBaseStyleModel.unSelectedSecurityBtnIMG ? : JobsBlueColor.jobsImage())
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                x
                    .jobsResetBtnImage(self.doorInputViewBaseStyleModel.selectedSecurityBtnIMG ? : JobsRedColor.jobsImage())
                    .byToggleSelected();
                self.zyTextField.bySecureTextEntry(x.jobs_isSelected);
                if (x.jobs_isSelected && !self.zyTextField.isEditing) {
                    self.zyTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
                }
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        });
        _securityModelBtn.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.top.right.equalTo(self);
            make.width.mas_equalTo(40);
            make.bottom.equalTo(self.titleLab.mas_top);
        });
    };return _securityModelBtn;
}
@synthesize zyTextField = _zyTextField;
-(ZYTextField *)zyTextField{
    if (!_zyTextField) {
        _zyTextField = jobsMakeZYTextField(^(ZYTextField * _Nullable textField) {
            textField
                .byDelegate(self)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
            @jobs_weakify(self)
            [_zyTextField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
                @jobs_strongify(self)
                return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
            } subscribeNextBlock:^(NSString *_Nullable x) {
                @jobs_strongify(self)
                JobsLog(@"输入的字符为 = %@",x);
                self.securityModelBtn.byJobsVisible(isValue(x) && self.doorInputViewBaseStyleModel.isShowSecurityBtn);
                if (x.isContainsSpecialSymbolsString(nil)) {
                    @"Do not enter special characters".jobsTr().toast();
                }else{
                    JobsLog(@"输入的字符为 = %@",x);
                    [self block:self->_zyTextField
                          value:x];
                }
            }];
        });
    };return _zyTextField;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont(UIFontWeightRegularSize(JobsWidth(11)))
                .byText(self.doorInputViewBaseStyleModel.textModel.text)
                .byTextCor(self.doorInputViewBaseStyleModel.textModel.textCor)
                .setMasonryBy(^(MASConstraintMaker *_Nonnull make){
                    @jobs_strongify(self)
                    make.left.bottom.equalTo(self);
                    make.top.equalTo(self.zyTextField.mas_bottom);
                }).on();
        });
    };return _titleLab;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_8
-(JobsRetJobsAppDoorInputViewBaseStyle_8ByJobsAppDoorInputViewBaseStyleModelBlock _Nonnull)byDoorInputViewBaseStyleModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyle_8 * _Nullable(JobsAppDoorInputViewBaseStyleModel * _Nullable data){
        @jobs_strongify(self)
        [self setDoorInputViewBaseStyleModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_8
@end
