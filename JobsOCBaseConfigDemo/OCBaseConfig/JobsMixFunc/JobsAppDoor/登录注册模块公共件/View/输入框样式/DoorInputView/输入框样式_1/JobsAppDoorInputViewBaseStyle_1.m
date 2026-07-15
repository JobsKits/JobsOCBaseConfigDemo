//
//  JobsAppDoorInputViewBaseStyle_1.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle_1.h"

@interface JobsAppDoorInputViewBaseStyle_1 ()
/// UI
Prop_strong()JobsCountdownBtn *countDownBtn;
Prop_strong()UIImageView *leftIMGV;
/// Data
Prop_copy()NSString *titleStr_1;
Prop_copy()NSString *titleStr_2;
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

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
        self.thisViewSize = thisViewSize;
        self.setting();
    };return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.countDownBtn.byWidth(self.countDownBtnWidth ? : JobsWidth(104));
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)setting{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.titleStr_1 = @"点击".tr;
        self.titleStr_2 = @"发送验证码".tr;
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.byLayerCor(JobsWhiteColor)
                .byJobsWidth(1);
        }));
    };
}

-(void)configTextField{
    UIImage *leftImage = self.doorInputViewBaseStyleModel.leftViewIMG;
    CGFloat leftOffset = leftImage ? (self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(14)) : 0;
    CGFloat placeholderOffset = leftImage ? (self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(39)) : JobsWidth(12);
    self.leftIMGV.byImage(leftImage).byAlpha(leftImage ? 1 : 0);
    _magicTextField.leftView = nil;
    _magicTextField.leftViewMode = UITextFieldViewModeNever;
    _magicTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
    _magicTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
    _magicTextField.byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType);
    _magicTextField.byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance);
    _magicTextField.byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
    _magicTextField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    _magicTextField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    _magicTextField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    _magicTextField.requestParams = self.textFieldInputModel;
    _magicTextField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    _magicTextField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    _magicTextField.leftViewOffsetX = leftOffset;
    _magicTextField.text_offset = leftImage ? (self.doorInputViewBaseStyleModel.offset ? : placeholderOffset) : JobsWidth(12);
    _magicTextField.animationColor = self.doorInputViewBaseStyleModel.animationColor ? : Cor3;
    _magicTextField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    _magicTextField.placeHolderOffset = placeholderOffset;
    _magicTextField.moveDistance = self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(35);
    _magicTextField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(4);
}

-(void)block:(JobsMagicTextField *)textField
       value:(NSString *)value{
    self.textFieldInputModel.resString = value;
    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeholder;
    textField.requestParams = self.textFieldInputModel;
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
/// 倒计时按钮（需要销毁定时器）
-(UIButton *)getCountDownBtn{
    return self.countDownBtn;
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
        self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel;
        self.countDownBtn.byAlpha(1);
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
-(JobsCountdownBtn *)countDownBtn{
    if (!_countDownBtn) {
        @jobs_weakify(self)
        JobsCountdownBtn *countdownBtn = [JobsCountdownBtn verificationCodeButton];
        [countdownBtn byJobsCountdownNormalTitle:Title9];
        [countdownBtn byJobsCountdownDuration:60];
        [countdownBtn byJobsCountdownClickBlock:^(id _Nullable data) {
            @jobs_strongify(self)
            if (self.objBlock) self.objBlock(data);
        }];
        _countDownBtn = (JobsCountdownBtn *)countdownBtn
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.right.equalTo(self).offset(-JobsWidth(14));
                make.top.equalTo(self).offset(JobsWidth(8));
                make.bottom.equalTo(self).offset(-JobsWidth(8));
                make.width.mas_equalTo(JobsWidth(104));
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

@end
