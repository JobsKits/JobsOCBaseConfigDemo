//
//  JobsAppDoorInputViewBaseStyle_8.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
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
    if (isValue(self.doorInputViewBaseStyleModel.inputStr)) {
        self.zyTextField.byText(self.doorInputViewBaseStyleModel.inputStr);

    }
    self.zyTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
    self.zyTextField.background = self.doorInputViewBaseStyleModel.background;
    self.zyTextField.byBgColor(self.doorInputViewBaseStyleModel.backgroundColor);
    self.zyTextField.disabledBackground = self.doorInputViewBaseStyleModel.disabledBackground;
    self.zyTextField.leftView = [UIImageView.alloc initWithImage:self.doorInputViewBaseStyleModel.leftViewIMG];
    self.zyTextField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
    self.zyTextField.background = self.doorInputViewBaseStyleModel.background;
    self.zyTextField.byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
    self.zyTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
    self.zyTextField.byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType);
    self.zyTextField.byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance);
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
        self.titleLab.byAlpha(1);
        self.securityModelBtn.byAlpha(1);
        self.zyTextField.byAlpha(1);
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
                self.zyTextField.bySecureTextEntry(x.selected);

                if (x.selected && !self.zyTextField.isEditing) {
                    self.zyTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
                }
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        });
        _securityModelBtn.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.top.right.equalTo(self);
            make.width.mas_equalTo(40);
            make.bottom.equalTo(self.titleLab.mas_top);
        });
    };return _securityModelBtn;
}
@synthesize zyTextField = _zyTextField;
-(ZYTextField *)zyTextField{
    if (!_zyTextField) {
        _zyTextField = jobsMakeZYTextField(^(ZYTextField * _Nullable textField) {
            textField
                .byDelegate(self)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });

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
        });
    };return _zyTextField;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont(UIFontWeightRegularSize(JobsWidth(11)))
                .byText(self.doorInputViewBaseStyleModel.textModel.text)
                .byTextCor(self.doorInputViewBaseStyleModel.textModel.textCor)
                .setMasonryBy(^(MASConstraintMaker *_Nonnull make){
                    @jobs_strongify(self)
                    make.left.bottom.equalTo(self);
                    make.top.equalTo(self.zyTextField.mas_bottom);
                }).on();
        });
    };return _titleLab;
}

@end
