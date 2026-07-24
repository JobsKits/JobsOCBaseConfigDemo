//
//  UIViewController+BaseNavigationBar.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+BaseNavigationBar.h"

static NSString *const JobsOCGlobalDarkModeDefaultsKey = @"com.BSports.JobsOCDemoListDarkModeUserDefaultsKey";
static NSInteger const JobsOCDemoThemeButtonTag = 0x4A54484D;

static BOOL JobsOCGlobalDarkModeEnabled(void) {
    id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsOCGlobalDarkModeDefaultsKey];
    if (value) return [value boolValue];
    if (@available(iOS 13.0, *)) {
        return UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark;
    };return NO;
}

static void JobsOCSyncGlobalThemeButtons(UIView *view,
                                         BOOL darkModeEnabled) {
    if ([view isKindOfClass:UIButton.class] && view.tag == JobsOCDemoThemeButtonTag) {
        ((UIButton *)view).bySelected(darkModeEnabled);
    }
    for (UIView *subview in view.subviews) {
        JobsOCSyncGlobalThemeButtons(subview, darkModeEnabled);
    }
}

static void JobsOCApplyGlobalTheme(void) {
    if (@available(iOS 13.0, *)) {
        BOOL darkModeEnabled = JobsOCGlobalDarkModeEnabled();
        UIUserInterfaceStyle style = darkModeEnabled ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight;
        for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
            if (![scene isKindOfClass:UIWindowScene.class]) continue;
            for (UIWindow *window in ((UIWindowScene *)scene).windows) {
                window.overrideUserInterfaceStyle = style;
                JobsOCSyncGlobalThemeButtons(window, darkModeEnabled);
            }
        }
    }
}

static BOOL JobsOCToggleGlobalTheme(void) {
    BOOL darkModeEnabled = !JobsOCGlobalDarkModeEnabled();
    [NSUserDefaults.standardUserDefaults setBool:darkModeEnabled
                                          forKey:JobsOCGlobalDarkModeDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
    JobsOCApplyGlobalTheme();
    return darkModeEnabled;
}

static BOOL JobsOCIsDemoRootViewController(UIViewController *viewController) {
    return [NSStringFromClass(viewController.class) isEqualToString:@"ViewController_1"];
}

static BOOL JobsOCIsDemoNavigationChild(UIViewController *viewController) {
    NSString *className = NSStringFromClass(viewController.class);
    if ([className containsString:@"Demo"]) return YES;
    UINavigationController *navigationController = viewController.navigationController;
    UIViewController *rootViewController = navigationController.viewControllers.firstObject;
    if (rootViewController != viewController && JobsOCIsDemoRootViewController(rootViewController)) return YES;
    UIViewController *presenter = viewController.presentingViewController ?: navigationController.presentingViewController;
    while (presenter) {
        if (JobsOCIsDemoRootViewController(presenter) ||
            JobsOCIsDemoRootViewController(presenter.navigationController.viewControllers.firstObject)) {
            return YES;
        }
        UIViewController *nextPresenter = presenter.presentingViewController ?:
            presenter.navigationController.presentingViewController;
        if (nextPresenter == presenter) break;
        presenter = nextPresenter;
    };return NO;
}

static BOOL JobsOCIsSystemNavigationBarDemo(UIViewController *viewController) {
    return [NSStringFromClass(viewController.class) isEqualToString:@"JobsNavigationDemoVC"];
}

@interface UIViewController (BaseNavigationBarTheme)

-(UIButton *)jobs_demoThemeButton;
-(UIBarButtonItem *)jobs_demoThemeBarButtonItem;

@end

@implementation UIViewController (BaseNavigationBar)
-(JobsRetVCByIDBlock _Nonnull)goBack{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(id data){
        @jobs_strongify(self)
        if(self.objBlock) self.objBlock(data);
        if (self.navigationController) {
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [self dismissViewControllerAnimated:YES completion:nil];
        };return self;
    };
}

-(void)jobs_ensureDemoThemeButton{
    if (@available(iOS 13.0, *)) {
        if (!JobsOCIsDemoNavigationChild(self)) return;
        UIButton *themeButton = self.jobs_demoThemeButton.bySelected(JobsOCGlobalDarkModeEnabled());
        UIBarButtonItem *themeItem = self.jobs_demoThemeBarButtonItem;
        if (JobsOCIsSystemNavigationBarDemo(self)) {
            NSArray <UIBarButtonItem *>*items = self.navigationItem.rightBarButtonItems ?: @[];
            if ([items containsObject:themeItem]) return;
            self.navigationItem.rightBarButtonItems = [@[themeItem] arrayByAddingObjectsFromArray:items];
            return;
        }
        NSArray <UIBarButtonItem *>*items = self.gk_navRightBarButtonItems;
        if ([items containsObject:themeItem]) return;
        if (items.count) {
            self.gk_navRightBarButtonItems = [@[themeItem] arrayByAddingObjectsFromArray:items];
        }else if (self.gk_navRightBarButtonItem){
            UIBarButtonItem *businessItem = self.gk_navRightBarButtonItem;
            self.gk_navRightBarButtonItem = nil;
            self.gk_navRightBarButtonItems = @[themeItem, businessItem];
        }else self.gk_navRightBarButtonItems = @[themeItem];
        themeButton.bySelected(JobsOCGlobalDarkModeEnabled());
    }
}
#pragma mark —— 全局主题切换按钮
JobsKey(_jobs_demoThemeButton)
-(UIButton *)jobs_demoThemeButton{
    UIButton *button = Jobs_getAssociatedObject(_jobs_demoThemeButton);
    if (!button) {
        UIImage *normalImage = UIImage.new;
        UIImage *selectedImage = UIImage.new;
        UIColor *tintColor = JobsLabelColor;
        if (@available(iOS 13.0, *)) {
            normalImage = [UIImage systemImageNamed:@"moon.circle.fill"];
            selectedImage = [UIImage systemImageNamed:@"sun.max.circle.fill"];
        }
        button = jobsMakeBaseButton(^(__kindof UIButton * _Nullable button) {
            button
                .normalStateImageBy(normalImage)
                .selectedStateImageBy(selectedImage)
                .onClickBy(^(UIButton *sender) {
                    sender.bySelected(JobsOCToggleGlobalTheme());
                })
                .bySelected(JobsOCGlobalDarkModeEnabled())
                .byTag(JobsOCDemoThemeButtonTag)
                .byTintColor(tintColor)
                .bySize(CGSizeMake(44, 44));
            button.accessibilityLabel = @"切换全局主题";
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_jobs_demoThemeButton, button)
    };return button;
}

JobsKey(_jobs_demoThemeBarButtonItem)
-(UIBarButtonItem *)jobs_demoThemeBarButtonItem{
    UIBarButtonItem *item = Jobs_getAssociatedObject(_jobs_demoThemeBarButtonItem);
    if (!item) {
        item = [UIBarButtonItem.alloc initWithCustomView:self.jobs_demoThemeButton];
        Jobs_setAssociatedRETAIN_NONATOMIC(_jobs_demoThemeBarButtonItem, item)
    };return item;
}

#pragma mark —— Prop_strong()NavigationBar *navigationBar;
JobsKey(_navigationBar)
@dynamic navigationBar;
-(BaseNavigationBar *)navigationBar{
    BaseNavigationBar *NavBar = Jobs_getAssociatedObject(_navigationBar);
    if (!NavBar) {
        @jobs_weakify(self)
        NavBar = jobsMakeBaseNavigationBar(^(__kindof BaseNavigationBar * _Nullable navBar) {
            @jobs_strongify(self)
            /// 优先级:背景图 > 背景色
            navBar.byBgColor(self.bgCor);
            [navBar setBackgroundImage:self.bgImage forBarMetrics:UIBarMetricsDefault];/// 仅仅是 navigationBar 背景
            navBar.titleTextAttributes = @{
                NSForegroundColorAttributeName:self.foregroundColorAttributeNameCor,
                NSShadowAttributeName:self.shadow,
                NSFontAttributeName:self.fontAttributeName
            };/// 设置导航上的title显示样式
            [navBar setBarTintColor:JobsRedColor];/// 一般的业务是全局设置，因为一个App里面只有一个主题
            navBar.byTintColor(JobsLabelColor);/// 系统组件使用语义色，自动适配明暗主题
            navBar.items = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                @jobs_strongify(self)
                data.add(self.navItem);
            });
            navBar.translucent = self.isBarTranslucent;
            navBar.byHidden(self.isHiddenNavigationBar);
            navBar.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
                make.left.right.top.equalTo(self.view);
                make.height.mas_offset(self.jobsNavigationBarHeight);
            });
        });Jobs_setAssociatedRETAIN_NONATOMIC(_navigationBar, NavBar)
    };return NavBar;
}

-(void)setNavigationBar:(BaseNavigationBar *)navigationBar{
    Jobs_setAssociatedRETAIN_NONATOMIC(_navigationBar, navigationBar)
}
#pragma mark —— Prop_strong()UIBarButtonItem *leftBarButtonItem_back;
JobsKey(_leftBarButtonItem_back)
@dynamic leftBarButtonItem_back;
-(UIBarButtonItem *)leftBarButtonItem_back{
    UIBarButtonItem *LeftBarButtonItem_back = Jobs_getAssociatedObject(_leftBarButtonItem_back);
    if (!LeftBarButtonItem_back) {
        if(self.navigationController.viewControllers.count > 1){
            LeftBarButtonItem_back = self.backBtnCategoryItem;
            [self setLeftBarButtonItem_back:LeftBarButtonItem_back];
        }
    };return LeftBarButtonItem_back;
}

- (void)setLeftBarButtonItem_back:(UIBarButtonItem *)leftBarButtonItem_back{
    Jobs_setAssociatedRETAIN_NONATOMIC(_leftBarButtonItem_back, leftBarButtonItem_back)
}
#pragma mark —— Prop_strong()UIColor *bgCor;
JobsKey(_bgCor)
@dynamic bgCor;
-(UIColor *)bgCor{
    UIColor *BgCor = Jobs_getAssociatedObject(_bgCor);
    if (!BgCor) {
        BgCor = JobsLightGrayColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_bgCor, BgCor)
    };return BgCor;
}

-(void)setBgCor:(UIColor *)bgCor{
    Jobs_setAssociatedRETAIN_NONATOMIC(_bgCor, bgCor)
}
#pragma mark —— Prop_assign()CGFloat jobsNavigationBarHeight;
JobsKey(_jobsNavigationBarHeight)
@dynamic jobsNavigationBarHeight;
-(CGFloat)jobsNavigationBarHeight{
    CGFloat jobsNavigationBarHeight = [Jobs_getAssociatedObject(_jobsNavigationBarHeight) floatValue];
    if (jobsNavigationBarHeight == 0) {
        jobsNavigationBarHeight = JobsNavigationBarAndStatusBarHeight(nil);
        Jobs_setAssociatedRETAIN_NONATOMIC(_jobsNavigationBarHeight, @(jobsNavigationBarHeight));
    };return jobsNavigationBarHeight;
}

-(void)setJobsNavigationBarHeight:(CGFloat)jobsNavigationBarHeight{
    Jobs_setAssociatedRETAIN_NONATOMIC(_jobsNavigationBarHeight, @(jobsNavigationBarHeight));
}
#pragma mark —— Prop_assign()BOOL isHiddenNavigationBar
JobsKey(_isHiddenNavigationBar)
@dynamic isHiddenNavigationBar;
-(BOOL)isHiddenNavigationBar{//默认不显示
    return [Jobs_getAssociatedObject(_isHiddenNavigationBar) boolValue];
}

-(void)setIsHiddenNavigationBar:(BOOL)isHiddenNavigationBar{
    [self.navigationController setNavigationBarHidden:isHiddenNavigationBar animated:true];
    Jobs_setAssociatedRETAIN_NONATOMIC(_isHiddenNavigationBar, @(isHiddenNavigationBar))
}
#pragma mark —— Prop_assign()BOOL isBarTranslucent;
JobsKey(_isBarTranslucent)
@dynamic isBarTranslucent;
-(BOOL)isBarTranslucent{//默认
    return [Jobs_getAssociatedObject(_isBarTranslucent) boolValue];
}

-(void)setIsBarTranslucent:(BOOL)isBarTranslucent{
    Jobs_setAssociatedRETAIN_NONATOMIC(_isBarTranslucent, @(isBarTranslucent))
}
#pragma mark —— Prop_strong()NSShadow *shadow;
JobsKey(_shadow)
@dynamic shadow;
-(NSShadow *)shadow{
    NSShadow *Shadow = Jobs_getAssociatedObject(_shadow);
    if (!Shadow) {
        @jobs_weakify(self)
        Shadow = jobsMakeShadow(^(__kindof NSShadow * _Nullable shadow) {
            @jobs_strongify(self)
            Shadow.shadowColor = self.shadowCor;
            Shadow.shadowOffset = CGSizeZero;
        });Jobs_setAssociatedRETAIN_NONATOMIC(_shadow, Shadow)
    };return Shadow;
}

-(void)setShadow:(NSShadow *)shadow{
    Jobs_setAssociatedRETAIN_NONATOMIC(_shadow, shadow)
}
#pragma mark —— Prop_strong()UINavigationItem *navItem;
JobsKey(_navItem)
@dynamic navItem;
-(UINavigationItem *)navItem{
    UINavigationItem *NavItem = Jobs_getAssociatedObject(_navItem);
    if (!NavItem) {
        @jobs_weakify(self)
        NavItem = jobsMakeNavigationItem(^(__kindof UINavigationItem * _Nullable navigationItem) {
            @jobs_strongify(self)
            NavItem.title = self.title;
            NavItem.leftBarButtonItem = self.leftBarButtonItem_back;
        });Jobs_setAssociatedRETAIN_NONATOMIC(_navItem, NavItem)
    };return NavItem;
}

-(void)setNavItem:(UINavigationItem *)navItem{
    Jobs_setAssociatedRETAIN_NONATOMIC(_navItem, navItem)
}
#pragma mark —— Prop_strong()UIColor *foregroundColorAttributeNameCor;
JobsKey(_foregroundColorAttributeNameCor)
@dynamic foregroundColorAttributeNameCor;
-(UIColor *)foregroundColorAttributeNameCor{
    UIColor *ForegroundColorAttributeNameCor = Jobs_getAssociatedObject(_foregroundColorAttributeNameCor);
    if (!ForegroundColorAttributeNameCor) {
        ForegroundColorAttributeNameCor = JobsGreenColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_foregroundColorAttributeNameCor, ForegroundColorAttributeNameCor)
    };return ForegroundColorAttributeNameCor;
}

-(void)setForegroundColorAttributeNameCor:(UIColor *)foregroundColorAttributeNameCor{
    Jobs_setAssociatedRETAIN_NONATOMIC(_foregroundColorAttributeNameCor, foregroundColorAttributeNameCor)
}
#pragma mark —— Prop_strong()UIFont *fontAttributeName;
JobsKey(_fontAttributeName)
@dynamic fontAttributeName;
-(UIFont *)fontAttributeName{
    UIFont *FontAttributeName = Jobs_getAssociatedObject(_fontAttributeName);
    if (!FontAttributeName) {
        FontAttributeName = JobsFontRegular(18);
        Jobs_setAssociatedRETAIN_NONATOMIC(_fontAttributeName, FontAttributeName)
    };return FontAttributeName;
}

-(void)setFontAttributeName:(UIFont *)fontAttributeName{
    Jobs_setAssociatedRETAIN_NONATOMIC(_fontAttributeName, fontAttributeName)
}
#pragma mark —— Prop_strong()UIColor *tintColor;
JobsKey(_tintColor)
@dynamic tintColor;
-(UIColor *)tintColor{
    UIColor *TintColor = Jobs_getAssociatedObject(_tintColor);
    if (!TintColor) {
        TintColor = JobsGreenColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_tintColor, TintColor)
    };return TintColor;
}

-(void)setTintColor:(UIColor *)tintColor{
    Jobs_setAssociatedRETAIN_NONATOMIC(_tintColor, tintColor)
}
#pragma mark —— Prop_strong()UIColor *barTintColor;
JobsKey(_barTintColor)
@dynamic barTintColor;
-(UIColor *)barTintColor{
    UIColor *BarTintColor = Jobs_getAssociatedObject(_barTintColor);
    if (!BarTintColor) {
        BarTintColor = JobsGreenColor;
        Jobs_setAssociatedRETAIN_NONATOMIC(_barTintColor, BarTintColor)
    };return BarTintColor;
}

-(void)setBarTintColor:(UIColor *)barTintColor{
    Jobs_setAssociatedRETAIN_NONATOMIC(_barTintColor, barTintColor)
}
#pragma mark —— Prop_copy()NSString *title;
JobsKey(_title)
@dynamic title;
-(NSString *)title{
    return Jobs_getAssociatedObject(_title);
}

-(void)setTitle:(NSString *)title{
    Jobs_setAssociatedRETAIN_NONATOMIC(_title, title)
}
#pragma mark —— Prop_strong()UIColor *shadowCor;
JobsKey(_shadowCor)
@dynamic shadowCor;
-(UIColor *)shadowCor{
    UIColor *ShadowCor = Jobs_getAssociatedObject(_shadowCor);
    if (!ShadowCor) {
        ShadowCor = RGBA_COLOR(0,
                              0,
                              0,
                              0.8);
        Jobs_setAssociatedRETAIN_NONATOMIC(_shadowCor, ShadowCor)
    };return ShadowCor;
}

-(void)setShadowCor:(UIColor *)shadowCor{
    Jobs_setAssociatedRETAIN_NONATOMIC(_shadowCor, shadowCor)
}

@end
