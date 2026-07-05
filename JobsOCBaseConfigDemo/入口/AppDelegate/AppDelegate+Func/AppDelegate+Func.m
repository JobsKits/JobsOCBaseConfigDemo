//
//  AppDelegate+Func.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate+Func.h"

static NSString *const JobsOCSplashEnabledUserDefaultsKey = @"com.BSports.JobsOCSplashEnabledUserDefaultsKey";

static BOOL JobsOCSplashEnabled(void) {
    id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsOCSplashEnabledUserDefaultsKey];
    return value ? [value boolValue] : YES;
}

@implementation AppDelegate (Func)
#pragma mark —— 启动调用功能
+(jobsByVoidBlock _Nonnull)launchFunc1{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
    };
}

-(jobsByVoidBlock _Nonnull)launchFunc2{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        UIApplication.sharedApplication.idleTimerDisabled = NO;/// 保持屏幕常亮
        /*
         * 禁止App系统文件夹document同步
         * 苹果要求：可重复产生的数据不得进行同步,什么叫做可重复数据？这里最好禁止，否则会影响上架，被拒！
         */
        FileFolderHandleTool.banSysDocSynchronization();
        NetworkingEnvir();/// 配置网络环境
#ifdef DEBUG
        /// 打印全员字体
        UIFont.getAvailableFont();
        [DDLog addLogger:DDOSLogger.sharedInstance];
        /// 想要 Xcode console 输出也可加：
        [DDLog addLogger:DDTTYLogger.sharedInstance];
#endif
        self.makeJobsNavBarConfig();/// 全局配置 JobsNavBarConfig
        self.makeTABAnimatedConfig();/// 全局配置 TABAnimated
        self.makeJobsOCKeyboardMgrConfig();/// 全局配置键盘
        self.makeGKNavigationBarConfig();/// 自定义导航栏
        if (JobsOCSplashEnabled()) self.makeJobsLaunchAdConfig();/// 开屏广告
        self.makeReachabilityConfig();/// 网络环境监测
        self.YTKNetworkConfig();/// YTK网络框架的配置
        self.KTVHTTP();/// KTVHTTPCache
    };
}
#pragma mark —— 开屏广告
-(jobsByVoidBlock _Nonnull)makeJobsLaunchAdConfig{
    return ^() {
        __block NSInteger retryCount = 0;
        __block jobsByVoidBlock showSplash = nil;
        showSplash = ^{
            UIWindow *window = jobsGetMainWindow();
            UIViewController *hostViewController = window.rootViewController;
            if (!hostViewController) {
                if (retryCount++ < 10) {
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)),
                                   dispatch_get_main_queue(),
                                   showSplash);
                };return;
            }

            JobsOCSplashConfiguration *configuration = [JobsOCSplashConfiguration localImage:@"1242x2688.png"];
            configuration
                .byCountdownSeconds(@8)
                .bySkipButtonVisible(YES)
                .byTapAction(JobsOCSplashAction.none)
                .byShakeAction(JobsOCSplashAction.none);
            [JobsOCSplashPresenter showOver:hostViewController
                              configuration:configuration];
            showSplash = nil;
        };
        dispatch_async(dispatch_get_main_queue(), showSplash);
    };
}
#pragma mark —— YTKNetworkConfig
-(jobsByVoidBlock _Nonnull)YTKNetworkConfig{
    return ^(){
        @jobs_weakify(self)
        jobsMakeYTKNetworkConfig(^(__kindof YTKNetworkConfig *_Nullable data) {
            @jobs_strongify(self)
            data.baseUrl = This.BaseUrl;
            data.cdnUrl = @"";
            //data.urlFilters = nil;
            //data.cacheDirPathFilters = nil;
            data.securityPolicy = AFSecurityPolicy.initByModeNone;
            data.debugLogEnabled = YES;
            data.sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration;
            [data addUrlFilter:[YTKUrlArgumentsFilter filterWithArguments:jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
                @jobs_strongify(self)
                if(self.appVersion) [data setValue:self.appVersion forKey:@"version"];
            })]];
        });
    };
}
#pragma mark —— KTVHTTPCache
-(jobsByVoidBlock _Nonnull)KTVHTTP{
    return ^(){
        NSError *error = nil;
        [KTVHTTPCache proxyStart:&error];
        if(error) JobsLog(@"error = %@",error.description)
    };
}
#pragma mark —— 欢迎引导页面
-(jobsByVoidBlock _Nonnull)guide{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.window.rootViewController = self.isAppFirstLaunch ? JobsWelcomeVC.new : AppDelegate.tabBarVC;
    };
}
#pragma mark —— 存取用户信息Demo
-(jobsByVoidBlock _Nonnull)saveAndReadUserInfoDemo{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.saveUserInfo(jobsMakeUserModel(^(__kindof JobsUserModel<NSCoding> * _Nullable userModel) {
            userModel.byToken(@"12345")
                     .byUid(@"54321");
        }));
//        JobsUserModel *f = self.readUserInfo;
//        JobsLog(@"");
    };
}
#pragma mark —— 读取Plist配置文件
-(jobsByVoidBlock _Nonnull)readPlistConfig{
    return ^(){
        @jobs_weakify(self)
        static dispatch_once_t readPlistConfigDispatchOnce;
        dispatch_once(&readPlistConfigDispatchOnce, ^{
            @jobs_strongify(self)
            id plistConfig = self.readLocalPlistWithFileName(@"MetaData");
            JobsLog(@"plistConfig = %@",plistConfig);
        });
    };
}
#pragma mark —— 全局配置 TABAnimated
-(jobsByVoidBlock _Nonnull)makeTABAnimatedConfig{
    return ^(){
        [TABAnimated.sharedAnimated initWithOnlySkeleton];
        /// 是否开启控制台Log提醒，默认不开启
        TABAnimated.sharedAnimated.openLog = YES;
        ///开启后，会在每一个动画元素上增加一个红色的数字，该数字表示该动画元素所在的下标，方便快速定位某个动画元素。
//        TABAnimated.sharedAnimated.openAnimationTag = YES;
//        TABAnimated.sharedAnimated.animationType;/// 全局动画类型
//        TABAnimated.sharedAnimated.animatedHeightCoefficient;/// 动画高度与视图原有高度的比例系数，该属性仅仅对`UILabel`生效。
//        TABAnimated.sharedAnimated.animatedColor;/// 全局动画内容颜色，默认值为0xEEEEEE
        TABAnimated.sharedAnimated.animatedBackgroundColor = JobsLightGrayColor;/// 全局动画背景颜色，默认值为UIColor.whiteColor
//        TABAnimated.sharedAnimated.useGlobalCornerRadius;/// 是否开启全局圆角。开启后，全局圆角默认值为: 动画高度/2.0
//        TABAnimated.sharedAnimated.animatedCornerRadius;/// 全局圆角的值。优先级：此属性 < view自身的圆角
//        TABAnimated.sharedAnimated.useGlobalAnimatedHeight;/// 是否需要全局动画高度
//        TABAnimated.sharedAnimated.animatedHeight;/// 全局动画高度
//        TABAnimated.sharedAnimated.scrollEnabled;/// 是否可以在滚动，默认可以滚动
//        TABAnimated.sharedAnimated.closeCache;/// 关闭缓存功能，默认开启
//        TABAnimated.sharedAnimated.darkAnimatedBackgroundColor;/// 暗黑模式下，动画背景色
//        TABAnimated.sharedAnimated.darkAnimatedColor;/// 暗黑模式下，动画内容的颜色
//        TABAnimated.sharedAnimated.darkModeType;/// 暗黑模式选择，跟随系统、强制普通模式、强制暗黑模式
//        TABAnimated.sharedAnimated.classicAnimation;/// 经典动画全局配置
//        TABAnimated.sharedAnimated.dropAnimation;/// 下坠动画全局配置
//        TABAnimated.sharedAnimated.binAnimation;/// 呼吸灯动画全局配置
//        TABAnimated.sharedAnimated.shimmerAnimation;/// 闪光灯动画全局配置
    };
}
#pragma mark —— 全局配置键盘
-(jobsByVoidBlock _Nonnull)makeJobsOCKeyboardMgrConfig{
    return ^(){
        JobsOCKeyboardMgr.shared.start();
    };
}

-(jobsByVoidBlock _Nonnull)makeIQKeyboardManagerConfig{
    return ^(){
        jobsMakeIQKeyboardManager(^(__kindof IQKeyboardManager * _Nullable manager) {
            manager.enable = YES; /// 控制整个功能是否启用
            manager.shouldResignOnTouchOutside = YES; /// 启用手势触摸:控制点击背景是否收起键盘
            manager.shouldToolbarUsesTextFieldTintColor = YES; /// 控制键盘上的工具条文字颜色是否用户自定义,(使用TextField的tintColor属性IQToolbar，否则色调的颜色是黑色 )
            manager.toolbarManageBehavior = IQAutoToolbarBySubviews; // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
            manager.enableAutoToolbar = NO; /// 控制是否显示键盘上的工具条,当需要支持内联编辑(Inline Editing), 这就需要隐藏键盘上的工具条(默认打开)
            manager.shouldShowToolbarPlaceholder = YES; // 是否显示占位文字
            manager.placeholderFont = UIFontWeightBoldSize(JobsWidth(17)); // 设置占位文字的字体
            manager.keyboardDistanceFromTextField = 10.0f; // 输入框距离键盘的距离
        });
    };
}
#pragma mark —— 全局配置GKNavigationBar
-(jobsByVoidBlock _Nonnull)makeGKNavigationBarConfig{
    return ^(){
        [GKConfigure setupCustomConfigure:^(GKNavigationBarConfigure * _Nonnull configure) {
            // 导航栏背景色
            configure.byBackgroundColor(JobsClearColor);
            // 导航栏标题颜色
            configure.titleColor = HEXCOLOR(0x3D4A58);
            // 导航栏标题字体
            configure.titleFont = UIFontWeightBoldSize(16);
            // 导航栏返回按钮样式
            configure.backStyle = GKNavigationBarBackStyleBlack;
            // 导航栏左右item间距
            configure.gk_navItemLeftSpace = JobsWidth(12.0f);
            configure.gk_navItemRightSpace = JobsWidth(12.0f);
    #warning 这里的Api有变化 先注释，否则无法编译通过
    //        configure.shiledItemSpaceVCs = @[@"PUPhotoPickerHostViewController"];
        }];
    };
}
#pragma mark —— 全局配置JobsNavBarConfig
-(jobsByVoidBlock _Nonnull)makeJobsNavBarConfig{
    return ^(){
        static_navBarConfig = JobsNavBarConfig.SharedInstance();
//        static_navBarConfig.backBtnModel = self.makeBackBtnModel;
    };
}
#pragma mark —— 本地推送通知
-(jobsByVoidBlock _Nonnull)localNotifications{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        jobsMakeUNUserNotificationCenter(^(__kindof UNUserNotificationCenter * _Nullable center) {
            @jobs_strongify(self)
            center.delegate = self;
            [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert +
                                                     UNAuthorizationOptionSound +
                                                     UNAuthorizationOptionBadge)
                                  completionHandler:^(BOOL granted,
                                                      NSError *_Nullable error) {
                if (granted) {
                    JobsLog(@"Notification permission granted.");
                } else {
                    JobsLog(@"Notification permission denied.");
                }
            }];
        });
    };
}
#pragma mark —— 网络环境监测
-(jobsByVoidBlock _Nonnull)makeReachabilityConfig{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        // Allocate a reachability object
        Reachability *reach = @"www.google.com".makeReachability;
        // Tell the reachability that we DON'T want to be reachable on 3G/EDGE/CDMA
        reach.reachableOnWWAN = NO;
        // Here we set up a NSNotification observer. The Reachability that caused the notification
        // is passed in the object parameter
        [reach startNotifier];
        @jobs_weakify(self)
        [self addNotificationName:kReachabilityChangedNotification
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
//            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            JobsLog(@"通知传递过来的 = %@",notification.object);
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            self.jobsPost(kReachabilityChangedNotification);
        });
    };
}

@end
