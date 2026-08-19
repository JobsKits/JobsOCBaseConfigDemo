//
//  JobsAppDoorInputViewBaseStyle_4.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle_4.h"

@interface JobsAppDoorInputViewBaseStyle_4 ()
/// UI
Prop_strong()JobsOCGraphicCaptchaView *captchaView;
Prop_strong()UIImageView *leftIMGV;
/// Data
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_4
@interface JobsAppDoorInputViewBaseStyle_4 (JobsPropertyDSLSetterAutogen_d7bb1b0231)
-(void)setDoorInputViewBaseStyleModel:(JobsAppDoorInputViewBaseStyleModel * _Nullable)data;
-(void)setGraphicCaptchaConfig:(JobsOCGraphicCaptchaConfig * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_4

@implementation JobsAppDoorInputViewBaseStyle_4
@synthesize thisViewSize = _thisViewSize;
@synthesize graphicCaptchaConfig = _graphicCaptchaConfig;

- (instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.byJobsWidth(1)
                .byLayerCor(JobsWhiteColor);
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
                .byLayerCor(JobsWhiteColor);
        }));
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_4.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
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
        UIImage *leftImage = self.doorInputViewBaseStyleModel.leftViewIMG;
        CGFloat leftOffset = leftImage ? (self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17)) : 0;
        CGFloat placeholderOffset = leftImage ? (self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(35)) : JobsWidth(12);
        self.leftIMGV.byImage(leftImage).byAlpha(leftImage ? 1 : 0);
        self.magicTextField.byLeftView(nil);
        self.magicTextField.byLeftViewMode(UITextFieldViewModeNever);
        self.magicTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
        self.magicTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
        self.magicTextField.byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType);
        self.magicTextField.byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance);
        self.magicTextField.byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
        self.magicTextField.byUseCustomClearButton(self.doorInputViewBaseStyleModel.useCustomClearButton);
        self.magicTextField.byIsShowDelBtn(self.doorInputViewBaseStyleModel.isShowDelBtn);
        self.magicTextField.byRightViewOffsetX(self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8));
        self.magicTextField.byPlaceholderColor(self.doorInputViewBaseStyleModel.placeholderColor);
        self.magicTextField.byPlaceholderFont(self.doorInputViewBaseStyleModel.placeholderFont);
        self.magicTextField.byRequestParams(self.textFieldInputModel);
        self.magicTextField.byLeftViewOffsetX(leftOffset);
        self.magicTextField.byTextOffset(leftImage ? (self.doorInputViewBaseStyleModel.offset ? : placeholderOffset) : JobsWidth(12));
        self.magicTextField.byAnimationColor(self.doorInputViewBaseStyleModel.animationColor ? : Cor3);
        self.magicTextField.byMoveDistance(self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(35));
        self.magicTextField.byPlaceHolderAlignment(self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft);
        self.magicTextField.byPlaceHolderOffset(placeholderOffset);
        self.magicTextField.byFieldEditorOffset(self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(4));
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
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_4.class, @selector(jobsTextFieldShouldBeginEditing)))(self, @selector(jobsTextFieldShouldBeginEditing));
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

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable data) {
        @jobs_strongify(self)
        self.byDoorInputViewBaseStyleModel(data);
        self.captchaView.byAlpha(1);
        self.magicTextField.byAlpha(1);
        self.configTextField();
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_4.class, @selector(jobsChangeTextFieldAnimationColor)))(self, @selector(jobsChangeTextFieldAnimationColor));
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
    JobsRetJobsMagicTextFieldByVoidBlock action = ((JobsRetJobsMagicTextFieldByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_4.class, @selector(jobsGetTextField)))(self, @selector(jobsGetTextField));
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
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_4.class, @selector(jobsTextFieldValue)))(self, @selector(jobsTextFieldValue));
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

-(JobsOCGraphicCaptchaConfig *)graphicCaptchaConfig{
    if (!_graphicCaptchaConfig) {
        _graphicCaptchaConfig = JobsOCGraphicCaptchaConfig.mixedConfig();
    };return _graphicCaptchaConfig;
}

-(void)setGraphicCaptchaConfig:(JobsOCGraphicCaptchaConfig *)graphicCaptchaConfig{
    _graphicCaptchaConfig = graphicCaptchaConfig.copy ? : JobsOCGraphicCaptchaConfig.mixedConfig();
    if (_captchaView) _captchaView.byConfig(_graphicCaptchaConfig);
}
#pragma mark —— lazyLoad
-(JobsOCGraphicCaptchaView *)captchaView{
    if (!_captchaView) {
        _captchaView = JobsOCGraphicCaptchaView.new
            .byConfig(self.graphicCaptchaConfig)
            .byFont(UIFontWeightSemiboldSize(16))
            .byCaptchaBackgroundColor(JobsWhiteColor);
        _captchaView.byAlpha(0.9);
        _captchaView.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(JobsWidth(5));
            make.bottom.equalTo(self).offset(-JobsWidth(5));
            make.right.equalTo(self).offset(-JobsWidth(10));
            make.width.mas_equalTo(JobsWidth(96));
        });self.refresh();
        _captchaView.cornerCutToCircleWithCornerRadius(JobsWidth(20));
    };return _captchaView;
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
                    make.right.equalTo(self.captchaView.mas_left).offset(-JobsWidth(8));
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_4
-(JobsRetJobsAppDoorInputViewBaseStyle_4ByJobsAppDoorInputViewBaseStyleModelBlock _Nonnull)byDoorInputViewBaseStyleModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyle_4 * _Nullable(JobsAppDoorInputViewBaseStyleModel * _Nullable data){
        @jobs_strongify(self)
        [self setDoorInputViewBaseStyleModel:data];
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyle_4ByJobsOCGraphicCaptchaConfigBlock _Nonnull)byGraphicCaptchaConfig{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyle_4 * _Nullable(JobsOCGraphicCaptchaConfig * _Nullable data){
        @jobs_strongify(self)
        [self setGraphicCaptchaConfig:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_4
@end
