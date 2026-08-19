//
//  JobsAppDoorContentView.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorContentView.h"

#import "JobsAppDoorInputViewBaseStyle_1.h"
#import "JobsAppDoorInputViewBaseStyle_3.h"
#import "JobsAppDoorInputViewBaseStyle_4.h"
#import "JobsAppDoorInputViewBaseStyle_7.h"

static UIFont *JobsAppDoorFormFont(void) {
    return UIFontWeightRegularSize(JobsWidth(14));
}

static UIFont *JobsAppDoorActionFont(void) {
    return UIFontWeightSemiboldSize(JobsWidth(15));
}

static UIColor *JobsAppDoorPlaceholderColor(void) {
    return JobsWhiteColor.colorWithAlphaComponentBy(0.56f);
}

static CGFloat JobsAppDoorRegisterSendBtnHeight(void) {
    return ThingsHeight;
}

static CGFloat JobsAppDoorRegisterInputViewOffset(void) {
    return JobsWidth(12);
}

static CGFloat JobsAppDoorRegisterFirstInputTopOffset(void) {
    return JobsWidth(14);
}

static CGFloat JobsAppDoorRegisterSendBtnTopOffset(void) {
    return JobsWidth(16);
}

static CGFloat JobsAppDoorRegisterHomeBtnTopOffset(void) {
    return JobsWidth(10);
}

/// 可以发现：（animateWithDuration + Masonry，动画参数设置无效）
/// 用户名 和 密码 ，登录注册两个界面共用，只不过frame不一样
@interface JobsAppDoorContentView (){
    JobsAppDoorInputViewBaseStyle_7 *inputView_7;
}
/// UI
Prop_strong()UILabel *titleLab;         // 标题
Prop_strong()UIButton *abandonLoginBtn; // 返回首页按钮
Prop_strong()UIButton *toRegisterBtn;   // 去注册
Prop_strong()UIButton *sendBtn;         // 登录 & 注册按钮 （本页面请求可以不用jobsAppDoorContentViewBlock回调）
Prop_strong()UIButton *storeCodeBtn;    // 记住密码
Prop_strong()UIButton *findCodeBtn;     // 忘记密码
/// Data
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyleModel *>*loginDoorInputViewBaseStyleModelMutArr;
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyleModel *>*registerDoorInputViewBaseStyleModelMutArr;
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyle *>*inputViewMutArr;
Prop_strong(nullable)RACCompoundDisposable *sendBtnEnableDisposable;
Prop_strong(nullable)RACDisposable *verificationCodeBtnEnableDisposable;

-(JobsRetUITextFieldByJobsAppDoorInputViewBaseStyleBlock _Nonnull)jobs_textFieldByInputView;
-(JobsRetNSStringByJobsAppDoorInputViewBaseStyleBlock _Nonnull)jobs_textByInputView;
-(JobsRetBOOLByNSArrayJobsAppDoorInputViewBaseStyleBlock _Nonnull)jobs_inputViewsHaveText;
-(jobsByBOOLBlock _Nonnull)jobs_refreshSendBtnEnabled;
-(jobsByNSArrayJobsAppDoorInputViewBaseStyleBlock _Nonnull)jobs_bindSendBtnEnableSignalByInputViews;
-(jobsByVoidBlock _Nonnull)jobs_bindVerificationCodeBtnEnableSignal;
-(jobsByVoidBlock _Nonnull)jobs_refreshRegisterSendBtnLayout;
-(jobsByVoidBlock _Nonnull)jobs_layoutRegisterInputViews;
-(jobsByVoidBlock _Nonnull)jobs_applyRegisterInputViewState;
-(jobsByJobsAppDoorInputViewBaseStyleBlock _Nonnull)jobs_prepareStaticPlaceholderForInputView;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorContentView
@interface JobsAppDoorContentView (JobsPropertyDSLSetterAutogen_f43b8bd450)
-(void)setSendBtnEnableDisposable:(RACCompoundDisposable * _Nullable)data;
-(void)setVerificationCodeBtnEnableDisposable:(RACDisposable * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorContentView

@implementation JobsAppDoorContentView
-(JobsRetJobsAppDoorContentViewByInputViewsBlock _Nonnull)byLoginDoorInputViewBaseStyleMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorContentView *_Nullable(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *_Nullable data){
        @jobs_strongify(self)
        self.loginDoorInputViewBaseStyleMutArr = data;
        return self;
    };
}

-(JobsRetJobsAppDoorContentViewByInputViewsBlock _Nonnull)byRegisterDoorInputViewBaseStyleMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorContentView *_Nullable(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *_Nullable data){
        @jobs_strongify(self)
        self.registerDoorInputViewBaseStyleMutArr = data;
        return self;
    };
}

-(JobsRetJobsAppDoorContentViewByModelBlock _Nonnull)byAppDoorModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorContentView *_Nullable(JobsAppDoorModel *_Nullable data){
        @jobs_strongify(self)
        self.appDoorModel = data;
        return self;
    };
}

-(JobsRetJobsAppDoorContentViewByConfigBlock _Nonnull)byConfiguration{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorContentView *_Nullable(JobsAppDoorConfig *_Nullable data){
        @jobs_strongify(self)
        self.configuration = data;
        return self;
    };
}

-(void)dealloc{
    [self.sendBtnEnableDisposable dispose];
    [self.verificationCodeBtnEnableDisposable dispose];
    for (JobsAppDoorInputViewBaseStyle *inputView in self.registerDoorInputViewBaseStyleMutArr) {
        if (![inputView isKindOfClass:JobsAppDoorInputViewBaseStyle_1.class]) continue;
        JobsAppDoorInputViewBaseStyle_1 *手机验证码 = (JobsAppDoorInputViewBaseStyle_1 *)inputView;
        (手机验证码.getCountDownBtn().timer).jobsStop();
    }
}

-(instancetype)init{
    if (self = [super init]) {
        _configuration = JobsAppDoorConfig.defaultConfig();
        self.byBgColor(Cor2);
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorContentView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
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
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable data) {
        @jobs_strongify(self)
        self.initialToRegisterBtn();
        self.initialTitleLab();
        self.makeInputView();
        self.initialSendBtn();
        self.initialAbandonLoginBtn();
        self.initialOthers();
        self.jobs_bindSendBtnEnableSignalByInputViews(self.loginDoorInputViewBaseStyleMutArr);
    };
}
#pragma mark —— 网络请求
/// 获取手机验证码网络请求
-(void)getCellPhoneVerificationCodeWithCountry:(NSString *)country
                                         phone:(NSString *)phone{
//    if ([self checkTelePhoneNum:phone]) {
//        JobsNetworkingPrepare
//        RequestTool *config = RequestTool.new;
//        config.languageType = self.currentLanguageType;
//        RequestTool.setupPublicParametersBy(config);
//
//        NSDictionary *parameters = @{@"country":@"855",//暂时写死855
//                                     @"phone":phone};
//
//        [JobsNetworkingAPI requestApi:NSObject.authGetVerificationCodeGET.funcName
//                         parameters:parameters
//                       successBlock:^(JobsResponseModel *data) {
//            JobsLog(@"用户获取短信验证码成功");
//            self.jobsToastSuccessMsg(@"Verification send success".jobsTr());
//        } failureBlock:^(id data) {
//            JobsNetworkingAPI.handleError(data);
//            JobsAppDoorInputViewBaseStyle_1 *手机验证码 = (JobsAppDoorInputViewBaseStyle_1 *)self.registerDoorInputViewBaseStyleMutArr[4];
//            手机验证码.getCountDownBtn.timerDestroy();
//        }];
//    }else{
//        self.jobsToastErrMsg(@"TelePhone Number Error".jobsTr());
//        JobsAppDoorInputViewBaseStyle_1 *手机验证码 = (JobsAppDoorInputViewBaseStyle_1 *)self.registerDoorInputViewBaseStyleMutArr[4];
//        手机验证码.getCountDownBtn.timerDestroy();
//    }
}
#pragma mark —— 一些外部调用的方法
///  获取存储按钮
-(JobsRetBtnByVoidBlock _Nonnull)getStoreCodeBtn{
    @jobs_weakify(self)
    return ^UIButton *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.storeCodeBtn;
    };
}
/// 去登录【外部调用】
-(jobsByVoidBlock _Nonnull)animationToLogin{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self 一些UI的初始状态];
        for (int i = 0; i < self.loginDoorInputViewBaseStyleMutArr.count; i++) {
            JobsAppDoorInputViewBaseStyle *inputView = self.loginDoorInputViewBaseStyleMutArr[i];
            inputView.byLeft(JobsWidth(20));
            if (i == 0) {
                inputView.byTop(self.titleLab.bottom + JobsWidth(20));
            }else{
                JobsAppDoorInputViewBaseStyle *lastInputView = self.loginDoorInputViewBaseStyleMutArr[i - 1];
                inputView.byTop(lastInputView.bottom + InputViewOffset);
            }
        }
        for (long i = self.loginDoorInputViewBaseStyleMutArr.count;
             i < self.registerDoorInputViewBaseStyleModelMutArr.count;
             i++) {
            if (self.registerDoorInputViewBaseStyleMutArr.count > i) {
                JobsAppDoorInputViewBaseStyle *inputView = self.registerDoorInputViewBaseStyleMutArr[i];
                inputView.byAlpha(0);
            }
        }
        self.jobs_bindSendBtnEnableSignalByInputViews(self.loginDoorInputViewBaseStyleMutArr);
    };
}
/// 去注册【外部调用】
-(jobsByVoidBlock _Nonnull)animationToRegister{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.toRegisterBtn.jobs_isSelected &&
            self.registerDoorInputViewBaseStyleMutArr.count >= self.registerDoorInputViewBaseStyleModelMutArr.count) return;
        self.toRegisterBtn.bySelected(YES);
        self.animationChangeRegisterBtnFrame();
    };
}
#pragma mark —— 一些私有方法
/// 手机验证码验证
-(JobsRetBOOLByStrBlock _Nonnull)checkTelePhoneNum{
    @jobs_weakify(self)
    return ^BOOL(NSString * phone){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        /// 不为空且全为整数
        if (isValue(phone) &&
            [phone isPureInt]) {
            return YES;
        };return NO;
    };
}
/// 除了传入的textfield，其他的全部放弃第一响应者
-(jobsByTextFieldBlock _Nonnull)allRise{
    @jobs_weakify(self)
    return ^(UITextField * textfield){
        @jobs_strongify(self)
        if (!self) return;
        for (JobsAppDoorInputViewBaseStyle *appDoorInputViewBaseStyle in self.loginDoorInputViewBaseStyleMutArr) {
            UITextField *inputTextField = self.jobs_textFieldByInputView(appDoorInputViewBaseStyle);
            if (textfield != inputTextField) {
                [inputTextField resignFirstResponder];
            }
        }
        for (JobsAppDoorInputViewBaseStyle *appDoorInputViewBaseStyle in self.registerDoorInputViewBaseStyleMutArr) {
            UITextField *inputTextField = self.jobs_textFieldByInputView(appDoorInputViewBaseStyle);
            if (textfield != inputTextField) {
                [inputTextField resignFirstResponder];
            }
        }
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

-(jobsByJobsAppDoorInputViewBaseStyleBlock _Nonnull)jobs_prepareStaticPlaceholderForInputView{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyle * inputView){
        @jobs_strongify(self)
        if (!self) return;
        UITextField *textField = self.jobs_textFieldByInputView(inputView);
        if (!textField) return;
        textField
            .byFont(JobsAppDoorFormFont())
            .byTextCor(Cor3);
        textField.byPlaceholderFont(JobsAppDoorFormFont());
        textField.byPlaceholderColor(JobsAppDoorPlaceholderColor());
        if ([textField isKindOfClass:JobsMagicTextField.class]) {
            JobsMagicTextField *magicTextField = (JobsMagicTextField *)textField;
            magicTextField.byPlaceholdAnimationable(NO);
        }
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
        if (inputViews == self.registerDoorInputViewBaseStyleMutArr && inputViews.count >= 3) {
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
        CGFloat cornerRadius = self.sendBtn.height > 0 ? self.sendBtn.height / 2 : ThingsHeight / 2;
        self.sendBtn
            .jobsResetBtnBgCor(Cor4.colorWithAlphaComponentBy(enabled ? 0.92f : 0.42f))
            .jobsResetBtnCornerRadiusValue(cornerRadius)
            .byEnabled(enabled)
            .byUserInteractionEnabled(enabled)
            .byAlpha(enabled ? 1.0f : 0.45f)
            .byLayer(^(CALayer *layer) {
                layer
                    .byCornerRadius(cornerRadius)
                    .byMasksToBounds(YES);
            });
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleByVoidBlock _Nonnull)jobs_lastVisibleRegisterInputView{
    @jobs_weakify(self)
    return ^JobsAppDoorInputViewBaseStyle *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        for (JobsAppDoorInputViewBaseStyle *inputView in self.registerDoorInputViewBaseStyleMutArr.reverseObjectEnumerator) {
            if (inputView.alpha > 0.01f) return inputView;
        };return nil;
    };
}

-(jobsByVoidBlock _Nonnull)jobs_refreshRegisterSendBtnLayout{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsAppDoorInputViewBaseStyle *lastInputView = self.jobs_lastVisibleRegisterInputView();
        if (lastInputView) {
            self.sendBtn.byTop(lastInputView.bottom + JobsAppDoorRegisterSendBtnTopOffset());
        }else{
            self.sendBtn.byBottom(self.height - JobsWidth(50));
        }
        self.abandonLoginBtn
            .byTop(self.sendBtn.bottom + JobsAppDoorRegisterHomeBtnTopOffset())
            .byCenterX(self.sendBtn.centerX);
        self
            .byBringSubviewToFront(self.sendBtn)
            .byBringSubviewToFront(self.abandonLoginBtn)
            .byBringSubviewToFront(self.toRegisterBtn);
    };
}

-(jobsByVoidBlock _Nonnull)jobs_layoutRegisterInputViews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat nextTop = self.titleLab.bottom + JobsAppDoorRegisterFirstInputTopOffset();
        for (JobsAppDoorInputViewBaseStyle *inputView in self.registerDoorInputViewBaseStyleMutArr) {
            inputView
                .byLeft(JobsWidth(20) + RegisterBtnWidth)
                .byTop(nextTop);
            nextTop = inputView.bottom + JobsAppDoorRegisterInputViewOffset();
        }
    };
}

-(jobsByVoidBlock _Nonnull)jobs_applyRegisterInputViewState{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        SEL changeColorSEL = @selector(changeTextFieldAnimationColor:);
        for (JobsAppDoorInputViewBaseStyle *inputView in self.registerDoorInputViewBaseStyleMutArr) {
            if ([inputView respondsToSelector:changeColorSEL]) {
                IMP imp = [inputView methodForSelector:changeColorSEL];
                void (*func)(id, SEL, BOOL) = (void *)imp;
                func(inputView, changeColorSEL, self.toRegisterBtn.jobs_isSelected);
            }
            inputView.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                data.byJobsWidth(1)
                    .byLayerCor(Cor3)
                    .byCornerRadiusValue(ThingsHeight / 2)
                    .byMasksToBounds(YES);
            }));
        }
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

-(void)jobs_refreshVerificationCodeBtn:(JobsCountdownBtn *)verificationCodeBtn
                             phoneText:(NSString *_Nullable)phoneText{
    BOOL enabled = self.jobs_textIsNotEmpty(phoneText) && !verificationCodeBtn.timer.isRunning;
    CGFloat cornerRadius = (ThingsHeight - JobsWidth(16)) / 2;
    verificationCodeBtn
        .jobsResetBtnTitleCor(Cor5)
        .disabledStateTitleColorBy(Cor5.colorWithAlphaComponentBy(0.45f))
        .jobsResetBtnBgCor(Cor4.colorWithAlphaComponentBy(enabled ? 0.92f : 0.32f))
        .jobsResetBtnCornerRadiusValue(cornerRadius)
        .byEnabled(enabled)
        .byUserInteractionEnabled(enabled)
        .byAlpha(1.0f)
        .byLayer(^(CALayer *layer) {
            layer
                .byCornerRadius(cornerRadius)
                .byMasksToBounds(YES);
        });
}

-(jobsByVoidBlock _Nonnull)jobs_bindVerificationCodeBtnEnableSignal{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.verificationCodeBtnEnableDisposable dispose];
        self.byVerificationCodeBtnEnableDisposable(nil);
        JobsAppDoorInputViewBaseStyle_7 *phoneInputView = nil;
        JobsAppDoorInputViewBaseStyle_1 *verificationCodeInputView = nil;
        for (JobsAppDoorInputViewBaseStyle *inputView in self.registerDoorInputViewBaseStyleMutArr) {
            if ([inputView isKindOfClass:JobsAppDoorInputViewBaseStyle_7.class]) {
                phoneInputView = (JobsAppDoorInputViewBaseStyle_7 *)inputView;
            }else if ([inputView isKindOfClass:JobsAppDoorInputViewBaseStyle_1.class]) {
                verificationCodeInputView = (JobsAppDoorInputViewBaseStyle_1 *)inputView;
            }
        }
        if (!phoneInputView || !verificationCodeInputView) return;
        JobsCountdownBtn *verificationCodeBtn = (JobsCountdownBtn *)verificationCodeInputView.getCountDownBtn();
        __weak JobsCountdownBtn *weakVerificationCodeBtn = verificationCodeBtn;
        @jobs_weakify(self)
        verificationCodeBtn.byOnFinish(^(JobsTimer *_Nullable timer) {
            @jobs_strongify(self)
            JobsCountdownBtn *strongVerificationCodeBtn = weakVerificationCodeBtn;
            if (!strongVerificationCodeBtn) return;
            strongVerificationCodeBtn.jobsResetCountdownTitle();
            [self jobs_refreshVerificationCodeBtn:strongVerificationCodeBtn
                                        phoneText:self.jobs_textByInputView(phoneInputView)];
        });
        UITextField *phoneTextField = self.jobs_textFieldByInputView(phoneInputView);
        if (!phoneTextField) return;
        RACSignal<NSString *> *phoneTextSignal = [[phoneTextField.rac_textSignal
                                                    startWith:phoneTextField.text ? : @""]
                                                   distinctUntilChanged];
        self.verificationCodeBtnEnableDisposable = [phoneTextSignal subscribeNext:^(NSString *_Nullable phoneText) {
            @jobs_strongify(self)
            JobsCountdownBtn *strongVerificationCodeBtn = weakVerificationCodeBtn;
            if (!strongVerificationCodeBtn) return;
            [self jobs_refreshVerificationCodeBtn:strongVerificationCodeBtn
                                        phoneText:phoneText];
        }];
    };
}
/// Core
-(jobsByVoidBlock _Nonnull)makeInputView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.loginDoorInputViewBaseStyleMutArr.count || self.inputViewMutArr.count) return;
        for (int i = 0; i < self.loginDoorInputViewBaseStyleModelMutArr.count; i++) {
            JobsAppDoorInputViewBaseStyle_3 *inputView = JobsAppDoorInputViewBaseStyle_3.new;
            [self.inputViewMutArr addObject:inputView];
            [self.loginDoorInputViewBaseStyleMutArr addObject:inputView];
            inputView.jobsRichViewByModel(self.loginDoorInputViewBaseStyleModelMutArr[i]);
            self.jobs_prepareStaticPlaceholderForInputView(inputView);
            NSUInteger inputIndex = i;
            @jobs_weakify(self)
            //【用户名 & 密码 输入回调，共享注册与登录两个界面】
            inputView.actionObjBlock(^(UITextField *data) {
                @jobs_strongify(self)
                if (inputIndex == 0) {
                    self.appDoorModel.byUserName(data.text);
                }else if (inputIndex == 1){
                    self.appDoorModel.byPassword(data.text);
                }else{}
                if (self.objBlock) self.objBlock(self.appDoorModel);
                self.allRise(data);
            });
            inputView.addOn(self);
            inputView
                .bySize(CGSizeMake(self.width - self.toRegisterBtn.width - JobsWidth(40), ThingsHeight))
                .byLeft(JobsWidth(20));
            if (i == 0) {
                inputView.byTop(self.titleLab.bottom + JobsWidth(20));//20是偏移量
            }else if(i == 1){
                JobsAppDoorInputViewBaseStyle_3 *lastObj = (JobsAppDoorInputViewBaseStyle_3 *)self.loginDoorInputViewBaseStyleMutArr[i - 1];
                inputView.byTop(lastObj.bottom + InputViewOffset);
            }else{}
            inputView.byLayer(^(CALayer *layer) {
                layer
                    .byCornerRadius(ThingsHeight / 2)
                    .byMasksToBounds(YES);
            });
            [self layoutIfNeeded];// 这句话不加，不刷新界面，placeHolder会出现异常
        }
    };
}
/// 返回NO 登录按钮不可点击【可加入判断标准】
-(JobsRetBOOLByVoidBlock _Nonnull)checkLoginBtnCanBeUsed{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.jobs_inputViewsHaveText(self.loginDoorInputViewBaseStyleMutArr);
    };
}
/// 返回NO 注册按钮不可点击【可加入判断标准】
-(JobsRetBOOLByVoidBlock _Nonnull)checkRegisterBtnCanBeUsed{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.jobs_inputViewsHaveText(self.registerDoorInputViewBaseStyleMutArr);
    };
}
/// 一些需要通过点击状态改变状态的控件
/// 一些需要通过点击状态改变状态的控件【初始状态】
-(jobsByVoidBlock _Nonnull)initialTitleLab{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.titleLab
            .byText(Title7)
            .byFont(UIFontWeightRegularSize(JobsWidth(20)))
            .byTextCor(Cor3)
            .bySizeToFit()//sizeToFit也会刷新UI造成UI错位，所以需要提前写
            .byTop(JobsWidth(20))
            .byCenterX((self.width - self.toRegisterBtn.width) / 2);
    };
}

-(jobsByVoidBlock _Nonnull)initialSendBtn{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    //    self.sendBtn.backgroundColor = KSystemPinkColor.colorWithAlphaComponentBy(.3f);
        self.sendBtn
            .normalStateTitleColorBy(Cor5)
            .disabledStateTitleColorBy(Cor5.colorWithAlphaComponentBy(0.45f))
            .normalStateTitleBy(Title7)
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(JobsWidth(15)))
            .jobsResetBtnBgCor(Cor4.colorWithAlphaComponentBy(0.92f))
            .jobsResetBtnCornerRadiusValue(ThingsHeight / 2)
            .bySize(CGSizeMake(self.width - self.toRegisterBtn.width - JobsWidth(40), ThingsHeight));
        self.sendBtn
            .byLayer(^(CALayer *layer) {
                layer.byMasksToBounds(YES);
            })
            .byCenterX(self.titleLab.centerX)
            .byBottom(JobsAppDoorContentViewLoginHeight - JobsWidth(50));
        self.sendBtn.titleLabel.bySizeToFit();//必须先定Size，在依据Size刷新内部控件约束
        self.jobs_refreshSendBtnEnabled(self.checkLoginBtnCanBeUsed());
    };
}
/// 返回首页
-(jobsByVoidBlock _Nonnull)initialAbandonLoginBtn{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.abandonLoginBtn
            .jobsResetBtnTitle(Title4)
            .jobsResetBtnTitleCor(Cor4)
            .jobsResetBtnTitleFont(JobsAppDoorActionFont())
            .byHeight(JobsWidth(20))
            .byTop(self.sendBtn.bottom + JobsWidth(12))
            .byCenterX(self.sendBtn.centerX)
            .byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button.adjustsImageSizeForAccessibilityContentSizeCategory = YES;
            });
        self.abandonLoginBtn.titleLabel.bySizeToFit();
    };
}

-(jobsByVoidBlock _Nonnull)initialOthers{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.storeCodeBtn
            .byAlpha(1);//存储登录信息
        self.findCodeBtn
            .byAlpha(1);//找回密码
        [self bringSubviewToFront:self.storeCodeBtn];
        [self bringSubviewToFront:self.findCodeBtn];
    };
}

-(jobsByVoidBlock _Nonnull)initialToRegisterBtn{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.toRegisterBtn
            .jobsResetBtnTitle(Title12)
            .jobsResetImagePlacement_Padding(NSDirectionalRectEdgeTop,JobsWidth(20));
    };
}
/// 一些需要通过点击状态改变状态的控件【被选中状态】
-(jobsByVoidBlock _Nonnull)selectTitleLab{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.titleLab
            .byText(Title6)
            .bySizeToFit()
            .byTop(JobsWidth(20))
            .byCenterX((self.width + self.toRegisterBtn.width) / 2);
    };
}

-(jobsByVoidBlock _Nonnull)selectSendBtn{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat sendBtnHeight = JobsAppDoorRegisterSendBtnHeight();
        self.sendBtn
            .normalStateTitleBy(Title6)
            .jobsResetBtnBgCor(Cor4.colorWithAlphaComponentBy(0.92f))
            .jobsResetBtnCornerRadiusValue(sendBtnHeight / 2)
            .bySize(CGSizeMake(self.width - self.toRegisterBtn.width - JobsWidth(40), sendBtnHeight))
            .byCenterX(self.titleLab.centerX)
            .byLayer(^(CALayer *layer) {
                layer
                    .byCornerRadius(sendBtnHeight / 2)
                    .byMasksToBounds(YES);
            });
        self.jobs_refreshRegisterSendBtnLayout();
        self.sendBtn.titleLabel.bySizeToFit();
        self.jobs_refreshSendBtnEnabled(self.checkRegisterBtnCanBeUsed());
    };
}

-(jobsByVoidBlock _Nonnull)selectAbandonLoginBtn{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.abandonLoginBtn
            .byCenterX(self.sendBtn.centerX)
            .byTop(self.sendBtn.bottom + JobsAppDoorRegisterHomeBtnTopOffset())
            .byAlpha(1);//返回首页
    };
}

-(jobsByVoidBlock _Nonnull)selectOthers{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.storeCodeBtn
            .byAlpha(0);//存储登录信息
        self.findCodeBtn
            .byAlpha(0);//找回密码
    };
}

-(jobsByVoidBlock _Nonnull)selectToRegisterBtn{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.toRegisterBtn.jobsResetBtnTitle(Title1);
    };
}

-(void)一些UI的初始状态{
    self.initialTitleLab();
    self.initialSendBtn();
    self.initialAbandonLoginBtn();
    self.initialOthers();
    self.initialToRegisterBtn();
}

-(void)一些UI点击以后的状态{
    self.selectTitleLab();
    self.selectSendBtn();
    self.selectAbandonLoginBtn();
    self.selectOthers();
    self.selectToRegisterBtn();
}
/// 去注册【内部调用】
-(jobsByVoidBlock _Nonnull)p_animationToRegister{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self 一些UI点击以后的状态];
        if (self.registerDoorInputViewBaseStyleMutArr.count >= self.registerDoorInputViewBaseStyleModelMutArr.count) {//不是第一次
            for (long i = self.loginDoorInputViewBaseStyleMutArr.count;
                 i < self.registerDoorInputViewBaseStyleModelMutArr.count;
                 i++) {
                JobsAppDoorInputViewBaseStyle *inputView = (JobsAppDoorInputViewBaseStyle *)self.registerDoorInputViewBaseStyleMutArr[i];
                inputView.byAlpha(1);
            }
            self.jobs_layoutRegisterInputViews();
            self.jobs_refreshRegisterSendBtnLayout();
            self.jobs_bindSendBtnEnableSignalByInputViews(self.registerDoorInputViewBaseStyleMutArr);
            self.jobs_bindVerificationCodeBtnEnableSignal();
            return;
        }
        [self.registerDoorInputViewBaseStyleMutArr addObjectsFromArray:self.loginDoorInputViewBaseStyleMutArr];
        NSUInteger confirmPasswordIndex = self.loginDoorInputViewBaseStyleMutArr.count;
        NSUInteger phoneIndex = confirmPasswordIndex + 1;
        NSUInteger verificationCodeIndex = phoneIndex + 1;
        NSUInteger graphicCaptchaIndex = confirmPasswordIndex + 1 + (self.configuration.registerConfig.showsMobileBinding ? 2 : 0);
        for (long i = self.loginDoorInputViewBaseStyleMutArr.count;
             i < self.registerDoorInputViewBaseStyleModelMutArr.count;
             i++) {
            JobsAppDoorInputViewBaseStyle *doorInputViewBaseStyle = nil;
            if (i == confirmPasswordIndex) {// 确认密码
                JobsAppDoorInputViewBaseStyle_3 *inputView = JobsAppDoorInputViewBaseStyle_3.new;
                doorInputViewBaseStyle = (JobsAppDoorInputViewBaseStyle *)inputView;
                inputView.addOn(self);
                [self.registerDoorInputViewBaseStyleMutArr addObject:inputView];
                inputView.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);
                self.jobs_prepareStaticPlaceholderForInputView(inputView);
                @jobs_weakify(self)
                inputView.actionObjBlock(^(UITextField *data) {
                    @jobs_strongify(self)
                    UITextField *textField = (UITextField *)data;
                    self.appDoorModel.byConfirmPassword(textField.text);
                    if (self.objBlock) self.objBlock(self.appDoorModel);
                    self.allRise(data);
                });
            }else if (self.configuration.registerConfig.showsMobileBinding && i == phoneIndex){// 手机号码
                inputView_7 = JobsAppDoorInputViewBaseStyle_7.new;
                doorInputViewBaseStyle = (JobsAppDoorInputViewBaseStyle *)inputView_7;
                inputView_7.addOn(self);
                [self.registerDoorInputViewBaseStyleMutArr addObject:inputView_7];
                inputView_7.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);
                self.jobs_prepareStaticPlaceholderForInputView(inputView_7);
                @jobs_weakify(self)
                inputView_7.actionObjBlock(^(id data) {
                    @jobs_strongify(self)
                    if ([data isKindOfClass:UITextField.class]) {
                        UITextField *textField = (UITextField *)data;
                        self.appDoorModel.byTel(textField.text);
                        if (self.objBlock) self.objBlock(self.appDoorModel);
                        self.allRise(textField);
                    }else if ([data isKindOfClass:UIButton.class]){
                        if (self.objBlock) self.objBlock(data);
                    }else{}
                });
            }else if (self.configuration.registerConfig.showsMobileBinding && i == verificationCodeIndex){// 手机验证码
                JobsAppDoorInputViewBaseStyle_1 *inputView = JobsAppDoorInputViewBaseStyle_1.new;
                doorInputViewBaseStyle = (JobsAppDoorInputViewBaseStyle *)inputView;
                inputView.addOn(self);
                [self.registerDoorInputViewBaseStyleMutArr addObject:inputView];
                inputView.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);
                self.jobs_prepareStaticPlaceholderForInputView(inputView);
                @jobs_weakify(self)
                inputView.actionObjBlock(^(id data) {
                    @jobs_strongify(self)
                    if ([data isKindOfClass:UITextField.class]) {
                        UITextField *textField = (UITextField *)data;
                        self.appDoorModel.byVerificationCode(textField.text);
                        if (self.objBlock) self.objBlock(self.appDoorModel);
                        self.allRise(data);
                    }else if ([data isKindOfClass:UIButton.class]){
                        [self getCellPhoneVerificationCodeWithCountry:nil
                                                                phone:self->inputView_7.textFieldValue];
                    }else{}
                });
            }else if (self.configuration.registerConfig.showsGraphicCaptcha && i == graphicCaptchaIndex){// 图形验证码
                JobsAppDoorInputViewBaseStyle_4 *inputView = JobsAppDoorInputViewBaseStyle_4.new;
                doorInputViewBaseStyle = (JobsAppDoorInputViewBaseStyle *)inputView;
                inputView.addOn(self);
                [self.registerDoorInputViewBaseStyleMutArr addObject:inputView];
                inputView.byGraphicCaptchaConfig(self.configuration.registerConfig.graphicCaptchaConfig.resolvedCaptchaConfig());
                inputView.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);
                self.jobs_prepareStaticPlaceholderForInputView(inputView);
                @jobs_weakify(self)
                inputView.actionObjBlock(^(id data) {
                    @jobs_strongify(self)
                    if ([data isKindOfClass:UITextField.class]) {
                        self.allRise(data);
                    }
                });
            }else{}
            if (!doorInputViewBaseStyle) continue;
            JobsAppDoorInputViewBaseStyle *lastObj = (JobsAppDoorInputViewBaseStyle *)self.registerDoorInputViewBaseStyleMutArr[i - 1];
            doorInputViewBaseStyle
                .byTop(lastObj.bottom + JobsAppDoorRegisterInputViewOffset())
                .bySize(CGSizeMake(self.width - self.toRegisterBtn.width - JobsWidth(40), ThingsHeight))
                .byLeft(JobsWidth(20) + RegisterBtnWidth)
                .byLayer(^(CALayer *layer) {
                    layer
                        .byCornerRadius(ThingsHeight / 2)
                        .byMasksToBounds(YES);
                });
        }
        self.jobs_layoutRegisterInputViews();
        self.jobs_refreshRegisterSendBtnLayout();
        self.jobs_bindSendBtnEnableSignalByInputViews(self.registerDoorInputViewBaseStyleMutArr);
        self.jobs_bindVerificationCodeBtnEnableSignal();
    };
}
/// 公共方法
-(jobsByVoidBlock _Nonnull)animationCommon{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.objBlock) self.objBlock(self.toRegisterBtn);
        self.toRegisterBtn.jobsResetImagePlacement_Padding(NSDirectionalRectEdgeTop,JobsWidth(6));
        self.jobs_applyRegisterInputViewState();
    };
}
/// 核心方法
-(jobsByVoidBlock _Nonnull)animationChangeRegisterBtnFrame{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        /*
         *    使用弹簧的描述时间曲线来执行动画 ,当dampingRatio == 1 时,动画会平稳的减速到最终的模型值,而不会震荡.
         *    小于1的阻尼比在达到完全停止之前会震荡的越来越多.
         *    如果你可以使用初始的 spring velocity 来 指定模拟弹簧末端的对象在加载之前移动的速度.
         *    他是一个单位坐标系统,其中2被定义为在一秒内移动整个动画距离.
         *    如果你在动画中改变一个物体的位置,你想在动画开始前移动到 100 pt/s 你会超过0.5,
         *    dampingRatio 阻尼
         *    velocity 速度
         */
        @jobs_weakify(self)
        [UIView animateWithDuration:0.7f
                              delay:0.1f
             usingSpringWithDamping:1
              initialSpringVelocity:0.1f
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
            @jobs_strongify(self)
            if (self.toRegisterBtn.jobs_isSelected) {// 点击了“新用户注册”按钮，正在进入注册页面
                self.p_animationToRegister();
            }else{// 点击了“返回登录”按钮，正在进入登录页面 初始状态
                self.animationToLogin();
            }
            self.animationCommon();
        } completion:nil];
    };
}
#pragma mark —— lazyLoad
-(UIButton *)toRegisterBtn{
    if (!_toRegisterBtn) {
        @jobs_weakify(self)
        _toRegisterBtn = UIButton.jobsInit()
            .jobsResetBtnImage(JobsAppDoorImageNamed(@"AppDoorBackLogin") ? : JobsAppDoorImageNamed(@"Lock"))
            .jobsResetBtnTitleCor(Cor4)
            .jobsResetBtnTitleFont(JobsAppDoorActionFont())
            .byTitleLabel(^(UILabel *label) {
                label
                    .byNumberOfLines(0)
                    .byFont(JobsAppDoorActionFont());
            })
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                x.byToggleSelected();
                [self endEditing:YES];
                self.animationChangeRegisterBtnFrame();
            })
            .addOn(self)
            .byBgColor(Cor1)
            .byFrame(CGRectMake(self.width - RegisterBtnWidth,
                                0,
                                RegisterBtnWidth,
                                self.height));
    };return _toRegisterBtn;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.addOn(self);
        });
    };return _titleLab;
}

-(UIButton *)abandonLoginBtn{
    if (!_abandonLoginBtn) {
        @jobs_weakify(self)
        _abandonLoginBtn = UIButton.jobsInit()
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            })
            .addOn(self);
    };return _abandonLoginBtn;
}
/// 登录 或者 注册按钮
-(UIButton *)sendBtn{
    if (!_sendBtn) {
        @jobs_weakify(self)
        _sendBtn = UIButton.jobsInit()
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                [self endEditing:YES];
                x.byRequestParams(self.appDoorModel);
                if (self.objBlock) self.objBlock(x);
            })
            .addOn(self)
            .byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button
                    .byCornerRadius(ThingsHeight / 2)
                    .byLayer(^(CALayer *layer) {
                        layer.byMasksToBounds(YES);
                    });
            });
    };return _sendBtn;
}
/// 记住登录成功的账号和密码
-(UIButton *)storeCodeBtn{
    if (!_storeCodeBtn) {
        @jobs_weakify(self)
        CGSize iconSize = CGSizeMake(JobsWidth(14), JobsWidth(14));
        UIImage *normalImage = JobsAppDoorImageNamed(@"没有记住密码");
        UIImage *selectedImage = JobsAppDoorImageNamed(@"记住密码");
        normalImage = normalImage ? normalImage.dw_RescaleImageToSize(iconSize) : nil;
        selectedImage = selectedImage ? selectedImage.dw_RescaleImageToSize(iconSize) : nil;
        _storeCodeBtn = UIButton.jobsInit()
            .jobsResetBtnTitle(Title5)
            .jobsResetBtnImage(normalImage)
            .selectedStateImageBy(selectedImage)
            .jobsResetBtnTitleCor(Cor3)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(12))
            .byTitleLabel(^(UILabel *label) {
                label
                    .byFont(UIFontWeightRegularSize(12))
                    .byNumberOfLines(1)
                    .byLineBreakMode(NSLineBreakByClipping)
                    .byAdjustsFontForContentSizeCategory(NO)
                    .byAdjustsFontSizeToFitWidth(YES)
                    .byMinimumScaleFactor(0.65f);
            })
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                x.byToggleSelected();
                if (self.objBlock) self.objBlock(x);
            })
            .bySelected(YES)
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                JobsAppDoorInputViewBaseStyle_3 *inputView = (JobsAppDoorInputViewBaseStyle_3 *)self.inputViewMutArr.lastObject;
                make.left.equalTo(inputView).offset(JobsWidth(17));
                make.right.equalTo(inputView.mas_centerX).offset(-JobsWidth(6));
                make.top.equalTo(inputView.mas_bottom).offset(JobsWidth(18));
                make.height.mas_equalTo(JobsWidth(22));
            })
            .byViewBlock(^(__kindof UIView *view) {
                @jobs_strongify(self)
                [self layoutIfNeeded];
                UIButton *button = (UIButton *)view;
                if (@available(iOS 15.0, *)) {
                    UIButtonConfiguration *configuration = button.configuration;
                    configuration.byTitleLineBreakMode(NSLineBreakByClipping);
                    button.byConfiguration(configuration);
                }
                button
                    .jobsResetImagePlacement_Padding(NSDirectionalRectEdgeLeading,JobsWidth(4))
                    .byEnabled(YES)
                    .byContentHorizontalAlignment(UIControlContentHorizontalAlignmentLeft)
                    .byUserInteractionEnabled(YES);
            });
    };return _storeCodeBtn;
}

-(UIButton *)findCodeBtn{
    if (!_findCodeBtn) {
        @jobs_weakify(self)
        CGSize iconSize = CGSizeMake(JobsWidth(14), JobsWidth(14));
        UIImage *image = JobsAppDoorImageNamed(@"AppDoorQuestion") ? : JobsAppDoorImageNamed(@"codeDecode");
        image = image ? image.dw_RescaleImageToSize(iconSize) : nil;
        _findCodeBtn = UIButton.jobsInit()
            .jobsResetBtnTitle(Title3)
            .jobsResetBtnImage(image)
            .jobsResetBtnTitleCor(Cor4)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(12))
            .byTitleLabel(^(UILabel *label) {
                label
                    .byFont(UIFontWeightRegularSize(12))
                    .byNumberOfLines(1)
                    .byLineBreakMode(NSLineBreakByClipping)
                    .byAdjustsFontForContentSizeCategory(NO)
                    .byAdjustsFontSizeToFitWidth(YES)
                    .byMinimumScaleFactor(0.65f);
            })
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                JobsAppDoorInputViewBaseStyle_3 *inputView = (JobsAppDoorInputViewBaseStyle_3 *)self.inputViewMutArr.lastObject;
                make.left.equalTo(inputView.mas_centerX).offset(JobsWidth(6));
                make.right.equalTo(inputView).offset(-JobsWidth(17));
                make.top.equalTo(inputView.mas_bottom).offset(JobsWidth(18));
                make.height.mas_equalTo(JobsWidth(22));
            })
            .byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                if (@available(iOS 15.0, *)) {
                    UIButtonConfiguration *configuration = button.configuration;
                    configuration.byTitleLineBreakMode(NSLineBreakByClipping);
                    button.byConfiguration(configuration);
                }
                button
                    .jobsResetImagePlacement_Padding(NSDirectionalRectEdgeLeading,JobsWidth(4))
                    .byContentHorizontalAlignment(UIControlContentHorizontalAlignmentRight);
            });
    };return _findCodeBtn;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyleModel *> *)loginDoorInputViewBaseStyleModelMutArr{
    if (!_loginDoorInputViewBaseStyleModelMutArr) {
        _loginDoorInputViewBaseStyleModelMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            UIImage *userIcon = JobsAppDoorImageNamed(@"用户名称") ? : @"用户名".img;
            UIImage *lockIcon = JobsAppDoorImageNamed(@"Lock") ? : JobsAppDoorImageNamed(@"codeDecode");
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 用户名) {
                用户名.leftViewIMG = userIcon;
                用户名.placeholder = @"用户名".jobsTr();
                用户名.placeholdAnimationable = NO;
                用户名.byIsShowDelBtn(YES);
                用户名.isShowSecurityBtn = NO;
                用户名.useCustomClearButton = YES;
                用户名.returnKeyType = UIReturnKeyDone;
                用户名.keyboardAppearance = UIKeyboardAppearanceAlert;
                用户名.leftViewMode = UITextFieldViewModeAlways;
                用户名.placeholderColor = JobsWhiteColor;
                用户名.rightViewOffsetX = JobsWidth(10);
                用户名.placeHolderOffset = JobsWidth(35);
                用户名.offset = JobsWidth(0);
                if (self.readUserNameMutArr().count) {
                    用户名.inputStr = self.readUserNameMutArr()[0];
                }
            }))
            .add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 密码) {
                密码.leftViewIMG = lockIcon;
                密码.placeholder = @"密码".jobsTr();
                密码.placeholdAnimationable = NO;
                密码.byIsShowDelBtn(YES);
                密码.isShowSecurityBtn = YES;
                密码.useCustomClearButton = YES;
                密码.selectedSecurityBtnIMG = JobsAppDoorImageNamed(@"codeEncode");//闭眼
                密码.unSelectedSecurityBtnIMG =JobsAppDoorImageNamed(@"codeDecode");//开眼
                密码.returnKeyType = UIReturnKeyDone;
                密码.keyboardAppearance = UIKeyboardAppearanceAlert;
                密码.leftViewMode = UITextFieldViewModeAlways;
                密码.placeholderColor = JobsWhiteColor;
                密码.rightViewOffsetX = -JobsWidth(8);
                密码.placeHolderOffset = JobsWidth(35);
                密码.offset = JobsWidth(0);
            }));
        });
    };return _loginDoorInputViewBaseStyleModelMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyleModel *> *)registerDoorInputViewBaseStyleModelMutArr{
    if (!_registerDoorInputViewBaseStyleModelMutArr) {
        _registerDoorInputViewBaseStyleModelMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            UIImage *userIcon = JobsAppDoorImageNamed(@"用户名称") ? : @"用户名".img;
            UIImage *lockIcon = JobsAppDoorImageNamed(@"Lock") ? : JobsAppDoorImageNamed(@"codeDecode");
            UIImage *verifyIcon = JobsAppDoorImageNamed(@"AppDoorVerifyCode") ? : @"验证ICON".img ? : lockIcon;
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 用户名) {
                用户名.leftViewIMG = userIcon;
                用户名.placeholder = @"用户名".jobsTr();
                用户名.placeholdAnimationable = NO;
                用户名.byIsShowDelBtn(YES);
                用户名.isShowSecurityBtn = NO;
                用户名.useCustomClearButton = YES;
                用户名.returnKeyType = UIReturnKeyDone;
                用户名.keyboardAppearance = UIKeyboardAppearanceAlert;
                用户名.leftViewMode = UITextFieldViewModeAlways;
                用户名.inputStr = self.jobsCurrentUserInfo().userName;
                用户名.placeholderColor = JobsWhiteColor;
                用户名.rightViewOffsetX = -JobsWidth(25);
                用户名.placeHolderOffset = JobsWidth(35);
                用户名.offset = JobsWidth(0);
            }))
            .add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 密码) {
                密码.leftViewIMG = lockIcon;
                密码.placeholder = @"密码".jobsTr();
                密码.placeholdAnimationable = NO;
                密码.byIsShowDelBtn(YES);
                密码.isShowSecurityBtn = YES;
                密码.useCustomClearButton = YES;
                密码.returnKeyType = UIReturnKeyDone;
                密码.keyboardAppearance = UIKeyboardAppearanceAlert;
                密码.selectedSecurityBtnIMG = JobsAppDoorImageNamed(@"codeEncode");//闭眼
                密码.unSelectedSecurityBtnIMG = JobsAppDoorImageNamed(@"codeDecode");//开眼
                密码.leftViewMode = UITextFieldViewModeAlways;
                密码.placeholderColor = JobsWhiteColor;
                密码.rightViewOffsetX = -JobsWidth(8);
                密码.placeHolderOffset = JobsWidth(35);
                密码.offset = JobsWidth(0);
            }))
            .add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 确认密码) {
                确认密码.leftViewIMG = lockIcon;
                确认密码.placeholder = @"确认密码".jobsTr();
                确认密码.placeholdAnimationable = NO;
                确认密码.byIsShowDelBtn(YES);
                确认密码.isShowSecurityBtn = YES;
                确认密码.useCustomClearButton = YES;
                确认密码.returnKeyType = UIReturnKeyDone;
                确认密码.keyboardAppearance = UIKeyboardAppearanceAlert;
                确认密码.selectedSecurityBtnIMG = JobsAppDoorImageNamed(@"codeEncode");//闭眼
                确认密码.unSelectedSecurityBtnIMG = JobsAppDoorImageNamed(@"codeDecode");//开眼
                确认密码.leftViewMode = UITextFieldViewModeAlways;
                确认密码.placeholderColor = JobsWhiteColor;
                确认密码.rightViewOffsetX = -JobsWidth(8);
                确认密码.placeHolderOffset = JobsWidth(35);
                确认密码.offset = JobsWidth(0);
            }));
            if (self.configuration.registerConfig.showsMobileBinding) {
                data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 手机号码) {
                    手机号码.leftViewIMG = JobsAppDoorImageNamed(@"手机号码");
                    手机号码.placeholder = @"手机号码".jobsTr();
                    手机号码.placeholdAnimationable = NO;
                    手机号码.byIsShowDelBtn(YES);
                    手机号码.isShowSecurityBtn = NO;
                    手机号码.useCustomClearButton = YES;
                    手机号码.returnKeyType = UIReturnKeyDone;
                    手机号码.keyboardAppearance = UIKeyboardAppearanceAlert;
                    手机号码.leftViewMode = UITextFieldViewModeAlways;
                    手机号码.placeholderColor = JobsWhiteColor;
                    手机号码.keyboardType = UIKeyboardTypePhonePad;
                    手机号码.leftViewOffsetX = 0.1f;
                    手机号码.rightViewOffsetX = JobsWidth(4);
                    手机号码.placeHolderOffset = JobsWidth(14);
                    手机号码.offset = 0.1f;
                    手机号码.fieldEditorOffset = JobsWidth(4);
                }));
                data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 手机验证码) {
                    手机验证码.leftViewIMG = verifyIcon;
                    手机验证码.placeholder = @"手机验证码".jobsTr();
                    手机验证码.placeholdAnimationable = NO;
                    手机验证码.byIsShowDelBtn(YES);
                    手机验证码.isShowSecurityBtn = NO;
                    手机验证码.useCustomClearButton = YES;
                    手机验证码.returnKeyType = UIReturnKeyDone;
                    手机验证码.keyboardType = UIKeyboardTypeNumberPad;
                    手机验证码.keyboardAppearance = UIKeyboardAppearanceAlert;
                    手机验证码.leftViewMode = UITextFieldViewModeAlways;
                    手机验证码.placeholderColor = JobsWhiteColor;
                    手机验证码.offset = JobsWidth(0);
                    手机验证码.placeHolderOffset = JobsWidth(35);
                    手机验证码.fieldEditorOffset = JobsWidth(4);
                }));
            }
            if (self.configuration.registerConfig.showsGraphicCaptcha) {
                data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 图形验证码) {
                    图形验证码.leftViewIMG = verifyIcon;
                    图形验证码.placeholder = @"图形验证码".jobsTr();
                    图形验证码.placeholdAnimationable = NO;
                    图形验证码.byIsShowDelBtn(YES);
                    图形验证码.isShowSecurityBtn = NO;
                    图形验证码.useCustomClearButton = YES;
                    图形验证码.returnKeyType = UIReturnKeyDone;
                    图形验证码.keyboardAppearance = UIKeyboardAppearanceAlert;
                    图形验证码.leftViewMode = UITextFieldViewModeAlways;
                    图形验证码.placeholderColor = JobsWhiteColor;
                    图形验证码.offset = JobsWidth(0);
                    图形验证码.placeHolderOffset = JobsWidth(35);
                    图形验证码.fieldEditorOffset = JobsWidth(4);
                }));
            }
        });
    };return _registerDoorInputViewBaseStyleModelMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)loginDoorInputViewBaseStyleMutArr{
    if (!_loginDoorInputViewBaseStyleMutArr) {
        _loginDoorInputViewBaseStyleMutArr = NSMutableArray.array;
    };return _loginDoorInputViewBaseStyleMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)registerDoorInputViewBaseStyleMutArr{
    if (!_registerDoorInputViewBaseStyleMutArr) {
        _registerDoorInputViewBaseStyleMutArr = NSMutableArray.array;
    };return _registerDoorInputViewBaseStyleMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)inputViewMutArr{
    if (!_inputViewMutArr) {
        _inputViewMutArr = NSMutableArray.array;
    };return _inputViewMutArr;
}

-(JobsAppDoorModel *)appDoorModel{
    if (!_appDoorModel) {
        _appDoorModel = JobsAppDoorModel.new;
    };return _appDoorModel;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorContentView
-(JobsRetJobsAppDoorContentViewByRACCompoundDisposableBlock _Nonnull)bySendBtnEnableDisposable{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorContentView * _Nullable(RACCompoundDisposable * _Nullable data){
        @jobs_strongify(self)
        [self setSendBtnEnableDisposable:data];
        return self;
    };
}

-(JobsRetJobsAppDoorContentViewByRACDisposableBlock _Nonnull)byVerificationCodeBtnEnableDisposable{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorContentView * _Nullable(RACDisposable * _Nullable data){
        @jobs_strongify(self)
        [self setVerificationCodeBtnEnableDisposable:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorContentView
@end
