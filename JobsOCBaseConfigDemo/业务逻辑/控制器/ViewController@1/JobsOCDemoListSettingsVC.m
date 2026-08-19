//
//  JobsOCDemoListSettingsVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCDemoListSettingsVC.h"

#import "AppDelegate+TabBarCtr.h"
#import "UIViewController+BaseNavigationBar.h"

static NSString *const JobsOCDemoListSettingsCellReuseIdentifier = @"JobsOCDemoListSettingsCell";
static NSString *const JobsOCSplashEnabledUserDefaultsKey = @"com.BSports.JobsOCSplashEnabledUserDefaultsKey";
static NSString *const JobsOCDemoListReturnToTopAndRefreshUserDefaultsKey = @"com.BSports.JobsOCDemoListReturnToTopAndRefreshUserDefaultsKey";
static NSString *const JobsOCDemoSuspendTimeButtonVisibleUserDefaultsKey = @"com.jobs.demoList.showsSuspendTimeButton";
static NSString *const JobsOCDemoListCellTextDisplayStrategyUserDefaultsKey = @"com.jobs.demoList.cellTextDisplayStrategy";

JobsOCDemoListCellTextDisplayStrategy JobsOCCurrentDemoListCellTextDisplayStrategy(void) {
    id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsOCDemoListCellTextDisplayStrategyUserDefaultsKey];
    if (!value) return JobsOCDemoListCellTextDisplayStrategyContinuous;
    NSInteger rawValue = [value integerValue];
    if (rawValue < JobsOCDemoListCellTextDisplayStrategyNormal ||
        rawValue > JobsOCDemoListCellTextDisplayStrategyPingPong) {
        return JobsOCDemoListCellTextDisplayStrategyContinuous;
    };return (JobsOCDemoListCellTextDisplayStrategy)rawValue;
}

void JobsOCSetDemoListCellTextDisplayStrategy(JobsOCDemoListCellTextDisplayStrategy strategy) {
    if (strategy < JobsOCDemoListCellTextDisplayStrategyNormal ||
        strategy > JobsOCDemoListCellTextDisplayStrategyPingPong) {
        strategy = JobsOCDemoListCellTextDisplayStrategyContinuous;
    }
    [NSUserDefaults.standardUserDefaults setInteger:strategy
                                             forKey:JobsOCDemoListCellTextDisplayStrategyUserDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

typedef NS_ENUM(NSInteger, JobsOCDemoListSettingItem) {
    JobsOCDemoListSettingItemSplash = 0,
    JobsOCDemoListSettingItemReturnBehavior,
    JobsOCDemoListSettingItemSuspendTimeButton,
    JobsOCDemoListSettingItemTheme,
    JobsOCDemoListSettingItemSideDrawerMode,
    JobsOCDemoListSettingItemAppEntry,
    JobsOCDemoListSettingItemDeallocTips
};

typedef NS_ENUM(NSInteger, JobsOCDemoListSettingSection) {
    JobsOCDemoListSettingSectionGeneral = 0,
    JobsOCDemoListSettingSectionSplashContent,
    JobsOCDemoListSettingSectionLanguage,
    JobsOCDemoListSettingSectionCellTextDisplayStrategy,
    JobsOCDemoListSettingSectionCount
};

@interface JobsOCDemoListSettingsVC ()

Prop_strong()UITableView *tableView;
Prop_strong()NSMutableIndexSet *expandedSettingSectionIndexSet;
Prop_assign()BOOL shouldApplyAppEntryAfterReturning;

-(JobsRetBOOLByVoidBlock _Nonnull)jobsOCSplashEnabled;
-(jobsByBOOLBlock _Nonnull)setJobsOCSplashEnabled;
-(JobsRetBOOLByVoidBlock _Nonnull)demoListReturnToTopAndRefreshEnabled;
-(jobsByBOOLBlock _Nonnull)setDemoListReturnToTopAndRefreshEnabled;
-(JobsRetBOOLByVoidBlock _Nonnull)showsSuspendTimeButton;
-(jobsByBOOLBlock _Nonnull)setShowsSuspendTimeButton;
-(JobsRetBOOLByVoidBlock _Nonnull)demoListDarkModeEnabled;
-(jobsByBOOLBlock _Nonnull)setDemoListDarkModeEnabled;
-(jobsByVoidBlock _Nonnull)applyDemoListInterfaceStyle;
-(JobsRetCorByVoidBlock _Nonnull)demoListPageBackgroundColor;
-(JobsRetCorByVoidBlock _Nonnull)demoListNavigationBackgroundColor;
-(JobsRetCorByVoidBlock _Nonnull)demoListPrimaryTextColor;
-(JobsRetCorByVoidBlock _Nonnull)demoListCellBackgroundColor;
-(JobsRetCorByVoidBlock _Nonnull)demoListSeparatorColor;
-(jobsByVoidBlock _Nonnull)applyDemoListNavigationInterfaceStyle;
-(jobsByVoidBlock _Nonnull)applyDemoListTabBarInterfaceStyle;
-(JobsRetStrByVoidBlock _Nonnull)splashSwitchTitle;
-(JobsRetStrByVoidBlock _Nonnull)returnSwitchTitle;
-(JobsRetStrByVoidBlock _Nonnull)suspendTimeButtonSwitchTitle;
-(JobsRetStrByVoidBlock _Nonnull)themeSwitchTitle;
-(JobsRetStrByVoidBlock _Nonnull)deallocTipsSwitchTitle;
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)generalSettingTitleArr;
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)splashContentTitleArr;
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)languageTitleArr;
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)cellTextDisplayStrategyTitleArr;
-(JobsRetJobsOCSplashContentTypeByNSIntegerBlock _Nonnull)splashContentTypeByRow;
-(JobsRetAppLanguageByNSIntegerBlock _Nonnull)appLanguageByRow;
-(JobsRetAppLanguageByVoidBlock _Nonnull)currentEffectiveAppLanguage;
-(JobsRetJobsOCDemoListCellTextDisplayStrategyByNSIntegerBlock _Nonnull)cellTextDisplayStrategyByRow;
-(JobsRetNSStringByJobsOCDemoListSettingSectionBlock _Nonnull)expandableSectionTitleBySection;
-(JobsRetUIViewByJobsOCDemoListSettingSectionBlock _Nonnull)expansionAccessoryViewBySection;
-(JobsRetNSStringByNSIndexPathBlock _Nonnull)titleByIndexPath;
-(JobsRetUITableViewCellAccessoryTypeByNSIndexPathBlock _Nonnull)accessoryTypeByIndexPath;
-(jobsByVoidBlock _Nonnull)updateLocalizedContent;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCDemoListSettingsVC
@interface JobsOCDemoListSettingsVC (JobsPropertyDSLSetterAutogen_ef46cb8a99)
-(void)setExpandedSettingSectionIndexSet:(NSMutableIndexSet * _Nullable)data;
-(void)setShouldApplyAppEntryAfterReturning:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCDemoListSettingsVC

@implementation JobsOCDemoListSettingsVC
@synthesize tableView = _tableView;

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCDemoListSettingsVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.byExpandedSettingSectionIndexSet(NSMutableIndexSet.indexSet);
        self.updateLocalizedContent();
        @jobs_weakify(self)
        [self addNotificationName:语言切换
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            self.applyDemoListInterfaceStyle();
        }];
        [self addNotificationName:JobsThemeDidChangeNotification
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            self.applyDemoListInterfaceStyle();
        }];
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCDemoListSettingsVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSecondarySystemBackgroundColor);
        self.makeNavByAlpha(1);
        self.tableView.byAlpha(1);
        self.applyDemoListInterfaceStyle();
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCDemoListSettingsVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
        if (!self.shouldApplyAppEntryAfterReturning || !self.isMovingFromParentViewController) return;
        self.byShouldApplyAppEntryAfterReturning(NO);
        JobsOCApplyAppRootViewController();
    };
}

#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCDemoListSettingsVC.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
    return action ? action(tableView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUITableViewBlock _Nonnull)jobsNumberOfSectionsInTableView{
    @jobs_weakify(self)
    return ^NSInteger(UITableView * tableView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return JobsOCDemoListSettingSectionCount;
    };
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    if (section == JobsOCDemoListSettingSectionGeneral) return self.generalSettingTitleArr().count;
    NSInteger optionCount = 0;
    if (section == JobsOCDemoListSettingSectionSplashContent) {
        optionCount = self.splashContentTitleArr().count;
    }else if (section == JobsOCDemoListSettingSectionLanguage){
        optionCount = self.languageTitleArr().count;
    }else{
        optionCount = self.cellTextDisplayStrategyTitleArr().count;
    }
    return [self.expandedSettingSectionIndexSet containsIndex:section] ? optionCount + 1 : 1;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return section == JobsOCDemoListSettingSectionGeneral ? JobsWidth(16) : JobsWidth(12);
}

-(CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(56);
}

-(NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    return nil;
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCDemoListSettingsCellReuseIdentifier
                                                            forIndexPath:indexPath];
    cell.byBgColor(self.demoListCellBackgroundColor());
    cell.contentView.byBgColor(self.demoListCellBackgroundColor());
    cell.byTintColor(HEXCOLOR(0x1D7FF2));
    cell.byAccessoryView(nil);
    cell.byIndentationLevel(indexPath.section != JobsOCDemoListSettingSectionGeneral && indexPath.row > 0 ? 1 : 0);
    cell.byIndentationWidth(JobsWidth(20));
    if (indexPath.section != JobsOCDemoListSettingSectionGeneral && indexPath.row == 0) {
        cell.byAccessoryView(self.expansionAccessoryViewBySection(indexPath.section));
    }
    return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(self.titleByIndexPath(indexPath))
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor(self.demoListPrimaryTextColor())
                .byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(indexPath.section != JobsOCDemoListSettingSectionGeneral && indexPath.row == 0)
                .byMinimumScaleFactor(indexPath.section != JobsOCDemoListSettingSectionGeneral && indexPath.row == 0 ? .72f : 1);
        })
        .byAccessoryType(self.accessoryTypeByIndexPath(indexPath))
        .bySelectionStyle(UITableViewCellSelectionStyleDefault);
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section != JobsOCDemoListSettingSectionGeneral && indexPath.row == 0) {
        if ([self.expandedSettingSectionIndexSet containsIndex:indexPath.section]) {
            [self.expandedSettingSectionIndexSet removeIndex:indexPath.section];
        }else{
            [self.expandedSettingSectionIndexSet addIndex:indexPath.section];
        }
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]
                 withRowAnimation:UITableViewRowAnimationAutomatic];
        return;
    }
    NSInteger optionRow = indexPath.row - 1;
    if (indexPath.section == JobsOCDemoListSettingSectionSplashContent) {
        JobsOCSplashContentType contentType = self.splashContentTypeByRow(optionRow);
        JobsOCSplashPreferences.setContentTypeForNextLaunch(contentType);
        ([NSString stringWithFormat:@"下次开屏内容已设为：%@".jobsTr(),
                                    self.splashContentTitleArr()[optionRow]]).toast();
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]
                 withRowAnimation:UITableViewRowAnimationAutomatic];
        return;
    }
    if (indexPath.section == JobsOCDemoListSettingSectionLanguage) {
        self.appLanguageAtAppLanguageBy(self.appLanguageByRow(optionRow));
        self.changeTabBarItemTitleBy([NSIndexPath indexPathForRow:optionRow
                                                        inSection:indexPath.section]);
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]
                 withRowAnimation:UITableViewRowAnimationAutomatic];
        return;
    }
    if (indexPath.section == JobsOCDemoListSettingSectionCellTextDisplayStrategy) {
        JobsOCDemoListCellTextDisplayStrategy strategy = self.cellTextDisplayStrategyByRow(optionRow);
        JobsOCSetDemoListCellTextDisplayStrategy(strategy);
        ([NSString stringWithFormat:@"列表主/副标题已设为：%@".jobsTr(),
                                    self.cellTextDisplayStrategyTitleArr()[optionRow]]).toast();
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]
                 withRowAnimation:UITableViewRowAnimationAutomatic];
        return;
    }
    JobsOCDemoListSettingItem item = indexPath.row;
    if (item == JobsOCDemoListSettingItemSplash) {
        self.setJobsOCSplashEnabled(![self jobsOCSplashEnabled]());
        ([self jobsOCSplashEnabled]() ? @"下次打开开屏".jobsTr() : @"下次关闭开屏".jobsTr()).toast();
    }else if (item == JobsOCDemoListSettingItemReturnBehavior){
        BOOL enabled = ![self demoListReturnToTopAndRefreshEnabled]();
        self.setDemoListReturnToTopAndRefreshEnabled(enabled);
        (enabled ? @"返回主列表：回顶部并刷新".jobsTr() : @"返回主列表：保持原样".jobsTr()).toast();
    }else if (item == JobsOCDemoListSettingItemSuspendTimeButton){
        self.setShowsSuspendTimeButton(![self showsSuspendTimeButton]());
        ([self showsSuspendTimeButton]() ? @"悬浮时间按钮已显示".jobsTr() : @"悬浮时间按钮已隐藏".jobsTr()).toast();
    }else if (item == JobsOCDemoListSettingItemTheme){
        BOOL dark = ![self demoListDarkModeEnabled]();
        self.setDemoListDarkModeEnabled(dark);
        (dark ? @"主题已切换：黑夜".jobsTr() : @"主题已切换：白天".jobsTr()).toast();
    }else if (item == JobsOCDemoListSettingItemSideDrawerMode){
        BOOL fixed = ![NSUserDefaults.standardUserDefaults boolForKey:@"JobsOCDemoSideDrawerFixed"];
        [NSUserDefaults.standardUserDefaults setBool:fixed forKey:@"JobsOCDemoSideDrawerFixed"];
        (fixed ? @"侧滑内容已设为固定".jobsTr() : @"侧滑内容已设为跟随".jobsTr()).toast();
    }else if (item == JobsOCDemoListSettingItemAppEntry){
        BOOL usesTabBarEntry = !JobsOCDemoListUsesTabBarEntry();
        JobsOCSetDemoListUsesTabBarEntry(usesTabBarEntry);
        self.byShouldApplyAppEntryAfterReturning(YES);
        (usesTabBarEntry ? @"返回后从 TabBar 进入".jobsTr() : @"返回后直接进入 Demo 列表".jobsTr()).toast();
    }else if (item == JobsOCDemoListSettingItemDeallocTips){
        JobsSetControllerDeallocTipsEnabled(!JobsControllerDeallocTipsEnabled());
        (JobsControllerDeallocTipsEnabled() ? @"控制器销毁提示已开启".jobsTr() : @"控制器销毁提示已关闭".jobsTr()).toast();
    }
    [self.tableView reloadData];
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            [tableView registerClass:UITableViewCell.class
               forCellReuseIdentifier:JobsOCDemoListSettingsCellReuseIdentifier];
            tableView
                .byDelegate(self)
                .byDataSource(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byRowHeight(JobsWidth(56))
                .byEstimatedRowHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .bySectionHeaderTopPadding(0)
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.bottom.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                });
        });
    };return _tableView;
}
#pragma mark —— 一些私有方法
-(JobsRetBOOLByVoidBlock _Nonnull)jobsOCSplashEnabled{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsOCSplashEnabledUserDefaultsKey];
        return value ? [value boolValue] : YES;
    };
}

-(jobsByBOOLBlock _Nonnull)setJobsOCSplashEnabled{
    @jobs_weakify(self)
    return ^(BOOL jobsOCSplashEnabled){
        @jobs_strongify(self)
        if (!self) return;
        [NSUserDefaults.standardUserDefaults setBool:jobsOCSplashEnabled
                                              forKey:JobsOCSplashEnabledUserDefaultsKey];
        [NSUserDefaults.standardUserDefaults synchronize];
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)demoListReturnToTopAndRefreshEnabled{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsOCDemoListReturnToTopAndRefreshUserDefaultsKey];
        return value ? [value boolValue] : YES;
    };
}

-(jobsByBOOLBlock _Nonnull)setDemoListReturnToTopAndRefreshEnabled{
    @jobs_weakify(self)
    return ^(BOOL enabled){
        @jobs_strongify(self)
        if (!self) return;
        [NSUserDefaults.standardUserDefaults setBool:enabled
                                              forKey:JobsOCDemoListReturnToTopAndRefreshUserDefaultsKey];
        [NSUserDefaults.standardUserDefaults synchronize];
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)showsSuspendTimeButton{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsOCDemoSuspendTimeButtonVisibleUserDefaultsKey];
        return value ? [value boolValue] : YES;
    };
}

-(jobsByBOOLBlock _Nonnull)setShowsSuspendTimeButton{
    @jobs_weakify(self)
    return ^(BOOL showsSuspendTimeButton){
        @jobs_strongify(self)
        if (!self) return;
        [NSUserDefaults.standardUserDefaults setBool:showsSuspendTimeButton
                                              forKey:JobsOCDemoSuspendTimeButtonVisibleUserDefaultsKey];
        [NSUserDefaults.standardUserDefaults synchronize];
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)demoListDarkModeEnabled{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return JobsThemeCenter.shared.isDarkMode;
    };
}

-(jobsByBOOLBlock _Nonnull)setDemoListDarkModeEnabled{
    @jobs_weakify(self)
    return ^(BOOL enabled){
        @jobs_strongify(self)
        if (!self) return;
        JobsThemeCenter.shared.setStyle(enabled ? JobsThemeStyleDark : JobsThemeStyleLight);
    };
}

-(jobsByVoidBlock _Nonnull)applyDemoListInterfaceStyle{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.view.byBgColor(self.demoListPageBackgroundColor());
        self.updateLocalizedContent();
        self.makeNavByAlpha(1);
        self.navBar.backBtn.jobsResetBtnTitle(@"返回".jobsTr());
        self.applyDemoListNavigationInterfaceStyle();
        self.applyDemoListTabBarInterfaceStyle();
        if (_tableView) {
            _tableView.bySeparatorColor(self.demoListSeparatorColor());
            [_tableView reloadData];
        }
    };
}

-(JobsRetCorByVoidBlock _Nonnull)demoListPageBackgroundColor{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsSystemGroupedBackgroundColor;
    };
}

-(JobsRetCorByVoidBlock _Nonnull)demoListNavigationBackgroundColor{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsSystemBackgroundColor;
    };
}

-(JobsRetCorByVoidBlock _Nonnull)demoListPrimaryTextColor{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsLabelColor;
    };
}

-(JobsRetCorByVoidBlock _Nonnull)demoListCellBackgroundColor{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsSecondarySystemGroupedBackgroundColor;
    };
}

-(JobsRetCorByVoidBlock _Nonnull)demoListSeparatorColor{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 13.0, *)) return UIColor.separatorColor;
        return HEXCOLOR(0xE5E7EB);
    };
}

-(jobsByVoidBlock _Nonnull)applyDemoListNavigationInterfaceStyle{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self
            .byGKNavBackgroundColor(self.demoListNavigationBackgroundColor())
            .byGKNavBackgroundImage(nil)
            .byGKNavTitleColor(self.demoListPrimaryTextColor())
            .byGKNavShadowColor(self.demoListSeparatorColor())
            .byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar * _Nullable navigationBar) {
                navigationBar.byTintColor(self.demoListPrimaryTextColor());
            });
        self.navBar.byBgColor(self.demoListNavigationBackgroundColor());
        self.navBar.titleLab.byTextCor(self.demoListPrimaryTextColor());
    };
}

-(jobsByVoidBlock _Nonnull)applyDemoListTabBarInterfaceStyle{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIColor *backgroundColor = self.demoListNavigationBackgroundColor();
        UIColor *titleColor = self.demoListPrimaryTextColor();
        UIColor *selectedColor = HEXCOLOR(0x1D7FF2);
        if (@available(iOS 13.0, *)) {
            UITabBarAppearance *appearance = jobsMakeTabBarAppearance(^(__kindof UITabBarAppearance * _Nullable appearance) {
                appearance
                    .byConfigureWithOpaqueBackground()
                    .byBackgroundColor(backgroundColor)
                    .byShadowColor(self.demoListSeparatorColor());
            });
            UITabBar.jobsApplyStandardAppearance(appearance);
            if (@available(iOS 15.0, *)) {
                UITabBar.jobsApplyScrollEdgeAppearance(appearance);
            }
        }
        NSMutableArray <UITabBar *>*tabBars = NSMutableArray.array;
        if (self.tabBarController.tabBar) [tabBars addObject:self.tabBarController.tabBar];
        if (AppDelegate.tabBarVC.tabBar && ![tabBars containsObject:AppDelegate.tabBarVC.tabBar]) {
            [tabBars addObject:AppDelegate.tabBarVC.tabBar];
        }
        for (UITabBar *tabBar in tabBars) {
            tabBar
                .byBarTintColor(backgroundColor)
                .byTintColor(selectedColor)
                .byBgColor(backgroundColor);
            if (@available(iOS 10.0, *)) {
                tabBar.byUnselectedItemTintColor(titleColor);
            }
            if (@available(iOS 13.0, *)) {
                UITabBarAppearance *appearance = jobsMakeTabBarAppearance(^(__kindof UITabBarAppearance * _Nullable appearance) {
                    appearance
                        .byConfigureWithOpaqueBackground()
                        .byBackgroundColor(backgroundColor)
                        .byShadowColor(self.demoListSeparatorColor());
                });
                tabBar.byStandardAppearance(appearance);
                if (@available(iOS 15.0, *)) {
                    tabBar.byScrollEdgeAppearance(appearance);
                }
            }
        }
        for (UIButton *button in AppDelegate.tabBarItemMutArr) {
            button
                .jobsResetBtnTitleCor(titleColor)
                .selectedStateTitleColorBy(selectedColor)
                .highlightedStateTitleColorBy(selectedColor)
                .titleColorForStateBy(selectedColor, UIControlStateSelected | UIControlStateHighlighted)
                .byTintColor(titleColor)
                .byBgColor(JobsClearColor);
        }
    };
}

-(jobsByVoidBlock _Nonnull)updateLocalizedContent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIColor *navBgColor = self.demoListNavigationBackgroundColor();
        UIColor *titleColor = self.demoListPrimaryTextColor();
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr())
                    .byTextCor(titleColor);
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"设置".jobsTr())
                    .byFont(UIFontWeightRegularSize(18))
                    .byTextCor(titleColor);
            })
            .byBgCor(navBgColor)
            .byNavBgCor(navBgColor);
    };
}

-(JobsRetStrByVoidBlock _Nonnull)splashSwitchTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [self jobsOCSplashEnabled]() ? @"下次开屏：开".jobsTr() : @"下次开屏：关".jobsTr();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)returnSwitchTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [self demoListReturnToTopAndRefreshEnabled]() ? @"返回：回顶部并刷新".jobsTr() : @"返回：保持原样".jobsTr();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)suspendTimeButtonSwitchTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [self showsSuspendTimeButton]() ? @"悬浮时间：开".jobsTr() : @"悬浮时间：关".jobsTr();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)themeSwitchTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [self demoListDarkModeEnabled]() ? @"主题切换：黑夜".jobsTr() : @"主题切换：白天".jobsTr();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)deallocTipsSwitchTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsControllerDeallocTipsEnabled() ? @"销毁提示：开".jobsTr() : @"销毁提示：关".jobsTr();
    };
}

-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)generalSettingTitleArr{
    @jobs_weakify(self)
    return ^NSArray<NSString *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @[
            self.splashSwitchTitle(),
            self.returnSwitchTitle(),
            self.suspendTimeButtonSwitchTitle(),
            self.themeSwitchTitle(),
            [NSUserDefaults.standardUserDefaults boolForKey:@"JobsOCDemoSideDrawerFixed"] ? @"侧滑菜单：内容固定".jobsTr() : @"侧滑菜单：内容跟随".jobsTr(),
            JobsOCDemoListUsesTabBarEntry() ? @"启动入口：TabBar".jobsTr() : @"启动入口：Demo 列表".jobsTr(),
            self.deallocTipsSwitchTitle()
        ];
    };
}

-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)languageTitleArr{
    @jobs_weakify(self)
    return ^NSArray<NSString *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @[
            @"中文".jobsTr(),
            @"英文".jobsTr(),
            @"他加禄语".jobsTr()
        ];
    };
}

-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)cellTextDisplayStrategyTitleArr{
    @jobs_weakify(self)
    return ^NSArray<NSString *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @[
            @"一般模式".jobsTr(),
            @"省略号模式".jobsTr(),
            @"缩小字体模式".jobsTr(),
            @"连续跑马灯".jobsTr(),
            @"左右来回滚动".jobsTr()
        ];
    };
}

-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)splashContentTitleArr{
    @jobs_weakify(self)
    return ^NSArray<NSString *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @[
            @"本地图片".jobsTr(),
            @"本地 GIF".jobsTr(),
            @"远程图片".jobsTr(),
            @"本地视频".jobsTr(),
            @"远程视频".jobsTr()
        ];
    };
}

-(JobsRetJobsOCSplashContentTypeByNSIntegerBlock _Nonnull)splashContentTypeByRow{
    @jobs_weakify(self)
    return ^JobsOCSplashContentType(NSInteger row){
        @jobs_strongify(self)
        if (!self) return (JobsOCSplashContentType){0};
        if (row < JobsOCSplashContentTypeLocalImage || row > JobsOCSplashContentTypeRemoteVideo) {
            return JobsOCSplashContentTypeLocalImage;
        };return (JobsOCSplashContentType)row;
    };
}

-(JobsRetAppLanguageByNSIntegerBlock _Nonnull)appLanguageByRow{
    @jobs_weakify(self)
    return ^AppLanguage(NSInteger row){
        @jobs_strongify(self)
        if (!self) return (AppLanguage){0};
        switch (row) {
            /// 处理 数值 0 分支
            case 0:
                return AppLanguageChineseSimplified;
            /// 处理 数值 1 分支
            case 1:
                return AppLanguageEnglish;
            /// 未匹配已知分支时执行兜底处理
            default:
                return AppLanguageTagalog;
        }
    };
}

-(JobsRetAppLanguageByVoidBlock _Nonnull)currentEffectiveAppLanguage{
    @jobs_weakify(self)
    return ^AppLanguage{
        @jobs_strongify(self)
        if (!self) return (AppLanguage){0};
        NSString *languageCode = LanMgr.languageCodeByAppLanguage(LanMgr.language).lowercaseString;
        if ([languageCode hasPrefix:@"zh"]) return AppLanguageChineseSimplified;
        if ([languageCode hasPrefix:@"fil"] || [languageCode hasPrefix:@"tl"]) return AppLanguageTagalog;
        return AppLanguageEnglish;
    };
}

-(JobsRetJobsOCDemoListCellTextDisplayStrategyByNSIntegerBlock _Nonnull)cellTextDisplayStrategyByRow{
    @jobs_weakify(self)
    return ^JobsOCDemoListCellTextDisplayStrategy(NSInteger row){
        @jobs_strongify(self)
        if (!self) return (JobsOCDemoListCellTextDisplayStrategy){0};
        if (row < JobsOCDemoListCellTextDisplayStrategyNormal ||
            row > JobsOCDemoListCellTextDisplayStrategyPingPong) {
            return JobsOCDemoListCellTextDisplayStrategyContinuous;
        };return (JobsOCDemoListCellTextDisplayStrategy)row;
    };
}

-(JobsRetNSStringByJobsOCDemoListSettingSectionBlock _Nonnull)expandableSectionTitleBySection{
    @jobs_weakify(self)
    return ^NSString *(JobsOCDemoListSettingSection section){
        @jobs_strongify(self)
        if (!self) return nil;
        if (section == JobsOCDemoListSettingSectionSplashContent) {
            JobsOCSplashContentType contentType = JobsOCSplashPreferences.contentTypeForNextLaunch();
            return [NSString stringWithFormat:@"开屏内容：%@".jobsTr(),
                                              self.splashContentTitleArr()[contentType]];
        }
        if (section == JobsOCDemoListSettingSectionLanguage) {
            AppLanguage currentLanguage = self.currentEffectiveAppLanguage();
            NSInteger currentRow = 0;
            for (NSInteger row = 0; row < self.languageTitleArr().count; row++) {
                if (self.appLanguageByRow(row) == currentLanguage) {
                    currentRow = row;
                    break;
                }
            };return [NSString stringWithFormat:@"应用语言：%@".jobsTr(),
                                                self.languageTitleArr()[currentRow]];
        }
        JobsOCDemoListCellTextDisplayStrategy strategy = JobsOCCurrentDemoListCellTextDisplayStrategy();
        return [NSString stringWithFormat:@"列表主/副标题：%@".jobsTr(),
                                          self.cellTextDisplayStrategyTitleArr()[strategy]];
    };
}

-(JobsRetUIViewByJobsOCDemoListSettingSectionBlock _Nonnull)expansionAccessoryViewBySection{
    @jobs_weakify(self)
    return ^UIView *(JobsOCDemoListSettingSection section){
        @jobs_strongify(self)
        if (!self) return nil;
        BOOL expanded = [self.expandedSettingSectionIndexSet containsIndex:section];
        return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(expanded ? @"收起".jobsTr() : @"展开".jobsTr())
                .byFont(UIFontWeightRegularSize(13))
                .byTextCor(HEXCOLOR(0x1D7FF2))
                .byTextAlignment(NSTextAlignmentRight)
                .byFrame(CGRectMake(0, 0, JobsWidth(76), JobsWidth(24)));
        });
    };
}

-(JobsRetNSStringByNSIndexPathBlock _Nonnull)titleByIndexPath{
    @jobs_weakify(self)
    return ^NSString *(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return nil;
        if (indexPath.section == JobsOCDemoListSettingSectionGeneral) return self.generalSettingTitleArr()[indexPath.row];
        if (indexPath.row == 0) return self.expandableSectionTitleBySection(indexPath.section);
        NSInteger optionRow = indexPath.row - 1;
        if (indexPath.section == JobsOCDemoListSettingSectionSplashContent) return self.splashContentTitleArr()[optionRow];
        if (indexPath.section == JobsOCDemoListSettingSectionLanguage) return self.languageTitleArr()[optionRow];
        return self.cellTextDisplayStrategyTitleArr()[optionRow];
    };
}

-(JobsRetUITableViewCellAccessoryTypeByNSIndexPathBlock _Nonnull)accessoryTypeByIndexPath{
    @jobs_weakify(self)
    return ^UITableViewCellAccessoryType(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return (UITableViewCellAccessoryType){0};
        if (indexPath.section == JobsOCDemoListSettingSectionGeneral) {
            return UITableViewCellAccessoryDisclosureIndicator;
        }
        if (indexPath.row == 0) return UITableViewCellAccessoryNone;
        NSInteger optionRow = indexPath.row - 1;
        if (indexPath.section == JobsOCDemoListSettingSectionSplashContent) {
            return self.splashContentTypeByRow(optionRow) == JobsOCSplashPreferences.contentTypeForNextLaunch() ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
        }
        if (indexPath.section == JobsOCDemoListSettingSectionLanguage) {
            return self.appLanguageByRow(optionRow) == self.currentEffectiveAppLanguage() ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
        };return self.cellTextDisplayStrategyByRow(optionRow) == JobsOCCurrentDemoListCellTextDisplayStrategy() ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCDemoListSettingsVC
-(JobsRetJobsOCDemoListSettingsVCByBOOLBlock _Nonnull)byShouldApplyAppEntryAfterReturning{
    @jobs_weakify(self)
    return ^__kindof JobsOCDemoListSettingsVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setShouldApplyAppEntryAfterReturning:data];
        return self;
    };
}

-(JobsRetJobsOCDemoListSettingsVCByNSMutableIndexSetBlock _Nonnull)byExpandedSettingSectionIndexSet{
    @jobs_weakify(self)
    return ^__kindof JobsOCDemoListSettingsVC * _Nullable(NSMutableIndexSet * _Nullable data){
        @jobs_strongify(self)
        [self setExpandedSettingSectionIndexSet:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCDemoListSettingsVC
@end
