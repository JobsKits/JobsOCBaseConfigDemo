//
//  JobsAppDoorVC_Style2.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorVC_Style2.h"

@interface JobsAppDoorVC_Style2 ()<UIGestureRecognizerDelegate>
/// UI
Prop_strong()UIImageView *bgImgV;
Prop_strong()BaseButton *customerServiceBtn;
Prop_strong(nullable)UIButton *volumeBtn;
Prop_strong(nullable)UIView *volumePanelView;
Prop_strong(nullable)UISlider *volumeSlider;
Prop_strong(nullable)UILabel *volumePercentLab;
Prop_strong(nullable)UITapGestureRecognizer *volumeDismissTapGesture;
Prop_strong(nullable)UIPanGestureRecognizer *volumeSliderPanGesture;
Prop_strong(nullable)UITapGestureRecognizer *volumeSliderTapGesture;
Prop_strong()ZFPlayerController *player;
Prop_strong()ZFAVPlayerManager *playerManager;
Prop_strong(nullable)CustomZFPlayerControlView *customPlayerControlView;
Prop_strong(nullable)JobsAppDoorLoginContentView *loginContentView;/// 登录页面
Prop_strong(nullable)JobsAppDoorRegisterContentView *registerContentView;/// 注册页面
Prop_strong(nullable)JobsAppDoorForgotCodeContentView *forgotCodeContentView;/// 忘记密码
Prop_strong(nullable)JobsAppDoorLogoContentView *logoContentView;
/// Data
Prop_assign()CGFloat logoContentViewY;/// 初始高度
Prop_assign()CGFloat loginContentViewY;/// 初始高度
Prop_assign()CGFloat registerContentViewY;/// 初始高度
Prop_assign()CGFloat forgotCodeContentViewY;/// 初始高度
Prop_assign()CGFloat loginCustomerServiceBtnY;/// 在登录页面的初始高度
Prop_assign()CGFloat registerCustomerServiceBtnY;/// 在注册页面的初始高度
Prop_assign()BOOL loginDoorInputEditing;/// 只要有一个TF还在编辑那么就是在编辑
Prop_assign()NSInteger lastTimeActivateTFIndex;/// 上一时刻被激活的输入框的序列号
Prop_assign()NSInteger currentActivateTFIndex;/// 当前被激活的输入框的序列号
Prop_assign()BOOL volumePanelShowing;
Prop_assign()BOOL videoPausedByApplicationState;

-(jobsByVoidBlock _Nonnull)jobs_hideDoorNavigationChrome;
-(jobsByVoidBlock _Nonnull)jobs_installDoorVideoApplicationStateObservers;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorVC_Style2
@interface JobsAppDoorVC_Style2 (JobsPropertyDSLSetterAutogen_8ee9dc95c1)
-(void)setForgotCodeContentViewY:(CGFloat)data;
-(void)setGk_navBarAlpha:(CGFloat)data;
-(void)setGk_navLeftBarButtonItem:(UIBarButtonItem * _Nullable)data;
-(void)setGk_navLeftBarButtonItems:(NSArray<UIBarButtonItem *> * _Nullable)data;
-(void)setGk_navRightBarButtonItem:(UIBarButtonItem * _Nullable)data;
-(void)setGk_navRightBarButtonItems:(NSArray<UIBarButtonItem *> * _Nullable)data;
-(void)setGk_navTitle:(NSString * _Nullable)data;
-(void)setGk_navTitleView:(UIView * _Nullable)data;
-(void)setIsHiddenNavigationBar:(BOOL)data;
-(void)setLoginContentViewY:(CGFloat)data;
-(void)setLoginCustomerServiceBtnY:(CGFloat)data;
-(void)setLoginDoorInputEditing:(BOOL)data;
-(void)setLogoContentViewY:(CGFloat)data;
-(void)setRegisterContentViewY:(CGFloat)data;
-(void)setRegisterCustomerServiceBtnY:(CGFloat)data;
-(void)setVideoPausedByApplicationState:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorVC_Style2

@implementation JobsAppDoorVC_Style2
-(JobsRetJobsAppDoorVCStyle2ByConfigBlock _Nonnull)byConfiguration{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 *_Nullable(JobsAppDoorConfig *_Nullable config){
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsAppDoorVC_Style2.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        static_jobsAppDoor_Style2OnceToken = 0;
        appDoorVC_Style2 = nil;
    };
}
static JobsAppDoorVC_Style2 *appDoorVC_Style2 = nil;
static dispatch_once_t static_jobsAppDoor_Style2OnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsAppDoorVC_Style2.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&static_jobsAppDoor_Style2OnceToken, ^{
            appDoorVC_Style2 = JobsAppDoorVC_Style2.new;
        });return appDoorVC_Style2;
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

-(jobsByVoidBlock _Nonnull)jobs_hideDoorNavigationChrome{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byHiddenNavigationBar(YES);
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        self.byTitle(nil);
        self.navigationItem.byTitle(nil);
        self.navigationItem.byTitleView(nil);
        self.navigationItem.byLeftBarButtonItem(nil);
        self.navigationItem.byLeftBarButtonItems(nil);
        self.navigationItem.byRightBarButtonItem(nil);
        self.navigationItem.byRightBarButtonItems(nil);
        self.byGk_navTitle(nil);
        self.byGk_navTitleView(nil);
        self.byGk_navLeftBarButtonItem(nil);
        self.byGk_navLeftBarButtonItems(nil);
        self.byGk_navRightBarButtonItem(nil);
        self.byGk_navRightBarButtonItems(nil);
        self.byGk_navBarAlpha(0);
        [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull subview,
                                                           NSUInteger idx,
                                                           BOOL * _Nonnull stop) {
            if ([subview isKindOfClass:GKCustomNavigationBar.class]) {
                subview
                    .byHidden(YES)
                    .byAlpha(0)
                    .byUserInteractionEnabled(NO);
            }
        }];
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC_Style2.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.jobs_hideDoorNavigationChrome();
        self.jobs_applyConfigurationFromRequestParams();
        if (self.configuration.backgroundType == JobsAppDoorBgType_Image) {
            self.byView(self.bgImgV);
        }else if (self.configuration.backgroundType == JobsAppDoorBgType_Video){
            [self.player.currentPlayerManager play];
        }
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.viewModel
                .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                    data.byText(data.attributedTitle.string);
                });
        }
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC_Style2.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.jobs_hideDoorNavigationChrome();
        self.view.byBgColor(JobsSystemBackgroundColor);
        //标的值初始化
        self.byLogoContentViewY(0);
        self.byLoginContentViewY(0);
        self.byRegisterContentViewY(0);
        self.byLoginCustomerServiceBtnY(0);
        self.byRegisterCustomerServiceBtnY(0);
        self.byCurrentPage(@(CurrentPage_Login));
        self.byLoginDoorInputEditing(NO);
        if (_player) {
            self.volumeBtn.图片从小放大();
            self.volumePanelView
                .byAlpha(0)
                .byHidden(YES);
            self.jobs_installVolumeDismissGestureIfNeeded();
            self.jobs_refreshVolumeControlFrame();
        }
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC_Style2.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
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

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC_Style2.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.jobs_hideDoorNavigationChrome();
        self.loginContentView.图片从小放大();
        self.registerContentView.图片从小放大();
        BOOL showsLogo = self.currentPage.integerValue == CurrentPage_Login;
        self.logoContentView
            .byHidden(!showsLogo)
            .byAlpha(showsLogo ? 1 : 0);
        if (showsLogo) self.logoContentView.图片从小放大();
        self.customerServiceBtn.图片从小放大();
        self.jobs_refreshKeyboardMgrConfig();
        self.jobs_resumeDoorVideoIfNeeded();
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC_Style2.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        self.jobs_hideDoorNavigationChrome();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC_Style2.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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
            [self jobs_setVolumePanelVisible:NO
                                    animated:NO];
        }
    };
}
-(JobsRetViewByVoidBlock _Nonnull)jobs_activeDoorContentViewForKeyboard{
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        if (!self) return nil;
        if (self.currentPage.integerValue == CurrentPage_Register) return self.registerContentView;
        if (self.currentPage.integerValue == CurrentPage_ForgotCode && _forgotCodeContentView) return _forgotCodeContentView;
        return self.loginContentView;
    };
}

-(jobsByVoidBlock _Nonnull)jobs_refreshKeyboardMgrConfig{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIView *targetView = self.jobs_activeDoorContentViewForKeyboard();
        if (!targetView) return;
        NSMutableArray *followViews = NSMutableArray.array;
        if (self.currentPage.integerValue == CurrentPage_Login) followViews.add(self.logoContentView);
        if (self.customerServiceBtn) followViews.add(self.customerServiceBtn);
        @jobs_weakify(self)
        ((JobsOCKeyboardMgr *)JobsOCKeyboardMgr.shared()).byConfig(jobsMakeOCKeyboardConfig(^(__kindof JobsOCKeyboardConfig * _Nullable data) {
            @jobs_strongify(self)
            data.byOwner(self)
                .byTargetView(targetView)
                .byContainerView(self.view)
                .byFollowViews(followViews)
                .byExtraSpacing(JobsWidth(16))
                .byTopSpacing(JobsWidth(12))
                .byAccessoryPolicy(JobsOCKeyboardAccessoryPolicyAuto);
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
    jobsByNotificationBlock action = ((jobsByNotificationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC_Style2.class, @selector(jobsJobs_applicationDidEnterBackground)))(self, @selector(jobsJobs_applicationDidEnterBackground));
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
    jobsByNotificationBlock action = ((jobsByNotificationBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC_Style2.class, @selector(jobsJobs_applicationDidBecomeActive)))(self, @selector(jobsJobs_applicationDidBecomeActive));
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
        _volumeDismissTapGesture = [UITapGestureRecognizer.alloc initWithTarget:self
                                                                         action:@selector(jobs_volumeDismissTap:)];
        _volumeDismissTapGesture.byCancelsTouchesInView(NO);
        _volumeDismissTapGesture.byDelegate(self);
        [self.view addGestureRecognizer:_volumeDismissTapGesture];
    };
}

-(void)jobs_volumeDismissTap:(UITapGestureRecognizer *)tapGesture{
    jobsByTapGestureRecognizerBlock action = ((jobsByTapGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC_Style2.class, @selector(jobsJobs_volumeDismissTap)))(self, @selector(jobsJobs_volumeDismissTap));
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
    jobsByGestureRecognizerBlock action = ((jobsByGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorVC_Style2.class, @selector(jobsJobs_volumePanelValueGesture)))(self, @selector(jobsJobs_volumePanelValueGesture));
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
        self.view
            .byBringSubviewToFront(self.volumePanelView)
            .byBringSubviewToFront(self.volumeBtn);
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
    UIView.jobsAnimateWithSpring(0.24f,
        0,
        0.86f,
        0.2f,
        UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction,
        animations,
        ^(BOOL finished) {
        completion(finished);
    });
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
#pragma mark —— lazyLoad
-(JobsAppDoorLoginContentView *)loginContentView{
    if (!_loginContentView) {
        @jobs_weakify(self)
        _loginContentView = (JobsAppDoorLoginContentView *)JobsAppDoorLoginContentView.new
            .byFrame(CGRectMake(20,
                                JobsMainScreen_HEIGHT() / 4,
                                JobsMainScreen_WIDTH() - 40,
                                JobsAppDoorContentViewLoginHeight))
            .addOn(self.view)
            .byViewBlock(^(__kindof UIView *view) {
                @jobs_strongify(self)
                JobsAppDoorLoginContentView *contentView = (JobsAppDoorLoginContentView *)view;
                self.byLoginContentViewY(contentView.y);
                contentView.jobsRichViewByModel(nil);
                @jobs_weakify(self)
                contentView.actionObjBlock(^(id data) {
                    @jobs_strongify(self)
                    if ([data isKindOfClass:UIButton.class]) {
                        UIButton *btn = (UIButton *)data;
                        if ([btn.titleLabel.text isEqualToString:Title2] ||
                            [btn.titleLabel.text isEqualToString:Title12]) {
                            self.byCurrentPage(@(CurrentPage_Register));
                            self.logoContentView
                                .byAlpha(0)
                                .byHidden(YES);
                            (self->_loginContentView).removeContentViewWithOffsetY(0);
                            self.registerContentView.showContentViewWithOffsetY(0);
                            self.jobs_refreshKeyboardMgrConfig();
                            @jobs_weakify(self)
                            UIView.jobsAnimateWithSpring(2,
                                0.1,
                                0.3,
                                10,
                                UIViewAnimationOptionCurveEaseInOut,
                                ^{
                                @jobs_strongify(self)
                                if (!self.registerCustomerServiceBtnY) {
                                    self.byRegisterCustomerServiceBtnY(self.registerContentView.top + self.registerContentView.height + JobsWidth(8));
                                }
                                self.customerServiceBtn.byY(self.registerCustomerServiceBtnY);
                            },
                                nil);
                        }else if([btn.titleLabel.text isEqualToString:Title3]){
                            self.byCurrentPage(@(CurrentPage_ForgotCode));
                            self.logoContentView
                                .byAlpha(0)
                                .byHidden(YES);
                            (self->_loginContentView).removeContentViewWithOffsetY(0);
                            self.forgotCodeContentView.showContentViewWithOffsetY(0);
                            self.customerServiceBtn.byAlpha(0);
                            self.jobs_refreshKeyboardMgrConfig();
                        }else if([btn.titleLabel.text isEqualToString:Title4]){
                            self.backBtnClickEvent(btn);
                        }else if([btn.titleLabel.text isEqualToString:Title3]){
                            // 忘记密码
                        }else{}
                    }else if ([data isKindOfClass:JobsMagicTextField.class]){
                    }else if ([data isKindOfClass:NSString.class]){
                    }else{}
                });
            })
            .cornerCutToCircleWithCornerRadius(8);
    };return _loginContentView;
}

-(JobsAppDoorRegisterContentView *)registerContentView{
    if (!_registerContentView) {
        @jobs_weakify(self)
        _registerContentView = (JobsAppDoorRegisterContentView *)JobsAppDoorRegisterContentView.new
            .byFrame(CGRectMake(JobsMainScreen_WIDTH() + 20,
                                self.configuration.registerContentY(),
                                JobsMainScreen_WIDTH() - 40,
                                self.configuration.registerContentHeight()))
            .addOn(self.view)
            .byViewBlock(^(__kindof UIView *view) {
                @jobs_strongify(self)
                JobsAppDoorRegisterContentView *contentView = (JobsAppDoorRegisterContentView *)view;
                contentView.byConfiguration(self.configuration.copy);
                self.byRegisterContentViewY(contentView.y);
                contentView.jobsRichViewByModel(nil);
                @jobs_weakify(self)
                contentView.actionObjBlock(^(id data) {
                    @jobs_strongify(self)
                    if ([data isKindOfClass:UIButton.class]) {
                        UIButton *btn = (UIButton *)data;
                        NSString *btnTitle = btn.titleLabel.text ? : btn.jobsTitleForNormalState();
                        if ([btnTitle isEqualToString:Title1]){
                            self.byCurrentPage(@(CurrentPage_Login));
                            self.logoContentView
                                .byHidden(NO)
                                .byAlpha(1)
                                .图片从小放大();
                            self.registerContentView.removeContentViewWithOffsetY(0);
                            (self->_loginContentView).showContentViewWithOffsetY(0);
                            self.jobs_refreshKeyboardMgrConfig();
                            @jobs_weakify(self)
                            UIView.jobsAnimateWithSpring(2,
                                0.1,
                                0.3,
                                10,
                                UIViewAnimationOptionCurveEaseInOut,
                                ^{
                                @jobs_strongify(self)
                                self.customerServiceBtn.byY(self.loginCustomerServiceBtnY);
                            },
                                nil);
                        }else if ([btnTitle isEqualToString:Title4]){
                            self.backBtnClickEvent(btn);
                        }else{}
                    }
                });
            })
            .cornerCutToCircleWithCornerRadius(8);
    };return _registerContentView;
}

-(JobsAppDoorForgotCodeContentView *)forgotCodeContentView{
    if (!_forgotCodeContentView) {
        @jobs_weakify(self)
        _forgotCodeContentView = (JobsAppDoorForgotCodeContentView *)JobsAppDoorForgotCodeContentView.new
            .byFrame(CGRectMake(JobsMainScreen_WIDTH() + 20,
                                JobsMainScreen_HEIGHT() / 4,
                                JobsMainScreen_WIDTH() - 40,
                                JobsAppDoorContentViewFindPasswordHeight))
            .addOn(self.view)
            .byViewBlock(^(__kindof UIView *view) {
                @jobs_strongify(self)
                JobsAppDoorForgotCodeContentView *contentView = (JobsAppDoorForgotCodeContentView *)view;
                self.byForgotCodeContentViewY(contentView.y);
                contentView.jobsRichViewByModel(nil);
                @jobs_weakify(self)
                contentView.actionObjBlock(^(id data) {
                    @jobs_strongify(self)
                    if ([data isKindOfClass:UIButton.class]) {
                        UIButton *btn = (UIButton *)data;
                        NSString *btnTitle = btn.titleLabel.text ? : btn.jobsTitleForNormalState();
                        if ([btnTitle isEqualToString:Title1] ||
                            [btnTitle isEqualToString:@"确认".jobsTr()]){
                            self.byCurrentPage(@(CurrentPage_Login));
                            self.logoContentView
                                .byHidden(NO)
                                .byAlpha(1)
                                .图片从小放大();
                            self.forgotCodeContentView.removeContentViewWithOffsetY(0);
                            (self->_loginContentView).showContentViewWithOffsetY(0);
                            self.jobs_refreshKeyboardMgrConfig();
                            @jobs_weakify(self)
                            UIView.jobsAnimateWithSpring(2,
                                0.1,
                                0.3,
                                10,
                                UIViewAnimationOptionCurveEaseInOut,
                                ^{
                                @jobs_strongify(self)
                                self.customerServiceBtn.byAlpha(1);
                            },
                                nil);
                        }else if ([btnTitle isEqualToString:Title4]){
                            self.backBtnClickEvent(btn);
                        }else if ([btnTitle isEqualToString:Title8]){
                            toastBy(btnTitle);
                        }else{}
                    }
                });
            })
            .cornerCutToCircleWithCornerRadius(8);
    };return _forgotCodeContentView;
}

-(JobsAppDoorLogoContentView *)logoContentView{
    if (!_logoContentView) {
        _logoContentView = (JobsAppDoorLogoContentView *)JobsAppDoorLogoContentView.new
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(82), JobsWidth(82)));
                make.bottom.equalTo(self.loginContentView.mas_top).offset(-JobsWidth(50));
                make.centerX.equalTo(self.view);
            });
        [self.view layoutIfNeeded];
        self.byLogoContentViewY(self.logoContentView.y);
    };return _logoContentView;
}

-(BaseButton *)customerServiceBtn{
    if (!_customerServiceBtn) {
        CGFloat customerBtnWidth = JobsWidth(118);
        CGFloat customerBtnHeight = JobsWidth(38);
        BaseButton *btn = BaseButton.jobsInit();
        if (@available(iOS 16.0, *)) {
            btn = (BaseButton *)btn
                .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
                .jobsResetImagePadding(JobsWidth(5));
        } else {
            btn = (BaseButton *)btn.byViewBlock(^(__kindof UIView *view) {
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
        _customerServiceBtn = (BaseButton *)btn
            .jobsResetBtnImage(customerImage)
            .jobsResetBtnTitle(Title8)
            .jobsResetBtnTitleCor(Cor4)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(10))
            .bgColorBy(Cor1)
            .cornerRadiusValueBy(customerBtnHeight / 2)
            .onClickBy(^(UIButton *x){
                x.byFuseTapScale();
                toastBy(x.jobsTitleForNormalState());
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self.view)
            .byFrame(CGRectMake((JobsMainScreen_WIDTH() - customerBtnWidth) / 2,
                                self.loginContentView.top + self.loginContentView.height + JobsWidth(8),
                                customerBtnWidth,
                                customerBtnHeight))
            .byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button
                    .byClipsToBounds(YES)
                    .byCornerRadius(customerBtnHeight / 2)
                    .byLayer(^(__kindof CALayer *layer) {
                        layer.byMasksToBounds(YES);
                    });
                button.imageView.byContentMode(UIViewContentModeScaleAspectFit);
                button.titleLabel
                    .byNumberOfLines(2)
                    .byTextAlignment(NSTextAlignmentCenter)
                    .byAdjustsFontSizeToFitWidth(NO)
                    .byLineBreakMode(NSLineBreakByWordWrapping);
            });
        self.byLoginCustomerServiceBtnY(_customerServiceBtn.y);
        _customerServiceBtn
            .jobsResetBtnLayerBorderCor(Cor4)
            .jobsResetBtnLayerBorderWidth(2)
            .jobsResetBtnCornerRadiusValue(customerBtnHeight / 2)
            .byLayer(^(__kindof CALayer *layer) {
                layer
                    .byCornerRadius(customerBtnHeight / 2)
                    .byMasksToBounds(YES);
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorVC_Style2
-(JobsRetJobsAppDoorVC_Style2ByBOOLBlock _Nonnull)byHiddenNavigationBar{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsHiddenNavigationBar:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByBOOLBlock _Nonnull)byLoginDoorInputEditing{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setLoginDoorInputEditing:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByBOOLBlock _Nonnull)byVideoPausedByApplicationState{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setVideoPausedByApplicationState:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byForgotCodeContentViewY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setForgotCodeContentViewY:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byLoginContentViewY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setLoginContentViewY:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byLoginCustomerServiceBtnY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setLoginCustomerServiceBtnY:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byLogoContentViewY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setLogoContentViewY:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byRegisterContentViewY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setRegisterContentViewY:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byRegisterCustomerServiceBtnY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setRegisterCustomerServiceBtnY:data];
        return self;
    };
}
-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byGk_navBarAlpha{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setGk_navBarAlpha:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByNSArrayUIBarButtonItemBlock _Nonnull)byGk_navLeftBarButtonItems{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(NSArray<UIBarButtonItem *> * _Nullable data){
        @jobs_strongify(self)
        [self setGk_navLeftBarButtonItems:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByNSArrayUIBarButtonItemBlock _Nonnull)byGk_navRightBarButtonItems{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(NSArray<UIBarButtonItem *> * _Nullable data){
        @jobs_strongify(self)
        [self setGk_navRightBarButtonItems:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByNSStringBlock _Nonnull)byGk_navTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setGk_navTitle:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByUIBarButtonItemBlock _Nonnull)byGk_navLeftBarButtonItem{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(UIBarButtonItem * _Nullable data){
        @jobs_strongify(self)
        [self setGk_navLeftBarButtonItem:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByUIBarButtonItemBlock _Nonnull)byGk_navRightBarButtonItem{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(UIBarButtonItem * _Nullable data){
        @jobs_strongify(self)
        [self setGk_navRightBarButtonItem:data];
        return self;
    };
}

-(JobsRetJobsAppDoorVC_Style2ByUIViewBlock _Nonnull)byGk_navTitleView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorVC_Style2 * _Nullable(UIView * _Nullable data){
        @jobs_strongify(self)
        [self setGk_navTitleView:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorVC_Style2
@end
