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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_5
@interface JobsAppDoorInputViewBaseStyle_5 (JobsPropertyDSLSetterAutogen_5994105357)
-(void)setDoorInputViewBaseStyleModel:(JobsAppDoorInputViewBaseStyleModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_5

@implementation JobsAppDoorInputViewBaseStyle_5
@synthesize thisViewSize = _thisViewSize;
-(void)dealloc{
    _authCodeBtn.stop;
    jobsByCtrlBlock disappearBlock = dropDownListView.dropDownListViewDisappear;
    if (disappearBlock) disappearBlock(nil);
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.byThisViewSize(thisViewSize);
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_5.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
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
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_5.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
        // 指定描边
        [self setBorderWithColor:RGBA_COLOR(162, 162, 162, 0.2f)
                     borderWidth:1
                      borderType:UIBorderSideTypeBottom];
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)registerNotification{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
    };
}

-(jobsByVoidBlock _Nonnull)configTextField{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.zyTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
        self.zyTextField.byBackground(self.doorInputViewBaseStyleModel.background);
        self.zyTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
        self.zyTextField.byTextCor(self.doorInputViewBaseStyleModel.ZYtextColor);
        self.zyTextField.byUseCustomClearButton(self.doorInputViewBaseStyleModel.useCustomClearButton);
        self.zyTextField.byIsShowDelBtn(self.doorInputViewBaseStyleModel.isShowDelBtn);
        self.zyTextField.byRightViewOffsetX(self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8));
        self.zyTextField.byPlaceHolderAlignment(self.doorInputViewBaseStyleModel.placeHolderAlignment);
        self.zyTextField.byPlaceHolderOffset(self.doorInputViewBaseStyleModel.placeHolderOffset);
        self.zyTextField.byLeftViewOffsetX(self.doorInputViewBaseStyleModel.leftViewOffsetX);
        self.zyTextField.byTextOffset(self.doorInputViewBaseStyleModel.offset);
        self.zyTextField.byRequestParams(self.textFieldInputModel);
        self.zyTextField.byPlaceholderColor(self.doorInputViewBaseStyleModel.placeholderColor);
        self.zyTextField.byPlaceholderFont(self.doorInputViewBaseStyleModel.placeholderFont);
        self.zyTextField.byFieldEditorOffset(self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50));
    };
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_5.class, @selector(jobsTextFieldShouldBeginEditing)))(self, @selector(jobsTextFieldShouldBeginEditing));
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
        return CGSizeMake(JobsWidth(305), JobsWidth(14 + 36 + 4));
    };
}
/// 外层数据渲染
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.byDoorInputViewBaseStyleModel(doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new);
        self.registerNotification();
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
            self.zyTextField.byIsShowDelBtn(self.doorInputViewBaseStyleModel.isShowDelBtn);/// ❎
            self.configTextField();
        }
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(ZYTextField *_Nullable)getTextField{
    JobsRetZYTextFieldByVoidBlock action = ((JobsRetZYTextFieldByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_5.class, @selector(jobsGetTextField)))(self, @selector(jobsGetTextField));
    return action ? action() : nil;
}

-(JobsRetZYTextFieldByVoidBlock _Nonnull)jobsGetTextField{
    @jobs_weakify(self)
    return ^ZYTextField *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.zyTextField;
    };
}

-(NSString *_Nullable)textFieldValue{
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_5.class, @selector(jobsTextFieldValue)))(self, @selector(jobsTextFieldValue));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsTextFieldValue{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.zyTextField.text;
    };
}

-(JobsRetBaseButtonByVoidBlock _Nonnull)getSecurityModeBtn{
    @jobs_weakify(self)
    return ^BaseButton *{
        @jobs_strongify(self)
        if (!self) return nil;
        return _securityModeBtn;
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)securityModeBtn{
    if (!_securityModeBtn) {
        @jobs_weakify(self)
        _securityModeBtn = BaseButton
            .initByNormalImage(self.doorInputViewBaseStyleModel.unSelectedSecurityBtnIMG ? : JobsBlueColor.jobsImage())
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                x.byToggleSelected();
                if (x.jobs_isSelected) {
                    x.jobsResetBtnImage(self.doorInputViewBaseStyleModel.selectedSecurityBtnIMG ? : JobsRedColor.jobsImage());
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
            self.securityModeBtn.byJobsVisible(isValue(x) && self.doorInputViewBaseStyleModel.isShowSecurityBtn);
            if (x.isContainsSpecialSymbolsString(nil)) {
                toastBy(@"Do not enter special characters".jobsTr());
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
    if (self.doorInputViewBaseStyleModel.textModel.text.isDebugText()) {
        _zyTextField.byText(@"".jobsTr());
    };return _zyTextField;
}

-(UIViewModel *)chooseBtnViewModel{
    if (!_chooseBtnViewModel) {
        @jobs_weakify(self)
        _chooseBtnViewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            @jobs_strongify(self)
            data.textModel.byText(@"请选择区号".jobsTr())
                          .byTextCor(JobsSecondaryLabelColor)
                          .byTextLineSpacing(0)
                          .byFont(UIFontWeightRegularSize(14));
            data.byBgCor(JobsClearColor)
                .byJobsWidth(self.chooseBtnSize.width);
            data.subTextModel.byText(@"".jobsTr());
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
                viewModel.textModel.byText(@"+87".jobsTr())
                                   .byTextCor(JobsSecondaryLabelColor)
                                   .byTextLineSpacing(0)
                                   .byFont(UIFontWeightRegularSize(14));
                viewModel.byBgCor(JobsClearColor)
                         .byJobsWidth(self.chooseBtnSize.width);
                viewModel.subTextModel.byText(@"".jobsTr());
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                @jobs_strongify(self)
                viewModel.textModel.byText(@"+88".jobsTr())
                                   .byTextCor(JobsSecondaryLabelColor)
                                   .byTextLineSpacing(0)
                                   .byFont(UIFontWeightRegularSize(14));
                viewModel.byBgCor(JobsClearColor)
                         .byJobsWidth(self.chooseBtnSize.width);
                viewModel.subTextModel.byText(@"".jobsTr());
            }));
        });
    };return _jobsPageViewDataMutArr;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_5
-(JobsRetJobsAppDoorInputViewBaseStyle_5ByJobsAppDoorInputViewBaseStyleModelBlock _Nonnull)byDoorInputViewBaseStyleModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyle_5 * _Nullable(JobsAppDoorInputViewBaseStyleModel * _Nullable data){
        @jobs_strongify(self)
        [self setDoorInputViewBaseStyleModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_5
@end
