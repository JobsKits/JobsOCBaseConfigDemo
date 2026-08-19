//
//  JobsAppDoorInputViewBaseStyle_10.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle_10.h"

@interface JobsAppDoorInputViewBaseStyle_10 ()
/// UI
Prop_strong()UILabel *titleLab;
/// Data
Prop_copy()NSString *titleStr_1;
Prop_copy()NSString *titleStr_2;
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_10
@interface JobsAppDoorInputViewBaseStyle_10 (JobsPropertyDSLSetterAutogen_9d99b3840a)
-(void)setDoorInputViewBaseStyleModel:(JobsAppDoorInputViewBaseStyleModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_10

@implementation JobsAppDoorInputViewBaseStyle_10
@synthesize thisViewSize = _thisViewSize;
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.byThisViewSize(thisViewSize);
        self.titleStr_1 = @"請輸入金額".jobsTr();
        self.titleStr_2 = @"全部金額".jobsTr();
    };return self;
}

-(instancetype)init{
    if (self = [super init]) {
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
        }
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_10.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        [self setBorderWithColor:HEXCOLOR(0xEAEBED)
                     borderWidth:JobsWidth(2)
                      borderType:UIBorderSideTypeBottom];
        /// 因为是子控件，所以要防止约束使用中间过程值，避免代码冗余，这里固定写死
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)configTextField{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.zyTextField.byLeftView(UIImageView.initBy(self.doorInputViewBaseStyleModel.leftViewIMG));
        self.zyTextField.byLeftViewMode(self.doorInputViewBaseStyleModel.leftViewMode);
        self.zyTextField.byPlaceholder(isNull(self.doorInputViewBaseStyleModel.placeholder) ? self.titleStr_1 : self.doorInputViewBaseStyleModel.placeholder);
        self.zyTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
        self.zyTextField.byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType);
        self.zyTextField.byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance);
        self.zyTextField.byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
        self.zyTextField.byUseCustomClearButton(self.doorInputViewBaseStyleModel.useCustomClearButton);
        self.zyTextField.byIsShowDelBtn(self.doorInputViewBaseStyleModel.isShowDelBtn);
        self.zyTextField.byRightViewOffsetX(self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8));
        self.zyTextField.byRequestParams(self.textFieldInputModel);
        self.zyTextField.byPlaceholderColor(self.doorInputViewBaseStyleModel.placeholderColor);
        self.zyTextField.byPlaceholderFont(self.doorInputViewBaseStyleModel.placeholderFont);
        self.zyTextField.byLeftViewOffsetX(self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(0));
        self.zyTextField.byPlaceHolderAlignment(self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft);
        self.zyTextField.byPlaceHolderOffset(self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(0));
        self.zyTextField.byFieldEditorOffset(self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(0));
    };
}

-(void)block:(ZYTextField *)textField value:(NSString *)value{
    self.textFieldInputModel.byResString(value);
    self.textFieldInputModel.byPlaceHolder(self.doorInputViewBaseStyleModel.placeholder);
    textField.byRequestParams(self.textFieldInputModel);
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_10.class, @selector(jobsTextFieldShouldBeginEditing)))(self, @selector(jobsTextFieldShouldBeginEditing));
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
        return CGSizeMake(JobsWidth(303), JobsWidth(36));
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.byUserInteractionEnabled(YES);
        self.byDoorInputViewBaseStyleModel(doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new);
        self.titleLab.byAlpha(1);
        self.zyTextField.byAlpha(1);
        self.configTextField();
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(ZYTextField *_Nullable)getTextField{
    JobsRetZYTextFieldByVoidBlock action = ((JobsRetZYTextFieldByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_10.class, @selector(jobsGetTextField)))(self, @selector(jobsGetTextField));
    return action ? action() : nil;
}

-(JobsRetZYTextFieldByVoidBlock _Nonnull)jobsGetTextField{
    @jobs_weakify(self)
    return ^ZYTextField *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.zyTextField;
    };
}

-(NSString *_Nullable)textFieldValue{
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_10.class, @selector(jobsTextFieldValue)))(self, @selector(jobsTextFieldValue));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsTextFieldValue{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.zyTextField.text;
    };
}
#pragma mark —— lazyLoad
@synthesize zyTextField = _zyTextField;
-(ZYTextField *)zyTextField{
    if (!_zyTextField) {
        _zyTextField = jobsMakeZYTextField(^(ZYTextField * _Nullable textField) {
            textField
                .byDelegate(self)
                .addOn(self).byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self);
                    make.top.bottom.equalTo(self);
                    make.size.mas_equalTo(inputSize_02());
                });
            @jobs_weakify(self)
            [_zyTextField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
                @jobs_strongify(self)
                return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
            } subscribeNextBlock:^(id _Nullable x) {
                @jobs_strongify(self)
                [self block:self->_zyTextField value:x];
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
                .byText(isNull(self.doorInputViewBaseStyleModel.textModel.text) ? self.titleStr_2 : self.doorInputViewBaseStyleModel.textModel.text)
                .byTextCor(self.viewModel.textModel.textCor ? : HEXCOLOR(0xAE8330))
                .byFont(self.viewModel.textModel.font ? : JobsFontMedium(JobsWidth(12)))
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.right.equalTo(self);
                    make.centerY.equalTo(self.zyTextField);
                })
                .makeLabelByShowingType(UILabelShowingType_03);
        });
    };return _titleLab;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_10
-(JobsRetJobsAppDoorInputViewBaseStyle_10ByJobsAppDoorInputViewBaseStyleModelBlock _Nonnull)byDoorInputViewBaseStyleModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyle_10 * _Nullable(JobsAppDoorInputViewBaseStyleModel * _Nullable data){
        @jobs_strongify(self)
        [self setDoorInputViewBaseStyleModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_10
@end
