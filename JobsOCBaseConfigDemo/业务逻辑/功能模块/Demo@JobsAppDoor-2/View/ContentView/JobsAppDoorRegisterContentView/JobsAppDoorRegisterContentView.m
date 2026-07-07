//
//  JobsAppDoorRegisterContentView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorRegisterContentView.h"

@class JobsAppDoorDoorInputViewBaseStyle;

@interface JobsAppDoorRegisterContentView ()
/// UI
Prop_strong()BaseButton *backToLoginBtn;// 返回登录
Prop_strong()UILabel *titleLab;// 标题
Prop_strong()BaseButton *sendBtn;// 注册按钮
/// Data
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyleModel *>*registerDoorInputViewBaseStyleModelMutArr;
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyle *>*registerDoorInputViewBaseStyleMutArr;
Prop_strong(nullable)RACCompoundDisposable *sendBtnEnableDisposable;

@end

@implementation JobsAppDoorRegisterContentView

- (void)dealloc {
    [self.sendBtnEnableDisposable dispose];
    JobsLog(@"%@",JobsLocalFunc);
}
#pragma mark —— Lifecycle
-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(Cor1);
//        @jobs_weakify(self)
        [self addNotificationName:@"textFieldTag"
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
//            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:UITextField.class]){
                UITextField *b = notification.object;
                JobsLog(@"木头 = %@",b.requestParams);
            }JobsLog(@"通知传递过来的 = %@",notification.object);
        }];
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self refreshRegisterLayout];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
#pragma mark —— JobsDoorInputViewProtocol
-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)getAppDoorInputViewBaseStyle{
    return self.registerDoorInputViewBaseStyleMutArr;
}
#pragma mark —— BaseViewProtocol
/// 外层数据渲染
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.backToLoginBtn.byAlpha(0.7f);
        self.titleLab.byAlpha(1);
        self.makeInputView();
        self.sendBtn.byAlpha(1);
        [self refreshRegisterLayout];
    };
}
#pragma mark —— 一些私有化方法
-(CGFloat)registerSideRailWidth{
    return RegisterBtnWidth;
}

-(CGFloat)registerFormLeft{
    return self.registerSideRailWidth + JobsWidth(20);
}

-(CGFloat)registerFormWidth{
    return MAX(JobsWidth(180), self.width - self.registerSideRailWidth - JobsWidth(40));
}

-(CGFloat)registerFormCenterX{
    return self.registerFormLeft + self.registerFormWidth / 2;
}

-(void)refreshRegisterLayout{
    if (self.width <= 0 || self.height <= 0) return;

    CGFloat sideRailWidth = self.registerSideRailWidth;
    CGFloat formLeft = self.registerFormLeft;
    CGFloat formWidth = self.registerFormWidth;
    CGFloat formCenterX = self.registerFormCenterX;

    self.backToLoginBtn
        .byFrame(CGRectMake(0,
                            0,
                            sideRailWidth,
                            self.height));

    self.titleLab
        .bySizeToFit()
        .byCenterX(formCenterX)
        .byTop(JobsWidth(20));

    [self.registerDoorInputViewBaseStyleMutArr enumerateObjectsUsingBlock:^(JobsAppDoorInputViewBaseStyle * _Nonnull obj,
                                                                            NSUInteger idx,
                                                                            BOOL * _Nonnull stop) {
        obj
            .bySize(CGSizeMake(formWidth, ThingsHeight))
            .byX(formLeft);
        if (idx == 0) {
            obj.byTop(self.titleLab.bottom + JobsWidth(20));
        }else{
            JobsAppDoorInputViewBaseStyle *lastObj = self.registerDoorInputViewBaseStyleMutArr[idx - 1];
            obj.byTop(lastObj.bottom + InputViewOffset);
        }
        obj
            .byAlpha(1)
            .byCornerRadius(ThingsHeight / 2)
            .byLayer(^(CALayer *layer) {
                layer.byMasksToBounds(YES);
            });
    }];

    self.sendBtn
        .byFrame(CGRectMake(formLeft,
                            self.height - JobsWidth(20) - ThingsHeight,
                            formWidth,
                            ThingsHeight));

    self.backToLoginBtn
        .byAlpha(.7f);
    self.titleLab
        .byAlpha(1);
    self.sendBtn
        .byAlpha(1);

    self
        .byBringSubviewToFront(self.backToLoginBtn)
        .byBringSubviewToFront(self.titleLab);
    [self.registerDoorInputViewBaseStyleMutArr enumerateObjectsUsingBlock:^(JobsAppDoorInputViewBaseStyle * _Nonnull obj,
                                                                            NSUInteger idx,
                                                                            BOOL * _Nonnull stop) {
        self.byBringSubviewToFront(obj);
    }];
    self.byBringSubviewToFront(self.sendBtn);
}

-(jobsByVoidBlock _Nonnull)makeInputView{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if (self.registerDoorInputViewBaseStyleMutArr.count) return;
        for (int i = 0; i < self.registerDoorInputViewBaseStyleModelMutArr.count; i++) {
            JobsAppDoorInputViewBaseStyle *inputViewBaseStyle = nil;
            {
                if (i == 0 || i == 1 || i == 2) {
                    inputViewBaseStyle = self.dk(JobsAppDoorInputViewBaseStyle_3.class);
                }else if (i == 3){
                    inputViewBaseStyle = self.dk(JobsAppDoorInputViewBaseStyle_1.class);
                }else if (i == 4){
                    inputViewBaseStyle = self.dk(JobsAppDoorInputViewBaseStyle_4.class);
                }
            }
            if (!inputViewBaseStyle) continue;
            inputViewBaseStyle.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);//进数据
            inputViewBaseStyle.addOn(self);
        }
        [self jobs_bindSendBtnEnableSignalByInputViews:self.registerDoorInputViewBaseStyleMutArr];
        [self refreshRegisterLayout];
        [self layoutIfNeeded];
    };
}

-(BOOL)jobs_textIsNotEmpty:(NSString *_Nullable)text{
    if (![text isKindOfClass:NSString.class]) return NO;
    return [text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].length > 0;
}

-(UITextField *_Nullable)jobs_textFieldByInputView:(JobsAppDoorInputViewBaseStyle *)inputView{
    if (!inputView) return nil;
    UITextField *textField = nil;
    if ([inputView respondsToSelector:@selector(textField)]) {
        textField = ((id<JobsDoorInputViewProtocol>)inputView).textField;
    }
    SEL getTextFieldSEL = NSSelectorFromString(@"getTextField");
    if (!textField && [inputView respondsToSelector:getTextFieldSEL]) {
        IMP imp = [inputView methodForSelector:getTextFieldSEL];
        UITextField *(*func)(id, SEL) = (void *)imp;
        textField = func(inputView, getTextFieldSEL);
    };return textField;
}

-(NSString *)jobs_textByInputView:(JobsAppDoorInputViewBaseStyle *)inputView{
    if (!inputView) return @"";
    NSString *text = nil;
    if ([inputView respondsToSelector:@selector(textFieldValue)]) {
        text = ((id<JobsDoorInputViewProtocol>)inputView).textFieldValue;
    }
    if (![text isKindOfClass:NSString.class]) {
        text = [self jobs_textFieldByInputView:inputView].text;
    };return text ? : @"";
}

-(BOOL)jobs_inputViewsHaveText:(NSArray<JobsAppDoorInputViewBaseStyle *> *)inputViews{
    if (!inputViews.count) return NO;
    for (JobsAppDoorInputViewBaseStyle *inputView in inputViews) {
        if (![self jobs_textIsNotEmpty:[self jobs_textByInputView:inputView]]) return NO;
    };return YES;
}

-(void)jobs_refreshSendBtnEnabled:(BOOL)enabled{
    self.sendBtn
        .jobsResetBtnBgCor(JobsSystemPinkColor.colorWithAlphaComponentBy(enabled ? 0.85f : 0.35f))
        .jobsResetBtnCornerRadiusValue(ThingsHeight / 2)
        .byEnabled(enabled)
        .byUserInteractionEnabled(enabled)
        .byAlpha(enabled ? 1.0f : 0.45f)
        .byLayer(^(CALayer *layer) {
            layer
                .byCornerRadius(ThingsHeight / 2)
                .byMasksToBounds(YES);
        });
}

-(RACDisposable *_Nullable)jobs_subscribeTextChangeByInputView:(JobsAppDoorInputViewBaseStyle *)inputView
                                                         block:(jobsByIDBlock _Nullable)block{
    UITextField *textField = [self jobs_textFieldByInputView:inputView];
    if (!textField) return nil;
    return [textField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
        return YES;
    } subscribeNextBlock:^(id _Nullable x) {
        if (block) block([x isKindOfClass:NSString.class] ? x : (textField.text ? : @""));
    }];
}

-(void)jobs_bindSendBtnEnableSignalByInputViews:(NSArray<JobsAppDoorInputViewBaseStyle *> *)inputViews{
    [self.sendBtnEnableDisposable dispose];
    self.sendBtnEnableDisposable = nil;
    RACCompoundDisposable *compoundDisposable = RACCompoundDisposable.byCompoundDisposable();
    NSInteger listenedCount = 0;
    @jobs_weakify(self)
    for (JobsAppDoorInputViewBaseStyle *inputView in inputViews) {
        RACDisposable *disposable = [self jobs_subscribeTextChangeByInputView:inputView
                                                                        block:^(id _Nullable data) {
            @jobs_strongify(self)
            [self jobs_refreshSendBtnEnabled:[self jobs_inputViewsHaveText:inputViews]];
        }];
        if (disposable) {
            listenedCount += 1;
            compoundDisposable.byAddDisposable(disposable);
        }
    }
    if (!listenedCount) {
        [self jobs_refreshSendBtnEnabled:NO];
        return;
    }
    self.sendBtnEnableDisposable = compoundDisposable;
    [self jobs_refreshSendBtnEnabled:[self jobs_inputViewsHaveText:inputViews]];
}

-(JobsRetAppDoorInputViewBaseStyleByClassBlock _Nonnull)dk{
    return ^JobsAppDoorInputViewBaseStyle *_Nullable(Class _Nonnull cls){
        if ([cls isSubclassOfClass:JobsAppDoorInputViewBaseStyle.class]) {
            JobsAppDoorInputViewBaseStyle *inputView = cls.new;
            [self.registerDoorInputViewBaseStyleMutArr addObject:inputView];
            @jobs_weakify(self)
            [inputView actionObjBlock:^(id data) {
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(data);
            }];return inputView;
        };return nil;
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)backToLoginBtn{
    if (!_backToLoginBtn) {
        @jobs_weakify(self)
        _backToLoginBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
            .jobsResetImagePadding(JobsWidth(8))
            .jobsResetBtnImage(@"AppDoorBackLogin".img ? : @"Lock".img)
            .jobsResetBtnTitleCor(Cor1)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(13))
            .jobsResetBtnTitle(Title1)
            .byTitleLabel(^(UILabel *label) {
                label
                    .byNumberOfLines(0);
            })
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                self.byEndEditing(YES);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self);
        self.byLayoutIfNeeded();
    };return _backToLoginBtn;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(Title6)
                .byTextCor(JobsWhiteColor)
                .byFont(UIFontWeightRegularSize(20))
                .bySizeToFit()
                .addOn(self)
                .byCenterX((self.width + self.backToLoginBtn.width) / 2)
                .byTop(20);
        });
    };return _titleLab;
}

-(UIButton *)sendBtn{
    if (!_sendBtn) {
        @jobs_weakify(self)
        _sendBtn = (BaseButton *)BaseButton.jobsInit()
            .bgColorBy(JobsSystemPinkColor.colorWithAlphaComponentBy(0.7))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(16))
            .jobsResetBtnTitle(Title6)
            .jobsResetBtnCornerRadiusValue(ThingsHeight / 2)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                [self endEditing:YES];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .buttonAutoWidthByFont()
            .addOn(self);
    };return _sendBtn;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyleModel *> *)registerDoorInputViewBaseStyleModelMutArr{
    if (!_registerDoorInputViewBaseStyleModelMutArr) {
        _registerDoorInputViewBaseStyleModelMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            UIImage *userIcon = @"用户名称".img ? : @"用户名".img;
            UIImage *lockIcon = @"Lock".img ? : @"codeDecode".img;
            UIImage *verifyIcon = @"AppDoorVerifyCode".img ? : @"验证ICON".img ? : lockIcon;
            arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 用户名) {
                用户名
                    .byLeftViewIMG(userIcon)
                    .byPlaceholder(@"用户名")
                    .byIsShowDelBtn(YES)
                    .byIsShowSecurityBtn(NO)
                    .byReturnKeyType(UIReturnKeyDone)
                    .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                    .byLeftViewMode(UITextFieldViewModeAlways);
            }));
            arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 密码) {
                密码
                    .byLeftViewIMG(lockIcon)
                    .byPlaceholder(@"密码")
                    .byIsShowDelBtn(YES)
                    .byIsShowSecurityBtn(YES)
                    .byReturnKeyType(UIReturnKeyDone)
                    .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                    .bySelectedSecurityBtnIMG(@"codeEncode".img)// 闭眼
                    .byUnSelectedSecurityBtnIMG(@"codeDecode".img)// 开眼
                    .byLeftViewMode(UITextFieldViewModeAlways);
            }));
            arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 确认密码) {
                确认密码
                    .byLeftViewIMG(lockIcon)
                    .byPlaceholder(@"确认密码")
                    .byIsShowDelBtn(YES)
                    .byIsShowSecurityBtn(YES)
                    .byReturnKeyType(UIReturnKeyDone)
                    .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                    .bySelectedSecurityBtnIMG(@"codeEncode".img)// 闭眼
                    .byUnSelectedSecurityBtnIMG(@"codeDecode".img)// 开眼
                    .byLeftViewMode(UITextFieldViewModeAlways);
            }));
            arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 手机验证码) {
                手机验证码
                    .byLeftViewIMG(verifyIcon)
                    .byPlaceholder(@"手机验证码")
                    .byIsShowDelBtn(YES)
                    .byIsShowSecurityBtn(NO)
                    .byKeyboardType(UIKeyboardTypeNumberPad)
                    .byFieldEditorOffset(JobsWidth(4))
                    .byReturnKeyType(UIReturnKeyDone)
                    .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                    .byLeftViewMode(UITextFieldViewModeAlways);
            }));
            arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 图形验证码) {
                图形验证码
                    .byLeftViewIMG(verifyIcon)
                    .byPlaceholder(@"图形验证码")
                    .byIsShowDelBtn(YES)
                    .byIsShowSecurityBtn(NO)
                    .byFieldEditorOffset(JobsWidth(4))
                    .byReturnKeyType(UIReturnKeyDone)
                    .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                    .byLeftViewMode(UITextFieldViewModeAlways);
            }));
        });
    };return _registerDoorInputViewBaseStyleModelMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)registerDoorInputViewBaseStyleMutArr{
    if (!_registerDoorInputViewBaseStyleMutArr) {
        _registerDoorInputViewBaseStyleMutArr = NSMutableArray.array;
    };return _registerDoorInputViewBaseStyleMutArr;
}

@end
