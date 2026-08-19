//
//  JobsAppDoorInputViewBaseStyle_6.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle_6.h"

#import "AuthCodeLab.h"

@interface JobsAppDoorInputViewBaseStyle_6 ()
/// UI
Prop_strong()AuthCodeLab *authCodeLab;
/// Data
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_6
@interface JobsAppDoorInputViewBaseStyle_6 (JobsPropertyDSLSetterAutogen_dd1b2595b7)
-(void)setDoorInputViewBaseStyleModel:(JobsAppDoorInputViewBaseStyleModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_6

@implementation JobsAppDoorInputViewBaseStyle_6
- (instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsClearColor);
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.byJobsWidth(1)
                .byLayerCor(JobsWhiteColor);
        }));
    };return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.byBgColor(JobsClearColor);
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.byJobsWidth(1)
                .byLayerCor(JobsWhiteColor);
        }));
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_6.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
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

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_6.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
        [self.authCodeLab appointCornerCutToCircleByRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight
                                                     cornerRadii:CGSizeMake(self.authCodeLab.height / 2, self.authCodeLab.height / 2)];
        [self.authCodeLab setBorderWithColor:JobsWhiteColor
                                 borderWidth:1
                                  borderType:UIBorderSideTypeLeft];
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)configTextField{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.magicTextField.byLeftView(UIImageView.initBy(self.doorInputViewBaseStyleModel.leftViewIMG));
        self.magicTextField.byLeftViewMode(self.doorInputViewBaseStyleModel.leftViewMode);
        self.magicTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
        self.magicTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
        self.magicTextField.byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
        self.magicTextField.byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType);
        self.magicTextField.byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance);
        self.magicTextField.byUseCustomClearButton(self.doorInputViewBaseStyleModel.useCustomClearButton);
        self.magicTextField.byIsShowDelBtn(self.doorInputViewBaseStyleModel.isShowDelBtn);
        self.magicTextField.byRightViewOffsetX(self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8));
        self.magicTextField.byPlaceholderColor(self.doorInputViewBaseStyleModel.placeholderColor);
        self.magicTextField.byPlaceholderFont(self.doorInputViewBaseStyleModel.placeholderFont);
        self.magicTextField.byRequestParams(self.textFieldInputModel);
        self.magicTextField.byLeftViewOffsetX(self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17));
        self.magicTextField.byAnimationColor(self.doorInputViewBaseStyleModel.animationColor ? : JobsWhiteColor);
        self.magicTextField.byPlaceHolderAlignment(self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft);
        self.magicTextField.byPlaceHolderOffset(self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(20));
        self.magicTextField.byMoveDistance(self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(40));
        self.magicTextField.byFieldEditorOffset(self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50));
    };
}

-(void)block:(JobsMagicTextField *)textField value:(NSString *)value{
    self.textFieldInputModel.byResString(value);
    self.textFieldInputModel.byPlaceHolder(self.doorInputViewBaseStyleModel.placeholder);
    textField.byRequestParams(self.textFieldInputModel);
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_6.class, @selector(jobsTextFieldShouldBeginEditing)))(self, @selector(jobsTextFieldShouldBeginEditing));
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
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.byDoorInputViewBaseStyleModel(doorInputViewBaseStyleModel);
        self.authCodeLab.byAlpha(1);
        self.magicTextField.byAlpha(1);
        self.configTextField();
    };
}

#pragma mark —— JobsDoorInputViewProtocol
-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_6.class, @selector(jobsChangeTextFieldAnimationColor)))(self, @selector(jobsChangeTextFieldAnimationColor));
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
    JobsRetJobsMagicTextFieldByVoidBlock action = ((JobsRetJobsMagicTextFieldByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_6.class, @selector(jobsGetTextField)))(self, @selector(jobsGetTextField));
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
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_6.class, @selector(jobsTextFieldValue)))(self, @selector(jobsTextFieldValue));
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
#pragma mark —— lazyLoad
-(AuthCodeLab *)authCodeLab{
    if (!_authCodeLab) {
        _authCodeLab = AuthCodeLab.new
        .byTextAlignment(NSTextAlignmentCenter)
        .byText(@"ss")
        .byFont(JobsFontRegular(16))
        .byTextCor(JobsWhiteColor)
        .byBgColor(JobsBlackColor)
        .byAlpha(0.7)
        .addOn(self)
        .byAdd(^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.right.equalTo(self);
            make.width.mas_equalTo(80);
        });
    };return _authCodeLab;
}
@synthesize magicTextField = _magicTextField;
-(JobsMagicTextField *)magicTextField{
    if (!_magicTextField) {
        @jobs_weakify(self)
        _magicTextField = jobsMakeMagicTextField(^(__kindof JobsMagicTextField * _Nullable textField) {
            @jobs_strongify(self)
            textField
                .byDelegate(self)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.top.bottom.equalTo(self);
                    make.right.equalTo(self.authCodeLab.mas_left).offset(-JobsWidth(3));
                });
            [textField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
                @jobs_strongify(self)
                return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
            } subscribeNextBlock:^(id _Nullable x) {
                @jobs_strongify(self)
                JobsLog(@"MMM = %@",x);
                [self block:textField value:x];
            }];
        });
    };return _magicTextField;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_6
-(JobsRetJobsAppDoorInputViewBaseStyle_6ByJobsAppDoorInputViewBaseStyleModelBlock _Nonnull)byDoorInputViewBaseStyleModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyle_6 * _Nullable(JobsAppDoorInputViewBaseStyleModel * _Nullable data){
        @jobs_strongify(self)
        [self setDoorInputViewBaseStyleModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_6
@end
