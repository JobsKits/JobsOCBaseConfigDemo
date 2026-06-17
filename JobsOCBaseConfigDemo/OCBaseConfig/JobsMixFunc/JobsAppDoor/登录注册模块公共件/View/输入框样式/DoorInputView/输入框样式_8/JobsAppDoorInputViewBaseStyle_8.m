//
//  JobsAppDoorInputViewBaseStyle_8.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2020/12/4.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsAppDoorInputViewBaseStyle_8.h"

@interface JobsAppDoorInputViewBaseStyle_8 ()
/// UI
Prop_strong()BaseButton *securityModelBtn;
Prop_strong()UILabel *titleLab;
/// Data
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

@implementation JobsAppDoorInputViewBaseStyle_8

-(instancetype)init{
    if (self = [super init]) {

    };return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor;
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.jobsWidth = 1;
            data.layerCor = Cor3;
        }));
    };return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些私有方法
-(void)configTextField{
    if (isValue(self.doorInputViewBaseStyleModel.inputStr)) {
        self.zyTextField.text = self.doorInputViewBaseStyleModel.inputStr;
    }
    self.zyTextField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
    self.zyTextField.background = self.doorInputViewBaseStyleModel.background;
    self.zyTextField.backgroundColor = self.doorInputViewBaseStyleModel.backgroundColor;
    self.zyTextField.disabledBackground = self.doorInputViewBaseStyleModel.disabledBackground;
    self.zyTextField.leftView = [UIImageView.alloc initWithImage:self.doorInputViewBaseStyleModel.leftViewIMG];
    self.zyTextField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
    self.zyTextField.background = self.doorInputViewBaseStyleModel.background;
    self.zyTextField.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
    self.zyTextField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
    self.zyTextField.returnKeyType = self.doorInputViewBaseStyleModel.returnKeyType;
    self.zyTextField.keyboardAppearance = self.doorInputViewBaseStyleModel.keyboardAppearance;
    self.zyTextField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    self.zyTextField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    self.zyTextField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    self.zyTextField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    self.zyTextField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(20);
    self.zyTextField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    self.zyTextField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    self.zyTextField.requestParams = self.textFieldInputModel;
    self.zyTextField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17);
    self.zyTextField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
}

-(void)block:(ZYTextField *)textField
       value:(NSString *)value{
    
    self.textFieldInputModel.resString = value;
    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeholder;

    textField.requestParams = self.textFieldInputModel;
    
    if (self.objBlock) self.objBlock(textField);
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.doorInputViewBaseStyleModel.keyboardEnable;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(345), JobsWidth(50));
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new;
        self.titleLab.alpha = 1;
        self.securityModelBtn.alpha = 1;
        self.textField.alpha = 1;
        [self configTextField];
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(ZYTextField *_Nullable)getTextField{
    return _zyTextField;
}

-(NSString *_Nullable)textFieldValue{
    return _zyTextField.text;
}
#pragma mark —— lazyLoad
-(BaseButton *)securityModelBtn{
    if (!_securityModelBtn) {
        @jobs_weakify(self)
        _securityModelBtn = BaseButton
            .initByNormalImage(self.doorInputViewBaseStyleModel.unSelectedSecurityBtnIMG ? : JobsBlueColor.image)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                x.selected = !x.selected;
                x.jobsResetBtnImage(self.doorInputViewBaseStyleModel.selectedSecurityBtnIMG ? : JobsRedColor.image);
                self.textField.secureTextEntry = x.selected;
                if (x.selected && !self.textField.isEditing) {
                    self.textField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
                }
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        });
        [self.addSubview(_securityModelBtn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.equalTo(self);
            make.width.mas_equalTo(40);
            make.bottom.equalTo(self.titleLab.mas_top);
        }];
    };return _securityModelBtn;
}
@synthesize zyTextField = _zyTextField;
-(ZYTextField *)zyTextField{
    if (!_zyTextField) {
        _zyTextField = ZYTextField.new;
        _zyTextField.delegate = self;
        @jobs_weakify(self)
        [_zyTextField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
            @jobs_strongify(self)
            return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
        } subscribeNextBlock:^(NSString *_Nullable x) {
            @jobs_strongify(self)
            JobsLog(@"输入的字符为 = %@",x);
            self.securityModelBtn.jobsVisible = isValue(x) && self.doorInputViewBaseStyleModel.isShowSecurityBtn;/// 👁
            if (x.isContainsSpecialSymbolsString(nil)) {
                @"Do not enter special characters".tr.toast();
            }else{
                JobsLog(@"输入的字符为 = %@",x);
                [self block:self->_zyTextField
                      value:x];
            }
        }];
        [self.addSubview(_zyTextField) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    };return _zyTextField;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byFont(UIFontWeightRegularSize(JobsWidth(11)))
                .byText(self.doorInputViewBaseStyleModel.textModel.text)
                .byTextCor(self.doorInputViewBaseStyleModel.textModel.textCor)
                .setMasonryBy(^(MASConstraintMaker *_Nonnull make){
                    @jobs_strongify(self)
                    make.left.bottom.equalTo(self);
                    make.top.equalTo(self.textField.mas_bottom);
                }).on();
        });
    };return _titleLab;
}

@end
