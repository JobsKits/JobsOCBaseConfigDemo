//
//  AppDelegate+Func.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate+Func.h"
#import "Reachability+Extra.h"

static NSString *const JobsOCSplashEnabledUserDefaultsKey = @"com.BSports.JobsOCSplashEnabledUserDefaultsKey";

static BOOL JobsOCSplashEnabled(void) {
    id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsOCSplashEnabledUserDefaultsKey];
    return value ? [value boolValue] : YES;
}

static JobsOCSplashConfiguration *JobsOCSplashConfigurationForNextLaunch(void) {
    switch (JobsOCSplashPreferences.contentTypeForNextLaunch()) {
        /// 使用本地静态图片开屏
        case JobsOCSplashContentTypeLocalImage:
            return JobsOCSplashConfiguration.localImage(@"1242x2688.png");
        /// 使用 App Bundle 内的 GIF 开屏
        case JobsOCSplashContentTypeLocalGIF:
            return JobsOCSplashConfiguration.localGIF(@"GIF大图.gif");
        /// 使用远程图片开屏
        case JobsOCSplashContentTypeRemoteImage:
            return JobsOCSplashConfiguration.remoteImage([NSURL URLWithString:@"https://picsum.photos/1242/2688.jpg"]);
        /// 使用 App Bundle 内的视频开屏
        case JobsOCSplashContentTypeLocalVideo:
            return [JobsOCSplashConfiguration localVideo:@"welcome_video"
                                           fileExtension:@"mp4"
                                                  bundle:nil];
        /// 使用远程视频开屏
        case JobsOCSplashContentTypeRemoteVideo:
            return [JobsOCSplashConfiguration remoteVideo:[NSURL URLWithString:@"https://media.w3.org/2010/05/sintel/trailer.mp4"]
                                        fallbackLocalVideo:@"welcome_video"
                                              fileExtension:@"mp4"
                                                     bundle:nil];
        /// 未知配置回退到本地静态图片
        default:
            return JobsOCSplashConfiguration.localImage(@"1242x2688.png");
    }
}

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN TABAnimated
@interface TABAnimated (JobsLocalPropertyDSLAutogen_3048ed2d28)
-(JobsRetTABAnimatedByBOOLBlock _Nonnull)byOpenLog;
-(JobsRetTABAnimatedByUIColorBlock _Nonnull)byAnimatedBackgroundColor;
-(void)setAnimatedBackgroundColor:(UIColor * _Nullable)data;
-(void)setOpenLog:(BOOL)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END TABAnimated

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN YTKNetworkConfig
@interface YTKNetworkConfig (JobsLocalPropertyDSLAutogen_3048ed2d28)
-(JobsRetYTKNetworkConfigByAFSecurityPolicyBlock _Nonnull)bySecurityPolicy;
-(JobsRetYTKNetworkConfigByBOOLBlock _Nonnull)byDebugLogEnabled;
-(JobsRetYTKNetworkConfigByNSStringBlock _Nonnull)byBaseUrl;
-(JobsRetYTKNetworkConfigByNSStringBlock _Nonnull)byCdnUrl;
-(JobsRetYTKNetworkConfigByNSURLSessionConfigurationBlock _Nonnull)bySessionConfiguration;
-(void)setBaseUrl:(NSString * _Nullable)data;
-(void)setCdnUrl:(NSString * _Nullable)data;
-(void)setDebugLogEnabled:(BOOL)data;
-(void)setSecurityPolicy:(AFSecurityPolicy * _Nullable)data;
-(void)setSessionConfiguration:(NSURLSessionConfiguration* _Nullable)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END YTKNetworkConfig

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
        NSError *themeError;
        [JobsThemeCenter.shared configureWithResource:@"JobsThemeResources"
                                        fileExtension:@"json"
                                               bundle:NSBundle.mainBundle
                                                error:&themeError];
        if (themeError) NSLog(@"JobsTheme 数据包加载失败：%@", themeError.localizedDescription);
        UIApplication.sharedApplication.byIdleTimerDisabled(NO);
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
        ((JobsOCSplashMediaCache *)JobsOCSplashMediaCache.shared()).resumePendingVideoPreloads();
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
            JobsOCSplashConfiguration *configuration = JobsOCSplashConfigurationForNextLaunch();
            configuration
                .byLanguageCode(LanMgr.languageCodeByAppLanguage(LanMgr.language))
                .byCountdownSeconds(@8)
                .bySkipButtonVisible(YES)
                .byTapAction(JobsOCSplashAction.none())
                .byShakeAction(JobsOCSplashAction.none());
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
            data
                .byBaseUrl(This.jobsBaseUrl())
                .byCdnUrl(@"");
            //data.urlFilters = nil;
            //data.cacheDirPathFilters = nil;
            data
                .bySecurityPolicy(AFSecurityPolicy.initByModeNone)
                .byDebugLogEnabled(YES)
                .bySessionConfiguration(NSURLSessionConfiguration.defaultSessionConfiguration);
            [data addUrlFilter:YTKUrlArgumentsFilter.filterWithArguments(jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
                @jobs_strongify(self)
                if(self.appVersion()) [data setValue:self.appVersion() forKey:@"version"];
            }))];
        });
    };
}
#pragma mark —— KTVHTTPCache
-(jobsByVoidBlock _Nonnull)KTVHTTP{
    return ^(){
        if ([KTVHTTPCache proxyIsRunning]) return;
        NSError *error = nil;
        BOOL isProxyStarted = [KTVHTTPCache proxyStart:&error];
        if(!isProxyStarted) JobsLog(@"KTVHTTPCache proxyStart failed: %@", error ? error.description : @"unknown error")
    };
}
#pragma mark —— 欢迎引导页面
-(jobsByVoidBlock _Nonnull)guide{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.window.byRootViewController(self.isAppFirstLaunch() ? JobsWelcomeVC.new : AppDelegate.tabBarVC);
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
        TABAnimated.sharedAnimated.byOpenLog(YES);
        ///开启后，会在每一个动画元素上增加一个红色的数字，该数字表示该动画元素所在的下标，方便快速定位某个动画元素。
//        TABAnimated.sharedAnimated.openAnimationTag = YES;
//        TABAnimated.sharedAnimated.animationType;/// 全局动画类型
//        TABAnimated.sharedAnimated.animatedHeightCoefficient;/// 动画高度与视图原有高度的比例系数，该属性仅仅对`UILabel`生效。
//        TABAnimated.sharedAnimated.animatedColor;/// 全局动画内容颜色，默认值为0xEEEEEE
        TABAnimated.sharedAnimated.byAnimatedBackgroundColor(JobsLightGrayColor);
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
        ((JobsOCKeyboardMgr *)JobsOCKeyboardMgr.shared()).start();
    };
}

-(jobsByVoidBlock _Nonnull)makeIQKeyboardManagerConfig{
    return ^(){
        jobsMakeIQKeyboardManager(^(__kindof IQKeyboardManager * _Nullable manager) {
            manager
                .byEnable(YES) /// 控制整个功能是否启用
                .byShouldResignOnTouchOutside(YES)
                .byShouldToolbarUsesTextFieldTintColor(YES) /// 使用 TextField 的 tintColor
                .byToolbarManageBehavior(IQAutoToolbarBySubviews)
                .byEnableAutoToolbar(NO)
                .byShouldShowToolbarPlaceholder(YES)
                .byPlaceholderFont(UIFontWeightBoldSize(JobsWidth(17)))
                .byKeyboardDistanceFromTextField(10.0f);
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
            configure.byTitleColor(HEXCOLOR(0x3D4A58));
            // 导航栏标题字体
            configure.byTitleFont(UIFontWeightBoldSize(16));
            // 导航栏返回按钮样式
            configure.byBackStyle(GKNavigationBarBackStyleBlack);
            // 导航栏左右item间距
            configure.byNavItemSpacing(@(JobsWidth(12.0f)), @(JobsWidth(12.0f)));
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
            center.byDelegate(self);
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
        reach.byReachableOnWWAN(NO);
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

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN TABAnimated
@implementation TABAnimated (JobsLocalPropertyDSLAutogen_3048ed2d28)
-(JobsRetTABAnimatedByBOOLBlock _Nonnull)byOpenLog{
    @jobs_weakify(self)
    return ^__kindof TABAnimated * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setOpenLog:data];
        return self;
    };
}

-(JobsRetTABAnimatedByUIColorBlock _Nonnull)byAnimatedBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof TABAnimated * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setAnimatedBackgroundColor:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END TABAnimated
