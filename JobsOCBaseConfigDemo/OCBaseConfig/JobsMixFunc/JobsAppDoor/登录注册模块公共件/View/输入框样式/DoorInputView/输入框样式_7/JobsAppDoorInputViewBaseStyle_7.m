//
//  JobsAppDoorInputViewBaseStyle_7.m
//  JobsOCTools
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
    [super layoutSubviews];
}
#pragma mark —— 一些私有方法
-(void)configTextField{
//    self.magicTextField.leftView;
//    self.magicTextField.leftViewMode;
    self.magicTextField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(12);
    self.magicTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
    self.magicTextField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    self.magicTextField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    self.magicTextField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    self.magicTextField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(14);
    self.magicTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
    self.magicTextField.byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance);
    self.magicTextField.byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType);
    self.magicTextField.byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
    self.magicTextField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    self.magicTextField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    self.magicTextField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    self.magicTextField.requestParams = self.textFieldInputModel;
    self.magicTextField.text_offset = self.doorInputViewBaseStyleModel.offset ? : JobsWidth(12);
    self.magicTextField.animationColor = self.doorInputViewBaseStyleModel.animationColor ? : Cor3;
    self.magicTextField.moveDistance = self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(35);
    self.magicTextField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(12);
}

-(void)block:(JobsMagicTextField *)textField value:(NSString *)value{
    self.textFieldInputModel.resString = value;
    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeholder;
    textField.requestParams = self.textFieldInputModel;
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.doorInputViewBaseStyleModel.keyboardEnable;
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
        self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new;
        self.leftIMGV.byAlpha(1);
        self.chooseBtn.byAlpha(1);
        self.magicTextField.byAlpha(1);
        [self configTextField];
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected{
    self.magicTextField.animationColor = toRegisterBtnSelected ? Cor3 : Cor3;
}

-(JobsMagicTextField *_Nullable)getTextField{
    return self.magicTextField;
}

-(NSString *_Nullable)textFieldValue{
    return self.magicTextField.text;
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
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(12), JobsWidth(16)));
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
                x.requestParams = @"JobsAppDoorCountryCodeCtrl";
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.equalTo(self.leftIMGV.mas_right).offset(JobsWidth(12));
                make.centerY.equalTo(self);
                make.size.mas_equalTo(CGSizeMake(JobsWidth(62), JobsWidth(20)));
            })
            .byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button.byContentHorizontalAlignment(UIControlContentHorizontalAlignmentLeft);
                button.titleLabel
                    .byAdjustsFontSizeToFitWidth(YES)
                    .byMinimumScaleFactor(0.72f);
            });
    };return _chooseBtn;
}

-(UIViewModel *)chooseBtnViewModel{
    if (!_chooseBtnViewModel) {
        @jobs_weakify(self)
        _chooseBtnViewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            @jobs_strongify(self)
            data.textModel.byText(@"🇨🇳｜+86")
                          .byTextCor(JobsWhiteColor)
                          .byTextLineSpacing(0)
                          .byFont(UIFontWeightRegularSize(14));
            data.byBgCor(JobsClearColor);
            data.subTextModel.byText(@"".tr);
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
                    make.left.equalTo(self.chooseBtn.mas_right);
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

@end
