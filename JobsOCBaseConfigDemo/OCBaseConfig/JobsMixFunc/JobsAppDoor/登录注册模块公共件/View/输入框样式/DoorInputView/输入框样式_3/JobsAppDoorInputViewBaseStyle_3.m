//
//  JobsAppDoorInputViewBaseStyle_3.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle_3.h"

@interface JobsAppDoorInputViewBaseStyle_3 ()
/// UI
Prop_strong()UIButton *securityModeBtn;
Prop_strong()UIImageView *leftIMGV;
/// Data
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

@implementation JobsAppDoorInputViewBaseStyle_3
@synthesize thisViewSize = _thisViewSize;
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
//        self.backgroundColor = JobsRedColor;
        self.thisViewSize = thisViewSize;
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
    if (isValue(self.doorInputViewBaseStyleModel.inputStr)) {
        self.magicTextField.byText(self.doorInputViewBaseStyleModel.inputStr);
    }
    self.magicTextField.background = self.doorInputViewBaseStyleModel.background;
    self.magicTextField.byBgColor(self.doorInputViewBaseStyleModel.backgroundColor);
    self.magicTextField.disabledBackground = self.doorInputViewBaseStyleModel.disabledBackground;
    self.magicTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
    UIImage *leftImage = self.doorInputViewBaseStyleModel.leftViewIMG;
    CGFloat leftOffset = leftImage ? (self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17)) : 0;
    CGFloat placeholderOffset = leftImage ? (self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(35)) : JobsWidth(12);
    self.leftIMGV.byImage(leftImage).byAlpha(leftImage ? 1 : 0);
    self.magicTextField.leftView = nil;
    self.magicTextField.leftViewMode = UITextFieldViewModeNever;
    self.magicTextField.byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
    self.magicTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
    self.magicTextField.byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType);
    self.magicTextField.byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance);
    self.magicTextField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    self.magicTextField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    self.magicTextField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    self.magicTextField.text_offset = leftImage ? (self.doorInputViewBaseStyleModel.offset ? : placeholderOffset) : JobsWidth(12);
    self.magicTextField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    self.magicTextField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    self.magicTextField.leftViewOffsetX = leftOffset;
    self.magicTextField.animationColor = self.doorInputViewBaseStyleModel.animationColor ? : Cor3;
    self.magicTextField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    self.magicTextField.moveDistance = self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(35);
    self.magicTextField.placeHolderOffset = placeholderOffset;
    self.magicTextField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
    self.textFieldInputModel.PlaceHolder = self.magicTextField.placeholder;
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

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable data) {
        @jobs_strongify(self)
        self.doorInputViewBaseStyleModel = data ? : JobsAppDoorInputViewBaseStyleModel.new;
        self.magicTextField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;/// ❎
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

-(UIButton *)getSecurityModeBtn{
    return _securityModeBtn;
}
#pragma mark —— UITextFieldDelegate
/// 获得焦点成为第一响应者，此时 textField.isEditing == YES
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
#pragma mark —— lazyLoad
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

-(UIButton *)securityModeBtn{
    if (!_securityModeBtn) {
        @jobs_weakify(self)
        _securityModeBtn = UIButton.jobsInit()
        .selectedStateImageBy(self.doorInputViewBaseStyleModel.selectedSecurityBtnIMG ? : JobsRedColor.image)
        .jobsResetBtnImage(self.doorInputViewBaseStyleModel.unSelectedSecurityBtnIMG ? : JobsBlueColor.image)
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            x.selected = !x.selected;
            self.magicTextField.bySecureTextEntry(!x.selected);
            if (x.selected && !self.magicTextField.isEditing) {
                self.magicTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
            }
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        })
        .addOn(self)
        .byAdd(^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self);
            make.width.mas_equalTo(JobsWidth(40));
        });
    };return _securityModeBtn;
}
@synthesize magicTextField = _magicTextField;
-(JobsMagicTextField *)magicTextField{
    if (!_magicTextField) {
        @jobs_weakify(self)
        _magicTextField = jobsMakeMagicTextField(^(__kindof JobsMagicTextField * _Nullable textField) {
            @jobs_strongify(self)
            textField.byDelegate(self);
            textField.bySecureTextEntry(self.doorInputViewBaseStyleModel.isShowSecurityBtn);
            [textField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
                JobsLog(@"SSS = %@",self.textFieldInputModel.PlaceHolder);
                @jobs_strongify(self)
                return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
            } subscribeNextBlock:^(NSString *_Nullable x) {
                @jobs_strongify(self)
                JobsLog(@"输入的字符为 = %@",x);
                self.securityModeBtn.jobsVisible = isValue(x) && self.doorInputViewBaseStyleModel.isShowSecurityBtn;/// 👁
                if(!x) return;
                if (x.isContainsSpecialSymbolsString(nil)) {
                    @"Do not enter special characters".tr.toast();
                }else{
                    [self block:textField value:x];
                }
            }];
            textField.addOn(self).byAdd(^(MASConstraintMaker *make) {
                make.top.left.bottom.equalTo(self);
                if (self.doorInputViewBaseStyleModel.isShowSecurityBtn) {
                    make.right.equalTo(self.securityModeBtn.mas_left);
                }else{
                    make.right.equalTo(self);
                }
            });
        });
    };return _magicTextField;
}

@end
