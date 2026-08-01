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
        self.view.byBgColor(JobsSystemBackgroundColor);
        UIButton *themeButton = self.jobs_demoThemeButton.bySelected(JobsThemeCenter.shared.isDarkMode);
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
        [JobsThemeCenter.shared bindObject:self
                                      slot:@"JobsBaseUI.GKNavigationBar.colors"
                                     apply:^(__kindof UIViewController *object,
                                             JobsThemeCenter *center) {
            object
                .byGKNavBackgroundColor([center resolvedColorForKey:JobsThemeColorKeyBackgroundPrimary])
                .byGKNavTitleColor([center resolvedColorForKey:JobsThemeColorKeyTextPrimary]);
        }];
        self.byGKNavBackgroundImage(nil);
        NSArray<UIBarButtonItem *> *items = self.gk_navRightBarButtonItems ?:
            (self.gk_navRightBarButtonItem ? @[self.gk_navRightBarButtonItem] : @[]);
        [self jobs_updateDemoBusinessButtonsFromItems:items
                                            themeItem:themeItem];
        self.gk_navRightBarButtonItem = nil;
        self.gk_navRightBarButtonItems = @[themeItem];
        themeButton.bySelected(JobsThemeCenter.shared.isDarkMode);
    }
}
#pragma mark —— 全局主题切换按钮
JobsKey(_jobs_demoThemeButton)
-(UIButton *)jobs_demoThemeButton{
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
                    if (!self.jobs_demoBusinessButtons.count) {
                        [JobsThemeCenter.shared toggle];
                        [self jobs_updateDemoTriggerPresentation];
                    }else [self jobs_showDemoActionMenu:self.jobs_demoActionMenuOverlay == nil];
                })
                .bySelected(JobsThemeCenter.shared.isDarkMode)
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
        [JobsThemeCenter.shared unbindObject:button
                                       slot:@"JobsBaseUI.themeButton.presentation"];
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
    button
        .normalStateImageBy(JobsThemeImage(JobsThemeImageKeyThemeToggle))
        .selectedStateImageBy(JobsThemeImage(JobsThemeImageKeyThemeToggle));
    [JobsThemeCenter.shared bindObject:button
                                 slot:@"JobsBaseUI.themeButton.presentation"
                                apply:^(__kindof UIButton *object,
                                        JobsThemeCenter *center) {
        object.bySelected(center.isDarkMode);
        object.accessibilityIdentifier = JobsOCDemoThemeDirectActionIdentifier;
        object.accessibilityLabel = center.isDarkMode
            ? @"切换为白天".tr
            : @"切换为黑夜".tr;
    }];
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
                if (JobsOCIsSystemNavigationBarDemo(self)) {
                    make.edges.equalTo(self.view);
                }else{
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                }
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
                make.top.equalTo(overlay).offset(6);
                make.right.equalTo(overlay).offset(-12);
                make.width.mas_equalTo(210);
                make.height.mas_equalTo(rowCount * 44);
            });
    });
    @jobs_weakify(self)
    __weak UIView *weakOverlay = overlay;
    __weak UIView *weakMenuView = menuView;
    overlay.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                         UITapGestureRecognizer *_Nullable gesture) {
        @jobs_strongify(self)
        UIView *strongOverlay = weakOverlay;
        UIView *strongMenuView = weakMenuView;
        if (!strongOverlay || !strongMenuView) return nil;
        CGPoint point = [gesture locationInView:strongOverlay];
        if (CGRectContainsPoint(strongMenuView.frame, point)) return nil;
        [self jobs_showDemoActionMenu:NO];
        return nil;
    }];
    overlay.tapGR
        .byCancelsTouchesInView(NO)
        .byEnabled(YES);
    [self jobs_setDemoActionMenuOverlay:overlay];
    BOOL darkModeEnabled = JobsThemeCenter.shared.isDarkMode;
    [self jobs_addDemoActionMenuRowToView:menuView
                                    title:darkModeEnabled ? @"切换为白天".tr : @"切换为黑夜".tr
                                    image:[JobsThemeCenter.shared resolvedImageForKey:
                                        JobsThemeImageKeyThemeToggle]
                                    index:0
                                 rowCount:rowCount
                                   action:^{
        @jobs_strongify(self)
        [self jobs_showDemoActionMenu:NO];
        [JobsThemeCenter.shared toggle];
    }];
    [self.jobs_demoBusinessButtons enumerateObjectsUsingBlock:^(UIButton *sourceButton,
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
        button.titleByState(button.state) ?: @"",
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
