//
//  JobsAppDoorInputViewBaseStyle_1.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle_1.h"

static CGFloat JobsAppDoorVerificationCodeBtnWidth(void){
    return JobsWidth(82);
}

@interface JobsAppDoorInputViewBaseStyle_1 ()
/// UI
Prop_strong()JobsCountdownBtn *countDownBtn;
Prop_strong()UIImageView *leftIMGV;
/// Data
Prop_copy()NSString *titleStr_1;
Prop_copy()NSString *titleStr_2;
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_1
@interface JobsAppDoorInputViewBaseStyle_1 (JobsPropertyDSLSetterAutogen_f8492514f2)
-(void)setDoorInputViewBaseStyleModel:(JobsAppDoorInputViewBaseStyleModel * _Nullable)data;
-(void)setTitleStr_1:(NSString * _Nullable)data;
-(void)setTitleStr_2:(NSString * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_1

@implementation JobsAppDoorInputViewBaseStyle_1
@synthesize thisViewSize = _thisViewSize;
- (instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.setting();
    };return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.byThisViewSize(thisViewSize);
        self.setting();
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_1.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.countDownBtn.byWidth(self.countDownBtnWidth ? : JobsAppDoorVerificationCodeBtnWidth());
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)setting{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.byTitleStr_1(@"点击".jobsTr());
        self.byTitleStr_2(@"发送验证码".jobsTr());
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.byLayerCor(JobsWhiteColor)
                .byJobsWidth(1);
        }));
    };
}

-(jobsByVoidBlock _Nonnull)configTextField{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.magicTextField.byPlaceholdAnimationable(self.doorInputViewBaseStyleModel.isPlaceholdAnimationable);
        UIImage *leftImage = self.doorInputViewBaseStyleModel.leftViewIMG;
        CGFloat leftOffset = leftImage ? (self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(14)) : 0;
        CGFloat placeholderOffset = leftImage ? (self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(39)) : JobsWidth(12);
        self.leftIMGV.byImage(leftImage).byAlpha(leftImage ? 1 : 0);
        _magicTextField.byLeftView(nil);
        _magicTextField.byLeftViewMode(UITextFieldViewModeNever);
        _magicTextField
            .byPlaceholder(self.doorInputViewBaseStyleModel.placeholder)
            .byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType)
            .byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType)
            .byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance)
            .byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
        _magicTextField.byUseCustomClearButton(self.doorInputViewBaseStyleModel.useCustomClearButton);
        _magicTextField.byIsShowDelBtn(self.doorInputViewBaseStyleModel.isShowDelBtn);
        _magicTextField.byRightViewOffsetX(self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8));
        _magicTextField.byRequestParams(self.textFieldInputModel);
        _magicTextField.byPlaceholderColor(self.doorInputViewBaseStyleModel.placeholderColor);
        _magicTextField.byPlaceholderFont(self.doorInputViewBaseStyleModel.placeholderFont);
        _magicTextField.byLeftViewOffsetX(leftOffset);
        _magicTextField.byTextOffset(leftImage ? (self.doorInputViewBaseStyleModel.offset ? : placeholderOffset) : JobsWidth(12));
        _magicTextField.byAnimationColor(self.doorInputViewBaseStyleModel.animationColor ? : Cor3);
        _magicTextField.byPlaceHolderAlignment(self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft);
        _magicTextField.byPlaceHolderOffset(placeholderOffset);
        _magicTextField.byMoveDistance(self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(35));
        _magicTextField.byFieldEditorOffset(self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(4));
    };
}

-(void)block:(JobsMagicTextField *)textField
       value:(NSString *)value{
    self.textFieldInputModel.byResString(value);
    self.textFieldInputModel.byPlaceHolder(self.doorInputViewBaseStyleModel.placeholder);
    textField.byRequestParams(self.textFieldInputModel);
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
/// 倒计时按钮（需要销毁定时器）
-(JobsRetBtnByVoidBlock _Nonnull)getCountDownBtn{
    @jobs_weakify(self)
    return ^UIButton *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.countDownBtn;
    };
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_1.class, @selector(jobsTextFieldShouldBeginEditing)))(self, @selector(jobsTextFieldShouldBeginEditing));
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
                    make.left.equalTo(self).offset(JobsWidth(14));
                    make.centerY.equalTo(self);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(16), JobsWidth(16)));
                });
        });
    };return _leftIMGV;
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.byDoorInputViewBaseStyleModel(doorInputViewBaseStyleModel);
        self.countDownBtn.byAlpha(1);
        self.magicTextField.byAlpha(1);
        self.configTextField();
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_1.class, @selector(jobsChangeTextFieldAnimationColor)))(self, @selector(jobsChangeTextFieldAnimationColor));
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
    JobsRetJobsMagicTextFieldByVoidBlock action = ((JobsRetJobsMagicTextFieldByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_1.class, @selector(jobsGetTextField)))(self, @selector(jobsGetTextField));
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
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_1.class, @selector(jobsTextFieldValue)))(self, @selector(jobsTextFieldValue));
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
-(JobsCountdownBtn *)countDownBtn{
    if (!_countDownBtn) {
        @jobs_weakify(self)
        JobsCountdownBtn *countdownBtn = JobsCountdownBtn.verificationCodeButton();
        countdownBtn.byJobsCountdownNormalTitle(Title9);
        countdownBtn.byJobsCountdownDuration(60);
        countdownBtn.byJobsCountdownClickBlock(^(id _Nullable data) {
            @jobs_strongify(self)
            if (self.objBlock) self.objBlock(data);
        });
        _countDownBtn = (JobsCountdownBtn *)countdownBtn
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.right.equalTo(self).offset(-JobsWidth(14));
                make.top.equalTo(self).offset(JobsWidth(8));
                make.bottom.equalTo(self).offset(-JobsWidth(8));
                make.width.mas_equalTo(self.countDownBtnWidth ? : JobsAppDoorVerificationCodeBtnWidth());
            })
            .byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button.byContentHorizontalAlignment(UIControlContentHorizontalAlignmentRight);
                button.titleLabel
                    .byAdjustsFontSizeToFitWidth(YES)
                    .byLineBreakMode(NSLineBreakByTruncatingTail)
                    .byMinimumScaleFactor(0.7f);
            });
    };return _countDownBtn;
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
                    make.top.left.bottom.equalTo(self);
                    make.right.equalTo(self.countDownBtn.mas_left).offset(-JobsWidth(8));
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_1
-(JobsRetJobsAppDoorInputViewBaseStyle_1ByJobsAppDoorInputViewBaseStyleModelBlock _Nonnull)byDoorInputViewBaseStyleModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyle_1 * _Nullable(JobsAppDoorInputViewBaseStyleModel * _Nullable data){
        @jobs_strongify(self)
        [self setDoorInputViewBaseStyleModel:data];
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyle_1ByNSStringBlock _Nonnull)byTitleStr_1{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyle_1 * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setTitleStr_1:data];
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyle_1ByNSStringBlock _Nonnull)byTitleStr_2{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyle_1 * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setTitleStr_2:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_1
@end
