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
#import <JobsOCDSL/UIButton+DSL.h>

static NSString *const JobsOCDemoThemeDirectActionIdentifier = @"JobsOCDemoThemeDirectAction";
static NSInteger const JobsOCDemoThemeButtonTag = 0x4A54484D;

static BOOL JobsOCIsDemoRootViewController(UIViewController *viewController) {
    return [NSStringFromClass(viewController.class) isEqualToString:@"ViewController_1"];
}

static UINavigationController *JobsOCNavigationControllerIfStackMember(UIViewController *viewController) {
    UINavigationController *navigationController = viewController.navigationController;
    if (!navigationController || ![navigationController.viewControllers containsObject:viewController]) return nil;
    return navigationController;
}

static BOOL JobsOCIsDemoNavigationChild(UIViewController *viewController) {
    if ([viewController isKindOfClass:UIAlertController.class] ||
        [viewController isKindOfClass:UINavigationController.class] ||
        [viewController isKindOfClass:UITabBarController.class] ||
        [viewController isKindOfClass:UISplitViewController.class]) {
        return NO;
    }
    UINavigationController *navigationController = JobsOCNavigationControllerIfStackMember(viewController);
    BOOL isPresentedPage = viewController.presentingViewController ||
        (navigationController.viewControllers.firstObject == viewController &&
         navigationController.presentingViewController);
    if (!navigationController && !isPresentedPage) return NO;
    NSString *className = NSStringFromClass(viewController.class);
    if ([className containsString:@"Demo"]) return YES;
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
    button.jobsBtnClickEventBlock(^id(UIButton *sender) {
        if (sender.clickBlock) sender.clickBlock(sender);
        return nil;
    });return button;
}

static void JobsOCCollectNavigationTitleLabels(UIView *_Nullable view,
                                               NSMutableArray<UILabel *> *labels) {
    if (!view) return;
    if ([view isKindOfClass:UILabel.class]) [labels addObject:(UILabel *)view];
    for (UIView *subview in view.subviews) {
        JobsOCCollectNavigationTitleLabels(subview, labels);
    }
}

static void JobsOCApplyNavigationTitleColor(UILabel *label,
                                            UIColor *color) {
    if (label.attributedText.length) {
        NSMutableAttributedString *attributedText = label.attributedText.mutableCopy;
        [attributedText addAttribute:NSForegroundColorAttributeName
                               value:color
                               range:NSMakeRange(0, attributedText.length)];
        label.byAttributedString(attributedText);
    }else label.byTextCor(color);
}

static void JobsOCApplyNavigationTitleViewTheme(UIView *_Nullable titleView,
                                                UIColor *mainTitleColor,
                                                UIColor *subTitleColor) {
    NSMutableArray<UILabel *> *labels = NSMutableArray.array;
    JobsOCCollectNavigationTitleLabels(titleView, labels);
    [labels enumerateObjectsUsingBlock:^(UILabel *label,
                                         NSUInteger index,
                                         BOOL *stop) {
        JobsOCApplyNavigationTitleColor(label,
                                        index ? subTitleColor : mainTitleColor);
    }];
}

static void JobsOCApplyNavigationBackButtonTheme(UIButton *button,
                                                 UIColor *foregroundColor,
                                                 UIColor *backgroundColor) {
    UIImage *normalImage = button.imageByState(UIControlStateNormal);
    if (normalImage) {
        button.jobsResetBtnImage([normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]);
    }
    button
        .jobsResetBtnTitleCor(foregroundColor)
        .selectedStateTitleColorBy(foregroundColor)
        .highlightedStateTitleColorBy(foregroundColor)
        .titleColorForStateBy(foregroundColor, UIControlStateSelected | UIControlStateHighlighted)
        .jobsResetBtnBgCor(backgroundColor)
        .jobsResetBtnCornerRadiusValue(JobsWidth(16))
        .byTintColor(foregroundColor);
}

static void JobsOCApplyNavigationBackItemsTheme(NSArray<UIBarButtonItem *> *items,
                                                UIColor *foregroundColor,
                                                UIColor *backgroundColor) {
    for (UIBarButtonItem *item in items) {
        for (UIButton *button in JobsOCDemoBusinessButtonsInView(item.customView)) {
            JobsOCApplyNavigationBackButtonTheme(button,
                                                 foregroundColor,
                                                 backgroundColor);
        }
    }
}

static void JobsOCApplyDemoNavigationTheme(UIViewController *viewController,
                                           JobsThemeCenter *center) {
    UIColor *backgroundColor = center.resolvedColorForKey(JobsThemeColorKeyBackgroundPrimary);
    UIColor *secondaryBackgroundColor = center.resolvedColorForKey(JobsThemeColorKeyBackgroundSecondary);
    UIColor *mainTitleColor = center.resolvedColorForKey(JobsThemeColorKeyTextPrimary);
    UIColor *subTitleColor = center.resolvedColorForKey(JobsThemeColorKeyTextSecondary);
    viewController
        .byGKNavBackgroundColor(backgroundColor)
        .byGKNavTitleColor(mainTitleColor)
        .byGKNavShadowColor(center.resolvedColorForKey(JobsThemeColorKeyTextQuaternary));
    JobsOCApplyNavigationTitleViewTheme(viewController.gk_navTitleView,
                                       mainTitleColor,
                                       subTitleColor);
    if (viewController.navigationItem.titleView != viewController.gk_navTitleView) {
        JobsOCApplyNavigationTitleViewTheme(viewController.navigationItem.titleView,
                                           mainTitleColor,
                                           subTitleColor);
    }
    NSArray<UIBarButtonItem *> *gkLeftItems = viewController.gk_navLeftBarButtonItems ?:
        (viewController.gk_navLeftBarButtonItem ? @[viewController.gk_navLeftBarButtonItem] : @[]);
    NSArray<UIBarButtonItem *> *systemLeftItems = viewController.navigationItem.leftBarButtonItems ?:
        (viewController.navigationItem.leftBarButtonItem ? @[viewController.navigationItem.leftBarButtonItem] : @[]);
    JobsOCApplyNavigationBackItemsTheme(gkLeftItems,
                                       mainTitleColor,
                                       secondaryBackgroundColor);
    JobsOCApplyNavigationBackItemsTheme(systemLeftItems,
                                       mainTitleColor,
                                       secondaryBackgroundColor);
    UINavigationBar *navigationBar = viewController.navigationController.navigationBar;
    if (navigationBar) {
        NSMutableDictionary *titleTextAttributes = navigationBar.titleTextAttributes.mutableCopy ?:
            NSMutableDictionary.dictionary;
        titleTextAttributes[NSForegroundColorAttributeName] = mainTitleColor;
        navigationBar.byTitleTextAttributes(titleTextAttributes.copy);
        navigationBar.byTintColor(mainTitleColor);
        navigationBar.byBarTintColor(backgroundColor);
    }
}

@interface UIViewController (BaseNavigationBarTheme)

-(JobsRetBtnByVoidBlock _Nonnull)jobs_demoThemeButton;
-(JobsRetBarButtonItemByVoidBlock _Nonnull)jobs_demoThemeBarButtonItem;
-(JobsRetNSArrayUIButtonByVoidBlock _Nonnull)jobs_demoBusinessButtons;
-(jobsByNSArrayUIButtonBlock _Nonnull)jobs_setDemoBusinessButtons;
-(JobsRetViewByVoidBlock _Nonnull)jobs_demoActionMenuOverlay;
-(jobsByViewBlock _Nonnull)jobs_setDemoActionMenuOverlay;
-(jobsByVoidBlock _Nonnull)jobs_updateDemoTriggerPresentation;
-(void)jobs_updateDemoBusinessButtonsFromItems:(NSArray<UIBarButtonItem *> *)items
                                     themeItem:(UIBarButtonItem *)themeItem;
-(JobsRetNSArrayUIButtonByUIBarButtonItemBlock _Nonnull)jobs_demoBusinessButtonsFromBarButtonItem;
-(jobsByBOOLBlock _Nonnull)jobs_showDemoActionMenu;
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

-(jobsByVoidBlock _Nonnull)jobs_ensureDemoThemeButton{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (@available(iOS 13.0, *)) {
            if (!JobsOCIsDemoNavigationChild(self)) return;
            self.view.byBgColor(JobsSystemBackgroundColor);
            UIButton *themeButton = self.jobs_demoThemeButton().bySelected(JobsThemeCenter.shared.isDarkMode);
            UIBarButtonItem *themeItem = self.jobs_demoThemeBarButtonItem();
            [JobsThemeCenter.shared bindObject:self
                                          slot:@"JobsBaseUI.navigationTheme"
                                         apply:^(__kindof UIViewController *object,
                                                 JobsThemeCenter *center) {
                JobsOCApplyDemoNavigationTheme(object, center);
            }];
            if (JobsOCIsSystemNavigationBarDemo(self)) {
                NSArray<UIBarButtonItem *> *items = self.navigationItem.rightBarButtonItems ?:
                    (self.navigationItem.rightBarButtonItem ? @[self.navigationItem.rightBarButtonItem] : @[]);
                [self jobs_updateDemoBusinessButtonsFromItems:items
                                                    themeItem:themeItem];
                self.navigationItem.byRightBarButtonItem(nil);
                self.navigationItem.byRightBarButtonItems(@[themeItem]);
                return;
            }
            self.byGKNavBackgroundImage(nil);
            NSArray<UIBarButtonItem *> *items = self.gk_navRightBarButtonItems ?:
                (self.gk_navRightBarButtonItem ? @[self.gk_navRightBarButtonItem] : @[]);
            [self jobs_updateDemoBusinessButtonsFromItems:items
                                                themeItem:themeItem];
            self.byGKNavRightBarButtonItem(nil);
            self.byGKNavRightBarButtonItems(@[themeItem]);
            themeButton.bySelected(JobsThemeCenter.shared.isDarkMode);
        }
    };
}
#pragma mark —— 全局主题切换按钮
JobsKey(_jobs_demoThemeButton)
-(JobsRetBtnByVoidBlock _Nonnull)jobs_demoThemeButton{
    @jobs_weakify(self)
    return ^UIButton *{
        @jobs_strongify(self)
        if (!self) return nil;
        UIButton *button = Jobs_getAssociatedObject(_jobs_demoThemeButton);
        if (!button) {
            UIImage *normalImage = JobsThemeImage(JobsThemeImageKeyThemeToggle);
            UIImage *selectedImage = JobsThemeImage(JobsThemeImageKeyThemeToggle);
            UIColor *tintColor = JobsLabelColor;
            @jobs_weakify(self)
            button = JobsOCMakeDemoActionButton(^(__kindof UIButton * _Nullable button) {
                button
                    .normalStateImageBy(normalImage)
                    .selectedStateImageBy(selectedImage)
                    .jobsResetBtnBgCor(JobsClearColor)
                    .onClickBy(^(UIButton *sender) {
                        @jobs_strongify(self)
                        if (!self.jobs_demoBusinessButtons().count) {
                            JobsThemeCenter.shared.toggle();
                            self.jobs_updateDemoTriggerPresentation();
                        }else self.jobs_showDemoActionMenu(self.jobs_demoActionMenuOverlay() == nil);
                    })
                    .byAccessibilityLabel(@"切换全局主题")
                    .bySelected(JobsThemeCenter.shared.isDarkMode)
                    .byTag(JobsOCDemoThemeButtonTag)
                    .byTintColor(tintColor)
                    .bySize(CGSizeMake(44, 44));
            });
            Jobs_setAssociatedRETAIN_NONATOMIC(_jobs_demoThemeButton, button)
            self.jobs_updateDemoTriggerPresentation();
        };return button;
    };
}

JobsKey(_jobs_demoThemeBarButtonItem)
-(JobsRetBarButtonItemByVoidBlock _Nonnull)jobs_demoThemeBarButtonItem{
    @jobs_weakify(self)
    return ^UIBarButtonItem *{
        @jobs_strongify(self)
        if (!self) return nil;
        UIBarButtonItem *item = Jobs_getAssociatedObject(_jobs_demoThemeBarButtonItem);
        if (!item) {
            item = [UIBarButtonItem.alloc initWithCustomView:self.jobs_demoThemeButton()];
            Jobs_setAssociatedRETAIN_NONATOMIC(_jobs_demoThemeBarButtonItem, item)
        };return item;
    };
}

JobsKey(_jobs_demoBusinessButtons)
-(JobsRetNSArrayUIButtonByVoidBlock _Nonnull)jobs_demoBusinessButtons{
    @jobs_weakify(self)
    return ^NSArray<UIButton *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        NSArray<UIButton *> *buttons = Jobs_getAssociatedObject(_jobs_demoBusinessButtons);
        return buttons ?: @[];
    };
}

-(jobsByNSArrayUIButtonBlock _Nonnull)jobs_setDemoBusinessButtons{
    @jobs_weakify(self)
    return ^(NSArray<UIButton *> * buttons){
        @jobs_strongify(self)
        if (!self) return;
        Jobs_setAssociatedRETAIN_NONATOMIC(_jobs_demoBusinessButtons, buttons ?: @[])
        self.jobs_updateDemoTriggerPresentation();
    };
}

JobsKey(_jobs_demoActionMenuOverlay)
-(JobsRetViewByVoidBlock _Nonnull)jobs_demoActionMenuOverlay{
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return Jobs_getAssociatedObject(_jobs_demoActionMenuOverlay);
    };
}

-(jobsByViewBlock _Nonnull)jobs_setDemoActionMenuOverlay{
    @jobs_weakify(self)
    return ^(UIView * overlay){
        @jobs_strongify(self)
        if (!self) return;
        Jobs_setAssociatedRETAIN_NONATOMIC(_jobs_demoActionMenuOverlay, overlay)
        self.jobs_updateDemoTriggerPresentation();
    };
}

-(jobsByVoidBlock _Nonnull)jobs_updateDemoTriggerPresentation{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIButton *button = Jobs_getAssociatedObject(_jobs_demoThemeButton);
        if (!button) return;
        BOOL opensMenu = self.jobs_demoBusinessButtons().count > 0;
        if (opensMenu) {
            [JobsThemeCenter.shared unbindObject:button
                                           slot:@"JobsBaseUI.themeButton.presentation"];
            BOOL expanded = self.jobs_demoActionMenuOverlay() != nil;
            UIImage *image = [UIImage systemImageNamed:expanded
                ? @"ellipsis.circle.fill"
                : @"ellipsis.circle"];
            button
                .normalStateImageBy(image)
                .selectedStateImageBy(image)
                .bySelected(NO);
            button.byAccessibilityIdentifier(@"JobsOCDemoActionMenuTrigger");
            button.accessibilityLabel = expanded
                ? @"收起主题与页面操作".jobsTr()
                : @"展开主题与页面操作".jobsTr();
            return;
        }
        button
            .normalStateImageBy(JobsThemeImage(JobsThemeImageKeyThemeToggle))
            .selectedStateImageBy(JobsThemeImage(JobsThemeImageKeyThemeToggle));
        [JobsThemeCenter.shared bindObject:button
                                     slot:@"JobsBaseUI.themeButton.presentation"
                                    apply:^(__kindof UIButton *object,
                                            JobsThemeCenter *center) {
            object
                .bySelected(center.isDarkMode)
                .byAccessibilityIdentifier(JobsOCDemoThemeDirectActionIdentifier);
            object.accessibilityLabel = center.isDarkMode
                ? @"切换为白天".jobsTr()
                : @"切换为黑夜".jobsTr();
        }];
    };
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
        [businessButtons addObjectsFromArray:self.jobs_demoBusinessButtonsFromBarButtonItem(item)];
    }
    self.jobs_setDemoBusinessButtons(businessButtons.copy);
    self.jobs_showDemoActionMenu(NO);
}

-(JobsRetNSArrayUIButtonByUIBarButtonItemBlock _Nonnull)jobs_demoBusinessButtonsFromBarButtonItem{
    @jobs_weakify(self)
    return ^NSArray<UIButton *> *(UIBarButtonItem * item){
        @jobs_strongify(self)
        if (!self) return nil;
        if (item.customView) return JobsOCDemoBusinessButtonsInView(item.customView);
        UIButton *sourceButton = JobsOCMakeDemoActionButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(item.title)
                .jobsResetBtnImage(item.image)
            .byAccessibilityLabel(item.accessibilityLabel);
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
    };
}

-(jobsByBOOLBlock _Nonnull)jobs_showDemoActionMenu{
    @jobs_weakify(self)
    return ^(BOOL show){
        @jobs_strongify(self)
        if (!self) return;
        UIView *overlay = self.jobs_demoActionMenuOverlay();
        if (overlay) overlay.byRemove();
        self.jobs_setDemoActionMenuOverlay(nil);
        if (!show || !self.jobs_demoBusinessButtons().count) return;
        overlay = jobsMakeBaseView(^(__kindof BaseView * _Nullable view) {
            view
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    if (JobsOCIsSystemNavigationBarDemo(self)) {
                        make.edges.equalTo(self.view);
                    }else{
                        make.top.equalTo(self.gk_navigationBar.mas_bottom);
                        make.left.right.bottom.equalTo(self.view);
                    }
                });
        });
        NSInteger rowCount = self.jobs_demoBusinessButtons().count + 1;
        UIView *menuView = jobsMakeBaseView(^(__kindof BaseView * _Nullable view) {
            view
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(8)
                .byClipsToBounds(YES)
                .addOn(overlay)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(overlay).offset(6);
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
            self.jobs_showDemoActionMenu(NO);
        });
        overlay.tapGR.byCancelsTouchesInView(NO);
        self.jobs_setDemoActionMenuOverlay(overlay);
        BOOL darkModeEnabled = JobsThemeCenter.shared.isDarkMode;
        [self jobs_addDemoActionMenuRowToView:menuView
                                        title:darkModeEnabled ? @"切换为白天".jobsTr() : @"切换为黑夜".jobsTr()
                                        image:JobsThemeCenter.shared.resolvedImageForKey(
                                            JobsThemeImageKeyThemeToggle)
                                        index:0
                                     rowCount:rowCount
                                       action:^{
            @jobs_strongify(self)
            self.jobs_showDemoActionMenu(NO);
            JobsThemeCenter.shared.toggle();
        }];
        [self.jobs_demoBusinessButtons() enumerateObjectsUsingBlock:^(UIButton *sourceButton,
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
                self.jobs_showDemoActionMenu(NO);
                sourceButton.actionByCode();
            }];
        }];
        [self.view bringSubviewToFront:overlay];
    };
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
    };return [NSString stringWithFormat:@"%@ %ld", @"页面操作".jobsTr(), (long)index + 1];
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
