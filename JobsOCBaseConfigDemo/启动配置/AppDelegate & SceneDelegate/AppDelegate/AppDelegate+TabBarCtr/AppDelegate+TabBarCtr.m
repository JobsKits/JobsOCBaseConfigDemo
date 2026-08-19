//
//  AppDelegate+TabBarCtr.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate+TabBarCtr.h"

static NSString *const JobsOCDemoListUsesTabBarEntryUserDefaultsKey = @"com.BSports.JobsOCDemoListUsesTabBarEntryUserDefaultsKey";

BOOL JobsOCDemoListUsesTabBarEntry(void) {
    return [NSUserDefaults.standardUserDefaults boolForKey:JobsOCDemoListUsesTabBarEntryUserDefaultsKey];
}

void JobsOCSetDemoListUsesTabBarEntry(BOOL usesTabBarEntry) {
    [NSUserDefaults.standardUserDefaults setBool:usesTabBarEntry
                                          forKey:JobsOCDemoListUsesTabBarEntryUserDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

__kindof UIViewController *JobsOCMakeAppRootViewController(void) {
    UIViewController *rootViewController = nil;
    if (JobsOCDemoListUsesTabBarEntry()) {
        AppDelegate.jobsCustomTabBarVC.customSelectIndex(0);
        rootViewController = AppDelegate.jobsCustomTabBarNavCtrl;
    }else{
        rootViewController = ViewController_1.new.navCtrl();
    }
    rootViewController.view.byFrame(UIScreen.mainScreen.bounds);
    return rootViewController;
}

void JobsOCApplyAppRootViewController(void) {
    for (UIWindow *window in UIApplication.sharedApplication.windows) {
        if (!window.windowScene || window.windowScene.activationState == UISceneActivationStateUnattached) continue;
        window
            .byRootViewController(JobsOCMakeAppRootViewController())
            .byMakeKeyAndVisible();
    }
}
NSUInteger DefaultIndex = 2; // 默认从第3个开始初始显示
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
@implementation AppDelegate (TabBarCtr)
#pragma mark —— 配置一些普通的控制器
@dynamic tabBarVC;
static JobsTabBarVC *_tabBarVC = nil;
+(JobsTabBarVC *)tabBarVC{
    if(!_tabBarVC){
        @jobs_weakify(self)
        _tabBarVC = jobsMakeSharedManagerTabBarVC(^(__kindof JobsTabBarVC * _Nullable tabBarVC) {
            tabBarVC
                .byAnimationAlert(YES)
                .byPlaySound(YES)
                .byFeedbackGenerator(YES)
                .byOpenScrollTabbar(NO)
        //    tabBarVC.isShakerAnimation = YES;
            .actionRetBoolByUIntegerBlock(^BOOL(NSUInteger data) {
                @jobs_strongify(self)
                for (JobsTabBarItemConfig *tabBarItemConfig in self.tabBarItemConfigMutArr) {
                    if(tabBarItemConfig.isNeedjump){
                        toastBy(@"这个跳开".jobsTr());
                        return NO;
                    }
                };return YES;
            });
        });
    };return _tabBarVC;
}

+(void)setTabBarVC:(JobsTabBarVC *)tabBarVC{
    _tabBarVC = tabBarVC;
}
@dynamic jobsCustomTabBarVC;
static JobsCustomTabBarVC *_jobsCustomTabBarVC = nil;
+(JobsCustomTabBarVC *)jobsCustomTabBarVC{
    if(!_jobsCustomTabBarVC){
        _jobsCustomTabBarVC = jobsMakeSharedManagerCustomTabBarVC(^(__kindof JobsCustomTabBarVC * _Nullable tabBarVC) {
            tabBarVC.byViewControllers(AppDelegate.viewCtrlByTabBarCtrlConfigMutArr);
            NSLog(@"");
        });
    };return _jobsCustomTabBarVC;
}

+(void)setJobsCustomTabBarVC:(JobsCustomTabBarVC *)jobsCustomTabBarVC{
    _jobsCustomTabBarVC = jobsCustomTabBarVC;
}
@dynamic lZTabBarCtrl;
static LZTabBarController *_lZTabBarCtrl = nil;
+(LZTabBarController *)lZTabBarCtrl{
    if(!_lZTabBarCtrl){
        @jobs_weakify(self)
        _lZTabBarCtrl = LZTabBarController.createTabBarController(^LZTabBarConfig *(LZTabBarConfig *config) {
            @jobs_strongify(self)
            return self.lZTabBarConfig;
        });
    };return _lZTabBarCtrl;
}

+(void)setLZTabBarCtrl:(LZTabBarController *)lZTabBarCtrl{
    _lZTabBarCtrl = lZTabBarCtrl;
}
#pragma mark —— 配置一些导航控制器
@dynamic tabBarNavCtrl;
static UINavigationController *_tabBarNavCtrl = nil;
+(UINavigationController *)tabBarNavCtrl{
    if(!_tabBarNavCtrl){
        _tabBarNavCtrl = self.tabBarVC.navCtrl();
        _tabBarNavCtrl.byHidesBottomBarWhenPushed(YES);
    };return _tabBarNavCtrl;
}

+(void)setTabBarNavCtrl:(UINavigationController *)tabBarNavCtrl{
    _tabBarNavCtrl = tabBarNavCtrl;
}
@dynamic jobsCustomTabBarNavCtrl;
static UINavigationController *_jobsCustomTabBarNavCtrl = nil;
+(UINavigationController *)jobsCustomTabBarNavCtrl{
    if(!_jobsCustomTabBarNavCtrl){
        _jobsCustomTabBarNavCtrl = self.jobsCustomTabBarVC.navCtrl();
        _jobsCustomTabBarNavCtrl.byHidesBottomBarWhenPushed(YES);
    };return _jobsCustomTabBarNavCtrl;
}

+(jobsByUINavigationControllerBlock _Nonnull)setJobsTabBarNavCtrl{
    return ^(UINavigationController * jobsCustomTabBarNavCtrl){
        _jobsCustomTabBarNavCtrl = jobsCustomTabBarNavCtrl;
    };
}
@dynamic lZTabBarNavCtrl;
static UINavigationController *_lZTabBarNavCtrl = nil;
+(UINavigationController *)lZTabBarNavCtrl{
    if(!_lZTabBarNavCtrl){
        _lZTabBarNavCtrl = self.lZTabBarCtrl.navCtrl();
        _lZTabBarNavCtrl.byHidesBottomBarWhenPushed(YES);
    };return _lZTabBarNavCtrl;
}

+(void)setLZTabBarNavCtrl:(UINavigationController *)lZTabBarNavCtrl{
    _lZTabBarNavCtrl = lZTabBarNavCtrl;
}
#pragma mark —— 数据源
@dynamic lZTabBarConfig;
static LZTabBarConfig *_lZTabBarConfig = nil;
+(LZTabBarConfig *)lZTabBarConfig{
    if(!_lZTabBarConfig){
        @jobs_weakify(self)
        _lZTabBarConfig = jobsMakeLZTabBarConfig(^(__kindof LZTabBarConfig * _Nullable data) {
            @jobs_strongify(self)
            data
                .byViewControllers(self.viewCtrlByTabBarCtrlConfigMutArr)
                .byNormalImages(self.imageUnselectedNameMutArr)
                .bySelectedImages(self.imageSelectedNameMutArr)
                .byTitles(self.tabBarItemTitleMutArr)
                .byIsNavigation(NO);
        });
    };return _lZTabBarConfig;
}

+(void)setLZTabBarConfig:(LZTabBarConfig *)lZTabBarConfig{
    _lZTabBarConfig = lZTabBarConfig;
}
@dynamic jobsCustomTabBarConfig;
static JobsCustomTabBarConfig *_jobsCustomTabBarConfig = nil;
+(JobsCustomTabBarConfig *)jobsCustomTabBarConfig{
    _jobsCustomTabBarConfig = jobsMakeSharedManagerCustomTabBarConfig(^(__kindof JobsCustomTabBarConfig * _Nullable tabBarConfig) {
        tabBarConfig
            .byTabBarHeight(JobsWidth(60))
            .byTabBarWidth(JobsWidth(389))
    //    tabBarConfig.tabBarX = JobsWidth(0);
    //    tabBarConfig.tabBarY = JobsWidth(0);
    //    tabBarConfig.tabBarSize = CGSizeMake(JobsWidth(0), JobsWidth(0));
    //    tabBarConfig.tabBarOrigin = CGPointMake(JobsWidth(0), JobsWidth(0));
    //    tabBarConfig.tabBarFrame = CGRectMake(JobsWidth(0), JobsWidth(0), JobsWidth(0), JobsWidth(0));

            .byTabBarBackgroundColor(JobsCyanColor)
            .byTabBarBackgroundImage(nil)
            .byTabBarItems(self.tabBarItemMutArr)
            .byViewControllers(self.viewCtrlByTabBarCtrlConfigMutArr)
            .byTabBarItemYOffsets(nil);
    });return _jobsCustomTabBarConfig;
}

+(void)setJobsCustomTabBarConfig:(JobsCustomTabBarConfig *)jobsCustomTabBarConfig{
    _jobsCustomTabBarConfig = jobsCustomTabBarConfig;
}
@dynamic tabBarItemConfigMutArr;
static NSMutableArray <__kindof JobsTabBarItemConfig *>*_tabBarItemConfigMutArr = nil;
+(NSMutableArray <__kindof JobsTabBarItemConfig *>*)tabBarItemConfigMutArr{
    if(!_tabBarItemConfigMutArr){
        @jobs_weakify(self)
        _tabBarItemConfigMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            data.add(jobsMakeTabBarItemConfig(^(__kindof JobsTabBarItemConfig * _Nullable config) {
                @jobs_strongify(self)
                config
                    .byVc(self.viewCtrlMutArr[0])
                    .byTitle(self.tabBarItemTitleMutArr[0])
                    .byImageSelected(self.imageSelectedMutArr[0])
                    .byImageUnselected(self.imageUnSelectedMutArr[0])
                    .byHumpOffsetY(0)
                    .byLottieName(nil)
                    .byXOffset(landscapeValue(JobsWidth(200)))
                    .byTabBarItemWidth(landscapeValue(JobsWidth(100)))
                    .bySpacing(JobsWidth(3))
                    .byTag(1)
                    .byNeedCheckLogin(NO)
                    .byNotNeedCheckLogin(YES)
                    .byNeedJump(NO);
            }))
            .add(jobsMakeTabBarItemConfig(^(__kindof JobsTabBarItemConfig * _Nullable config) {
                @jobs_strongify(self)
                config
                    .byVc(self.viewCtrlMutArr[1])
                    .byTitle(self.tabBarItemTitleMutArr[1])
                    .byImageSelected(self.imageSelectedMutArr[1])
                    .byImageUnselected(self.imageUnSelectedMutArr[1])
                    .byHumpOffsetY(0)
                    .byLottieName(nil)
                    .byXOffset(landscapeValue(JobsWidth(5)))
                    .byTabBarItemWidth(landscapeValue(JobsWidth(100)))
                    .bySpacing(JobsWidth(3))
                    .byTag(2)
                    .byNeedCheckLogin(NO)
                    .byNotNeedCheckLogin(YES)
                    .byNeedJump(NO);
            }))
            .add(jobsMakeTabBarItemConfig(^(__kindof JobsTabBarItemConfig * _Nullable config) {
                @jobs_strongify(self)
                config
                    .byVc(self.viewCtrlMutArr[2])
                    .byTitle(self.tabBarItemTitleMutArr[2])
                    .byImageSelected(self.imageSelectedMutArr[2])
                    .byImageUnselected(self.imageUnSelectedMutArr[2])
                    .byHumpOffsetY(0)
                    .byLottieName(nil)
                    .byXOffset(landscapeValue(JobsWidth(5)))
                    .byTabBarItemWidth(landscapeValue(JobsWidth(50)))
                    .bySpacing(JobsWidth(3))
                    .byTag(3)
                    .byNeedCheckLogin(NO)
                    .byNotNeedCheckLogin(YES)
                    .byNeedJump(NO);
            }))
            .add(jobsMakeTabBarItemConfig(^(__kindof JobsTabBarItemConfig * _Nullable config) {
                @jobs_strongify(self)
                config
                    .byVc(self.viewCtrlMutArr[3])
                    .byTitle(self.tabBarItemTitleMutArr[3])
                    .byImageSelected(self.imageSelectedMutArr[3])
                    .byImageUnselected(self.imageUnSelectedMutArr[3])
                    .byHumpOffsetY(0)
                    .byLottieName(nil)
                    .byXOffset(landscapeValue(JobsWidth(5)))
                    .byTabBarItemWidth(landscapeValue(JobsWidth(50)))
                    .bySpacing(JobsWidth(3))
                    .byTag(4)
                    .byNeedCheckLogin(NO)
                    .byNotNeedCheckLogin(YES)
                    .byNeedJump(NO);
            }))
            .add(jobsMakeTabBarItemConfig(^(__kindof JobsTabBarItemConfig * _Nullable config) {
                @jobs_strongify(self)
                config
                    .byVc(self.viewCtrlMutArr[4])
                    .byTitle(self.tabBarItemTitleMutArr[4])
                    .byImageSelected(self.imageSelectedMutArr[4])
                    .byImageUnselected(self.imageUnSelectedMutArr[4])
                    .byHumpOffsetY(0)
                    .byLottieName(nil)
                    .byXOffset(landscapeValue(JobsWidth(5)))
                    .byTabBarItemWidth(landscapeValue(JobsWidth(100)))
                    .bySpacing(JobsWidth(3))
                    .byTag(5)
                    .byNeedCheckLogin(NO)
                    .byNotNeedCheckLogin(YES)
                    .byNeedJump(NO);
            }));
        });
    };return _tabBarItemConfigMutArr;
}

+(void)setTabBarItemConfigMutArr:(NSMutableArray<__kindof JobsTabBarItemConfig *> *)tabBarItemConfigMutArr{
    _tabBarItemConfigMutArr = tabBarItemConfigMutArr;
}
@dynamic tabBarItemMutArr;
static NSMutableArray <__kindof UIButton *>*_tabBarItemMutArr = nil;
+(NSMutableArray <__kindof UIButton *>*)tabBarItemMutArr{
    if(!_tabBarItemMutArr){
        _tabBarItemMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof UIButton *>* _Nullable data) {
            @jobs_weakify(self)
            data.add(BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                @jobs_strongify(self)
                buttonModel.byNormalImage(self.imageUnSelectedMutArr[0])
                           .byHighlightImage(self.imageSelectedMutArr[0])
                           .byTitle(AppDelegate.tabBarItemTitleMutArr[0])
                           .byTitleFont(bayonRegular(14))
                           .byTitleCor(@"#FFFFFF".jobsCor())
                           .byImagePlacement(NSDirectionalRectEdgeTop)
                           .byTextAlignment(NSTextAlignmentCenter)
                           .bySubTextAlignment(NSTextAlignmentCenter)
                           .byImagePadding(JobsWidth(5))
                           .byBaseBackgroundColor(JobsClearColor)
                           .byBackgroundImage(DefaultIndex == 0 ? @"TabBarItem选中的背景色".img :@"TabBarItem选中的背景色（透明）".img);
            })).onClickBy(^(__kindof UIButton *x){
                x.bySelected(!x.selected);
                ((MyAppTools *)MyAppTools.jobsSharedManager()).loginWork = FMLoginWork_MyFav;
                @jobs_strongify(self)
//                 [self isLogin:^{
//                     @jobs_strongify(self)
//                     [AppDelegate button:x index:0];
//                     if (self.objBlock) self.objBlock(x);
//                 }];
                [AppDelegate button:x index:0];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            }))
            .add(BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                @jobs_strongify(self)
                buttonModel.byNormalImage(self.imageUnSelectedMutArr[1])
                           .byHighlightImage(self.imageSelectedMutArr[1])
                           .byTitle(AppDelegate.tabBarItemTitleMutArr[1])
                           .byTitleFont(bayonRegular(14))
                           .byTitleCor(@"#FFFFFF".jobsCor())
                           .byImagePlacement(NSDirectionalRectEdgeTop)
                           .byTextAlignment(NSTextAlignmentCenter)
                           .bySubTextAlignment(NSTextAlignmentCenter)
                           .byImagePadding(JobsWidth(5))
                           .byBaseBackgroundColor(JobsClearColor)
                           .byBackgroundImage(DefaultIndex == 1 ? @"TabBarItem选中的背景色".img  :@"TabBarItem选中的背景色（透明）".img);
            })).onClickBy(^(__kindof UIButton *x){
                x.bySelected(!x.selected);
                ((MyAppTools *)MyAppTools.jobsSharedManager()).loginWork = FMLoginWork_MyBank;
                @jobs_weakify(self)
//                 [self isLogin:^{
//                     @jobs_strongify(self)
//                     [AppDelegate button:x index:1];
//                     if (self.objBlock) self.objBlock(x);
//                 }];
                [AppDelegate button:x index:1];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            }))
            .add(BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                @jobs_strongify(self)
                buttonModel.byNormalImage(self.imageUnSelectedMutArr[2])
                           .byHighlightImage(self.imageSelectedMutArr[2])
                           .byTitle(AppDelegate.tabBarItemTitleMutArr[2])
                           .byTitleFont(bayonRegular(14))
                           .byTitleCor(@"#FFFFFF".jobsCor())
                           .byImagePlacement(NSDirectionalRectEdgeTop)
                           .byTextAlignment(NSTextAlignmentCenter)
                           .bySubTextAlignment(NSTextAlignmentCenter)
                           .byImagePadding(JobsWidth(5))
                           .byBaseBackgroundColor(JobsClearColor)
                           .byBackgroundImage(@"TabBarItem选中的背景色（透明）".img);
//                DefaultIndex == 2 ? @"TabBarItem选中的背景色".img :@"TabBarItem选中的背景色（透明）".img;
            })).onClickBy(^(__kindof UIButton *x){
                @jobs_strongify(self)
                x.bySelected(!x.selected);
                [AppDelegate button:x index:2];
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            }))
            .add(BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                @jobs_strongify(self)
                buttonModel.byNormalImage(self.imageUnSelectedMutArr[3])
                           .byHighlightImage(self.imageSelectedMutArr[3])
                           .byTitle(AppDelegate.tabBarItemTitleMutArr[3])
                           .byTitleFont(bayonRegular(14))
                           .byTitleCor(@"#FFFFFF".jobsCor())
                           .byImagePlacement(NSDirectionalRectEdgeTop)
                           .byTextAlignment(NSTextAlignmentCenter)
                           .bySubTextAlignment(NSTextAlignmentCenter)
                           .byImagePadding(JobsWidth(5))
                           .byBaseBackgroundColor(JobsClearColor)
                           .byBackgroundImage(DefaultIndex == 3 ? @"TabBarItem选中的背景色".img :@"TabBarItem选中的背景色（透明）".img);
            })).onClickBy(^(__kindof UIButton *x){
                @jobs_strongify(self)
                ((MyAppTools *)MyAppTools.jobsSharedManager()).loginWork = FMLoginWork_Default;
                x.bySelected(!x.selected);
                [AppDelegate button:x index:3];
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            }))
            .add(BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                @jobs_strongify(self)
                buttonModel.byNormalImage(self.imageUnSelectedMutArr[4])
                           .byHighlightImage(self.imageSelectedMutArr[4])
                           .byTitle(AppDelegate.tabBarItemTitleMutArr[4])
                           .byTitleFont(bayonRegular(14))
                           .byTitleCor(@"#FFFFFF".jobsCor())
                           .byImagePlacement(NSDirectionalRectEdgeTop)
                           .byTextAlignment(NSTextAlignmentCenter)
                           .bySubTextAlignment(NSTextAlignmentCenter)
                           .byImagePadding(JobsWidth(5))
                           .byBaseBackgroundColor(JobsClearColor)
                           .byBackgroundImage(DefaultIndex == 4 ? @"TabBarItem选中的背景色".img :@"TabBarItem选中的背景色（透明）".img);
            })).onClickBy(^(__kindof UIButton *x){
                @jobs_strongify(self)
                x.bySelected(!x.selected);
                [AppDelegate button:x index:4];
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            }));
        });
    } return _tabBarItemMutArr;
}

+(void)setTabBarItemMutArr:(NSMutableArray<__kindof UIButton *> *)tabBarItemMutArr{
    _tabBarItemMutArr = tabBarItemMutArr;
}
@dynamic tabBarItemTitleMutArr;
static NSMutableArray <__kindof NSString *>*_tabBarItemTitleMutArr = nil;
+(NSMutableArray <__kindof NSString *>*)tabBarItemTitleMutArr{
    if(!_tabBarItemTitleMutArr){
        _tabBarItemTitleMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof NSString *>*_Nullable data) {
            data
                .add(@"MY FAV".jobsTr())
                .add(@"BANK".jobsTr())
                .add(@"INCENTIVE".jobsTr())
                .add(@"INVITE".jobsTr())
                .add(@"CONTACT US".jobsTr());
        });
    };return _tabBarItemTitleMutArr;
}

+(void)setTabBarItemTitleMutArr:(NSMutableArray<__kindof NSString *> *)tabBarItemTitleMutArr{
    _tabBarItemTitleMutArr = tabBarItemTitleMutArr;
}
@dynamic imageSelectedNameMutArr;
static NSMutableArray <__kindof NSString *>*_imageSelectedNameMutArr = nil;
+(NSMutableArray <__kindof NSString *>*)imageSelectedNameMutArr{
    if(!_imageSelectedNameMutArr){
        _imageSelectedNameMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof NSString *>*_Nullable data) {
            data.add(@"MY FAV_已点击")
                .add(@"BANK_已点击")
                .add(@"INCENTIVE_已点击")
                .add(@"INVITE_已点击")
                .add(@"CONTACT US_已点击");
        });
    };return _imageSelectedNameMutArr;
}

+(void)setImageSelectedNameMutArr:(NSMutableArray<__kindof NSString *> *)imageSelectedNameMutArr{
    _imageSelectedNameMutArr = imageSelectedNameMutArr;
}
@dynamic imageUnselectedNameMutArr;
static NSMutableArray <__kindof NSString *>*_imageUnselectedNameMutArr = nil;
+(NSMutableArray <__kindof NSString *>*)imageUnselectedNameMutArr{
    if(!_imageUnselectedNameMutArr){
        _imageUnselectedNameMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof NSString *>*_Nullable data) {
            data.add(@"MY FAV_未点击")
                .add(@"BANK_未点击")
                .add(@"INCENTIVE_未点击")
                .add(@"INVITE_未点击")
                .add(@"CONTACT US_未点击");
        });
    };return _imageUnselectedNameMutArr;
}

+(void)setImageUnselectedNameMutArr:(NSMutableArray<__kindof NSString *> *)imageUnselectedNameMutArr{
    _imageUnselectedNameMutArr = imageUnselectedNameMutArr;
}
@dynamic imageSelectedMutArr;
static NSMutableArray <__kindof UIImage *>*_imageSelectedMutArr = nil;
+(NSMutableArray <__kindof UIImage *>*)imageSelectedMutArr{
    if(!_imageSelectedMutArr){
        @jobs_weakify(self)
        _imageSelectedMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof UIImage *>*_Nullable data) {
            @jobs_strongify(self)
            for (NSString *imageSelectedName in self.imageSelectedNameMutArr) {
                data.add(imageSelectedName.img);
            }
        });
    };return _imageSelectedMutArr;
}

+(void)setImageSelectedMutArr:(NSMutableArray<__kindof UIImage *> *)imageSelectedMutArr{
    _imageSelectedMutArr = imageSelectedMutArr;
}
@dynamic imageUnSelectedMutArr;
static NSMutableArray <__kindof UIImage *>*_imageUnSelectedMutArr = nil;
+(NSMutableArray <__kindof UIImage *>*)imageUnSelectedMutArr{
    if(!_imageUnSelectedMutArr){
        @jobs_weakify(self)
        _imageUnSelectedMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof UIImage *>*_Nullable data) {
            @jobs_strongify(self)
            for (NSString *imageUnSelectedName in self.imageUnselectedNameMutArr) {
                data.add(imageUnSelectedName.img);
            }
        });
    };return _imageUnSelectedMutArr;
}

+(void)setImageUnSelectedMutArr:(NSMutableArray<__kindof UIImage *> *)imageUnSelectedMutArr{
    _imageUnSelectedMutArr = imageUnSelectedMutArr;
}
@dynamic viewCtrlByTabBarCtrlConfigMutArr;
static NSMutableArray <__kindof UIViewController *>*_viewCtrlByTabBarCtrlConfigMutArr = nil;
+(NSMutableArray <__kindof UIViewController *>*)viewCtrlByTabBarCtrlConfigMutArr{
    if(!_viewCtrlByTabBarCtrlConfigMutArr){
        @jobs_weakify(self)
        _viewCtrlByTabBarCtrlConfigMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            for (JobsTabBarItemConfig *tabBarCtrlConfig in self.tabBarItemConfigMutArr) {
                data.add(tabBarCtrlConfig.vc);
            }
        });
    };return _viewCtrlByTabBarCtrlConfigMutArr;
}

+(void)setViewCtrlByTabBarCtrlConfigMutArr:(NSMutableArray<__kindof UIViewController *> *)viewCtrlByTabBarCtrlConfigMutArr{
    _viewCtrlByTabBarCtrlConfigMutArr = viewCtrlByTabBarCtrlConfigMutArr;
}
@dynamic viewCtrlMutArr;
static NSMutableArray <__kindof UIViewController *>*_viewCtrlMutArr = nil;
+(NSMutableArray <__kindof UIViewController *>*)viewCtrlMutArr{
    if(!_viewCtrlMutArr){
        _viewCtrlMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof UIViewController *>*_Nullable data) {
            data
                .add(ViewController_1.new)
                .add(ViewController_2.new)
                .add(ViewController_3.new)
                .add(ViewController_4.new)
                .add(ViewController_5.new);
        });
    };return _viewCtrlMutArr;
}

+(void)setViewCtrlMutArr:(NSMutableArray<__kindof UIViewController *> *)viewCtrlMutArr{
    _viewCtrlMutArr = viewCtrlMutArr;
}
@dynamic navCtrMutArr;
static NSMutableArray <__kindof UINavigationController *>*_navCtrMutArr = nil;
+(NSMutableArray <__kindof UINavigationController *>*)navCtrMutArr{
    if(!_navCtrMutArr){
        @jobs_weakify(self)
        _navCtrMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof UINavigationController *>*_Nullable data) {
            @jobs_strongify(self)
            for (UIViewController *vc in self.viewCtrlMutArr) {
                data.add(vc.navCtrl());
            }
        });
    };return _navCtrMutArr;
}

+(void)setNavCtrMutArr:(NSMutableArray<__kindof UINavigationController *> *)navCtrMutArr{
    _navCtrMutArr = navCtrMutArr;
}
#pragma mark —— 一些公有方法
/// 切换控制器
+(void)button:(__kindof UIButton *)button index:(NSUInteger)index{
    AppDelegate.switchByIndex(index);
    button
        .jobsResetBtnImage(self.imageSelectedMutArr[index])
        .jobsResetBtnTitleCor(@"#C71B1B".jobsCor());
}

+(jobsByNSUIntegerBlock _Nonnull)switchByIndex{
    @jobs_weakify(self)
    return ^(NSUInteger index){
        @jobs_strongify(self)
        int t = 0;
        for (__kindof UIButton *btn in AppDelegate.tabBarItemMutArr) {
            btn
                .jobsResetBtnImage(self.imageUnSelectedMutArr[t])
                .jobsResetBtnTitleCor(@"#8A93A1".jobsCor());
            t+=1;
        }self.jobsCustomTabBarVC.customSelectIndex(index);
    };
}
/// 刷新 TabBarTitle
-(jobsByVoidBlock _Nonnull)refreshTabBarTitle{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        AppDelegate.byTabBarItemTitleMutArr(nil);
        NSArray <NSString *>*titleArr = AppDelegate.tabBarItemTitleMutArr;
        for (NSUInteger index = 0; index < AppDelegate.tabBarItemConfigMutArr.count; index++) {
            if (index >= titleArr.count) break;
            NSString *title = titleArr[index];
            JobsTabBarItemConfig *config = AppDelegate.tabBarItemConfigMutArr[index];
            config.vc.tabBarItem.byTitle(title);
            if (index < AppDelegate.tabBarItemMutArr.count) {
                AppDelegate.tabBarItemMutArr[index].jobsResetBtnTitle(title);
            }
        }
    };
}

@end
#pragma clang diagnostic pop
