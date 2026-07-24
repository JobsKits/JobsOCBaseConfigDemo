//
//  UIViewController+BaseNavigationBar.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+BaseNavigationBar.h"
#import <JobsBaseUI/BaseButton.h>
#import <JobsBaseUI/UIButton+SimplyMake.h>
#import <JobsBaseUI/UIButton+UIControlState.h>

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

@end
