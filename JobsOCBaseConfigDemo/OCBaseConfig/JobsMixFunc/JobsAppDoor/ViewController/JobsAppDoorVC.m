//
//  JobsAppDoorVC.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorVC.h"

//ZFPlayerController *ZFPlayer_DoorVC;
@interface JobsAppDoorVC ()<UIGestureRecognizerDelegate>{
    NSInteger index;// 当前被激活的TextField的序号，从1开始
    UIButton *toRegisterBtn;
    UITextField *lastEditTextField;// 上一次处于编辑状态的TextField
}
/// UI
Prop_strong()JobsAppDoorLogoContentView *logoContentView;
Prop_strong()JobsAppDoorContentView *jobsAppDoorContentView;// 登录和注册
Prop_strong(nullable)JobsAppDoorForgotCodeContentView *forgotCodeContentView;// 忘记密码
Prop_strong(nullable)UIImageView *bgImgV;
Prop_strong(nullable)UIButton *customerServiceBtn;
Prop_strong(nullable)UIButton *volumeBtn;
Prop_strong(nullable)UIView *volumePanelView;
Prop_strong(nullable)UISlider *volumeSlider;
Prop_strong(nullable)UILabel *volumePercentLab;
Prop_strong(nullable)UITapGestureRecognizer *volumeDismissTapGesture;
Prop_strong(nullable)UIPanGestureRecognizer *volumeSliderPanGesture;
Prop_strong(nullable)UITapGestureRecognizer *volumeSliderTapGesture;
Prop_strong(nullable)ZFPlayerController *player;
Prop_strong(nullable)ZFAVPlayerManager *playerManager;
Prop_strong(nullable)CustomZFPlayerControlView *customPlayerControlView;
/// Data
Prop_assign()BOOL registerDoorInputEditing;
Prop_assign()CGFloat logoContentViewY;// 初始高度
Prop_assign()CGFloat forgotCodeContentViewY;// 初始高度
Prop_assign()CGFloat jobsAppDoorContentViewY;// 初始高度
Prop_assign()CGFloat customerServiceBtnY;// 初始高度
Prop_assign()NSInteger currentActivateTFIndex;// 当前被激活的输入框的序列号
Prop_assign()NSInteger lastTimeActivateTFIndex;// 上一时刻被激活的输入框的序列号
Prop_assign()BOOL volumePanelShowing;
Prop_assign()BOOL videoPausedByApplicationState;
Prop_strong()JobsAppDoorModel *appDoorModel;

-(jobsByVoidBlock _Nonnull)jobs_bringDoorControlsToFront;
-(jobsByBOOLBlock _Nonnull)jobs_refreshLogoVisibilityForKeyboardVisible;
-(jobsByVoidBlock _Nonnull)jobs_installDoorVideoApplicationStateObservers;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorVC
@interface JobsAppDoorVC (JobsPropertyDSLSetterAutogen_6c27c8be35)
-(void)setAppDoorModel:(JobsAppDoorModel * _Nullable)data;
-(void)setCurrentActivateTFIndex:(NSInteger)data;
-(void)setCustomerServiceBtnY:(CGFloat)data;
-(void)setForgotCodeContentViewY:(CGFloat)data;
-(void)setIsHiddenNavigationBar:(BOOL)data;
-(void)setJobsAppDoorContentViewY:(CGFloat)data;
-(void)setLastTimeActivateTFIndex:(NSInteger)data;
-(void)setLogoContentViewY:(CGFloat)data;
-(void)setVideoPausedByApplicationState:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorVC

@implementation JobsAppDoorVC
-(JobsRetJobsAppDoorVCByConfigBlock _Nonnull)byConfiguration{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC *_Nullable(JobsAppDoorConfig *_Nullable config){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setConfiguration:config];
        return self;
    };
}

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsAppDoorVC.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        static_jobsAppDoorOnceToken = 0;
        static_appDoorVC = nil;
    };
}
static JobsAppDoorVC *static_appDoorVC = nil;
static dispatch_once_t static_jobsAppDoorOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsAppDoorVC.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&static_jobsAppDoorOnceToken, ^{
            static_appDoorVC = JobsAppDoorVC.new;
        });return static_appDoorVC;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        _configuration = JobsAppDoorConfig.defaultConfig();
        self.jobs_installDoorVideoApplicationStateObservers();
    };return self;
}

-(instancetype)initWithConfiguration:(JobsAppDoorConfig *)configuration{
    if (self = [self init]) {
        _configuration = configuration.copy ? : JobsAppDoorConfig.defaultConfig();
    };return self;
}

-(JobsRetBOOLByVoidBlock _Nonnull)jobs_requiresDefaultNavigationBar{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return NO;
    };
}

-(jobsByVoidBlock _Nonnull)jobs_applyConfigurationFromRequestParams{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        id parameters = self.requestParams;
        if ([parameters isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)parameters);
            parameters = self.viewModel.requestParams;
        }
        if ([parameters isKindOfClass:JobsAppDoorConfig.class]) {
            self.byConfiguration([parameters copy]);
        }else if ([parameters isKindOfClass:NSNumber.class]) {
            self.configuration.byBackgroundType([parameters integerValue]);
        }
    };
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.byHiddenNavigationBar(YES);
        self.byBgImage(nil);
        self.jobs_applyConfigurationFromRequestParams();
        if (self.configuration.backgroundType == JobsAppDoorBgType_Image) {
            self.byView(self.bgImgV);
        }else if (self.configuration.backgroundType == JobsAppDoorBgType_Video){
            [self.player.currentPlayerManager play];
        }
        self.byCurrentPage(@(CurrentPage_Login));
        //标的值初始化
        self.byLogoContentViewY(0);
        self.byJobsAppDoorContentViewY(0);
        self.byCustomerServiceBtnY(0);
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byTextCor(JobsLabelColor)
                    .byText(data.attributedTitle.string)
                    .byFont(UIFontWeightRegularSize(16));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.jobsAppDoorContentView.图片从小放大();
        self.logoContentView.图片从小放大();
        self.customerServiceBtn.图片从小放大();
        if (_player) {
            self.volumeBtn.图片从小放大();
            self.volumePanelView.byVisible(NO);
            self.jobs_installVolumeDismissGestureIfNeeded();
            self.jobs_refreshVolumeControlFrame();
        }
        self.jobs_bringDoorControlsToFront();
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        self.jobs_refreshVolumeControlFrame();
    };
}

- (void)viewWillAppear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.jobs_refreshLogoVisibilityForKeyboardVisible(NO);
        self.jobs_resumeDoorVideoIfNeeded();
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        JobsLog(@"%@",self.requestParams);
        if (self.currentPage.integerValue == CurrentPage_Login) self.jobsAppDoorContentView.animationToLogin();
        self.jobs_refreshKeyboardMgrConfig();
        self.jobs_resumeDoorVideoIfNeeded();
        self.jobs_bringDoorControlsToFront();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        ((JobsOCKeyboardMgr *)JobsOCKeyboardMgr.shared()).clearConfigByOwner(self);
        if (self.configuration.backgroundType == JobsAppDoorBgType_Video) {
            BOOL shouldPauseVideo = self.isBeingDismissed || self.isMovingFromParentViewController || self.navigationController.isBeingDismissed;
            if (shouldPauseVideo && self.player.currentPlayerManager.isPlaying) {
                self.player.currentPlayerManager.pause;
            }
            [self jobs_setVolumePanelVisible:NO animated:NO];
        }
    };
}
#pragma mark —— 一些私有方法
-(void)竖形按钮在左边{
    index = 0;
    self->_jobsAppDoorContentView.byBgColor(Cor2);
    Ivar ivar = class_getInstanceVariable(JobsAppDoorContentView.class, "_toRegisterBtn");// 必须是下划线接属性
    UIButton *toRegisterBtn = object_getIvar(self->_jobsAppDoorContentView, ivar);
    toRegisterBtn
        .jobsResetBtnBgCor(Cor3)
        .jobsResetBtnTitleCor(Cor1)
        .jobsResetBtnTitle(Title1);
    self.byCurrentPage(@(CurrentPage_Register));
    self.jobs_refreshLogoVisibilityForKeyboardVisible(NO);
    self->_jobsAppDoorContentView
        .byFrame(CGRectMake(JobsAppDoorContentViewRegisterX,
                            self.configuration.registerContentY(),
                            JobsAppDoorContentViewRegisterWidth,
                            self.configuration.registerContentHeight()));
    toRegisterBtn
        .byFrame(CGRectMake(0,
                            0,
                            JobsWidth(64),
                            self->_jobsAppDoorContentView.height));
}

-(void)竖形按钮在右边{
    index = 0;
    self->_jobsAppDoorContentView.byBgColor(Cor2);
    Ivar ivar = class_getInstanceVariable([JobsAppDoorContentView class], "_toRegisterBtn");// 必须是下划线接属性
    UIButton *toRegisterBtn = object_getIvar(self->_jobsAppDoorContentView, ivar);
    toRegisterBtn
        .jobsResetBtnBgCor(Cor1)
        .jobsResetBtnTitleCor(Cor4)
        .jobsResetBtnTitle(Title12);
    self.byCurrentPage(@(CurrentPage_Login));
    self.jobs_refreshLogoVisibilityForKeyboardVisible(((JobsOCKeyboardMgr *)JobsOCKeyboardMgr.shared()).latestResult.keyboardVisible);
    self->_jobsAppDoorContentView
        .byFrame(CGRectMake(JobsAppDoorContentViewLoginX,
                            JobsAppDoorContentViewLoginY,
                            JobsAppDoorContentViewLoginWidth,
                            JobsAppDoorContentViewLoginHeight));
    toRegisterBtn
        .byFrame(CGRectMake(self->_jobsAppDoorContentView.width - 64,
                            0,
                            64,
                            self->_jobsAppDoorContentView.height));
}
/// 进此页面先自动跳转到注册页面
-(jobsByVoidBlock _Nonnull)toRegister{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.jobsAppDoorContentView.animationToRegister();
    };
}

-(JobsRetViewByVoidBlock _Nonnull)jobs_activeDoorContentViewForKeyboard{
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        if (!self) return nil;
        if (self.currentPage.integerValue == CurrentPage_ForgotCode && _forgotCodeContentView) return _forgotCodeContentView;
        return self.jobsAppDoorContentView;
    };
}

-(jobsByBOOLBlock _Nonnull)jobs_refreshLogoVisibilityForKeyboardVisible{
    @jobs_weakify(self)
    return ^(BOOL keyboardVisible){
        @jobs_strongify(self)
        if (!self) return;
        BOOL logoVisible = self.currentPage.integerValue == CurrentPage_Login && !keyboardVisible;
        self.logoContentView.byAlpha(logoVisible ? 1.0f : 0.0f);
    };
}

-(jobsByVoidBlock _Nonnull)jobs_refreshKeyboardMgrConfig{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIView *targetView = self.jobs_activeDoorContentViewForKeyboard();
        if (!targetView) return;
        NSArray *followViews = self.customerServiceBtn ? @[self.customerServiceBtn] : @[];
        CGFloat keyboardExtraSpacing = JobsWidth(16);
        if (self.currentPage.integerValue == CurrentPage_Register) {
            keyboardExtraSpacing += MAX(0, (NSInteger)self.configuration.registerFieldCount() - 3) * (ThingsHeight + InputViewOffset) / 2;
        }
        @jobs_weakify(self)
        ((JobsOCKeyboardMgr *)JobsOCKeyboardMgr.shared()).byConfig(jobsMakeOCKeyboardConfig(^(__kindof JobsOCKeyboardConfig * _Nullable data) {
            @jobs_strongify(self)
            data.byOwner(self)
                .byTargetView(targetView)
                .byContainerView(self.view)
                .byFollowViews(followViews)
                .byExtraSpacing(keyboardExtraSpacing)
                .byTopSpacing(JobsWidth(12))
                .byAccessoryPolicy(JobsOCKeyboardAccessoryPolicyAuto)
                .byResultBlock(^(JobsOCKeyboardResult *result) {
                    @jobs_strongify(self)
                    self.jobs_refreshLogoVisibilityForKeyboardVisible(result.keyboardVisible);
                });
        }));
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)jobs_isVideoDoorMode{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.configuration.backgroundType == JobsAppDoorBgType_Video;
    };
}

-(jobsByVoidBlock _Nonnull)jobs_resumeDoorVideoIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (![self jobs_isVideoDoorMode]() || !_player) return;
        if (!self.player.currentPlayerManager.isPlaying) {
            [self.player.currentPlayerManager play];
        }
    };
}

-(jobsByVoidBlock _Nonnull)jobs_installDoorVideoApplicationStateObservers{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsAddNotification(self,
                            @selector(jobs_applicationDidEnterBackground:),
                            UIApplicationDidEnterBackgroundNotification,
                            nil);
        JobsAddNotification(self,
                            @selector(jobs_applicationDidBecomeActive:),
                            UIApplicationDidBecomeActiveNotification,
                            nil);
    };
}

-(void)jobs_applicationDidEnterBackground:(NSNotification *)notification{
    jobsByNotificationBlock action = ((jobsByNotificationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC.class, @selector(jobsJobs_applicationDidEnterBackground)))(self, @selector(jobsJobs_applicationDidEnterBackground));
    if (action) action(notification);
}

-(jobsByNotificationBlock _Nonnull)jobsJobs_applicationDidEnterBackground{
    @jobs_weakify(self)
    return ^(NSNotification * notification){
        @jobs_strongify(self)
        if (!self) return;
        (void)notification;
        if (![self jobs_isVideoDoorMode]() || !_player) return;
        id<ZFPlayerMediaPlayback> currentPlayerManager = _player.currentPlayerManager;
        self.byVideoPausedByApplicationState(currentPlayerManager.isPlaying);
        if (self.videoPausedByApplicationState) currentPlayerManager.pause;
    };
}

-(void)jobs_applicationDidBecomeActive:(NSNotification *)notification{
    jobsByNotificationBlock action = ((jobsByNotificationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC.class, @selector(jobsJobs_applicationDidBecomeActive)))(self, @selector(jobsJobs_applicationDidBecomeActive));
    if (action) action(notification);
}

-(jobsByNotificationBlock _Nonnull)jobsJobs_applicationDidBecomeActive{
    @jobs_weakify(self)
    return ^(NSNotification * notification){
        @jobs_strongify(self)
        if (!self) return;
        (void)notification;
        BOOL shouldResumeVideo = self.videoPausedByApplicationState;
        self.byVideoPausedByApplicationState(NO);
        if (!shouldResumeVideo || !self.viewIfLoaded.window) return;
        self.jobs_resumeDoorVideoIfNeeded();
    };
}

-(jobsByVoidBlock _Nonnull)jobs_installVolumeDismissGestureIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (_volumeDismissTapGesture) return;
        @jobs_weakify(self)
        _volumeDismissTapGesture = (jobsMakeTapGesture(^(UITapGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            gesture
                .byCancelsTouchesInView(NO)
                .byDelegate(self);
        })).GestureActionBy(^(__kindof UIGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            [self jobs_volumeDismissTap:(UITapGestureRecognizer *)gesture];
        });
        self.view.addGesture(_volumeDismissTapGesture);
    };
}

-(void)jobs_volumeDismissTap:(UITapGestureRecognizer *)tapGesture{
    jobsByTapGestureRecognizerBlock action = ((jobsByTapGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC.class, @selector(jobsJobs_volumeDismissTap)))(self, @selector(jobsJobs_volumeDismissTap));
    if (action) action(tapGesture);
}

-(jobsByTapGestureRecognizerBlock _Nonnull)jobsJobs_volumeDismissTap{
    @jobs_weakify(self)
    return ^(UITapGestureRecognizer * tapGesture){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.volumePanelShowing) return;
        [self jobs_setVolumePanelVisible:NO
                                animated:YES];
    };
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
      shouldReceiveTouch:(UITouch *)touch{
    if (gestureRecognizer != self.volumeDismissTapGesture || !self.volumePanelShowing) return NO;
    UIView *touchView = touch.view;
    if ([touchView isDescendantOfView:self.volumeBtn] ||
        [touchView isDescendantOfView:self.volumePanelView]) {
        return NO;
    };return YES;
}

-(JobsRetFloatByVoidBlock _Nonnull)jobs_currentDoorVolume{
    @jobs_weakify(self)
    return ^float{
        @jobs_strongify(self)
        if (!self) return (float){0};
        id<ZFPlayerMediaPlayback> currentPlayerManager = _player.currentPlayerManager;
        float volume = _volumeSlider ? _volumeSlider.value : 0;
        if (_player) {
            volume = _player.volume;
        }else if (currentPlayerManager) {
            volume = currentPlayerManager.volume;
        }else if (_playerManager) {
            volume = _playerManager.volume;
        };return MAX(0, MIN(1, volume));
    };
}

-(JobsRetfloatByCGPointBlock _Nonnull)jobs_volumeValueByPanelPoint{
    @jobs_weakify(self)
    return ^float(CGPoint point){
        @jobs_strongify(self)
        if (!self) return (float){0};
        CGRect sliderFrame = self.volumeSlider.frame;
        CGFloat sliderHeight = CGRectGetHeight(sliderFrame);
        if (sliderHeight <= 0) return self.jobs_currentDoorVolume();
        CGFloat progress = 1.0f - ((point.y - CGRectGetMinY(sliderFrame)) / sliderHeight);
        return (float)MAX(0, MIN(1, progress));
    };
}

-(jobsByFloatBlock _Nonnull)jobs_applyDoorVolume{
    @jobs_weakify(self)
    return ^(float volume){
        @jobs_strongify(self)
        if (!self) return;
        volume = MAX(0, MIN(1, volume));
        BOOL muted = volume <= 0.001f;
        id<ZFPlayerMediaPlayback> currentPlayerManager = _player.currentPlayerManager;
        self.volumeSlider.byValue(volume);
        if (_player) {
            _player.byMuted(muted);
            _player.byVolume(volume);
        }
        if (currentPlayerManager) {
            ((NSObject *)currentPlayerManager).byMuted(muted);
            ((NSObject *)currentPlayerManager).byVolume(volume);
        }
        if (_playerManager && _playerManager != currentPlayerManager) {
            _playerManager.byMuted(muted);
            _playerManager.byVolume(volume);
        }
        self.jobs_updateVolumePercentText();
    };
}

-(void)jobs_volumePanelValueGesture:(UIGestureRecognizer *)gesture{
    jobsByGestureRecognizerBlock action = ((jobsByGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC.class, @selector(jobsJobs_volumePanelValueGesture)))(self, @selector(jobsJobs_volumePanelValueGesture));
    if (action) action(gesture);
}

-(jobsByGestureRecognizerBlock _Nonnull)jobsJobs_volumePanelValueGesture{
    @jobs_weakify(self)
    return ^(UIGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.volumePanelShowing || !_volumePanelView) return;
        CGPoint point = [gesture locationInView:self.volumePanelView];
        CGRect sliderFrame = self.volumeSlider.frame;
        CGRect sliderHitFrame = CGRectMake(0,
                                           CGRectGetMinY(sliderFrame) - JobsWidth(18),
                                           self.volumePanelView.width,
                                           CGRectGetHeight(sliderFrame) + JobsWidth(36));
        if (!CGRectContainsPoint(sliderHitFrame, point)) return;
        self.jobs_applyDoorVolume(self.jobs_volumeValueByPanelPoint(point));
    };
}

-(jobsByVoidBlock _Nonnull)jobs_updateVolumePercentText{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        float volume = self.jobs_currentDoorVolume();
        NSInteger percent = (NSInteger)(MAX(0, MIN(1, volume)) * 100.0f + 0.5f);
        self.volumePercentLab.byText([NSString stringWithFormat:@"%ld%%",(long)percent]);
    };
}

-(NSString *)jobs_countryCodeTitleByCountryName:(NSString *)countryName
                                           code:(NSString *)code{
    NSString *cleanCode = code.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
    if (!cleanCode.length) cleanCode = @"86";
    NSString *codeText = [cleanCode hasPrefix:@"+"] ? cleanCode : [NSString stringWithFormat:@"+%@",cleanCode];
    if (self.jobs_isTaiwanCountryName(countryName)) return [NSString stringWithFormat:@"｜%@",codeText];
    return [NSString stringWithFormat:@"%@｜%@",self.jobs_countryFlagByCountryName(countryName),codeText];
}

-(JobsRetBOOLByStrBlock _Nonnull)jobs_isTaiwanCountryName{
    @jobs_weakify(self)
    return ^BOOL(NSString * countryName){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSString *cleanCountryName = countryName.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
        if (!cleanCountryName.length) return NO;
        NSSet <NSString *>*taiwanNames = [NSSet setWithArray:@[@"中国台湾",@"台湾",@"Taiwan",@"Taiwan, China",@"China Taiwan"]];
        return [taiwanNames containsObject:cleanCountryName];
    };
}

-(JobsRetImageByStrBlock _Nonnull)jobs_countryFlagImageByCountryName{
    @jobs_weakify(self)
    return ^UIImage *(NSString * countryName){
        @jobs_strongify(self)
        if (!self) return nil;
        if (!self.jobs_isTaiwanCountryName(countryName)) return nil;
        return JobsAppDoorImageNamed(@"AppDoorTaiwanBlueSkyWhiteSun");
    };
}

-(JobsRetStrByStrBlock _Nonnull)jobs_countryFlagByCountryName{
    @jobs_weakify(self)
    return ^NSString *(NSString * countryName){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *cleanCountryName = countryName.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
        if (!cleanCountryName.length) return @"🇨🇳";
        NSDictionary <NSString *,NSString *>*specialISOCodeByCountryName = @{
            @"中国":@"CN",
            @"中国香港":@"HK",
            @"香港":@"HK",
            @"中国澳门":@"MO",
            @"澳门":@"MO",
            @"中国台湾":@"TW",
            @"台湾":@"TW"
        };
        NSString *ISOCode = specialISOCodeByCountryName[cleanCountryName];
        if (ISOCode.length) return self.jobs_flagEmojiByISOCode(ISOCode);
        NSArray <NSLocale *>*locales = @[
            NSLocale.currentLocale,
            [NSLocale localeWithLocaleIdentifier:@"zh_Hans_CN"],
            [NSLocale localeWithLocaleIdentifier:@"en_US"]
        ];
        for (NSString *countryCode in NSLocale.ISOCountryCodes) {
            for (NSLocale *locale in locales) {
                NSString *displayName = [locale displayNameForKey:NSLocaleCountryCode value:countryCode];
                if ([cleanCountryName isEqualToString:displayName]) return self.jobs_flagEmojiByISOCode(countryCode);
            }
        };return @"🌐";
    };
}

-(JobsRetStrByStrBlock _Nonnull)jobs_flagEmojiByISOCode{
    @jobs_weakify(self)
    return ^NSString *(NSString * ISOCode){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *uppercaseISOCode = ISOCode.uppercaseString;
        if (uppercaseISOCode.length != 2) return @"🌐";
        uint32_t base = 0x1F1E6;
        uint32_t scalars[2] = {
            base + [uppercaseISOCode characterAtIndex:0] - 'A',
            base + [uppercaseISOCode characterAtIndex:1] - 'A'
        };
        NSData *data = [NSData dataWithBytes:scalars length:sizeof(scalars)];
        NSString *flag = [NSString.alloc initWithData:data encoding:NSUTF32LittleEndianStringEncoding];
        return flag.length ? flag : @"🌐";
    };
}

-(jobsByBtnBlock _Nonnull)jobs_pushCountryCodeCtrlBySender{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        JobsOCCountryCodeCtrl *countryCodeCtrl = JobsOCCountryCodeCtrl.new;
        countryCodeCtrl.byHidesBottomBarWhenPushed(YES);
        @jobs_weakify(self)
        countryCodeCtrl.countryCodeBlock = ^(__kindof NSString * _Nullable countryName,
                                             __kindof NSString * _Nullable code) {
            @jobs_strongify(self)
            UIImage *flagImage = self.jobs_countryFlagImageByCountryName(countryName);
            sender.jobsResetBtnImage(flagImage);
            if (flagImage) {
                sender.imageView.byContentMode(UIViewContentModeScaleAspectFit);
                sender.jobsResetImagePlacement_Padding(NSDirectionalRectEdgeLeading,JobsWidth(4));
            }else{
                sender
                    .byImageEdgeInsets(UIEdgeInsetsZero)
                    .byTitleEdgeInsets(UIEdgeInsetsZero);
            }
            sender.jobsResetBtnTitle([self jobs_countryCodeTitleByCountryName:countryName code:code]);
        };
        if (self.navigationController) {
            [self.navigationController pushViewController:countryCodeCtrl animated:YES];
        }else{
            [self presentViewController:countryCodeCtrl animated:YES completion:nil];
        }
    };
}

-(jobsByVoidBlock _Nonnull)jobs_refreshVolumeControlFrame{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!_volumeBtn) return;
        CGFloat buttonWH = JobsWidth(36);
        CGFloat right = JobsWidth(18);
        CGFloat top = self.view.safeAreaInsets.top + JobsWidth(12);
        if (top < JobsWidth(28)) top = JobsWidth(28);
        CGFloat viewWidth = self.view.width > 0 ? self.view.width : JobsMainScreen_WIDTH();
        self.volumeBtn.byFrame(CGRectMake(viewWidth - right - buttonWH,
                                          top,
                                          buttonWH,
                                          buttonWH));
        CGFloat volumeBtnCornerRadius = buttonWH / 2;
        self.volumeBtn.jobsResetBtnCornerRadiusValue(volumeBtnCornerRadius);
        self.volumeBtn.layer
            .byCornerRadius(volumeBtnCornerRadius)
            .byMasksToBounds(YES);
        CGFloat panelW = JobsWidth(52);
        CGFloat panelH = JobsWidth(188);
        self.volumePanelView.byFrame(CGRectMake(self.volumeBtn.centerX - panelW / 2,
                                                self.volumeBtn.bottom + JobsWidth(8),
                                                panelW,
                                                panelH));
        self.volumePercentLab.byFrame(CGRectMake(0,
                                                 JobsWidth(8),
                                                 panelW,
                                                 JobsWidth(20)));
        self.volumeSlider
            .byBounds(CGRectMake(0, 0, panelH - JobsWidth(54), JobsWidth(28)))
            .byCenterPoint(CGPointMake(panelW / 2, panelH / 2 + JobsWidth(10)));
        self.jobs_bringDoorControlsToFront();
    };
}

-(jobsByVoidBlock _Nonnull)jobs_bringDoorControlsToFront{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (_jobsAppDoorContentView) [self.view bringSubviewToFront:_jobsAppDoorContentView];
        if (_logoContentView) [self.view bringSubviewToFront:_logoContentView];
        if (_customerServiceBtn) [self.view bringSubviewToFront:_customerServiceBtn];
        if (_volumePanelView) [self.view bringSubviewToFront:_volumePanelView];
        if (_volumeBtn) [self.view bringSubviewToFront:_volumeBtn];
    };
}

-(void)jobs_setVolumePanelVisible:(BOOL)visible
                         animated:(BOOL)animated{
    if (!visible && !_volumePanelView) return;
    self.volumePanelShowing = visible;
    self.volumePanelView
        .byHidden(NO)
        .byUserInteractionEnabled(visible);
    if (visible) self.volumeSlider.byValue(self.jobs_currentDoorVolume());
    self.jobs_updateVolumePercentText();
    CGFloat alpha = visible ? 1 : 0;
    CGAffineTransform transform = visible ? CGAffineTransformIdentity : CGAffineTransformMakeScale(0.88f, 0.88f);
    void (^animations)(void) = ^{
        self.volumePanelView
            .byAlpha(alpha)
            .byTransform(transform);
    };
    void (^completion)(BOOL) = ^(BOOL finished) {
        if (!visible) self.volumePanelView.byHidden(YES);
    };
    if (!animated) {
        animations();
        completion(YES);
        return;
    }
    [UIView animateWithDuration:0.24f
                          delay:0
         usingSpringWithDamping:0.86f
          initialSpringVelocity:0.2f
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction
                     animations:animations
                     completion:^(BOOL finished) {
        completion(finished);
    }];
}

-(jobsByVoidBlock _Nonnull)jobs_toggleVolumePanel{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self jobs_setVolumePanelVisible:!self.volumePanelShowing
                                animated:YES];
    };
}

-(jobsBySliderBlock _Nonnull)jobs_volumeSliderValueChanged{
    @jobs_weakify(self)
    return ^(UISlider * slider){
        @jobs_strongify(self)
        if (!self) return;
        self.jobs_applyDoorVolume(slider.value);
    };
}
#pragma mark —— 网络请求
/// 注册网络请求
-(void)authRegisterByAccount:(NSString *_Nullable)account
                     country:(NSString *_Nullable)country
                  inviteCode:(NSString *_Nullable)inviteCode
                    password:(NSString *_Nullable)password
                       phone:(NSString *_Nullable)phone
                   phoneCode:(NSString *_Nullable)phoneCode
                    validate:(NSString *_Nullable)validate{
    /// TODO
}
/// 登录网络请求
-(void)authLoginByAccount:(NSString *_Nullable)account
                 deviceId:(NSString *_Nullable)deviceId
                 password:(NSString *_Nullable)password
                 validate:(NSString *_Nullable)validate{
    /// TODO
}
/// 网易云盾验证
-(jobsByjobsByIDBlockBlock _Nonnull)NTESVerifyCodeWithBlock{
    @jobs_weakify(self)
    return ^(jobsByIDBlock block){
        @jobs_strongify(self)
        if (!self) return;
    };
}
#pragma mark —— lazyLoad
-(JobsAppDoorLogoContentView *)logoContentView{
    if (!_logoContentView) {
        _logoContentView = (JobsAppDoorLogoContentView *)JobsAppDoorLogoContentView.new
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(150), JobsWidth(50)));
                make.bottom.equalTo(self.jobsAppDoorContentView.mas_top).offset(-JobsWidth(50));
                make.centerX.equalTo(self.view);
            });
        [self.view layoutIfNeeded];
        self.byLogoContentViewY(self.logoContentView.y);
    };return _logoContentView;
}

-(JobsAppDoorForgotCodeContentView *)forgotCodeContentView{
    if (!_forgotCodeContentView) {
        @jobs_weakify(self)
        _forgotCodeContentView = (JobsAppDoorForgotCodeContentView *)JobsAppDoorForgotCodeContentView.new
            .byFrame(CGRectMake(JobsAppDoorContentViewFindPasswordX,
                                JobsAppDoorContentViewFindPasswordY,
                                JobsAppDoorContentViewFindPasswordWidth,
                                JobsAppDoorContentViewFindPasswordHeight))
            .addOn(self.view)
            .byViewBlock(^(__kindof UIView *view) {
                @jobs_strongify(self)
                JobsAppDoorForgotCodeContentView *contentView = (JobsAppDoorForgotCodeContentView *)view;
                self.byForgotCodeContentViewY(contentView.y);
                contentView.jobsRichViewByModel(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {}));
                @jobs_weakify(self)
                contentView.actionObjBlock(^(id data) {
                    @jobs_strongify(self)
                    if ([data isKindOfClass:UIButton.class]) {
                        UIButton *btn = (UIButton *)data;
                        NSString *btnTitle = btn.titleLabel.text ? : btn.jobsTitleForNormalState();
                        if ([btnTitle isEqualToString:Title1]){
                            self.byCurrentPage(@(CurrentPage_Login));
                            self.forgotCodeContentView.removeContentViewWithOffsetY(0);
                            self.jobsAppDoorContentView.showContentViewWithOffsetY(0);
                            self.jobs_refreshKeyboardMgrConfig();
                            @jobs_weakify(self)
                            [UIView animateWithDuration:2
                                                  delay:0.1
                                 usingSpringWithDamping:0.3
                                  initialSpringVelocity:10
                                                options:UIViewAnimationOptionCurveEaseInOut
                                             animations:^{
                                @jobs_strongify(self)
                                self.customerServiceBtn.byAlpha(1);
                            } completion:nil];
                        }else if ([btnTitle isEqualToString:Title4]){
                            self.backBtnClickEvent(btn);
                            JobsAppDoorVC.jobsDestroySingleton();
                        }else{}
                    }
                });
            })
            .cornerCutToCircleWithCornerRadius(8);
    };return _forgotCodeContentView;
}

-(JobsAppDoorContentView *)jobsAppDoorContentView{
    if (!_jobsAppDoorContentView) {
        /// 初始进的是登录页面
        @jobs_weakify(self)
        _jobsAppDoorContentView = (JobsAppDoorContentView *)JobsAppDoorContentView.new
            .byFrame(CGRectMake(JobsAppDoorContentViewLoginX,
                                JobsAppDoorContentViewLoginY,
                                JobsAppDoorContentViewLoginWidth,
                                JobsAppDoorContentViewLoginHeight))
            .byBgColor(Cor2)
            .addOn(self.view)
            .byViewBlock(^(__kindof UIView *view) {
                @jobs_strongify(self)
                JobsAppDoorContentView *contentView = (JobsAppDoorContentView *)view;
                contentView.byConfiguration(self.configuration.copy);
                self.byJobsAppDoorContentViewY(contentView.y);
                /// 监测输入字符回调 和 激活的textField 和 toRegisterBtn/abandonLoginBtn点击事件
                @jobs_weakify(self)
                contentView.actionObjBlock(^(id data) {
                    @jobs_strongify(self)
                    if ([data isKindOfClass:UIButton.class]) {
                        [self.view endEditing:YES];
                        UIButton *btn = (UIButton *)data;
                        NSString *btnTitle = btn.titleLabel.text ? : btn.jobsTitleForNormalState();
                        if ([btn.requestParams isKindOfClass:NSString.class] &&
                            [btn.requestParams isEqualToString:@"JobsAppDoorCountryCodeCtrl"]) {
                            self.jobs_pushCountryCodeCtrlBySender(btn);
                        }
                        else if ([btnTitle isEqualToString:Title2] ||// Title2 @"L\no\ng\ni\nn".jobsTr()
                            [btnTitle isEqualToString:Title12] ||
                            [btnTitle isEqualToString:Title1]) {// Title1 @"B\na\nc\nk\nT\no\nL\no\ng\ni\nn".jobsTr()
                            self->toRegisterBtn = (UIButton *)data;
                            //状态置空
                            self.byCurrentActivateTFIndex(0);
                            self.byLastTimeActivateTFIndex(0);
                            if (self->toRegisterBtn.jobs_isSelected) {
                                [self 竖形按钮在左边];
                            }else{
                                [self 竖形按钮在右边];
                            }
                            self.customerServiceBtn
                                .byTop(self.jobsAppDoorContentView.top + self.jobsAppDoorContentView.height + JobsWidth(8))
                                .byCenterX(self.jobsAppDoorContentView.centerX);
                            self.byCustomerServiceBtnY(self.customerServiceBtn.y);
                            self.jobs_refreshKeyboardMgrConfig();
                        }
                        else if ([btnTitle isEqualToString:Title6]){// Title6 @"Register".jobsTr()
                        }
                        else if ([btnTitle isEqualToString:Title7]){// @"Login".jobsTr()
                        }
                        else if ([btnTitle isEqualToString:Title4]){// Title4 @"Back to HomePage".jobsTr()
                            UIButton *abandonLoginBtn = (UIButton *)data;
                            self.backBtnClickEvent(abandonLoginBtn);
                            JobsAppDoorVC.jobsDestroySingleton();
                        }
                        else if ([btnTitle isEqualToString:Title5]){// Title5 @"记住我".jobsTr()
                        }
                        else if ([btnTitle isEqualToString:Title3]){// Title3 @"Forgot code".jobsTr()
                            {//本页动效实现的
                                self.byCurrentPage(@(CurrentPage_ForgotCode));
                                (self->_jobsAppDoorContentView).removeContentViewWithOffsetY(0);
                                self.forgotCodeContentView.showContentViewWithOffsetY(0);
                                self.customerServiceBtn.byAlpha(0);
                                self.jobs_refreshKeyboardMgrConfig();
                            }
                        }else{}
                    }else if ([data isKindOfClass:JobsAppDoorModel.class]){
                        self.byAppDoorModel((JobsAppDoorModel *)data);
                    }else{}
                });
                contentView.jobsRichViewByModel(nil);
            })
            .cornerCutToCircleWithCornerRadius(8);
    };return _jobsAppDoorContentView;
}

- (UIButton *)customerServiceBtn {
    if (!_customerServiceBtn) {
        @jobs_weakify(self)
        CGFloat customerBtnWidth = JobsWidth(118);
        CGFloat customerBtnHeight = JobsWidth(38);
        UIButton *btn = BaseButton.jobsInit();
        if (@available(iOS 16.0, *)) {
            btn = btn
                .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
                .jobsResetImagePadding(JobsWidth(5));
        } else {
            btn = (UIButton *)btn.byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button
                    .byImageEdgeInsets(UIEdgeInsetsMake(0, 0, 0, 5))
                    .byTitleEdgeInsets(UIEdgeInsetsMake(0, 5, 0, 0))
                    .bySemanticContentAttribute(UISemanticContentAttributeForceLeftToRight);
            });
        }
        CGSize customerIconSize = CGSizeMake(JobsWidth(18), JobsWidth(18));
        UIImage *customerImage = JobsAppDoorCustomerServiceIconImage();
        customerImage = customerImage ? customerImage.dw_RescaleImageToSize(customerIconSize) : JobsAppDoorImageNamed(@"用户名称");
        _customerServiceBtn = (UIButton *)btn
            .jobsResetBtnImage(customerImage)
            .jobsResetBtnTitleCor(Cor4)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(10))
            .jobsResetBtnTitle(Title8)
            .onClickBy(^ (UIButton *x) {
                x.byFuseTapScale();
                JobsLog(@"点击客服按钮");
            })
            .onLongPressGestureBy(^ (id data) {
                JobsLog(@"");
            })
            .bgColorBy(Cor1)
            .byCornerRadius(JobsWidth(18)) // 设置圆角
//            .setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
//                @jobs_strongify(self)
//                data.byJobsWidth(2)
//                    .byLayerCor(Cor4)
//                    .byCornerRadiusValue(customerBtnHeight / 2)
//                    .byMasksToBounds(YES);
//            }))
            .addOn(self.view)
            .byFrame(CGRectMake((JobsMainScreen_WIDTH() - customerBtnWidth) / 2,
                                self.jobsAppDoorContentView.bottom + JobsWidth(8),
                                customerBtnWidth,
                                customerBtnHeight))
            .byVisible(YES)
            .byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button
                    .jobsResetBtnBgCor(Cor1)
                    .jobsResetBtnLayerBorderCor(Cor4)
                    .jobsResetBtnLayerBorderWidth(JobsWidth(2))
                    .jobsResetBtnCornerRadiusValue(customerBtnHeight / 2);
                button
                    .cornerCutToCircleWithCornerRadius(customerBtnHeight / 2)
                    .byClipsToBounds(YES)
                    .byCornerRadius(customerBtnHeight / 2)
                    .byLayer(^(__kindof CALayer *layer) {
                        layer
                            .byCornerRadius(customerBtnHeight / 2)
                            .byMasksToBounds(YES);
                    });
                button.imageView.byContentMode(UIViewContentModeScaleAspectFit);
                button.titleLabel
                    .byNumberOfLines(2)
                    .byTextAlignment(NSTextAlignmentCenter)
                    .byAdjustsFontSizeToFitWidth(NO)
                    .byLineBreakMode(NSLineBreakByWordWrapping);
        });
    };return _customerServiceBtn;
}

-(UIButton *)volumeBtn{
    if (!_volumeBtn) {
        @jobs_weakify(self)
        UIImage *volumeImage = JobsAppDoorImageNamed(@"AppDoorVolume") ? : JobsAppDoorImageNamed(@"手机号码");
        _volumeBtn = (UIButton *)UIButton.jobsInit()
            .jobsResetBtnImage(volumeImage)
            .bgColorBy(Cor1)
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                self.jobs_toggleVolumePanel();
            })
            .setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                data.byJobsWidth(1)
                    .byLayerCor(Cor4)
                    .byCornerRadiusValue(JobsWidth(18))
                    .byMasksToBounds(YES);
            }))
            .addOn(self.view)
            .byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button
                    .byClipsToBounds(YES)
                    .byCornerRadius(JobsWidth(18))
                    .byLayer(^(__kindof CALayer *layer) {
                        layer.byMasksToBounds(YES);
                    });
                button.imageView.byContentMode(UIViewContentModeScaleAspectFit);
            });
    };return _volumeBtn;
}

-(UIView *)volumePanelView{
    if (!_volumePanelView) {
        @jobs_weakify(self)
        _volumePanelView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(Cor1.colorWithAlphaComponentBy(0.92f))
                .byCornerRadius(JobsWidth(14))
                .byClipsToBounds(YES)
                .byAlpha(0)
                .byHidden(YES)
                .byTransform(CGAffineTransformMakeScale(0.88f, 0.88f))
                .byLayer(^(__kindof CALayer *layer) {
                    layer
                        .byMasksToBounds(YES)
                        .byBorderColorUIColor(Cor4)
                        .byBorderWidth(1);
                })
                .addOn(self.view)
                .byViewBlock(^(__kindof UIView *view) {
                    self.volumePercentLab.addOn(view);
                    self.volumeSlider.addOn(view);
                    self.volumeSliderPanGesture = [UIPanGestureRecognizer.alloc initWithTarget:self
                                                                                         action:@selector(jobs_volumePanelValueGesture:)];
                    self.volumeSliderPanGesture.byCancelsTouchesInView(NO);
                    [view addGestureRecognizer:self.volumeSliderPanGesture];
                    self.volumeSliderTapGesture = [UITapGestureRecognizer.alloc initWithTarget:self
                                                                                        action:@selector(jobs_volumePanelValueGesture:)];
                    self.volumeSliderTapGesture.byCancelsTouchesInView(NO);
                    [view addGestureRecognizer:self.volumeSliderTapGesture];
                });
        });
    };return _volumePanelView;
}

-(UILabel *)volumePercentLab{
    if (!_volumePercentLab) {
        _volumePercentLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextAlignment(NSTextAlignmentCenter)
                .byTextCor(Cor4)
                .byFont(UIFontWeightMediumSize(JobsWidth(10)))
                .byAdjustsFontSizeToFitWidth(YES)
                .byMinimumScaleFactor(0.7f);
        });
        self.jobs_updateVolumePercentText();
    };return _volumePercentLab;
}

-(UISlider *)volumeSlider{
    if (!_volumeSlider) {
        @jobs_weakify(self)
        _volumeSlider = jobsMakeSlider(^(__kindof UISlider * _Nullable slider) {
            @jobs_strongify(self)
            slider
                .byMinimumValue(0)
                .byMaximumValue(1)
                .byValue(self.jobs_currentDoorVolume())
                .byMinimumTrackTintColor(Cor4)
                .byMaximumTrackTintColor(JobsWhiteColor.colorWithAlphaComponentBy(0.28f))
                .byThumbTintColor(Cor4)
                .onJobsChange(^(__kindof UIControl * _Nullable ctrl) {
                    @jobs_strongify(self)
                    self.jobs_volumeSliderValueChanged((UISlider *)ctrl);
                })
                .byTransform(CGAffineTransformMakeRotation(-M_PI_2));
        });
    };return _volumeSlider;
}

-(ZFAVPlayerManager *)playerManager{
    if (!_playerManager) {
        _playerManager = jobsMakeZFAVPlayerManager(^(__kindof ZFAVPlayerManager * _Nullable data) {
            NSString *videoResourceName = isiPhoneX_series() ? self.configuration.notchVideoResourceName : self.configuration.compactVideoResourceName;
            data
                .byShouldAutoPlay(YES)
                .byAssetURL(JobsAppDoorResourceURL(videoResourceName));
        });
    };return _playerManager;
}

-(ZFPlayerController *)player{
    if (!_player) {
        @jobs_weakify(self)
        _player = [ZFPlayerController.alloc initWithPlayerManager:self.playerManager
                                                    containerView:self.view];
        _player.byControlView(self.customPlayerControlView);
//        ZFPlayer_DoorVC = _player;
        [_player setPlayerDidToEnd:^(id<ZFPlayerMediaPlayback>  _Nonnull asset) {
            @jobs_strongify(self)
            self.playerManager.byReplay();// 设置循环播放
        }];
    };return _player;
}

-(CustomZFPlayerControlView *)customPlayerControlView{
    if (!_customPlayerControlView) {
        _customPlayerControlView = CustomZFPlayerControlView.new;
        _customPlayerControlView.byUserInteractionEnabled(NO);
        @jobs_weakify(self)
        _customPlayerControlView.actionCustomZFPlayerControlViewBlock(^(id data, id data2) {
            @jobs_strongify(self)
            [self.view endEditing:YES];
        });
    };return _customPlayerControlView;
}

-(UIImageView *)bgImgV{
    if (!_bgImgV) {
        UIImage *appDoorBgImage = JobsAppDoorImageNamed(self.configuration.backgroundImageName) ? :
            JobsAppDoorImageNamed(@"bg_video") ? : JobsBlackColor.jobsImage();
        _bgImgV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage(appDoorBgImage)
                .byUserInteractionEnabled(YES);
        });
    };return _bgImgV;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorVC
-(JobsRetJobsAppDoorVCByBOOLBlock _Nonnull)byHiddenNavigationBar{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsHiddenNavigationBar:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVCByBOOLBlock _Nonnull)byVideoPausedByApplicationState{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setVideoPausedByApplicationState:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVCByCGFloatBlock _Nonnull)byCustomerServiceBtnY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setCustomerServiceBtnY:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVCByCGFloatBlock _Nonnull)byForgotCodeContentViewY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setForgotCodeContentViewY:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVCByCGFloatBlock _Nonnull)byJobsAppDoorContentViewY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setJobsAppDoorContentViewY:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVCByCGFloatBlock _Nonnull)byLogoContentViewY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setLogoContentViewY:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVCByJobsAppDoorModelBlock _Nonnull)byAppDoorModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC * _Nullable(JobsAppDoorModel * _Nullable data){
        @jobs_strongify(self)
        [self setAppDoorModel:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVCByNSIntegerBlock _Nonnull)byCurrentActivateTFIndex{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setCurrentActivateTFIndex:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVCByNSIntegerBlock _Nonnull)byLastTimeActivateTFIndex{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setLastTimeActivateTFIndex:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorVC
@end
