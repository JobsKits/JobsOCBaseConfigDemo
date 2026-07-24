//
//  JobsAppDoorVC_Style2.m
//  JobsOCBaseConfigDemo
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

-(void)jobs_installDoorVideoApplicationStateObservers;

@end

@implementation JobsAppDoorVC_Style2
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

+(void)destroySingleton{
    static_jobsAppDoor_Style2OnceToken = 0;
    appDoorVC_Style2 = nil;
}
static JobsAppDoorVC_Style2 *appDoorVC_Style2 = nil;
static dispatch_once_t static_jobsAppDoor_Style2OnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_jobsAppDoor_Style2OnceToken, ^{
        appDoorVC_Style2 = JobsAppDoorVC_Style2.new;
    });return appDoorVC_Style2;
}

-(instancetype)init{
    if (self = [super init]) {
        [self jobs_installDoorVideoApplicationStateObservers];
    };return self;
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Image) {
            self.view = self.bgImgV;
        }else if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Video){
            [self.player.currentPlayerManager play];
        }else{}
        self.viewModel
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(data.attributedTitle.string);
            });
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsBlueColor);
    //标的值初始化
    self.logoContentViewY = 0;
    self.loginContentViewY = 0;
    self.registerContentViewY = 0;
    self.loginCustomerServiceBtnY = 0;
    self.registerCustomerServiceBtnY = 0;
    self.currentPage = @(CurrentPage_Login);//默认页面是登录
    self.loginDoorInputEditing = NO;
    if (_player) {
        self.volumeBtn.图片从小放大();
        self.volumePanelView
            .byAlpha(0)
            .byHidden(YES);
        [self jobs_installVolumeDismissGestureIfNeeded];
        [self jobs_refreshVolumeControlFrame];
    }
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self jobs_refreshVolumeControlFrame];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.loginContentView.图片从小放大();
    self.registerContentView.图片从小放大();
    self.logoContentView.图片从小放大();
    self.customerServiceBtn.图片从小放大();
    [self jobs_refreshKeyboardMgrConfig];
    [self jobs_resumeDoorVideoIfNeeded];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [JobsOCKeyboardMgr.shared clearConfigByOwner:self];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Image) {
        }else if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Video){
            BOOL shouldPauseVideo = self.isBeingDismissed || self.isMovingFromParentViewController || self.navigationController.isBeingDismissed;
            if (shouldPauseVideo && self.player.currentPlayerManager.isPlaying) {
                [self.player.currentPlayerManager pause];
            }
            [self jobs_setVolumePanelVisible:NO
                                    animated:NO];
        }else{}
    }
}
-(UIView *)jobs_activeDoorContentViewForKeyboard{
    if (self.currentPage.integerValue == CurrentPage_Register) return self.registerContentView;
    if (self.currentPage.integerValue == CurrentPage_ForgotCode && _forgotCodeContentView) return _forgotCodeContentView;
    return self.loginContentView;
}

-(void)jobs_refreshKeyboardMgrConfig{
    UIView *targetView = [self jobs_activeDoorContentViewForKeyboard];
    if (!targetView) return;
    NSArray *followViews = self.customerServiceBtn ? @[self.logoContentView,self.customerServiceBtn] : @[self.logoContentView];
    @jobs_weakify(self)
    JobsOCKeyboardMgr.shared.byConfig(jobsMakeOCKeyboardConfig(^(__kindof JobsOCKeyboardConfig * _Nullable data) {
        @jobs_strongify(self)
        data.byOwner(self)
            .byTargetView(targetView)
            .byContainerView(self.view)
            .byFollowViews(followViews)
            .byExtraSpacing(JobsWidth(16))
            .byTopSpacing(JobsWidth(12))
            .byAccessoryPolicy(JobsOCKeyboardAccessoryPolicyAuto);
    }));
}

-(BOOL)jobs_isVideoDoorMode{
    if (![self.requestParams isKindOfClass:UIViewModel.class]) return NO;
    self.viewModel = (UIViewModel *)self.requestParams;
    return [self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Video;
}

-(void)jobs_resumeDoorVideoIfNeeded{
    if (![self jobs_isVideoDoorMode] || !_player) return;
    if (!self.player.currentPlayerManager.isPlaying) {
        [self.player.currentPlayerManager play];
    }
}

-(void)jobs_installDoorVideoApplicationStateObservers{
    JobsAddNotification(self,
                        @selector(jobs_applicationDidEnterBackground:),
                        UIApplicationDidEnterBackgroundNotification,
                        nil);
    JobsAddNotification(self,
                        @selector(jobs_applicationDidBecomeActive:),
                        UIApplicationDidBecomeActiveNotification,
                        nil);
}

-(void)jobs_applicationDidEnterBackground:(NSNotification *)notification{
    (void)notification;
    if (![self jobs_isVideoDoorMode] || !_player) return;
    id<ZFPlayerMediaPlayback> currentPlayerManager = _player.currentPlayerManager;
    self.videoPausedByApplicationState = currentPlayerManager.isPlaying;
    if (self.videoPausedByApplicationState) [currentPlayerManager pause];
}

-(void)jobs_applicationDidBecomeActive:(NSNotification *)notification{
    (void)notification;
    BOOL shouldResumeVideo = self.videoPausedByApplicationState;
    self.videoPausedByApplicationState = NO;
    if (!shouldResumeVideo || !self.viewIfLoaded.window) return;
    [self jobs_resumeDoorVideoIfNeeded];
}

-(void)jobs_installVolumeDismissGestureIfNeeded{
    if (_volumeDismissTapGesture) return;
    _volumeDismissTapGesture = [UITapGestureRecognizer.alloc initWithTarget:self
                                                                     action:@selector(jobs_volumeDismissTap:)];
    _volumeDismissTapGesture.cancelsTouchesInView = NO;
    _volumeDismissTapGesture.delegate = self;
    [self.view addGestureRecognizer:_volumeDismissTapGesture];
}

-(void)jobs_volumeDismissTap:(UITapGestureRecognizer *)tapGesture{
    if (!self.volumePanelShowing) return;
    [self jobs_setVolumePanelVisible:NO
                            animated:YES];
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

-(float)jobs_currentDoorVolume{
    id<ZFPlayerMediaPlayback> currentPlayerManager = _player.currentPlayerManager;
    float volume = _volumeSlider ? _volumeSlider.value : 0;
    if (_player) {
        volume = _player.volume;
    }else if (currentPlayerManager) {
        volume = currentPlayerManager.volume;
    }else if (_playerManager) {
        volume = _playerManager.volume;
    };return MAX(0, MIN(1, volume));
}

-(float)jobs_volumeValueByPanelPoint:(CGPoint)point{
    CGRect sliderFrame = self.volumeSlider.frame;
    CGFloat sliderHeight = CGRectGetHeight(sliderFrame);
    if (sliderHeight <= 0) return [self jobs_currentDoorVolume];
    CGFloat progress = 1.0f - ((point.y - CGRectGetMinY(sliderFrame)) / sliderHeight);
    return (float)MAX(0, MIN(1, progress));
}

-(void)jobs_applyDoorVolume:(float)volume{
    volume = MAX(0, MIN(1, volume));
    BOOL muted = volume <= 0.001f;
    id<ZFPlayerMediaPlayback> currentPlayerManager = _player.currentPlayerManager;
    self.volumeSlider.byValue(volume);
    if (_player) {
        _player.muted = muted;
        _player.volume = volume;
    }
    if (currentPlayerManager) {
        currentPlayerManager.muted = muted;
        currentPlayerManager.volume = volume;
    }
    if (_playerManager && _playerManager != currentPlayerManager) {
        _playerManager.muted = muted;
        _playerManager.volume = volume;
    }
    [self jobs_updateVolumePercentText];
}

-(void)jobs_volumePanelValueGesture:(UIGestureRecognizer *)gesture{
    if (!self.volumePanelShowing || !_volumePanelView) return;
    CGPoint point = [gesture locationInView:self.volumePanelView];
    CGRect sliderFrame = self.volumeSlider.frame;
    CGRect sliderHitFrame = CGRectMake(0,
                                       CGRectGetMinY(sliderFrame) - JobsWidth(18),
                                       self.volumePanelView.width,
                                       CGRectGetHeight(sliderFrame) + JobsWidth(36));
    if (!CGRectContainsPoint(sliderHitFrame, point)) return;
    [self jobs_applyDoorVolume:[self jobs_volumeValueByPanelPoint:point]];
}

-(void)jobs_updateVolumePercentText{
    float volume = [self jobs_currentDoorVolume];
    NSInteger percent = (NSInteger)(MAX(0, MIN(1, volume)) * 100.0f + 0.5f);
    self.volumePercentLab.byText([NSString stringWithFormat:@"%ld%%",(long)percent]);
}

-(void)jobs_refreshVolumeControlFrame{
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
}

-(void)jobs_setVolumePanelVisible:(BOOL)visible
                         animated:(BOOL)animated{
    if (!visible && !_volumePanelView) return;
    self.volumePanelShowing = visible;
    self.volumePanelView
        .byHidden(NO)
        .byUserInteractionEnabled(visible);
    if (visible) self.volumeSlider.byValue([self jobs_currentDoorVolume]);
    [self jobs_updateVolumePercentText];
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

-(void)jobs_toggleVolumePanel{
    [self jobs_setVolumePanelVisible:!self.volumePanelShowing
                            animated:YES];
}

-(void)jobs_volumeSliderValueChanged:(UISlider *)slider{
    [self jobs_applyDoorVolume:slider.value];
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
                self.loginContentViewY = contentView.y;
                contentView.jobsRichViewByModel(nil);
                @jobs_weakify(self)
                [contentView actionObjBlock:^(id data) {
                    @jobs_strongify(self)
                    if ([data isKindOfClass:UIButton.class]) {
                        UIButton *btn = (UIButton *)data;
                        if ([btn.titleLabel.text isEqualToString:Title2] ||
                            [btn.titleLabel.text isEqualToString:Title12]) {
                            self.currentPage = @(CurrentPage_Register);
                            [self->_loginContentView removeContentViewWithOffsetY:0];
                            [self.registerContentView showContentViewWithOffsetY:0];
                            [self jobs_refreshKeyboardMgrConfig];
                            @jobs_weakify(self)
                            [UIView animateWithDuration:2
                                                  delay:0.1
                                 usingSpringWithDamping:0.3
                                  initialSpringVelocity:10
                                                options:UIViewAnimationOptionCurveEaseInOut
                                             animations:^{
                                @jobs_strongify(self)
                                if (!self.registerCustomerServiceBtnY) {
                                    self.registerCustomerServiceBtnY = self.registerContentView.top + self.registerContentView.height + JobsWidth(8);
                                }
                                self.customerServiceBtn.byY(self.registerCustomerServiceBtnY);
                            } completion:nil];
                        }else if([btn.titleLabel.text isEqualToString:Title3]){
                            self.currentPage = @(CurrentPage_ForgotCode);
                            [self->_loginContentView removeContentViewWithOffsetY:0];
                            [self.forgotCodeContentView showContentViewWithOffsetY:0];
                            self.customerServiceBtn.byAlpha(0);
                            [self jobs_refreshKeyboardMgrConfig];
                        }else if([btn.titleLabel.text isEqualToString:Title4]){
                            self.backBtnClickEvent(btn);
                        }else if([btn.titleLabel.text isEqualToString:Title3]){
                            // 忘记密码
                        }else{}
                    }else if ([data isKindOfClass:JobsMagicTextField.class]){
                    }else if ([data isKindOfClass:NSString.class]){
                    }else{}
                }];
            })
            .cornerCutToCircleWithCornerRadius(8);
    };return _loginContentView;
}

-(JobsAppDoorRegisterContentView *)registerContentView{
    if (!_registerContentView) {
        @jobs_weakify(self)
        _registerContentView = (JobsAppDoorRegisterContentView *)JobsAppDoorRegisterContentView.new
            .byFrame(CGRectMake(JobsMainScreen_WIDTH() + 20,
                                JobsMainScreen_HEIGHT() / 4,
                                JobsMainScreen_WIDTH() - 40,
                                JobsAppDoorContentViewRegisterHeight))
            .addOn(self.view)
            .byViewBlock(^(__kindof UIView *view) {
                @jobs_strongify(self)
                JobsAppDoorRegisterContentView *contentView = (JobsAppDoorRegisterContentView *)view;
                self.registerContentViewY = contentView.y;
                contentView.jobsRichViewByModel(nil);
                @jobs_weakify(self)
                [contentView actionObjBlock:^(id data) {
                    @jobs_strongify(self)
                    if ([data isKindOfClass:UIButton.class]) {
                        UIButton *btn = (UIButton *)data;
                        if ([btn.titleLabel.text isEqualToString:Title1]){
                            self.currentPage = @(CurrentPage_Login);
                            [self.registerContentView removeContentViewWithOffsetY:0];
                            [self->_loginContentView showContentViewWithOffsetY:0];
                            [self jobs_refreshKeyboardMgrConfig];
                            @jobs_weakify(self)
                            [UIView animateWithDuration:2
                                                  delay:0.1
                                 usingSpringWithDamping:0.3
                                  initialSpringVelocity:10
                                                options:UIViewAnimationOptionCurveEaseInOut
                                             animations:^{
                                @jobs_strongify(self)
                                self.customerServiceBtn.byY(self.loginCustomerServiceBtnY);
                            } completion:nil];
                        }else{}
                    }
                }];
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
                self.forgotCodeContentViewY = contentView.y;
                contentView.jobsRichViewByModel(nil);
                @jobs_weakify(self)
                [contentView actionObjBlock:^(id data) {
                    @jobs_strongify(self)
                    if ([data isKindOfClass:UIButton.class]) {
                        UIButton *btn = (UIButton *)data;
                        NSString *btnTitle = btn.titleLabel.text ? : btn.titleForNormalState;
                        if ([btnTitle isEqualToString:Title1] ||
                            [btnTitle isEqualToString:@"确认".tr]){
                            self.currentPage = @(CurrentPage_Login);
                            [self.forgotCodeContentView removeContentViewWithOffsetY:0];
                            [self->_loginContentView showContentViewWithOffsetY:0];
                            [self jobs_refreshKeyboardMgrConfig];
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
                        }else if ([btnTitle isEqualToString:Title8]){
                            toastBy(btnTitle);
                        }else{}
                    }
                }];
            })
            .cornerCutToCircleWithCornerRadius(8);
    };return _forgotCodeContentView;
}

-(JobsAppDoorLogoContentView *)logoContentView{
    if (!_logoContentView) {
        _logoContentView = (JobsAppDoorLogoContentView *)JobsAppDoorLogoContentView.new
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(150), JobsWidth(50)));
                make.bottom.equalTo(self.loginContentView.mas_top).offset(-JobsWidth(50));
                make.centerX.equalTo(self.view);
            });
        [self.view layoutIfNeeded];
        self.logoContentViewY = self.logoContentView.y;
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
                .jobsResetImagePadding(JobsWidth(6));
        } else {
            btn = (BaseButton *)btn.byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button
                    .byImageEdgeInsets(UIEdgeInsetsMake(0, 0, 0, 6))
                    .byTitleEdgeInsets(UIEdgeInsetsMake(0, 6, 0, 0))
                    .bySemanticContentAttribute(UISemanticContentAttributeForceLeftToRight);
            });
        }
        UIImage *customerImage = @"客服".img ? : @"用户名称".img;
        _customerServiceBtn = (BaseButton *)btn
            .jobsResetBtnImage(customerImage)
            .jobsResetBtnTitle(Title8)
            .jobsResetBtnTitleCor(Cor4)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(JobsWidth(12)))
            .bgColorBy(Cor1)
            .cornerRadiusValueBy(customerBtnHeight / 2)
            .onClickBy(^(UIButton *x){
                [x byFuseTapScale];
                toastBy(x.titleForNormalState);
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
                    .byAdjustsFontSizeToFitWidth(YES)
                    .byMinimumScaleFactor(0.75f)
                    .byLineBreakMode(NSLineBreakByTruncatingTail);
            });
        self.loginCustomerServiceBtnY = _customerServiceBtn.y;
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
        UIImage *volumeImage = @"AppDoorVolume".img ? : @"手机号码".img;
        _volumeBtn = (UIButton *)UIButton.jobsInit()
            .jobsResetBtnImage(volumeImage)
            .bgColorBy(Cor1)
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                [self jobs_toggleVolumePanel];
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
                    self.volumeSliderPanGesture.cancelsTouchesInView = NO;
                    [view addGestureRecognizer:self.volumeSliderPanGesture];
                    self.volumeSliderTapGesture = [UITapGestureRecognizer.alloc initWithTarget:self
                                                                                        action:@selector(jobs_volumePanelValueGesture:)];
                    self.volumeSliderTapGesture.cancelsTouchesInView = NO;
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
        [self jobs_updateVolumePercentText];
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
                .byValue([self jobs_currentDoorVolume])
                .byMinimumTrackTintColor(Cor4)
                .byMaximumTrackTintColor(JobsWhiteColor.colorWithAlphaComponentBy(0.28f))
                .byThumbTintColor(Cor4);
            slider.byTransform(CGAffineTransformMakeRotation(-M_PI_2));
            slider.onJobsChange(^(__kindof UIControl * _Nullable ctrl) {
                @jobs_strongify(self)
                [self jobs_volumeSliderValueChanged:(UISlider *)ctrl];
            });
        });
    };return _volumeSlider;
}

-(ZFAVPlayerManager *)playerManager{
    if (!_playerManager) {
        _playerManager = jobsMakeZFAVPlayerManager(^(__kindof ZFAVPlayerManager * _Nullable data) {
            data
                .byShouldAutoPlay(YES)
                .byAssetURL(isiPhoneX_series() ? @"iph_X.mp4".pathForResourceWithFullName.jobsFileUrl : @"非iph_X.mp4".pathForResourceWithFullName.jobsFileUrl);
        });
    };return _playerManager;
}

-(ZFPlayerController *)player{
    if (!_player) {
        @jobs_weakify(self)
        _player = [ZFPlayerController.alloc initWithPlayerManager:self.playerManager
                                                    containerView:self.view];
        _player.controlView = self.customPlayerControlView;
//        ZFPlayer_DoorVC = _player;
        [_player setPlayerDidToEnd:^(id<ZFPlayerMediaPlayback>  _Nonnull asset) {
            @jobs_strongify(self)
            self.playerManager.byReplay;// 设置循环播放
        }];
    };return _player;
}

-(CustomZFPlayerControlView *)customPlayerControlView{
    if (!_customPlayerControlView) {
        _customPlayerControlView = CustomZFPlayerControlView.new;
        @jobs_weakify(self)
        [_customPlayerControlView actionCustomZFPlayerControlViewBlock:^(id data, id data2) {
            @jobs_strongify(self)
            [self.view endEditing:YES];
        }];
    };return _customPlayerControlView;
}

-(UIImageView *)bgImgV{
    if (!_bgImgV) {
        UIImage *appDoorBgImage = @"AppDoorBgImage".img ? : @"bg_video".img ? : JobsBlackColor.image;
        _bgImgV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage(appDoorBgImage)
                .byUserInteractionEnabled(YES);
        });
    };return _bgImgV;
}

@end
