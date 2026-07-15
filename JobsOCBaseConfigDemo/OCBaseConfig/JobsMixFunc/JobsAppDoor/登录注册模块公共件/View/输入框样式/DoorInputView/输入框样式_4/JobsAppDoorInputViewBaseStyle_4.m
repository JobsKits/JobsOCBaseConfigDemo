//
//  JobsAppDoorInputViewBaseStyle_4.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle_4.h"

@interface JobsAppDoorInputViewBaseStyle_4 ()
/// UI
Prop_strong()JobsGraphicCaptchaView *captchaView;
Prop_strong()UIImageView *leftIMGV;
/// Data
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

@implementation JobsAppDoorInputViewBaseStyle_4
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
        self.thisViewSize = thisViewSize;
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.byJobsWidth(1)
                .byLayerCor(JobsWhiteColor);
        }));
    };return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些私有方法
-(void)configTextField{
    UIImage *leftImage = self.doorInputViewBaseStyleModel.leftViewIMG;
    CGFloat leftOffset = leftImage ? (self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17)) : 0;
    CGFloat placeholderOffset = leftImage ? (self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(35)) : JobsWidth(12);
    self.leftIMGV.byImage(leftImage).byAlpha(leftImage ? 1 : 0);
    self.magicTextField.leftView = nil;
    self.magicTextField.leftViewMode = UITextFieldViewModeNever;
    self.magicTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
    self.magicTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
    self.magicTextField.byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType);
    self.magicTextField.byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance);
    self.magicTextField.byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
    self.magicTextField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    self.magicTextField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    self.magicTextField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    self.magicTextField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    self.magicTextField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    self.magicTextField.requestParams = self.textFieldInputModel;
    self.magicTextField.leftViewOffsetX = leftOffset;
    self.magicTextField.text_offset = leftImage ? (self.doorInputViewBaseStyleModel.offset ? : placeholderOffset) : JobsWidth(12);
    self.magicTextField.animationColor = self.doorInputViewBaseStyleModel.animationColor ? : Cor3;
    self.magicTextField.moveDistance = self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(35);
    self.magicTextField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    self.magicTextField.placeHolderOffset = placeholderOffset;
    self.magicTextField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(4);
}

-(void)block:(JobsMagicTextField *)textField
       value:(NSString *)value{
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
        self.doorInputViewBaseStyleModel = data;
        self.captchaView.byAlpha(1);
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
-(JobsGraphicCaptchaView *)captchaView{
    if (!_captchaView) {
        _captchaView = JobsGraphicCaptchaView.new;
        _captchaView.config = JobsGraphicCaptchaConfig.mixedConfig;
        _captchaView.font = UIFontWeightSemiboldSize(16);
        _captchaView.byAlpha(0.9);
        _captchaView.captchaBackgroundColor = JobsWhiteColor;
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

@end
