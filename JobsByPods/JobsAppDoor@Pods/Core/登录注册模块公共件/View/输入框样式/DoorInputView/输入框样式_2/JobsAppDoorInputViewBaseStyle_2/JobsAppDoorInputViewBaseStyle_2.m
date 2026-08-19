//
//  JobsAppDoorInputViewBaseStyle_2.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle_2.h"

@interface JobsAppDoorInputViewBaseStyle_2 ()
/// UI
Prop_strong()ImageCodeView *imageCodeView;
/// Data
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_2
@interface JobsAppDoorInputViewBaseStyle_2 (JobsPropertyDSLSetterAutogen_f3a0eb8cbc)
-(void)setDoorInputViewBaseStyleModel:(JobsAppDoorInputViewBaseStyleModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_2

@implementation JobsAppDoorInputViewBaseStyle_2
@synthesize thisViewSize = _thisViewSize;
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_2.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
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
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_2.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
        [self.imageCodeView appointCornerCutToCircleByRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight
                                                          cornerRadii:CGSizeMake(self.imageCodeView.height / 2, self.imageCodeView.height / 2)];
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)configTextField{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        _magicTextField
            .byLeftView(jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView
                    .byImage(self.doorInputViewBaseStyleModel.leftViewIMG)
                    .byUserInteractionEnabled(NO);
            }))
            .byLeftViewMode(self.doorInputViewBaseStyleModel.leftViewMode);
        _magicTextField.byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType);
        _magicTextField.byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance);
        _magicTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
        _magicTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
        _magicTextField.byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
        _magicTextField.byUseCustomClearButton(self.doorInputViewBaseStyleModel.useCustomClearButton);
        _magicTextField.byIsShowDelBtn(self.doorInputViewBaseStyleModel.isShowDelBtn);
        _magicTextField.byRightViewOffsetX(self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8));
        _magicTextField.byPlaceholderColor(self.doorInputViewBaseStyleModel.placeholderColor);
        _magicTextField.byLeftViewOffsetX(self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17));
        _magicTextField.byPlaceholderFont(self.doorInputViewBaseStyleModel.placeholderFont);
        _magicTextField.byRequestParams(self.textFieldInputModel);
        _magicTextField.byAnimationColor(self.doorInputViewBaseStyleModel.animationColor ? : Cor3);
        _magicTextField.byPlaceHolderAlignment(self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft);
        _magicTextField.byPlaceHolderOffset(self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(20));
        _magicTextField.byMoveDistance(self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(40));
        _magicTextField.byFieldEditorOffset(self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50));
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
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_2.class, @selector(jobsTextFieldShouldBeginEditing)))(self, @selector(jobsTextFieldShouldBeginEditing));
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
        self.imageCodeView.byAlpha(1);
        self.magicTextField.byAlpha(1);
        self.configTextField();
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_2.class, @selector(jobsChangeTextFieldAnimationColor)))(self, @selector(jobsChangeTextFieldAnimationColor));
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
    JobsRetJobsMagicTextFieldByVoidBlock action = ((JobsRetJobsMagicTextFieldByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_2.class, @selector(jobsGetTextField)))(self, @selector(jobsGetTextField));
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
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_2.class, @selector(jobsTextFieldValue)))(self, @selector(jobsTextFieldValue));
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
-(ImageCodeView *)imageCodeView{
    if (!_imageCodeView) {
        _imageCodeView = ImageCodeView.new;
        _imageCodeView.byFont(JobsFontRegular(16));
        _imageCodeView.byAlpha(0.7);
        _imageCodeView.byBgColor(JobsWhiteColor);
        _imageCodeView.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.right.equalTo(self);
            make.width.mas_equalTo(80);
        });
    };return _imageCodeView;
}
@synthesize magicTextField = _magicTextField;
-(JobsMagicTextField *)magicTextField{
    if (!_magicTextField) {
        @jobs_weakify(self)
        _magicTextField = jobsMakeMagicTextField(^(__kindof JobsMagicTextField * _Nullable textField) {
            @jobs_strongify(self)
            textField.byDelegate(self)
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.top.bottom.equalTo(self);
                make.right.equalTo(self.imageCodeView.mas_left);
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_2
-(JobsRetJobsAppDoorInputViewBaseStyle_2ByJobsAppDoorInputViewBaseStyleModelBlock _Nonnull)byDoorInputViewBaseStyleModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyle_2 * _Nullable(JobsAppDoorInputViewBaseStyleModel * _Nullable data){
        @jobs_strongify(self)
        [self setDoorInputViewBaseStyleModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_2
@end
