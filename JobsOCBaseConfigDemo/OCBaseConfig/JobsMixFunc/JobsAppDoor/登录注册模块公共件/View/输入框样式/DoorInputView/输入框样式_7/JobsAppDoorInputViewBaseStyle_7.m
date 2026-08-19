//
//  JobsAppDoorInputViewBaseStyle_7.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle_7.h"

@interface JobsAppDoorInputViewBaseStyle_7 ()
/// UI
Prop_strong()UIImageView *leftIMGV;
Prop_strong()UIButton *chooseBtn;
/// Data
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;
Prop_strong()UIViewModel *chooseBtnViewModel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_7
@interface JobsAppDoorInputViewBaseStyle_7 (JobsPropertyDSLSetterAutogen_76e053cfd3)
-(void)setDoorInputViewBaseStyleModel:(JobsAppDoorInputViewBaseStyleModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_7

@implementation JobsAppDoorInputViewBaseStyle_7
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
        self.byBgColor(JobsClearColor);
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.byJobsWidth(1)
                .byLayerCor(Cor3);
        }));
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_7.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
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
    //    self.magicTextField.leftView;
    //    self.magicTextField.leftViewMode;
        self.magicTextField.byPlaceholdAnimationable(self.doorInputViewBaseStyleModel.isPlaceholdAnimationable);
        self.magicTextField.byLeftViewOffsetX(self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(12));
        self.magicTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
        self.magicTextField.byPlaceholderColor(self.doorInputViewBaseStyleModel.placeholderColor);
        self.magicTextField.byPlaceholderFont(self.doorInputViewBaseStyleModel.placeholderFont);
        self.magicTextField.byPlaceHolderAlignment(self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft);
        self.magicTextField.byPlaceHolderOffset(self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(14));
        self.magicTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
        self.magicTextField.byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance);
        self.magicTextField.byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType);
        self.magicTextField.byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
        self.magicTextField.byUseCustomClearButton(self.doorInputViewBaseStyleModel.useCustomClearButton);
        self.magicTextField.byIsShowDelBtn(self.doorInputViewBaseStyleModel.isShowDelBtn);
        self.magicTextField.byRightViewOffsetX(self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8));
        self.magicTextField.byRequestParams(self.textFieldInputModel);
        self.magicTextField.byTextOffset(self.doorInputViewBaseStyleModel.offset ? : JobsWidth(12));
        self.magicTextField.byAnimationColor(self.doorInputViewBaseStyleModel.animationColor ? : Cor3);
        self.magicTextField.byMoveDistance(self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(35));
        self.magicTextField.byFieldEditorOffset(self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(12));
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
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_7.class, @selector(jobsTextFieldShouldBeginEditing)))(self, @selector(jobsTextFieldShouldBeginEditing));
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
        self.byDoorInputViewBaseStyleModel(doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new);
        self.leftIMGV.byAlpha(1);
        self.chooseBtn.byAlpha(1);
        self.magicTextField.byAlpha(1);
        self.configTextField();
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_7.class, @selector(jobsChangeTextFieldAnimationColor)))(self, @selector(jobsChangeTextFieldAnimationColor));
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
    JobsRetJobsMagicTextFieldByVoidBlock action = ((JobsRetJobsMagicTextFieldByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_7.class, @selector(jobsGetTextField)))(self, @selector(jobsGetTextField));
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
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_7.class, @selector(jobsTextFieldValue)))(self, @selector(jobsTextFieldValue));
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
-(UIImageView *)leftIMGV{
    if (!_leftIMGV) {
        @jobs_weakify(self)
        _leftIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byImage(self.doorInputViewBaseStyleModel.leftViewIMG)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self).offset(JobsWidth(14));
                    make.centerY.equalTo(self);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(10), JobsWidth(14)));
                });
        });
    };return _leftIMGV;
}

-(UIButton *)chooseBtn{
    if (!_chooseBtn) {
        @jobs_weakify(self)
        _chooseBtn = BaseButton.jobsInit()
            .bgColorBy(JobsClearColor)
            .jobsResetBtnTitleCor(self.chooseBtnViewModel.textModel.textCor)
            .jobsResetBtnTitleFont(self.chooseBtnViewModel.textModel.font)
            .jobsResetBtnTitle(self.chooseBtnViewModel.textModel.text)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.byRequestParams(@"JobsAppDoorCountryCodeCtrl");
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.equalTo(self.leftIMGV.mas_right).offset(JobsWidth(8));
                make.centerY.equalTo(self);
                make.size.mas_equalTo(CGSizeMake(JobsWidth(56), JobsWidth(18)));
            })
            .byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button.byContentHorizontalAlignment(UIControlContentHorizontalAlignmentLeft);
                button.titleLabel
                    .byNumberOfLines(1)
                    .byLineBreakMode(NSLineBreakByClipping)
                    .byAdjustsFontSizeToFitWidth(YES)
                    .byMinimumScaleFactor(0.8f);
            });
    };return _chooseBtn;
}

-(UIViewModel *)chooseBtnViewModel{
    if (!_chooseBtnViewModel) {
        @jobs_weakify(self)
        _chooseBtnViewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            @jobs_strongify(self)
            data.textModel.byText(@"🇨🇳|+86")
                          .byTextCor(JobsWhiteColor)
                          .byTextLineSpacing(0)
                          .byFont(UIFontWeightRegularSize(12));
            data.byBgCor(JobsClearColor);
            data.subTextModel.byText(@"".jobsTr());
        });
    };return _chooseBtnViewModel;
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
                    make.top.bottom.equalTo(self);
                    make.right.equalTo(self).offset(-JobsWidth(12));
                    make.left.equalTo(self.chooseBtn.mas_right).offset(JobsWidth(4));
                });
            [textField jobsTextFieldEventFilterBlock:^BOOL(NSString * _Nullable data) {
                @jobs_strongify(self)
                return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
            } subscribeNextBlock:^(NSString * _Nullable x) {
                @jobs_strongify(self)
                JobsLog(@"输入的字符为 = %@",x);
                [self block:self->_magicTextField value:x];
            }];
        });
    };return _magicTextField;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_7
-(JobsRetJobsAppDoorInputViewBaseStyle_7ByJobsAppDoorInputViewBaseStyleModelBlock _Nonnull)byDoorInputViewBaseStyleModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyle_7 * _Nullable(JobsAppDoorInputViewBaseStyleModel * _Nullable data){
        @jobs_strongify(self)
        [self setDoorInputViewBaseStyleModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_7
@end
