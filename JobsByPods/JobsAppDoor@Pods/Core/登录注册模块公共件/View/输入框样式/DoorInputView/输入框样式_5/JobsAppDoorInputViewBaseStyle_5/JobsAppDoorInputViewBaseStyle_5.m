//
//  JobsAppDoorInputViewBaseStyle_5.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle_5.h"

@interface JobsAppDoorInputViewBaseStyle_5 (){
    JobsDropDownListView *dropDownListView;
}
/// UI
Prop_strong()UILabel *titleLab;
Prop_strong()UIButton *authCodeBtn;
Prop_strong()BaseButton *securityModeBtn;
Prop_strong()BaseButton *chooseBtn;
/// Data
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;
Prop_strong()NSMutableArray <UIViewModel *>*jobsPageViewDataMutArr;
Prop_assign()CGSize chooseBtnSize;
Prop_strong()UIViewModel *chooseBtnViewModel;

@end

@implementation JobsAppDoorInputViewBaseStyle_5
@synthesize thisViewSize = _thisViewSize;
-(void)dealloc{
    [_authCodeBtn stop];
    jobsByCtrlBlock disappearBlock = dropDownListView.dropDownListViewDisappear;
    if (disappearBlock) disappearBlock(nil);
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.thisViewSize = thisViewSize;
    };return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    // 指定描边
    [self setBorderWithColor:RGBA_COLOR(162, 162, 162, 0.2f)
                 borderWidth:1
                  borderType:UIBorderSideTypeBottom];
}
#pragma mark —— 一些私有方法
-(void)registerNotification{
    @jobs_weakify(self)
    [self addNotificationName:@"关闭电话号码区号选择器"
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
        NSNotification *notification = (NSNotification *)arg;
        if([notification.object isKindOfClass:NSNumber.class]){
            NSNumber *b = notification.object;
            JobsLog(@"SSS = %d",b.boolValue);
        }
        if (self.style_5 == InputViewStyle_5_3) {
            self->dropDownListView.dropDownListViewDisappear(self.chooseBtn);
        }
    }];
}

-(void)configTextField{
    self.zyTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
    self.zyTextField.background = self.doorInputViewBaseStyleModel.background;
    self.zyTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
    self.zyTextField.byTextCor(self.doorInputViewBaseStyleModel.ZYtextColor);
    self.zyTextField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    self.zyTextField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    self.zyTextField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    self.zyTextField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment;
    self.zyTextField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset;
    self.zyTextField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX;
    self.zyTextField.text_offset = self.doorInputViewBaseStyleModel.offset;
    self.zyTextField.requestParams = self.textFieldInputModel;
    self.zyTextField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    self.zyTextField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    self.zyTextField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.doorInputViewBaseStyleModel.keyboardEnable;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(305), JobsWidth(14 + 36 + 4));
    };
}
/// 外层数据渲染
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new;
        [self registerNotification];
#warning 这里需要被修改
    //    self.chooseBtnSize = CGSizeMake([UIView widthByData:self.chooseBtnViewModel] + JobsWidth(10), JobsWidth(16));
        if (self.doorInputViewBaseStyleModel) {
            self.titleLab.byAlpha(1);
            switch (self.style_5) {
                /// 带发送验证码按钮
                case InputViewStyle_5_1:{
                    self.authCodeBtn.byAlpha(1);
                }break;
                /// 没有额外的UI控件
                case InputViewStyle_5_2:{
                }break;
                /// 电话号码区号选择器
                case InputViewStyle_5_3:{
                    self.chooseBtn.byAlpha(1);
                    self.zyTextField.byAlpha(1);
                }break;
                /// 未匹配已知分支时执行兜底处理
                default:
                    break;
            }
            self.zyTextField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;/// ❎
            [self configTextField];
        }
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(ZYTextField *_Nullable)getTextField{
    return self.zyTextField;
}

-(NSString *_Nullable)textFieldValue{
    return self.zyTextField.text;
}

-(BaseButton *)getSecurityModeBtn{
    return _securityModeBtn;
}
#pragma mark —— lazyLoad
-(BaseButton *)securityModeBtn{
    if (!_securityModeBtn) {
        @jobs_weakify(self)
        _securityModeBtn = BaseButton
            .initByNormalImage(self.doorInputViewBaseStyleModel.unSelectedSecurityBtnIMG ? : JobsBlueColor.image)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                x.byToggleSelected();
                if (x.jobs_isSelected) {
                    x.jobsResetBtnImage(self.doorInputViewBaseStyleModel.selectedSecurityBtnIMG ? : JobsRedColor.image);
                }
                self.zyTextField.bySecureTextEntry(x.jobs_isSelected);
                if (x.jobs_isSelected && !self.zyTextField.isEditing) {
                    self.zyTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
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

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(self.doorInputViewBaseStyleModel.titleStrCor)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self);
                    make.left.equalTo(self);
                });
        });
    }
    _titleLab
        .byText(self.doorInputViewBaseStyleModel.titleLabStr)
        .byFont(self.doorInputViewBaseStyleModel.titleStrFont)
        .makeLabelByShowingType(UILabelShowingType_03);
    return _titleLab;
}

-(UIButton<TimerProtocol> *)authCodeBtn{
    if (!_authCodeBtn) {
        @jobs_weakify(self)
        _authCodeBtn = (UIButton<TimerProtocol> *)UIButton.jobsInit()
            .onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .byOnTick(^(CGFloat time) {
                /// 每 tick 一次
                NSLog(@"剩余: %.0f", time);
            })
            .byOnFinish(^(JobsTimer * _Nullable timer) {
                /// 倒计时完成
                NSLog(@"倒计时结束");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.right.equalTo(self).offset(-JobsWidth(16));
                make.bottom.equalTo(self.zyTextField);
                make.size.mas_equalTo(CGSizeMake(JobsWidth(120), JobsWidth(25)));
            });
    };return _authCodeBtn;
}

-(BaseButton *)chooseBtn{
    if (!_chooseBtn) {
        @jobs_weakify(self)
        _chooseBtn = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            @jobs_strongify(self)
            data
                .byButtonConfigurationTitleAlignment(UIButtonConfigurationTitleAlignmentAutomatic)
                .byTextAlignment(NSTextAlignmentCenter)
                .bySubTextAlignment(NSTextAlignmentCenter)
                .byNormalImage(self.chooseBtnViewModel.image)
                .byTitle(self.chooseBtnViewModel.textModel.text)
                .byTitleFont(self.chooseBtnViewModel.textModel.font)
                .byTitleCor(self.chooseBtnViewModel.textModel.textCor)
                .byTitleLineBreakMode(NSLineBreakByWordWrapping)
                .bySubtitleLineBreakMode(NSLineBreakByWordWrapping)
                .byImagePadding(JobsWidth(8))
                .byImagePlacement(NSDirectionalRectEdgeTrailing)
                .byContentHorizontalAlignment(UIControlContentHorizontalAlignmentCenter)
                .byContentVerticalAlignment(UIControlContentVerticalAlignmentCenter)
                .byRoundingCorners(UIRectCornerAllCorners);
        }))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.byToggleSelected();
                if (self.objBlock) self.objBlock(x);
                if (x.jobs_isSelected) {
                    self->dropDownListView = [self motivateFromView:x
                                          jobsDropDownListViewDirection:JobsDropDownListViewDirection_UP
                                                                   data:self.jobsPageViewDataMutArr
                                                     motivateViewOffset:0
                                                            finishBlock:^(UIViewModel *data) {
                        JobsLog(@"data = %@", data);
                        JobsLog(@"data = %@", data.data);
                        x.jobsResetBtnTitle(data.textModel.text.add(data.subTextModel.text));
                    }];
                } else {
                    self->dropDownListView.dropDownListViewDisappear(x);
                }
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.bottom.equalTo(self).offset(-JobsWidth(8));
                make.size.mas_equalTo(self.chooseBtnSize);
                make.left.equalTo(self).offset(JobsWidth(0));
            });
    };return _chooseBtn;
}

@synthesize zyTextField = _zyTextField;
-(ZYTextField *)zyTextField{
    if (!_zyTextField) {
        _zyTextField = ZYTextField.new;
        _zyTextField.byDelegate(self);
        @jobs_weakify(self)
        [_zyTextField jobsTextFieldEventFilterBlock:^BOOL(NSString * _Nullable data) {
            @jobs_strongify(self)
            return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
        } subscribeNextBlock:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            self.securityModeBtn.jobsVisible = isValue(x) && self.doorInputViewBaseStyleModel.isShowSecurityBtn;/// 👁
            if (x.isContainsSpecialSymbolsString(nil)) {
                toastBy(@"Do not enter special characters".tr);
            }else{
                if (self.objBlock) self.objBlock(self->_zyTextField);
            }
        }];
        _zyTextField.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom);
            make.bottom.equalTo(self).offset(-JobsWidth(8));
            if (self.style_5 == InputViewStyle_5_1) {
                make.right.equalTo(self.authCodeBtn.mas_left);
                make.left.equalTo(self.titleLab);
            }else if (self.style_5 == InputViewStyle_5_2){
                make.right.equalTo(self);
                make.left.equalTo(self.titleLab);
            }else if (self.style_5 == InputViewStyle_5_3){
                make.right.equalTo(self);
                make.left.equalTo(self.chooseBtn.mas_right).offset(JobsWidth(10));
            }else{}
        });
    }
    if (self.doorInputViewBaseStyleModel.textModel.text.isDebugText) {
        _zyTextField.byText(@"".tr);
    };return _zyTextField;
}

-(UIViewModel *)chooseBtnViewModel{
    if (!_chooseBtnViewModel) {
        @jobs_weakify(self)
        _chooseBtnViewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            @jobs_strongify(self)
            data.textModel.byText(@"请选择区号".tr)
                          .byTextCor(JobsSecondaryLabelColor)
                          .byTextLineSpacing(0)
                          .byFont(UIFontWeightRegularSize(14));
            data.byBgCor(JobsClearColor)
                .byJobsWidth(self.chooseBtnSize.width);
            data.subTextModel.byText(@"".tr);
            data.byImage(@"向下的箭头".img);
        });
    };return _chooseBtnViewModel;
}

-(NSMutableArray<UIViewModel *> *)jobsPageViewDataMutArr{
    if (!_jobsPageViewDataMutArr) {
        @jobs_weakify(self)
        _jobsPageViewDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                @jobs_strongify(self)
                viewModel.textModel.byText(@"+87".tr)
                                   .byTextCor(JobsSecondaryLabelColor)
                                   .byTextLineSpacing(0)
                                   .byFont(UIFontWeightRegularSize(14));
                viewModel.byBgCor(JobsClearColor)
                         .byJobsWidth(self.chooseBtnSize.width);
                viewModel.subTextModel.byText(@"".tr);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                @jobs_strongify(self)
                viewModel.textModel.byText(@"+88".tr)
                                   .byTextCor(JobsSecondaryLabelColor)
                                   .byTextLineSpacing(0)
                                   .byFont(UIFontWeightRegularSize(14));
                viewModel.byBgCor(JobsClearColor)
                         .byJobsWidth(self.chooseBtnSize.width);
                viewModel.subTextModel.byText(@"".tr);
            }));
        });
    };return _jobsPageViewDataMutArr;
}

@end
