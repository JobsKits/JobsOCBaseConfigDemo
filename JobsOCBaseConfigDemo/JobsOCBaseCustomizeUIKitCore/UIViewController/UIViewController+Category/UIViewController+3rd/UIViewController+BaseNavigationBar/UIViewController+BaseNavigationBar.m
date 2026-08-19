//
//  UIViewController+BaseNavigationBar.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+BaseNavigationBar.h"

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
        UINavigationController *presenterNavigationController = JobsOCNavigationControllerIfStackMember(presenter);
        if (JobsOCIsDemoRootViewController(presenter) ||
            JobsOCIsDemoRootViewController(presenterNavigationController.viewControllers.firstObject)) {
            return YES;
        }
        UIViewController *nextPresenter = presenter.presentingViewController ?:
            presenterNavigationController.presentingViewController;
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
            self.byGk_navRightBarButtonItem(nil);
            self.byGk_navRightBarButtonItems(@[themeItem]);
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
        overlay.tapGR_SelImp.selector = self.jobsSelectorBlock(^id _Nullable(id _Nullable target,
                                                                             UITapGestureRecognizer *_Nullable gesture) {
            @jobs_strongify(self)
            UIView *strongOverlay = weakOverlay;
            UIView *strongMenuView = weakMenuView;
            if (!strongOverlay || !strongMenuView) return nil;
            CGPoint point = [gesture locationInView:strongOverlay];
            if (CGRectContainsPoint(strongMenuView.frame, point)) return nil;
            self.jobs_showDemoActionMenu(NO);
            return nil;
        });
        overlay.tapGR
            .byCancelsTouchesInView(NO)
            .byEnabled(YES);
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
                                            image:sourceButton.imageByState(sourceButton.state)
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
        button.titleByState(button.state) ?: @"",
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
            navBar
                .byTranslucent(self.isBarTranslucent)
                .byHidden(self.isHiddenNavigationBar)
            .addOn(self.view).byAdd(^(MASConstraintMaker *make) {
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
            Shadow.byShadowColor(self.shadowCor);
            Shadow.byShadowOffset(CGSizeZero);
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
            NavItem.byTitle(self.title);
            NavItem.byLeftBarButtonItem(self.leftBarButtonItem_back);
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
