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

-(UITextField *_Nullable)jobs_textFieldByInputView:(JobsAppDoorInputViewBaseStyle *)inputView;
-(NSString *)jobs_textByInputView:(JobsAppDoorInputViewBaseStyle *)inputView;
-(BOOL)jobs_inputViewsHaveText:(NSArray<JobsAppDoorInputViewBaseStyle *> *)inputViews;
-(void)jobs_refreshSendBtnEnabled:(BOOL)enabled;
-(void)jobs_bindSendBtnEnableSignalByInputViews:(NSArray<JobsAppDoorInputViewBaseStyle *> *)inputViews;
-(void)jobs_bindVerificationCodeBtnEnableSignal;
-(void)jobs_refreshRegisterSendBtnLayout;
-(void)jobs_layoutRegisterInputViews;
-(void)jobs_applyRegisterInputViewState;
-(void)jobs_prepareStaticPlaceholderForInputView:(JobsAppDoorInputViewBaseStyle *)inputView;

@end

@implementation JobsAppDoorContentView
-(void)dealloc{
    [self.sendBtnEnableDisposable dispose];
    [self.verificationCodeBtnEnableDisposable dispose];
    for (JobsAppDoorInputViewBaseStyle *inputView in self.registerDoorInputViewBaseStyleMutArr) {
        if (![inputView isKindOfClass:JobsAppDoorInputViewBaseStyle_1.class]) continue;
        JobsAppDoorInputViewBaseStyle_1 *手机验证码 = (JobsAppDoorInputViewBaseStyle_1 *)inputView;
        [手机验证码.getCountDownBtn.timer stop];
    }
}

-(instancetype)init{
    if (self = [super init]) {
        _configuration = JobsAppDoorConfig.defaultConfig;
        self.byBgColor(Cor2);
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable data) {
        @jobs_strongify(self)
        [self initialToRegisterBtn];
        [self initialTitleLab];
        [self makeInputView];
        [self initialSendBtn];
        [self initialAbandonLoginBtn];
        [self initialOthers];
        [self jobs_bindSendBtnEnableSignalByInputViews:self.loginDoorInputViewBaseStyleMutArr];
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
//            self.jobsToastSuccessMsg(@"Verification send success".tr);
//        } failureBlock:^(id data) {
//            JobsNetworkingAPI.handleError(data);
//            JobsAppDoorInputViewBaseStyle_1 *手机验证码 = (JobsAppDoorInputViewBaseStyle_1 *)self.registerDoorInputViewBaseStyleMutArr[4];
//            手机验证码.getCountDownBtn.timerDestroy();
//        }];
//    }else{
//        self.jobsToastErrMsg(@"TelePhone Number Error".tr);
//        JobsAppDoorInputViewBaseStyle_1 *手机验证码 = (JobsAppDoorInputViewBaseStyle_1 *)self.registerDoorInputViewBaseStyleMutArr[4];
//        手机验证码.getCountDownBtn.timerDestroy();
//    }
}
#pragma mark —— 一些外部调用的方法
///  获取存储按钮
-(UIButton *)getStoreCodeBtn{
    return self.storeCodeBtn;
}
/// 去登录【外部调用】
-(void)animationToLogin{
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
    [self jobs_bindSendBtnEnableSignalByInputViews:self.loginDoorInputViewBaseStyleMutArr];
}
/// 去注册【外部调用】
-(void)animationToRegister{
    if (self.toRegisterBtn.jobs_isSelected &&
        self.registerDoorInputViewBaseStyleMutArr.count >= self.registerDoorInputViewBaseStyleModelMutArr.count) return;
    self.toRegisterBtn.bySelected(YES);
    [self animationChangeRegisterBtnFrame];
}
#pragma mark —— 一些私有方法
/// 手机验证码验证
-(BOOL)checkTelePhoneNum:(NSString *)phone{
    /// 不为空且全为整数
    if (isValue(phone) &&
        [phone isPureInt]) {
        return YES;
    };return NO;
}
/// 除了传入的textfield，其他的全部放弃第一响应者
-(void)allRise:(UITextField *)textfield{
    for (JobsAppDoorInputViewBaseStyle *appDoorInputViewBaseStyle in self.loginDoorInputViewBaseStyleMutArr) {
        UITextField *inputTextField = [self jobs_textFieldByInputView:appDoorInputViewBaseStyle];
        if (textfield != inputTextField) {
            [inputTextField resignFirstResponder];
        }
    }
    for (JobsAppDoorInputViewBaseStyle *appDoorInputViewBaseStyle in self.registerDoorInputViewBaseStyleMutArr) {
        UITextField *inputTextField = [self jobs_textFieldByInputView:appDoorInputViewBaseStyle];
        if (textfield != inputTextField) {
            [inputTextField resignFirstResponder];
        }
    }
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

-(void)jobs_prepareStaticPlaceholderForInputView:(JobsAppDoorInputViewBaseStyle *)inputView{
    UITextField *textField = [self jobs_textFieldByInputView:inputView];
    if (!textField) return;
    textField
        .byFont(JobsAppDoorFormFont())
        .byTextCor(Cor3);
    textField.placeholderFont = JobsAppDoorFormFont();
    textField.placeholderColor = JobsAppDoorPlaceholderColor();
    if ([textField isKindOfClass:JobsMagicTextField.class]) {
        JobsMagicTextField *magicTextField = (JobsMagicTextField *)textField;
        magicTextField.placeholdAnimationable = NO;
    }
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
    }
    if (inputViews == self.registerDoorInputViewBaseStyleMutArr && inputViews.count >= 3) {
        NSString *password = [self jobs_textByInputView:inputViews[1]];
        NSString *confirmPassword = [self jobs_textByInputView:inputViews[2]];
        if (![password isEqualToString:confirmPassword]) return NO;
    };return YES;
}

-(void)jobs_refreshSendBtnEnabled:(BOOL)enabled{
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
}

-(JobsAppDoorInputViewBaseStyle *_Nullable)jobs_lastVisibleRegisterInputView{
    for (JobsAppDoorInputViewBaseStyle *inputView in self.registerDoorInputViewBaseStyleMutArr.reverseObjectEnumerator) {
        if (inputView.alpha > 0.01f) return inputView;
    };return nil;
}

-(void)jobs_refreshRegisterSendBtnLayout{
    JobsAppDoorInputViewBaseStyle *lastInputView = [self jobs_lastVisibleRegisterInputView];
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
}

-(void)jobs_layoutRegisterInputViews{
    CGFloat nextTop = self.titleLab.bottom + JobsAppDoorRegisterFirstInputTopOffset();
    for (JobsAppDoorInputViewBaseStyle *inputView in self.registerDoorInputViewBaseStyleMutArr) {
        inputView
            .byLeft(JobsWidth(20) + RegisterBtnWidth)
            .byTop(nextTop);
        nextTop = inputView.bottom + JobsAppDoorRegisterInputViewOffset();
    }
}

-(void)jobs_applyRegisterInputViewState{
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

-(void)jobs_refreshVerificationCodeBtn:(JobsCountdownBtn *)verificationCodeBtn
                             phoneText:(NSString *_Nullable)phoneText{
    BOOL enabled = [self jobs_textIsNotEmpty:phoneText] && !verificationCodeBtn.timer.isRunning;
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

-(void)jobs_bindVerificationCodeBtnEnableSignal{
    [self.verificationCodeBtnEnableDisposable dispose];
    self.verificationCodeBtnEnableDisposable = nil;
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
    JobsCountdownBtn *verificationCodeBtn = (JobsCountdownBtn *)verificationCodeInputView.getCountDownBtn;
    __weak JobsCountdownBtn *weakVerificationCodeBtn = verificationCodeBtn;
    @jobs_weakify(self)
    verificationCodeBtn.byOnFinish(^(JobsTimer *_Nullable timer) {
        @jobs_strongify(self)
        JobsCountdownBtn *strongVerificationCodeBtn = weakVerificationCodeBtn;
        if (!strongVerificationCodeBtn) return;
        [strongVerificationCodeBtn jobsResetCountdownTitle];
        [self jobs_refreshVerificationCodeBtn:strongVerificationCodeBtn
                                    phoneText:[self jobs_textByInputView:phoneInputView]];
    });
    UITextField *phoneTextField = [self jobs_textFieldByInputView:phoneInputView];
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
}
/// Core
-(void)makeInputView{
    if (self.loginDoorInputViewBaseStyleMutArr.count || self.inputViewMutArr.count) return;
    for (int i = 0; i < self.loginDoorInputViewBaseStyleModelMutArr.count; i++) {
        JobsAppDoorInputViewBaseStyle_3 *inputView = JobsAppDoorInputViewBaseStyle_3.new;
        [self.inputViewMutArr addObject:inputView];
        [self.loginDoorInputViewBaseStyleMutArr addObject:inputView];
        inputView.jobsRichViewByModel(self.loginDoorInputViewBaseStyleModelMutArr[i]);
        [self jobs_prepareStaticPlaceholderForInputView:inputView];
        NSUInteger inputIndex = i;
        @jobs_weakify(self)
        //【用户名 & 密码 输入回调，共享注册与登录两个界面】
        [inputView actionObjBlock:^(UITextField *data) {
            @jobs_strongify(self)
            if (inputIndex == 0) {
                self.appDoorModel.userName = data.text;
            }else if (inputIndex == 1){
                self.appDoorModel.password = data.text;
            }else{}
            if (self.objBlock) self.objBlock(self.appDoorModel);
            [self allRise:data];
        }];
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
}
/// 返回NO 登录按钮不可点击【可加入判断标准】
-(BOOL)checkLoginBtnCanBeUsed{
    return [self jobs_inputViewsHaveText:self.loginDoorInputViewBaseStyleMutArr];
}
/// 返回NO 注册按钮不可点击【可加入判断标准】
-(BOOL)checkRegisterBtnCanBeUsed{
    return [self jobs_inputViewsHaveText:self.registerDoorInputViewBaseStyleMutArr];
}
/// 一些需要通过点击状态改变状态的控件
/// 一些需要通过点击状态改变状态的控件【初始状态】
-(void)initialTitleLab{
    self.titleLab
        .byText(Title7)
        .byFont(UIFontWeightRegularSize(JobsWidth(20)))
        .byTextCor(Cor3)
        .bySizeToFit()//sizeToFit也会刷新UI造成UI错位，所以需要提前写
        .byTop(JobsWidth(20))
        .byCenterX((self.width - self.toRegisterBtn.width) / 2);
}

-(void)initialSendBtn{
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
    [self jobs_refreshSendBtnEnabled:[self checkLoginBtnCanBeUsed]];
}
/// 返回首页
-(void)initialAbandonLoginBtn{
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
}

-(void)initialOthers{
    self.storeCodeBtn
        .byAlpha(1);//存储登录信息
    self.findCodeBtn
        .byAlpha(1);//找回密码
    [self bringSubviewToFront:self.storeCodeBtn];
    [self bringSubviewToFront:self.findCodeBtn];
}

-(void)initialToRegisterBtn{
    self.toRegisterBtn
        .jobsResetBtnTitle(Title12)
        .jobsResetImagePlacement_Padding(NSDirectionalRectEdgeTop,JobsWidth(20));
}
/// 一些需要通过点击状态改变状态的控件【被选中状态】
-(void)selectTitleLab{
    self.titleLab
        .byText(Title6)
        .bySizeToFit()
        .byTop(JobsWidth(20))
        .byCenterX((self.width + self.toRegisterBtn.width) / 2);
}

-(void)selectSendBtn{
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
    [self jobs_refreshRegisterSendBtnLayout];
    self.sendBtn.titleLabel.bySizeToFit();
    [self jobs_refreshSendBtnEnabled:[self checkRegisterBtnCanBeUsed]];
}

-(void)selectAbandonLoginBtn{
    self.abandonLoginBtn
        .byCenterX(self.sendBtn.centerX)
        .byTop(self.sendBtn.bottom + JobsAppDoorRegisterHomeBtnTopOffset())
        .byAlpha(1);//返回首页
}

-(void)selectOthers{
    self.storeCodeBtn
        .byAlpha(0);//存储登录信息
    self.findCodeBtn
        .byAlpha(0);//找回密码
}

-(void)selectToRegisterBtn{
    self.toRegisterBtn.jobsResetBtnTitle(Title1);
}

-(void)一些UI的初始状态{
    [self initialTitleLab];
    [self initialSendBtn];
    [self initialAbandonLoginBtn];
    [self initialOthers];
    [self initialToRegisterBtn];
}

-(void)一些UI点击以后的状态{
    [self selectTitleLab];
    [self selectSendBtn];
    [self selectAbandonLoginBtn];
    [self selectOthers];
    [self selectToRegisterBtn];
}
/// 去注册【内部调用】
-(void)p_animationToRegister{
    [self 一些UI点击以后的状态];
    if (self.registerDoorInputViewBaseStyleMutArr.count >= self.registerDoorInputViewBaseStyleModelMutArr.count) {//不是第一次
        for (long i = self.loginDoorInputViewBaseStyleMutArr.count;
             i < self.registerDoorInputViewBaseStyleModelMutArr.count;
             i++) {
            JobsAppDoorInputViewBaseStyle *inputView = (JobsAppDoorInputViewBaseStyle *)self.registerDoorInputViewBaseStyleMutArr[i];
            inputView.byAlpha(1);
        }
        [self jobs_layoutRegisterInputViews];
        [self jobs_refreshRegisterSendBtnLayout];
        [self jobs_bindSendBtnEnableSignalByInputViews:self.registerDoorInputViewBaseStyleMutArr];
        [self jobs_bindVerificationCodeBtnEnableSignal];
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
            [self jobs_prepareStaticPlaceholderForInputView:inputView];
            @jobs_weakify(self)
            [inputView actionObjBlock:^(UITextField *data) {
                @jobs_strongify(self)
                UITextField *textField = (UITextField *)data;
                self.appDoorModel.confirmPassword = textField.text;
                if (self.objBlock) self.objBlock(self.appDoorModel);
                [self allRise:data];
            }];
        }else if (self.configuration.registerConfig.showsMobileBinding && i == phoneIndex){// 手机号码
            inputView_7 = JobsAppDoorInputViewBaseStyle_7.new;
            doorInputViewBaseStyle = (JobsAppDoorInputViewBaseStyle *)inputView_7;
            inputView_7.addOn(self);
            [self.registerDoorInputViewBaseStyleMutArr addObject:inputView_7];
            inputView_7.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);
            [self jobs_prepareStaticPlaceholderForInputView:inputView_7];
            @jobs_weakify(self)
            [inputView_7 actionObjBlock:^(id data) {
                @jobs_strongify(self)
                if ([data isKindOfClass:UITextField.class]) {
                    UITextField *textField = (UITextField *)data;
                    self.appDoorModel.tel = textField.text;
                    if (self.objBlock) self.objBlock(self.appDoorModel);
                    [self allRise:textField];
                }else if ([data isKindOfClass:UIButton.class]){
                    if (self.objBlock) self.objBlock(data);
                }else{}
            }];
        }else if (self.configuration.registerConfig.showsMobileBinding && i == verificationCodeIndex){// 手机验证码
            JobsAppDoorInputViewBaseStyle_1 *inputView = JobsAppDoorInputViewBaseStyle_1.new;
            doorInputViewBaseStyle = (JobsAppDoorInputViewBaseStyle *)inputView;
            inputView.addOn(self);
            [self.registerDoorInputViewBaseStyleMutArr addObject:inputView];
            inputView.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);
            [self jobs_prepareStaticPlaceholderForInputView:inputView];
            @jobs_weakify(self)
            [inputView actionObjBlock:^(id data) {
                @jobs_strongify(self)
                if ([data isKindOfClass:UITextField.class]) {
                    UITextField *textField = (UITextField *)data;
                    self.appDoorModel.verificationCode = textField.text;
                    if (self.objBlock) self.objBlock(self.appDoorModel);
                    [self allRise:data];
                }else if ([data isKindOfClass:UIButton.class]){
                    [self getCellPhoneVerificationCodeWithCountry:nil
                                                            phone:self->inputView_7.textFieldValue];
                }else{}
            }];
        }else if (self.configuration.registerConfig.showsGraphicCaptcha && i == graphicCaptchaIndex){// 图形验证码
            JobsAppDoorInputViewBaseStyle_4 *inputView = JobsAppDoorInputViewBaseStyle_4.new;
            doorInputViewBaseStyle = (JobsAppDoorInputViewBaseStyle *)inputView;
            inputView.addOn(self);
            [self.registerDoorInputViewBaseStyleMutArr addObject:inputView];
            inputView.graphicCaptchaConfig = self.configuration.registerConfig.graphicCaptchaConfig.resolvedCaptchaConfig;
            inputView.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);
            [self jobs_prepareStaticPlaceholderForInputView:inputView];
            @jobs_weakify(self)
            [inputView actionObjBlock:^(id data) {
                @jobs_strongify(self)
                if ([data isKindOfClass:UITextField.class]) {
                    [self allRise:data];
                }
            }];
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
    [self jobs_layoutRegisterInputViews];
    [self jobs_refreshRegisterSendBtnLayout];
    [self jobs_bindSendBtnEnableSignalByInputViews:self.registerDoorInputViewBaseStyleMutArr];
    [self jobs_bindVerificationCodeBtnEnableSignal];
}
/// 公共方法
-(void)animationCommon{
    if (self.objBlock) self.objBlock(self.toRegisterBtn);
    self.toRegisterBtn.jobsResetImagePlacement_Padding(NSDirectionalRectEdgeTop,JobsWidth(6));
    [self jobs_applyRegisterInputViewState];
}
/// 核心方法
-(void)animationChangeRegisterBtnFrame{
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
            [self p_animationToRegister];
        }else{// 点击了“返回登录”按钮，正在进入登录页面 初始状态
            [self animationToLogin];
        }
        [self animationCommon];
    } completion:nil];
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
                [self animationChangeRegisterBtnFrame];
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
                x.requestParams = self.appDoorModel;
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
                    configuration.titleLineBreakMode = NSLineBreakByClipping;
                    button.configuration = configuration;
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
                    configuration.titleLineBreakMode = NSLineBreakByClipping;
                    button.configuration = configuration;
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
                用户名.placeholder = @"用户名".tr;
                用户名.placeholdAnimationable = NO;
                用户名.isShowDelBtn = YES;
                用户名.isShowSecurityBtn = NO;
                用户名.useCustomClearButton = YES;
                用户名.returnKeyType = UIReturnKeyDone;
                用户名.keyboardAppearance = UIKeyboardAppearanceAlert;
                用户名.leftViewMode = UITextFieldViewModeAlways;
                用户名.placeholderColor = JobsWhiteColor;
                用户名.rightViewOffsetX = JobsWidth(10);
                用户名.placeHolderOffset = JobsWidth(35);
                用户名.offset = JobsWidth(0);
                if (self.readUserNameMutArr.count) {
                    用户名.inputStr = self.readUserNameMutArr[0];
                }
            }));
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 密码) {
                密码.leftViewIMG = lockIcon;
                密码.placeholder = @"密码".tr;
                密码.placeholdAnimationable = NO;
                密码.isShowDelBtn = YES;
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
                用户名.placeholder = @"用户名".tr;
                用户名.placeholdAnimationable = NO;
                用户名.isShowDelBtn = YES;
                用户名.isShowSecurityBtn = NO;
                用户名.useCustomClearButton = YES;
                用户名.returnKeyType = UIReturnKeyDone;
                用户名.keyboardAppearance = UIKeyboardAppearanceAlert;
                用户名.leftViewMode = UITextFieldViewModeAlways;
                用户名.inputStr = self.readUserInfo.userName;
                用户名.placeholderColor = JobsWhiteColor;
                用户名.rightViewOffsetX = -JobsWidth(25);
                用户名.placeHolderOffset = JobsWidth(35);
                用户名.offset = JobsWidth(0);
            }));
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 密码) {
                密码.leftViewIMG = lockIcon;
                密码.placeholder = @"密码".tr;
                密码.placeholdAnimationable = NO;
                密码.isShowDelBtn = YES;
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
            }));
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 确认密码) {
                确认密码.leftViewIMG = lockIcon;
                确认密码.placeholder = @"确认密码".tr;
                确认密码.placeholdAnimationable = NO;
                确认密码.isShowDelBtn = YES;
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
                    手机号码.placeholder = @"手机号码".tr;
                    手机号码.placeholdAnimationable = NO;
                    手机号码.isShowDelBtn = YES;
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
                    手机验证码.placeholder = @"手机验证码".tr;
                    手机验证码.placeholdAnimationable = NO;
                    手机验证码.isShowDelBtn = YES;
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
                    图形验证码.placeholder = @"图形验证码".tr;
                    图形验证码.placeholdAnimationable = NO;
                    图形验证码.isShowDelBtn = YES;
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

@end
