//
//  JobsAppDoorVC.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorVC.h"
#import "NSString+Sys.h"

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
Prop_strong()JobsAppDoorModel *appDoorModel;

-(void)jobs_bringDoorControlsToFront;

@end

@implementation JobsAppDoorVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

+(void)destroySingleton{
    static_jobsAppDoorOnceToken = 0;
    static_appDoorVC = nil;
}
static JobsAppDoorVC *static_appDoorVC = nil;
static dispatch_once_t static_jobsAppDoorOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_jobsAppDoorOnceToken, ^{
        static_appDoorVC = JobsAppDoorVC.new;
    });return static_appDoorVC;
}

-(instancetype)init{
    if (self = [super init]) {

    };return self;
}

-(void)loadView{
    [super loadView];
    self.bgImage = nil;
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Image) {
            self.view = self.bgImgV;
        }else if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Video){
            [self.player.currentPlayerManager play];
        }else{}
    }
    self.currentPage = @(CurrentPage_Login);//默认页面是登录
    //标的值初始化
    self.logoContentViewY = 0;
    self.jobsAppDoorContentViewY = 0;
    self.customerServiceBtnY = 0;

    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(data.attributedTitle.string);
            data.byFont(UIFontWeightRegularSize(16));
        })

        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jobsAppDoorContentView.图片从小放大();
    self.logoContentView.图片从小放大();
    self.customerServiceBtn.图片从小放大();
    if (_player) {
        self.volumeBtn.图片从小放大();
        self.volumePanelView.byVisible(NO);
        [self jobs_installVolumeDismissGestureIfNeeded];
        [self jobs_refreshVolumeControlFrame];
    }
    [self jobs_bringDoorControlsToFront];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self jobs_refreshVolumeControlFrame];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self jobs_resumeDoorVideoIfNeeded];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    JobsLog(@"%@",self.requestParams);
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        JobsLog(@"%@",self.requestParams);
        if ([self.viewModel.requestParams integerValue] == CurrentPage_Login) {

        }else if ([self.viewModel.requestParams integerValue] == CurrentPage_Register){
            [self.jobsAppDoorContentView animationToRegister];
        }else if ([self.viewModel.requestParams integerValue] == CurrentPage_ForgotCode){

        }else{}
    }
    [self jobs_refreshKeyboardMgrConfig];
    [self jobs_resumeDoorVideoIfNeeded];
    [self jobs_bringDoorControlsToFront];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    JobsOCKeyboardMgr.shared.byConfig(nil);

    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Image) {

        }else if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Video){
            BOOL shouldPauseVideo = self.isBeingDismissed || self.isMovingFromParentViewController || self.navigationController.isBeingDismissed;
            if (shouldPauseVideo && self.player.currentPlayerManager.isPlaying) {
                [self.player.currentPlayerManager pause];
            }
            [self jobs_setVolumePanelVisible:NO animated:NO];
        }else{}
    }
}
#pragma mark —— 一些私有方法
-(void)竖形按钮在左边{
    index = 0;
    self->_jobsAppDoorContentView.backgroundColor = Cor2;
    Ivar ivar = class_getInstanceVariable(JobsAppDoorContentView.class, "_toRegisterBtn");// 必须是下划线接属性
    UIButton *toRegisterBtn = object_getIvar(self->_jobsAppDoorContentView, ivar);
    toRegisterBtn.jobsResetBtnBgCor(Cor3);
    toRegisterBtn.jobsResetBtnTitleCor(Cor1);

    self.currentPage = @(CurrentPage_Register);//注册页面
    self->_jobsAppDoorContentView.frame = CGRectMake(JobsAppDoorContentViewRegisterX,
                                                     JobsAppDoorContentViewRegisterY,
                                                     JobsAppDoorContentViewRegisterWidth,
                                                     JobsAppDoorContentViewRegisterHeight);
    toRegisterBtn.frame = CGRectMake(0,
                                     0,
                                     JobsWidth(64),
                                     self->_jobsAppDoorContentView.height);
}

-(void)竖形按钮在右边{
    index = 0;
    self->_jobsAppDoorContentView.backgroundColor = Cor2;
    Ivar ivar = class_getInstanceVariable([JobsAppDoorContentView class], "_toRegisterBtn");// 必须是下划线接属性
    UIButton *toRegisterBtn = object_getIvar(self->_jobsAppDoorContentView, ivar);
    toRegisterBtn.jobsResetBtnBgCor(Cor1);
    toRegisterBtn.jobsResetBtnTitleCor(Cor4);

    self.currentPage = @(CurrentPage_Login);//登录页面
    self->_jobsAppDoorContentView.frame = CGRectMake(JobsAppDoorContentViewLoginX,
                                                     JobsAppDoorContentViewLoginY,
                                                     JobsAppDoorContentViewLoginWidth,
                                                     JobsAppDoorContentViewLoginHeight);
    toRegisterBtn.frame = CGRectMake(self->_jobsAppDoorContentView.width - 64,
                                     0,
                                     64,
                                     self->_jobsAppDoorContentView.height);
}
/// 进此页面先自动跳转到注册页面
-(void)toRegister{
    [self.jobsAppDoorContentView animationToRegister];
}

-(UIView *)jobs_activeDoorContentViewForKeyboard{
    if (self.currentPage.integerValue == CurrentPage_ForgotCode && _forgotCodeContentView) return _forgotCodeContentView;
    return self.jobsAppDoorContentView;
}

-(void)jobs_refreshKeyboardMgrConfig{
    UIView *targetView = [self jobs_activeDoorContentViewForKeyboard];
    if (!targetView) return;
    NSArray *followViews = self.customerServiceBtn ? @[self.logoContentView,self.customerServiceBtn] : @[self.logoContentView];
    @jobs_weakify(self)
    JobsOCKeyboardMgr.shared.byConfig(jobsMakeOCKeyboardConfig(^(__kindof JobsOCKeyboardConfig * _Nullable data) {
        @jobs_strongify(self)
        data.byTargetView(targetView)
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

-(void)jobs_installVolumeDismissGestureIfNeeded{
    if (_volumeDismissTapGesture) return;
    @jobs_weakify(self)
    _volumeDismissTapGesture = [jobsMakeTapGesture(^(UITapGestureRecognizer * _Nullable gesture) {
        @jobs_strongify(self)
        gesture
            .byCancelsTouchesInView(NO)
            .byDelegate(self);
    }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable gesture) {
        @jobs_strongify(self)
        [self jobs_volumeDismissTap:(UITapGestureRecognizer *)gesture];
    }];
    self.view.addGesture(_volumeDismissTapGesture);
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

-(void)jobs_updateVolumePercentText{
    float volume = _player ? _player.volume : (_volumeSlider ? _volumeSlider.value : 0);
    NSInteger percent = (NSInteger)(MAX(0, MIN(1, volume)) * 100.0f + 0.5f);
    self.volumePercentLab.byText([NSString stringWithFormat:@"%ld%%",(long)percent]);
}

-(NSString *)jobs_countryCodeTitleByCountryName:(NSString *)countryName
                                           code:(NSString *)code{
    NSString *cleanCode = code.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
    if (!cleanCode.length) cleanCode = @"86";
    NSString *codeText = [cleanCode hasPrefix:@"+"] ? cleanCode : [NSString stringWithFormat:@"+%@",cleanCode];
    if ([self jobs_isTaiwanCountryName:countryName]) return [NSString stringWithFormat:@"｜%@",codeText];
    return [NSString stringWithFormat:@"%@｜%@",[self jobs_countryFlagByCountryName:countryName],codeText];
}

-(BOOL)jobs_isTaiwanCountryName:(NSString *)countryName{
    NSString *cleanCountryName = countryName.byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
    if (!cleanCountryName.length) return NO;
    NSSet <NSString *>*taiwanNames = [NSSet setWithArray:@[@"中国台湾",@"台湾",@"Taiwan",@"Taiwan, China",@"China Taiwan"]];
    return [taiwanNames containsObject:cleanCountryName];
}

-(UIImage *)jobs_countryFlagImageByCountryName:(NSString *)countryName{
    if (![self jobs_isTaiwanCountryName:countryName]) return nil;
    return @"AppDoorTaiwanBlueSkyWhiteSun".img;
}

-(NSString *)jobs_countryFlagByCountryName:(NSString *)countryName{
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
    if (ISOCode.length) return [self jobs_flagEmojiByISOCode:ISOCode];
    NSArray <NSLocale *>*locales = @[
        NSLocale.currentLocale,
        [NSLocale localeWithLocaleIdentifier:@"zh_Hans_CN"],
        [NSLocale localeWithLocaleIdentifier:@"en_US"]
    ];
    for (NSString *countryCode in NSLocale.ISOCountryCodes) {
        for (NSLocale *locale in locales) {
            NSString *displayName = [locale displayNameForKey:NSLocaleCountryCode value:countryCode];
            if ([cleanCountryName isEqualToString:displayName]) return [self jobs_flagEmojiByISOCode:countryCode];
        }
    };return @"🌐";
}

-(NSString *)jobs_flagEmojiByISOCode:(NSString *)ISOCode{
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
}

-(void)jobs_pushCountryCodeCtrlBySender:(UIButton *)sender{
    JobsOCCountryCodeCtrl *countryCodeCtrl = JobsOCCountryCodeCtrl.new;
    countryCodeCtrl.hidesBottomBarWhenPushed = YES;
    @jobs_weakify(self)
    countryCodeCtrl.countryCodeBlock = ^(__kindof NSString * _Nullable countryName,
                                         __kindof NSString * _Nullable code) {
        @jobs_strongify(self)
        UIImage *flagImage = [self jobs_countryFlagImageByCountryName:countryName];
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
    [self jobs_bringDoorControlsToFront];
}

-(void)jobs_bringDoorControlsToFront{
    if (_jobsAppDoorContentView) [self.view bringSubviewToFront:_jobsAppDoorContentView];
    if (_logoContentView) [self.view bringSubviewToFront:_logoContentView];
    if (_customerServiceBtn) [self.view bringSubviewToFront:_customerServiceBtn];
    if (_volumePanelView) [self.view bringSubviewToFront:_volumePanelView];
    if (_volumeBtn) [self.view bringSubviewToFront:_volumeBtn];
}

-(void)jobs_setVolumePanelVisible:(BOOL)visible
                         animated:(BOOL)animated{
    if (!visible && !_volumePanelView) return;
    self.volumePanelShowing = visible;
    self.volumePanelView
        .byHidden(NO)
        .byUserInteractionEnabled(visible);
    self.volumeSlider.byValue(_player ? _player.volume : 0);
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
    if (!_player) return;
    float volume = MAX(0, MIN(1, slider.value));
    slider.byValue(volume);
    _player.volume = volume;
    _player.muted = volume <= 0.001f;
    [self jobs_updateVolumePercentText];
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
}
/// 登录网络请求
-(void)authLoginByAccount:(NSString *_Nullable)account
                 deviceId:(NSString *_Nullable)deviceId
                 password:(NSString *_Nullable)password
                 validate:(NSString *_Nullable)validate{
}
/// 网易云盾验证
-(void)NTESVerifyCodeWithBlock:(jobsByIDBlock)block{

}
#pragma mark —— lazyLoad
-(JobsAppDoorLogoContentView *)logoContentView{
    if (!_logoContentView) {
        _logoContentView = JobsAppDoorLogoContentView.new;
        _logoContentView
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(150), JobsWidth(150)));
                make.bottom.equalTo(self.jobsAppDoorContentView.mas_top).offset(-JobsWidth(50));
                make.centerX.equalTo(self.view);
            });

        [self.view layoutIfNeeded];
        self.logoContentViewY = self.logoContentView.y;
    };return _logoContentView;
}

-(JobsAppDoorForgotCodeContentView *)forgotCodeContentView{
    if (!_forgotCodeContentView) {
        _forgotCodeContentView = JobsAppDoorForgotCodeContentView.new;
        _forgotCodeContentView.x = JobsAppDoorContentViewFindPasswordX;
        _forgotCodeContentView.y = JobsAppDoorContentViewFindPasswordY;
        _forgotCodeContentView.width = JobsAppDoorContentViewFindPasswordWidth;
        _forgotCodeContentView.height = JobsAppDoorContentViewFindPasswordHeight;
        self.forgotCodeContentViewY = _forgotCodeContentView.y;
        [self.view addSubview:_forgotCodeContentView];
        _forgotCodeContentView.jobsRichViewByModel(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {}));
        @jobs_weakify(self)
        [_forgotCodeContentView actionObjBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:UIButton.class]) {
                UIButton *btn = (UIButton *)data;
                if (btn.titleForNormalState.isEqualToString(Title1)){
                    self.currentPage = @(CurrentPage_Login);
                    [self.forgotCodeContentView removeContentViewWithOffsetY:0];
                    [self.jobsAppDoorContentView showContentViewWithOffsetY:0];
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
                }else{}
            }
        }];
        _forgotCodeContentView.cornerCutToCircleWithCornerRadius(8);
    };return _forgotCodeContentView;
}

-(JobsAppDoorContentView *)jobsAppDoorContentView{
    if (!_jobsAppDoorContentView) {
        _jobsAppDoorContentView = JobsAppDoorContentView.new;
        /// 初始进的是登录页面
        _jobsAppDoorContentView.frame = CGRectMake(JobsAppDoorContentViewLoginX,
                                                   JobsAppDoorContentViewLoginY,
                                                   JobsAppDoorContentViewLoginWidth,
                                                   JobsAppDoorContentViewLoginHeight);
        self.jobsAppDoorContentViewY = _jobsAppDoorContentView.y;
        _jobsAppDoorContentView.byBgColor(Cor2);

        @jobs_weakify(self)
        //监测输入字符回调 和 激活的textField 和 toRegisterBtn/abandonLoginBtn点击事件
        [_jobsAppDoorContentView actionObjBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:UIButton.class]) {
                [self.view endEditing:YES];
                UIButton *btn = (UIButton *)data;
                if ([btn.requestParams isKindOfClass:NSString.class] &&
                    [btn.requestParams isEqualToString:@"JobsAppDoorCountryCodeCtrl"]) {
                    [self jobs_pushCountryCodeCtrlBySender:btn];
                }
                else if (btn.titleForNormalState.isEqualToString(Title2) ||// Title2 @"L\no\ng\ni\nn".tr
                    btn.titleForNormalState.isEqualToString(Title12) ||
                    btn.titleForNormalState.isEqualToString(Title1)) {// Title1 @"B\na\nc\nk\nT\no\nL\no\ng\ni\nn".tr
                    self->toRegisterBtn = (UIButton *)data;
                    //状态置空
                    self.currentActivateTFIndex = 0;
                    self.lastTimeActivateTFIndex = 0;

                    if (self->toRegisterBtn.selected) {
                        [self 竖形按钮在左边];
                    }else{
                        [self 竖形按钮在右边];
                    }
                    self.customerServiceBtn.top = self.jobsAppDoorContentView.top + self.jobsAppDoorContentView.height + JobsWidth(8);
                    self.customerServiceBtn.centerX = self.jobsAppDoorContentView.centerX;
                    self.customerServiceBtnY =  self.customerServiceBtn.y;
                    [self jobs_refreshKeyboardMgrConfig];
                }
                else if (btn.titleForNormalState.isEqualToString(Title6)){// Title6 @"Register".tr

                }
                else if (btn.titleForNormalState.isEqualToString(Title7)){// @"Login".tr

                }
                else if (btn.titleForNormalState.isEqualToString(Title4)){// Title4 @"Back to HomePage".tr
                    UIButton *abandonLoginBtn = (UIButton *)data;
                    self.backBtnClickEvent(abandonLoginBtn);
                    [JobsAppDoorVC destroySingleton];
                }
                else if (btn.titleForNormalState.isEqualToString(Title5)){// Title5 @"记住我".tr

                }
                else if (btn.titleForNormalState.isEqualToString(Title3)){// Title3 @"Forgot code".tr

                    {//本页动效实现的
                        self.currentPage = @(CurrentPage_ForgotCode);
                        [self->_jobsAppDoorContentView removeContentViewWithOffsetY:0];
                        [self.forgotCodeContentView showContentViewWithOffsetY:0];
                        self.customerServiceBtn.byAlpha(0);
                        [self jobs_refreshKeyboardMgrConfig];

                    }

                }else{}
            }else if ([data isKindOfClass:JobsAppDoorModel.class]){
                self.appDoorModel = (JobsAppDoorModel *)data;
            }else{}
        }];
        [self.view addSubview:_jobsAppDoorContentView];
        _jobsAppDoorContentView.cornerCutToCircleWithCornerRadius(8);
        _jobsAppDoorContentView.jobsRichViewByModel(nil);
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
                .jobsResetImagePadding(JobsWidth(6));
        } else {
            btn = (UIButton *)btn.byViewBlock(^(__kindof UIView *view) {
                UIButton *button = (UIButton *)view;
                button.bySemanticContentAttribute(UISemanticContentAttributeForceLeftToRight);
                button
                    .byImageEdgeInsets(UIEdgeInsetsMake(0, 0, 0, 6))
                    .byTitleEdgeInsets(UIEdgeInsetsMake(0, 6, 0, 0));
            });
        }
        UIImage *customerImage = @"客服".img ? : @"用户名称".img;
        _customerServiceBtn = (UIButton *)btn
            .jobsResetBtnImage(customerImage)
            .jobsResetBtnTitleCor(Cor4)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(JobsWidth(12)))
            .jobsResetBtnTitle(Title8)
            .onClickBy(^ (UIButton *x) {
                [x byFuseTapScale];
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
                    .byClipsToBounds(YES)
                    .byCornerRadius(customerBtnHeight / 2)
                    .byLayer(^(__kindof CALayer *layer) {
                        layer
                            .byCornerRadius(customerBtnHeight / 2)
                            .byMasksToBounds(YES);
                    });
                button.imageView.byContentMode(UIViewContentModeScaleAspectFit);
                button.titleLabel.byAdjustsFontSizeToFitWidth(YES);
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
                .byValue(_player ? _player.volume : 0)
                .byMinimumTrackTintColor(Cor4)
                .byMaximumTrackTintColor(JobsWhiteColor.colorWithAlphaComponentBy(0.28f))
                .byThumbTintColor(Cor4)
                .onJobsChange(^(__kindof UIControl * _Nullable ctrl) {
                    @jobs_strongify(self)
                    [self jobs_volumeSliderValueChanged:(UISlider *)ctrl];
                })
                .byTransform(CGAffineTransformMakeRotation(-M_PI_2));
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
        _customPlayerControlView.userInteractionEnabled = NO;
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
