//
//  JobsAppDoorRegisterContentView.m
//  JobsAppDoor
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
Prop_strong()BaseButton *abandonRegisterBtn;// 返回首页
/// Data
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyleModel *>*registerDoorInputViewBaseStyleModelMutArr;
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyle *>*registerDoorInputViewBaseStyleMutArr;
Prop_strong(nullable)RACCompoundDisposable *sendBtnEnableDisposable;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorRegisterContentView
@interface JobsAppDoorRegisterContentView (JobsPropertyDSLSetterAutogen_2b430aaebb)
-(void)setSendBtnEnableDisposable:(RACCompoundDisposable * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorRegisterContentView

@implementation JobsAppDoorRegisterContentView
-(JobsRetJobsAppDoorRegisterContentViewByConfigBlock _Nonnull)byConfiguration{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorRegisterContentView *_Nullable(JobsAppDoorConfig *_Nullable data){
        @jobs_strongify(self)
        self.configuration = data;
        return self;
    };
}

- (void)dealloc {
    [self.sendBtnEnableDisposable dispose];
    JobsLog(@"%@",JobsLocalFunc);
}
#pragma mark —— Lifecycle
-(instancetype)init{
    if (self = [super init]) {
        _configuration = JobsAppDoorConfig.defaultConfig();
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
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorRegisterContentView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorRegisterContentView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.refreshRegisterLayout();
    };
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
#pragma mark —— JobsDoorInputViewProtocol
-(JobsRetNSMutableArrayJobsAppDoorInputViewBaseStyleByVoidBlock _Nonnull)getAppDoorInputViewBaseStyle{
    @jobs_weakify(self)
    return ^NSMutableArray<JobsAppDoorInputViewBaseStyle *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.registerDoorInputViewBaseStyleMutArr;
    };
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
        self.abandonRegisterBtn.byAlpha(1);
        self.refreshRegisterLayout();
    };
}
#pragma mark —— 一些私有化方法
-(JobsRetCGFloatByVoidBlock _Nonnull)registerSideRailWidth{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return RegisterBtnWidth;
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)registerFormLeft{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return self.registerSideRailWidth() + JobsWidth(20);
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)registerFormWidth{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return MAX(JobsWidth(180), self.width - self.registerSideRailWidth() - JobsWidth(40));
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)registerFormCenterX{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return self.registerFormLeft() + self.registerFormWidth() / 2;
    };
}

-(jobsByVoidBlock _Nonnull)refreshRegisterLayout{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.width <= 0 || self.height <= 0) return;
        CGFloat sideRailWidth = self.registerSideRailWidth();
        CGFloat formLeft = self.registerFormLeft();
        CGFloat formWidth = self.registerFormWidth();
        CGFloat formCenterX = self.registerFormCenterX();
        self.backToLoginBtn
            .byFrame(CGRectMake(0,
                                0,
                                sideRailWidth,
                                self.height));
        self.titleLab
            .bySizeToFit()
            .byCenterX(formCenterX)
            .byTop(JobsWidth(16));
        [self.registerDoorInputViewBaseStyleMutArr enumerateObjectsUsingBlock:^(JobsAppDoorInputViewBaseStyle * _Nonnull obj,
                                                                                NSUInteger idx,
                                                                                BOOL * _Nonnull stop) {
            obj
                .bySize(CGSizeMake(formWidth, ThingsHeight))
                .byX(formLeft);
            if (idx == 0) {
                obj.byTop(self.titleLab.bottom + JobsWidth(14));
            }else{
                JobsAppDoorInputViewBaseStyle *lastObj = self.registerDoorInputViewBaseStyleMutArr[idx - 1];
                obj.byTop(lastObj.bottom + JobsWidth(12));
            }
            self.jobs_textFieldByInputView(obj)
                .byFont(UIFontWeightRegularSize(JobsWidth(14)))
                .byAdjustsFontSizeToFitWidth(YES)
                .byMinimumFontSize(JobsWidth(11));
            obj
                .byAlpha(1)
                .byCornerRadius(ThingsHeight / 2)
                .byLayer(^(CALayer *layer) {
                    layer.byMasksToBounds(YES);
                });
        }];
        self.abandonRegisterBtn
            .byFrame(CGRectMake(formLeft,
                                self.height - JobsWidth(40),
                                formWidth,
                                JobsWidth(22)));
        self.sendBtn
            .byFrame(CGRectMake(formLeft,
                                self.abandonRegisterBtn.top - JobsWidth(12) - ThingsHeight,
                                formWidth,
                                ThingsHeight));
        self.backToLoginBtn
            .byAlpha(.7f);
        self.titleLab
            .byAlpha(1);
        self.sendBtn
            .byAlpha(1);
        self.abandonRegisterBtn
            .byAlpha(1);
        self
            .byBringSubviewToFront(self.backToLoginBtn)
            .byBringSubviewToFront(self.titleLab);
        [self.registerDoorInputViewBaseStyleMutArr enumerateObjectsUsingBlock:^(JobsAppDoorInputViewBaseStyle * _Nonnull obj,
                                                                                NSUInteger idx,
                                                                                BOOL * _Nonnull stop) {
            self.byBringSubviewToFront(obj);
        }];
        self
            .byBringSubviewToFront(self.sendBtn)
            .byBringSubviewToFront(self.abandonRegisterBtn);
    };
}

-(jobsByVoidBlock _Nonnull)makeInputView{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if (self.registerDoorInputViewBaseStyleMutArr.count) return;
        NSUInteger phoneIndex = 3;
        NSUInteger verificationCodeIndex = phoneIndex + 1;
        NSUInteger graphicCaptchaIndex = 3 + (self.configuration.registerConfig.showsMobileBinding ? 2 : 0);
        for (int i = 0; i < self.registerDoorInputViewBaseStyleModelMutArr.count; i++) {
            JobsAppDoorInputViewBaseStyle *inputViewBaseStyle = nil;
            {
                if (i == 0 || i == 1 || i == 2) {
                    inputViewBaseStyle = self.dk(JobsAppDoorInputViewBaseStyle_3.class);
                }else if (self.configuration.registerConfig.showsMobileBinding && i == phoneIndex){
                    inputViewBaseStyle = self.dk(JobsAppDoorInputViewBaseStyle_7.class);
                }else if (self.configuration.registerConfig.showsMobileBinding && i == verificationCodeIndex){
                    inputViewBaseStyle = self.dk(JobsAppDoorInputViewBaseStyle_1.class);
                }else if (self.configuration.registerConfig.showsGraphicCaptcha && i == graphicCaptchaIndex){
                    inputViewBaseStyle = self.dk(JobsAppDoorInputViewBaseStyle_4.class);
                }
            }
            if (!inputViewBaseStyle) continue;
            if ([inputViewBaseStyle isKindOfClass:JobsAppDoorInputViewBaseStyle_4.class]) {
                JobsAppDoorInputViewBaseStyle_4 *graphicCaptchaInputView = (JobsAppDoorInputViewBaseStyle_4 *)inputViewBaseStyle;
                graphicCaptchaInputView.byGraphicCaptchaConfig(self.configuration.registerConfig.graphicCaptchaConfig.resolvedCaptchaConfig());
            }
            inputViewBaseStyle.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);//进数据
            inputViewBaseStyle.addOn(self);
        }
        self.jobs_bindSendBtnEnableSignalByInputViews(self.registerDoorInputViewBaseStyleMutArr);
        self.refreshRegisterLayout();
        [self layoutIfNeeded];
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)jobs_textIsNotEmpty{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable text){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        if (![text isKindOfClass:NSString.class]) return NO;
        return [text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].length > 0;
    };
}

-(JobsRetUITextFieldByJobsAppDoorInputViewBaseStyleBlock _Nonnull)jobs_textFieldByInputView{
    @jobs_weakify(self)
    return ^UITextField *_Nullable(JobsAppDoorInputViewBaseStyle * inputView){
        @jobs_strongify(self)
        if (!self) return nil;
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
    };
}

-(JobsRetNSStringByJobsAppDoorInputViewBaseStyleBlock _Nonnull)jobs_textByInputView{
    @jobs_weakify(self)
    return ^NSString *(JobsAppDoorInputViewBaseStyle * inputView){
        @jobs_strongify(self)
        if (!self) return nil;
        if (!inputView) return @"";
        NSString *text = nil;
        if ([inputView respondsToSelector:@selector(textFieldValue)]) {
            text = ((id<JobsDoorInputViewProtocol>)inputView).textFieldValue;
        }
        if (![text isKindOfClass:NSString.class]) {
            text = self.jobs_textFieldByInputView(inputView).text;
        };return text ? : @"";
    };
}

-(JobsRetBOOLByNSArrayJobsAppDoorInputViewBaseStyleBlock _Nonnull)jobs_inputViewsHaveText{
    @jobs_weakify(self)
    return ^BOOL(NSArray<JobsAppDoorInputViewBaseStyle *> * inputViews){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        if (!inputViews.count) return NO;
        for (JobsAppDoorInputViewBaseStyle *inputView in inputViews) {
            if (!self.jobs_textIsNotEmpty(self.jobs_textByInputView(inputView))) return NO;
        }
        if (inputViews.count >= 3) {
            NSString *password = self.jobs_textByInputView(inputViews[1]);
            NSString *confirmPassword = self.jobs_textByInputView(inputViews[2]);
            if (![password isEqualToString:confirmPassword]) return NO;
        };return YES;
    };
}

-(jobsByBOOLBlock _Nonnull)jobs_refreshSendBtnEnabled{
    @jobs_weakify(self)
    return ^(BOOL enabled){
        @jobs_strongify(self)
        if (!self) return;
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
    };
}

-(RACDisposable *_Nullable)jobs_subscribeTextChangeByInputView:(JobsAppDoorInputViewBaseStyle *)inputView
                                                         block:(jobsByIDBlock _Nullable)block{
    UITextField *textField = self.jobs_textFieldByInputView(inputView);
    if (!textField) return nil;
    return [textField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
        return YES;
    } subscribeNextBlock:^(id _Nullable x) {
        if (block) block([x isKindOfClass:NSString.class] ? x : (textField.text ? : @""));
    }];
}

-(jobsByNSArrayJobsAppDoorInputViewBaseStyleBlock _Nonnull)jobs_bindSendBtnEnableSignalByInputViews{
    @jobs_weakify(self)
    return ^(NSArray<JobsAppDoorInputViewBaseStyle *> * inputViews){
        @jobs_strongify(self)
        if (!self) return;
        [self.sendBtnEnableDisposable dispose];
        self.bySendBtnEnableDisposable(nil);
        RACCompoundDisposable *compoundDisposable = RACCompoundDisposable.byCompoundDisposable();
        NSInteger listenedCount = 0;
        @jobs_weakify(self)
        for (JobsAppDoorInputViewBaseStyle *inputView in inputViews) {
            RACDisposable *disposable = [self jobs_subscribeTextChangeByInputView:inputView
                                                                            block:^(id _Nullable data) {
                @jobs_strongify(self)
                self.jobs_refreshSendBtnEnabled(self.jobs_inputViewsHaveText(inputViews));
            }];
            if (disposable) {
                listenedCount += 1;
                compoundDisposable.byAddDisposable(disposable);
            }
        }
        if (!listenedCount) {
            self.jobs_refreshSendBtnEnabled(NO);
            return;
        }
        self.bySendBtnEnableDisposable(compoundDisposable);
        self.jobs_refreshSendBtnEnabled(self.jobs_inputViewsHaveText(inputViews));
    };
}

-(JobsRetAppDoorInputViewBaseStyleByClassBlock _Nonnull)dk{
    return ^JobsAppDoorInputViewBaseStyle *_Nullable(Class _Nonnull cls){
        if ([cls isSubclassOfClass:JobsAppDoorInputViewBaseStyle.class]) {
            JobsAppDoorInputViewBaseStyle *inputView = cls.new;
            [self.registerDoorInputViewBaseStyleMutArr addObject:inputView];
            @jobs_weakify(self)
            inputView.actionObjBlock(^(id data) {
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(data);
            });return inputView;
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
            .jobsResetBtnImage(JobsAppDoorImageNamed(@"AppDoorBackLogin") ? : JobsAppDoorImageNamed(@"Lock"))
            .jobsResetBtnTitleCor(Cor1)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(12))
            .jobsResetBtnTitle(Title1)
            .byTitleLabel(^(UILabel *label) {
                label
                    .byNumberOfLines(0)
                    .byTextAlignment(NSTextAlignmentCenter)
                    .byAdjustsFontSizeToFitWidth(YES)
                    .byMinimumScaleFactor(0.75f);
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
                .byFont(UIFontWeightSemiboldSize(18))
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
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(15))
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

-(BaseButton *)abandonRegisterBtn{
    if (!_abandonRegisterBtn) {
        @jobs_weakify(self)
        _abandonRegisterBtn = (BaseButton *)BaseButton.jobsInit()
            .bgColorBy(JobsClearColor)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(14))
            .jobsResetBtnTitle(Title4)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self endEditing:YES];
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self);
    };return _abandonRegisterBtn;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyleModel *> *)registerDoorInputViewBaseStyleModelMutArr{
    if (!_registerDoorInputViewBaseStyleModelMutArr) {
        _registerDoorInputViewBaseStyleModelMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            UIImage *userIcon = JobsAppDoorImageNamed(@"用户名称") ? : @"用户名".img;
            UIImage *lockIcon = JobsAppDoorImageNamed(@"Lock") ? : JobsAppDoorImageNamed(@"codeDecode");
            UIImage *verifyIcon = JobsAppDoorImageNamed(@"AppDoorVerifyCode") ? : @"验证ICON".img ? : lockIcon;
            arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 用户名) {
                用户名
                    .byLeftViewIMG(userIcon)
                    .byPlaceholder(@"用户名".jobsTr())
                    .byPlaceHolderOffset(JobsWidth(27))
                    .byOffset(JobsWidth(27))
                    .byIsShowDelBtn(YES)
                    .byIsShowSecurityBtn(NO)
                    .byReturnKeyType(UIReturnKeyDone)
                    .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                    .byLeftViewMode(UITextFieldViewModeAlways);
            }))
            .add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 密码) {
                密码
                    .byLeftViewIMG(lockIcon)
                    .byPlaceholder(@"密码".jobsTr())
                    .byPlaceHolderOffset(JobsWidth(27))
                    .byOffset(JobsWidth(27))
                    .byIsShowDelBtn(YES)
                    .byIsShowSecurityBtn(YES)
                    .byReturnKeyType(UIReturnKeyDone)
                    .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                    .bySelectedSecurityBtnIMG(JobsAppDoorImageNamed(@"codeEncode"))// 闭眼
                    .byUnSelectedSecurityBtnIMG(JobsAppDoorImageNamed(@"codeDecode"))// 开眼
                    .byLeftViewMode(UITextFieldViewModeAlways);
            }))
            .add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 确认密码) {
                确认密码
                    .byLeftViewIMG(lockIcon)
                    .byPlaceholder(@"确认密码".jobsTr())
                    .byPlaceHolderOffset(JobsWidth(27))
                    .byOffset(JobsWidth(27))
                    .byIsShowDelBtn(YES)
                    .byIsShowSecurityBtn(YES)
                    .byReturnKeyType(UIReturnKeyDone)
                    .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                    .bySelectedSecurityBtnIMG(JobsAppDoorImageNamed(@"codeEncode"))// 闭眼
                    .byUnSelectedSecurityBtnIMG(JobsAppDoorImageNamed(@"codeDecode"))// 开眼
                    .byLeftViewMode(UITextFieldViewModeAlways);
            }));
            if (self.configuration.registerConfig.showsMobileBinding) {
                arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 手机号码) {
                    手机号码
                        .byLeftViewIMG(JobsAppDoorImageNamed(@"手机号码"))
                        .byPlaceholder(@"手机号码".jobsTr())
                        .byPlaceHolderOffset(JobsWidth(4))
                        .byOffset(JobsWidth(4))
                        .byIsShowDelBtn(YES)
                        .byIsShowSecurityBtn(NO)
                        .byKeyboardType(UIKeyboardTypePhonePad)
                        .byFieldEditorOffset(JobsWidth(4))
                        .byReturnKeyType(UIReturnKeyDone)
                        .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                        .byLeftViewMode(UITextFieldViewModeAlways);
                }));
                arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 手机验证码) {
                    手机验证码
                        .byLeftViewIMG(verifyIcon)
                        .byPlaceholder(@"手机验证码".jobsTr())
                        .byPlaceHolderOffset(JobsWidth(27))
                        .byOffset(JobsWidth(27))
                        .byIsShowDelBtn(YES)
                        .byIsShowSecurityBtn(NO)
                        .byKeyboardType(UIKeyboardTypeNumberPad)
                        .byFieldEditorOffset(JobsWidth(4))
                        .byReturnKeyType(UIReturnKeyDone)
                        .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                        .byLeftViewMode(UITextFieldViewModeAlways);
                }));
            }
            if (self.configuration.registerConfig.showsGraphicCaptcha) {
                arr.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 图形验证码) {
                    图形验证码
                        .byLeftViewIMG(verifyIcon)
                        .byPlaceholder(@"图形验证码".jobsTr())
                        .byPlaceHolderOffset(JobsWidth(27))
                        .byOffset(JobsWidth(27))
                        .byIsShowDelBtn(YES)
                        .byIsShowSecurityBtn(NO)
                        .byFieldEditorOffset(JobsWidth(4))
                        .byReturnKeyType(UIReturnKeyDone)
                        .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                        .byLeftViewMode(UITextFieldViewModeAlways);
                }));
            }
            [arr enumerateObjectsUsingBlock:^(JobsAppDoorInputViewBaseStyleModel * _Nonnull model,
                                              NSUInteger idx,
                                              BOOL * _Nonnull stop) {
                model
                    .byFont(UIFontWeightRegularSize(14))
                    .byPlaceholderFont(UIFontWeightRegularSize(13));
            }];
        });
    };return _registerDoorInputViewBaseStyleModelMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)registerDoorInputViewBaseStyleMutArr{
    if (!_registerDoorInputViewBaseStyleMutArr) {
        _registerDoorInputViewBaseStyleMutArr = NSMutableArray.array;
    };return _registerDoorInputViewBaseStyleMutArr;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorRegisterContentView
-(JobsRetJobsAppDoorRegisterContentViewByRACCompoundDisposableBlock _Nonnull)bySendBtnEnableDisposable{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorRegisterContentView * _Nullable(RACCompoundDisposable * _Nullable data){
        @jobs_strongify(self)
        [self setSendBtnEnableDisposable:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorRegisterContentView
@end
