//
//  UIViewController+BaseNavigationBar.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+BaseNavigationBar.h"
#import <JobsBaseUI/BaseButton.h>
#import <JobsBaseUI/BaseView.h>
#import <JobsBaseUI/UIButton+SimplyMake.h>
#import <JobsBaseUI/UIButton+UI.h>
#import <JobsBaseUI/UIButton+UIControlState.h>

static NSString *const JobsOCGlobalDarkModeDefaultsKey = @"com.BSports.JobsOCDemoListDarkModeUserDefaultsKey";
static NSString *const JobsOCDemoThemeDirectActionIdentifier = @"JobsOCDemoThemeDirectAction";
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
        UIButton *button = (UIButton *)view;
        button.bySelected(darkModeEnabled);
        if ([button.accessibilityIdentifier isEqualToString:JobsOCDemoThemeDirectActionIdentifier]) {
            button.accessibilityLabel = darkModeEnabled
                ? @"切换为白天".tr
                : @"切换为黑夜".tr;
        }
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

static NSArray<UIButton *> *JobsOCDemoBusinessButtonsInView(UIView *view) {
    if ([view isKindOfClass:UIButton.class]) {
        UIButton *button = (UIButton *)view;
        return button.tag == JobsOCDemoThemeButtonTag ? @[] : @[button];
    }
    NSArray<UIView *> *subviews = [view isKindOfClass:UIStackView.class]
        ? ((UIStackView *)view).arrangedSubviews
        : view.subviews;
    NSMutableArray<UIButton *> *buttons = NSMutableArray.array;
    for (UIView *subview in subviews) {
        [buttons addObjectsFromArray:JobsOCDemoBusinessButtonsInView(subview)];
    };return buttons.copy;
}

static __kindof UIButton *JobsOCMakeDemoActionButton(jobsByBtnBlock configure) {
    UIButton *button = jobsMakeBaseButton(configure);
    [button jobsBtnClickEventBlock:^id(UIButton *sender) {
        if (sender.clickBlock) sender.clickBlock(sender);
        return nil;
    }];return button;
}

@interface UIViewController (BaseNavigationBarTheme)

-(UIButton *)jobs_demoThemeButton;
-(UIBarButtonItem *)jobs_demoThemeBarButtonItem;
-(NSArray<UIButton *> *)jobs_demoBusinessButtons;
-(void)jobs_setDemoBusinessButtons:(NSArray<UIButton *> *)buttons;
-(UIView *_Nullable)jobs_demoActionMenuOverlay;
-(void)jobs_setDemoActionMenuOverlay:(UIView *_Nullable)overlay;
-(void)jobs_updateDemoTriggerPresentation;
-(void)jobs_updateDemoBusinessButtonsFromItems:(NSArray<UIBarButtonItem *> *)items
                                     themeItem:(UIBarButtonItem *)themeItem;
-(NSArray<UIButton *> *)jobs_demoBusinessButtonsFromBarButtonItem:(UIBarButtonItem *)item;
-(void)jobs_showDemoActionMenu:(BOOL)show;
-(NSString *)jobs_demoActionTitleForButton:(UIButton *)button
                                     index:(NSInteger)index;
-(void)jobs_addDemoActionMenuRowToView:(UIView *)menuView
                                 title:(NSString *)title
                                 image:(UIImage *_Nullable)image
                                 index:(NSInteger)index
                              rowCount:(NSInteger)rowCount
                                action:(jobsByVoidBlock)action;

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
            NSArray<UIBarButtonItem *> *items = self.navigationItem.rightBarButtonItems ?:
                (self.navigationItem.rightBarButtonItem ? @[self.navigationItem.rightBarButtonItem] : @[]);
            [self jobs_updateDemoBusinessButtonsFromItems:items
                                                themeItem:themeItem];
            self.navigationItem.rightBarButtonItem = nil;
            self.navigationItem.rightBarButtonItems = @[themeItem];
            return;
        }
        NSArray<UIBarButtonItem *> *items = self.gk_navRightBarButtonItems ?:
            (self.gk_navRightBarButtonItem ? @[self.gk_navRightBarButtonItem] : @[]);
        [self jobs_updateDemoBusinessButtonsFromItems:items
                                            themeItem:themeItem];
        self.gk_navRightBarButtonItem = nil;
        self.gk_navRightBarButtonItems = @[themeItem];
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
        @jobs_weakify(self)
        button = JobsOCMakeDemoActionButton(^(__kindof UIButton * _Nullable button) {
            button
                .normalStateImageBy(normalImage)
                .selectedStateImageBy(selectedImage)
                .onClickBy(^(UIButton *sender) {
                    @jobs_strongify(self)
                    if (!self.jobs_demoBusinessButtons.count) {
                        JobsOCToggleGlobalTheme();
                        [self jobs_updateDemoTriggerPresentation];
                    }else [self jobs_showDemoActionMenu:self.jobs_demoActionMenuOverlay == nil];
                })
                .bySelected(JobsOCGlobalDarkModeEnabled())
                .byTag(JobsOCDemoThemeButtonTag)
                .byTintColor(tintColor)
                .bySize(CGSizeMake(44, 44));
            button.accessibilityLabel = @"切换全局主题";
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_jobs_demoThemeButton, button)
        [self jobs_updateDemoTriggerPresentation];
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

JobsKey(_jobs_demoBusinessButtons)
-(NSArray<UIButton *> *)jobs_demoBusinessButtons{
    NSArray<UIButton *> *buttons = Jobs_getAssociatedObject(_jobs_demoBusinessButtons);
    return buttons ?: @[];
}

-(void)jobs_setDemoBusinessButtons:(NSArray<UIButton *> *)buttons{
    Jobs_setAssociatedRETAIN_NONATOMIC(_jobs_demoBusinessButtons, buttons ?: @[])
    [self jobs_updateDemoTriggerPresentation];
}

JobsKey(_jobs_demoActionMenuOverlay)
-(UIView *)jobs_demoActionMenuOverlay{
    return Jobs_getAssociatedObject(_jobs_demoActionMenuOverlay);
}

-(void)jobs_setDemoActionMenuOverlay:(UIView *)overlay{
    Jobs_setAssociatedRETAIN_NONATOMIC(_jobs_demoActionMenuOverlay, overlay)
    [self jobs_updateDemoTriggerPresentation];
}

-(void)jobs_updateDemoTriggerPresentation{
    UIButton *button = Jobs_getAssociatedObject(_jobs_demoThemeButton);
    if (!button) return;
    BOOL opensMenu = self.jobs_demoBusinessButtons.count > 0;
    if (opensMenu) {
        BOOL expanded = self.jobs_demoActionMenuOverlay != nil;
        UIImage *image = [UIImage systemImageNamed:expanded
            ? @"ellipsis.circle.fill"
            : @"ellipsis.circle"];
        button
            .normalStateImageBy(image)
            .selectedStateImageBy(image)
            .bySelected(NO);
        button.accessibilityIdentifier = @"JobsOCDemoActionMenuTrigger";
        button.accessibilityLabel = expanded
            ? @"收起主题与页面操作".tr
            : @"展开主题与页面操作".tr;
        return;
    }
    BOOL darkModeEnabled = JobsOCGlobalDarkModeEnabled();
    button
        .normalStateImageBy([UIImage systemImageNamed:@"moon.circle.fill"])
        .selectedStateImageBy([UIImage systemImageNamed:@"sun.max.circle.fill"])
        .bySelected(darkModeEnabled);
    button.accessibilityIdentifier = JobsOCDemoThemeDirectActionIdentifier;
    button.accessibilityLabel = darkModeEnabled
        ? @"切换为白天".tr
        : @"切换为黑夜".tr;
}

-(void)jobs_updateDemoBusinessButtonsFromItems:(NSArray<UIBarButtonItem *> *)items
                                     themeItem:(UIBarButtonItem *)themeItem{
    BOOL containsThemeItem = [items containsObject:themeItem];
    NSMutableArray<UIBarButtonItem *> *businessItems = NSMutableArray.array;
    for (UIBarButtonItem *item in items) {
        if (item != themeItem) [businessItems addObject:item];
    }
    if (containsThemeItem && !businessItems.count) return;
    NSMutableArray<UIButton *> *businessButtons = NSMutableArray.array;
    for (UIBarButtonItem *item in businessItems) {
        [businessButtons addObjectsFromArray:[self jobs_demoBusinessButtonsFromBarButtonItem:item]];
    }
    [self jobs_setDemoBusinessButtons:businessButtons.copy];
    [self jobs_showDemoActionMenu:NO];
}

-(NSArray<UIButton *> *)jobs_demoBusinessButtonsFromBarButtonItem:(UIBarButtonItem *)item{
    if (item.customView) return JobsOCDemoBusinessButtonsInView(item.customView);
    UIButton *sourceButton = JobsOCMakeDemoActionButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(item.title)
            .jobsResetBtnImage(item.image);
        button.accessibilityLabel = item.accessibilityLabel;
    });
    if (@available(iOS 14.0, *)) {
        if (item.primaryAction) {
            [sourceButton addAction:item.primaryAction
                   forControlEvents:UIControlEventTouchUpInside];
        }else if (item.target && item.action){
            sourceButton.onClickBy(^(UIButton *sender) {
                [UIApplication.sharedApplication sendAction:item.action
                                                         to:item.target
                                                       from:item
                                                   forEvent:nil];
            });
        }
    }else if (item.target && item.action){
        sourceButton.onClickBy(^(UIButton *sender) {
            [UIApplication.sharedApplication sendAction:item.action
                                                     to:item.target
                                                   from:item
                                               forEvent:nil];
        });
    };return @[sourceButton];
}

-(void)jobs_showDemoActionMenu:(BOOL)show{
    UIView *overlay = self.jobs_demoActionMenuOverlay;
    if (overlay) overlay.byRemove();
    [self jobs_setDemoActionMenuOverlay:nil];
    if (!show || !self.jobs_demoBusinessButtons.count) return;
    overlay = jobsMakeBaseView(^(__kindof BaseView * _Nullable view) {
        view
            .byBgColor(JobsClearColor)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self.view);
            });
    });
    NSInteger rowCount = self.jobs_demoBusinessButtons.count + 1;
    UIView *menuView = jobsMakeBaseView(^(__kindof BaseView * _Nullable view) {
        view
            .byBgColor(JobsSecondarySystemBackgroundColor)
            .byCornerRadius(8)
            .byClipsToBounds(YES)
            .addOn(overlay)
            .byAdd(^(MASConstraintMaker *make) {
                if (JobsOCIsSystemNavigationBarDemo(self)) {
                    make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(6);
                }else{
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(6);
                }
                make.right.equalTo(overlay).offset(-12);
                make.width.mas_equalTo(210);
                make.height.mas_equalTo(rowCount * 44);
            });
    });
    @jobs_weakify(self)
    __weak UIView *weakOverlay = overlay;
    __weak UIView *weakMenuView = menuView;
    overlay.addTapGR(^(__kindof UITapGestureRecognizer * _Nullable gesture) {
        @jobs_strongify(self)
        UIView *strongOverlay = weakOverlay;
        UIView *strongMenuView = weakMenuView;
        if (!strongOverlay || !strongMenuView) return;
        CGPoint point = [gesture locationInView:strongOverlay];
        if (CGRectContainsPoint(strongMenuView.frame, point)) return;
        [self jobs_showDemoActionMenu:NO];
    });
    overlay.tapGR.byCancelsTouchesInView(NO);
    [self jobs_setDemoActionMenuOverlay:overlay];
    BOOL darkModeEnabled = JobsOCGlobalDarkModeEnabled();
    [self jobs_addDemoActionMenuRowToView:menuView
                                    title:darkModeEnabled ? @"切换为白天".tr : @"切换为黑夜".tr
                                    image:[UIImage systemImageNamed:darkModeEnabled
                                        ? @"sun.max.circle.fill"
                                        : @"moon.circle.fill"]
                                    index:0
                                 rowCount:rowCount
                                   action:^{
        @jobs_strongify(self)
        JobsOCToggleGlobalTheme();
        [self jobs_showDemoActionMenu:NO];
    }];
    [self.jobs_demoBusinessButtons enumerateObjectsUsingBlock:^(UIButton *sourceButton,
                                                                NSUInteger index,
                                                                BOOL *stop) {
        @jobs_strongify(self)
        [self jobs_addDemoActionMenuRowToView:menuView
                                        title:[self jobs_demoActionTitleForButton:sourceButton
                                                                           index:index]
                                        image:sourceButton.imageByState(sourceButton.jobs_effectiveState)
                                        index:index + 1
                                     rowCount:rowCount
                                       action:^{
            @jobs_strongify(self)
            [self jobs_showDemoActionMenu:NO];
            sourceButton.actionByCode();
        }];
    }];
    [self.view bringSubviewToFront:overlay];
}

-(NSString *)jobs_demoActionTitleForButton:(UIButton *)button
                                     index:(NSInteger)index{
    NSArray<NSString *> *candidates = @[
        button.accessibilityLabel ?: @"",
        button.titleByState(button.jobs_effectiveState) ?: @"",
        button.titleByState(UIControlStateNormal) ?: @""
    ];
    for (NSString *candidate in candidates) {
        NSString *title = [candidate stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        if (title.length) return title;
    };return [NSString stringWithFormat:@"%@ %ld", @"页面操作".tr, (long)index + 1];
}

-(void)jobs_addDemoActionMenuRowToView:(UIView *)menuView
                                 title:(NSString *)title
                                 image:(UIImage *)image
                                 index:(NSInteger)index
                              rowCount:(NSInteger)rowCount
                                action:(jobsByVoidBlock)action{
    UIButton *rowButton = JobsOCMakeDemoActionButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(15))
            .jobsResetBtnTitleCor(JobsLabelColor)
            .jobsResetBtnImage([image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate])
            .jobsResetImagePlacement_Padding(NSDirectionalRectEdgeLeading, 8)
            .jobsResetBtnBgCor(JobsSecondarySystemBackgroundColor)
            .onClickBy(^(UIButton *sender) {
                if (action) action();
            })
            .byContentHorizontalAlignment(UIControlContentHorizontalAlignmentLeft)
            .byTintColor(JobsLabelColor)
            .addOn(menuView)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(menuView).offset(index * 44);
                make.left.right.equalTo(menuView);
                make.height.mas_equalTo(44);
            });
    });
    if (index < rowCount - 1) {
        jobsMakeBaseView(^(__kindof BaseView * _Nullable view) {
            view
                .byBgColor(JobsSeparatorColor)
                .addOn(rowButton)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(rowButton).offset(12);
                    make.right.bottom.equalTo(rowButton);
                    make.height.mas_equalTo(1 / UIScreen.mainScreen.scale);
                });
        });
    }
}

@end
