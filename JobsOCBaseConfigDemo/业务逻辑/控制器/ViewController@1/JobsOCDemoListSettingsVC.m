//
//  JobsOCDemoListSettingsVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCDemoListSettingsVC.h"
#import "AppDelegate+TabBarCtr.h"
#import <JobsBaseUI/UIViewController+BaseNavigationBar.h>

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

-(BOOL)jobsOCSplashEnabled;
-(void)setJobsOCSplashEnabled:(BOOL)jobsOCSplashEnabled;
-(BOOL)demoListReturnToTopAndRefreshEnabled;
-(void)setDemoListReturnToTopAndRefreshEnabled:(BOOL)enabled;
-(BOOL)showsSuspendTimeButton;
-(void)setShowsSuspendTimeButton:(BOOL)showsSuspendTimeButton;
-(BOOL)demoListDarkModeEnabled;
-(void)setDemoListDarkModeEnabled:(BOOL)enabled;
-(void)applyDemoListInterfaceStyle;
-(UIColor *)demoListPageBackgroundColor;
-(UIColor *)demoListNavigationBackgroundColor;
-(UIColor *)demoListPrimaryTextColor;
-(UIColor *)demoListCellBackgroundColor;
-(UIColor *)demoListSeparatorColor;
-(void)applyDemoListNavigationInterfaceStyle;
-(void)applyDemoListTabBarInterfaceStyle;
-(NSString *)splashSwitchTitle;
-(NSString *)returnSwitchTitle;
-(NSString *)suspendTimeButtonSwitchTitle;
-(NSString *)themeSwitchTitle;
-(NSString *)deallocTipsSwitchTitle;
-(NSArray <NSString *>*)generalSettingTitleArr;
-(NSArray <NSString *>*)splashContentTitleArr;
-(NSArray <NSString *>*)languageTitleArr;
-(NSArray <NSString *>*)cellTextDisplayStrategyTitleArr;
-(JobsOCSplashContentType)splashContentTypeByRow:(NSInteger)row;
-(AppLanguage)appLanguageByRow:(NSInteger)row;
-(AppLanguage)currentEffectiveAppLanguage;
-(JobsOCDemoListCellTextDisplayStrategy)cellTextDisplayStrategyByRow:(NSInteger)row;
-(NSString *)expandableSectionTitleBySection:(JobsOCDemoListSettingSection)section;
-(UIView *)expansionAccessoryViewBySection:(JobsOCDemoListSettingSection)section;
-(NSString *)titleByIndexPath:(NSIndexPath *)indexPath;
-(UITableViewCellAccessoryType)accessoryTypeByIndexPath:(NSIndexPath *)indexPath;
-(void)updateLocalizedContent;

@end

@implementation JobsOCDemoListSettingsVC
@synthesize tableView = _tableView;

-(void)loadView{
    [super loadView];
    self.expandedSettingSectionIndexSet = NSMutableIndexSet.indexSet;
    [self updateLocalizedContent];
    @jobs_weakify(self)
    [self addNotificationName:语言切换
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
        [self applyDemoListInterfaceStyle];
    }];
    [self addNotificationName:JobsThemeDidChangeNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
        [self applyDemoListInterfaceStyle];
    }];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(JobsSecondarySystemBackgroundColor);
    self.makeNavByAlpha(1);
    self.tableView.byAlpha(1);
    [self applyDemoListInterfaceStyle];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if (!self.shouldApplyAppEntryAfterReturning || !self.isMovingFromParentViewController) return;
    self.shouldApplyAppEntryAfterReturning = NO;
    JobsOCApplyAppRootViewController();
}

#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return JobsOCDemoListSettingSectionCount;
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    if (section == JobsOCDemoListSettingSectionGeneral) return self.generalSettingTitleArr.count;
    NSInteger optionCount = 0;
    if (section == JobsOCDemoListSettingSectionSplashContent) {
        optionCount = self.splashContentTitleArr.count;
    }else if (section == JobsOCDemoListSettingSectionLanguage){
        optionCount = self.languageTitleArr.count;
    }else{
        optionCount = self.cellTextDisplayStrategyTitleArr.count;
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
    cell.byBgColor([self demoListCellBackgroundColor]);
    cell.contentView.byBgColor([self demoListCellBackgroundColor]);
    cell.byTintColor(HEXCOLOR(0x1D7FF2));
    cell.accessoryView = nil;
    cell.indentationLevel = indexPath.section != JobsOCDemoListSettingSectionGeneral && indexPath.row > 0 ? 1 : 0;
    cell.indentationWidth = JobsWidth(20);
    if (indexPath.section != JobsOCDemoListSettingSectionGeneral && indexPath.row == 0) {
        cell.accessoryView = [self expansionAccessoryViewBySection:indexPath.section];
    }
    return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText([self titleByIndexPath:indexPath])
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor([self demoListPrimaryTextColor])
                .byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(indexPath.section != JobsOCDemoListSettingSectionGeneral && indexPath.row == 0)
                .byMinimumScaleFactor(indexPath.section != JobsOCDemoListSettingSectionGeneral && indexPath.row == 0 ? .72f : 1);
        })
        .byAccessoryType([self accessoryTypeByIndexPath:indexPath])
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
        JobsOCSplashContentType contentType = [self splashContentTypeByRow:optionRow];
        [JobsOCSplashPreferences setContentTypeForNextLaunch:contentType];
        ([NSString stringWithFormat:@"下次开屏内容已设为：%@".tr,
                                    self.splashContentTitleArr[optionRow]]).toast();
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]
                 withRowAnimation:UITableViewRowAnimationAutomatic];
        return;
    }
    if (indexPath.section == JobsOCDemoListSettingSectionLanguage) {
        self.appLanguageAtAppLanguageBy([self appLanguageByRow:optionRow]);
        self.changeTabBarItemTitleBy([NSIndexPath indexPathForRow:optionRow
                                                        inSection:indexPath.section]);
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]
                 withRowAnimation:UITableViewRowAnimationAutomatic];
        return;
    }
    if (indexPath.section == JobsOCDemoListSettingSectionCellTextDisplayStrategy) {
        JobsOCDemoListCellTextDisplayStrategy strategy = [self cellTextDisplayStrategyByRow:optionRow];
        JobsOCSetDemoListCellTextDisplayStrategy(strategy);
        ([NSString stringWithFormat:@"列表主/副标题已设为：%@".tr,
                                    self.cellTextDisplayStrategyTitleArr[optionRow]]).toast();
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]
                 withRowAnimation:UITableViewRowAnimationAutomatic];
        return;
    }
    JobsOCDemoListSettingItem item = indexPath.row;
    if (item == JobsOCDemoListSettingItemSplash) {
        [self setJobsOCSplashEnabled:![self jobsOCSplashEnabled]];
        ([self jobsOCSplashEnabled] ? @"下次打开开屏".tr : @"下次关闭开屏".tr).toast();
    }else if (item == JobsOCDemoListSettingItemReturnBehavior){
        BOOL enabled = ![self demoListReturnToTopAndRefreshEnabled];
        [self setDemoListReturnToTopAndRefreshEnabled:enabled];
        (enabled ? @"返回主列表：回顶部并刷新".tr : @"返回主列表：保持原样".tr).toast();
    }else if (item == JobsOCDemoListSettingItemSuspendTimeButton){
        [self setShowsSuspendTimeButton:![self showsSuspendTimeButton]];
        ([self showsSuspendTimeButton] ? @"悬浮时间按钮已显示".tr : @"悬浮时间按钮已隐藏".tr).toast();
    }else if (item == JobsOCDemoListSettingItemTheme){
        BOOL dark = ![self demoListDarkModeEnabled];
        [self setDemoListDarkModeEnabled:dark];
        (dark ? @"主题已切换：黑夜".tr : @"主题已切换：白天".tr).toast();
    }else if (item == JobsOCDemoListSettingItemSideDrawerMode){
        BOOL fixed = ![NSUserDefaults.standardUserDefaults boolForKey:@"JobsOCDemoSideDrawerFixed"];
        [NSUserDefaults.standardUserDefaults setBool:fixed forKey:@"JobsOCDemoSideDrawerFixed"];
        (fixed ? @"侧滑内容已设为固定".tr : @"侧滑内容已设为跟随".tr).toast();
    }else if (item == JobsOCDemoListSettingItemAppEntry){
        BOOL usesTabBarEntry = !JobsOCDemoListUsesTabBarEntry();
        JobsOCSetDemoListUsesTabBarEntry(usesTabBarEntry);
        self.shouldApplyAppEntryAfterReturning = YES;
        (usesTabBarEntry ? @"返回后从 TabBar 进入".tr : @"返回后直接进入 Demo 列表".tr).toast();
    }else if (item == JobsOCDemoListSettingItemDeallocTips){
        JobsSetControllerDeallocTipsEnabled(!JobsControllerDeallocTipsEnabled());
        (JobsControllerDeallocTipsEnabled() ? @"控制器销毁提示已开启".tr : @"控制器销毁提示已关闭".tr).toast();
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
-(BOOL)jobsOCSplashEnabled{
    id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsOCSplashEnabledUserDefaultsKey];
    return value ? [value boolValue] : YES;
}

-(void)setJobsOCSplashEnabled:(BOOL)jobsOCSplashEnabled{
    [NSUserDefaults.standardUserDefaults setBool:jobsOCSplashEnabled
                                          forKey:JobsOCSplashEnabledUserDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

-(BOOL)demoListReturnToTopAndRefreshEnabled{
    id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsOCDemoListReturnToTopAndRefreshUserDefaultsKey];
    return value ? [value boolValue] : YES;
}

-(void)setDemoListReturnToTopAndRefreshEnabled:(BOOL)enabled{
    [NSUserDefaults.standardUserDefaults setBool:enabled
                                          forKey:JobsOCDemoListReturnToTopAndRefreshUserDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

-(BOOL)showsSuspendTimeButton{
    id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsOCDemoSuspendTimeButtonVisibleUserDefaultsKey];
    return value ? [value boolValue] : YES;
}

-(void)setShowsSuspendTimeButton:(BOOL)showsSuspendTimeButton{
    [NSUserDefaults.standardUserDefaults setBool:showsSuspendTimeButton
                                          forKey:JobsOCDemoSuspendTimeButtonVisibleUserDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

-(BOOL)demoListDarkModeEnabled{
    return JobsThemeCenter.shared.isDarkMode;
}

-(void)setDemoListDarkModeEnabled:(BOOL)enabled{
    [JobsThemeCenter.shared setStyle:enabled ? JobsThemeStyleDark : JobsThemeStyleLight];
}

-(void)applyDemoListInterfaceStyle{
    self.view.byBgColor([self demoListPageBackgroundColor]);
    [self updateLocalizedContent];
    self.makeNavByAlpha(1);
    self.navBar.backBtn.jobsResetBtnTitle(@"返回".tr);
    [self applyDemoListNavigationInterfaceStyle];
    [self applyDemoListTabBarInterfaceStyle];
    if (_tableView) {
        _tableView.separatorColor = [self demoListSeparatorColor];
        [_tableView reloadData];
    }
}

-(UIColor *)demoListPageBackgroundColor{
    return JobsSystemGroupedBackgroundColor;
}

-(UIColor *)demoListNavigationBackgroundColor{
    return JobsSystemBackgroundColor;
}

-(UIColor *)demoListPrimaryTextColor{
    return JobsLabelColor;
}

-(UIColor *)demoListCellBackgroundColor{
    return JobsSecondarySystemGroupedBackgroundColor;
}

-(UIColor *)demoListSeparatorColor{
    if (@available(iOS 13.0, *)) return UIColor.separatorColor;
    return HEXCOLOR(0xE5E7EB);
}

-(void)applyDemoListNavigationInterfaceStyle{
    self
        .byGKNavBackgroundColor([self demoListNavigationBackgroundColor])
        .byGKNavBackgroundImage(nil)
        .byGKNavTitleColor([self demoListPrimaryTextColor])
        .byGKNavShadowColor([self demoListSeparatorColor])
        .byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar * _Nullable navigationBar) {
            navigationBar.byTintColor([self demoListPrimaryTextColor]);
        });
    self.navBar.byBgColor([self demoListNavigationBackgroundColor]);
    self.navBar.titleLab.byTextCor([self demoListPrimaryTextColor]);
}

-(void)applyDemoListTabBarInterfaceStyle{
    UIColor *backgroundColor = [self demoListNavigationBackgroundColor];
    UIColor *titleColor = [self demoListPrimaryTextColor];
    UIColor *selectedColor = HEXCOLOR(0x1D7FF2);
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = jobsMakeTabBarAppearance(^(__kindof UITabBarAppearance * _Nullable appearance) {
            appearance
                .byConfigureWithOpaqueBackground()
                .byBackgroundColor(backgroundColor)
                .byShadowColor([self demoListSeparatorColor]);
        });
        [UITabBar jobsApplyStandardAppearance:appearance];
        if (@available(iOS 15.0, *)) {
            [UITabBar jobsApplyScrollEdgeAppearance:appearance];
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
                    .byShadowColor([self demoListSeparatorColor]);
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
}

-(void)updateLocalizedContent{
    UIColor *navBgColor = [self demoListNavigationBackgroundColor];
    UIColor *titleColor = [self demoListPrimaryTextColor];
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr)
                .byTextCor(titleColor);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"设置".tr)
                .byFont(UIFontWeightRegularSize(18))
                .byTextCor(titleColor);
        })
        .byBgCor(navBgColor)
        .byNavBgCor(navBgColor);
}

-(NSString *)splashSwitchTitle{
    return [self jobsOCSplashEnabled] ? @"下次开屏：开".tr : @"下次开屏：关".tr;
}

-(NSString *)returnSwitchTitle{
    return [self demoListReturnToTopAndRefreshEnabled] ? @"返回：回顶部并刷新".tr : @"返回：保持原样".tr;
}

-(NSString *)suspendTimeButtonSwitchTitle{
    return [self showsSuspendTimeButton] ? @"悬浮时间：开".tr : @"悬浮时间：关".tr;
}

-(NSString *)themeSwitchTitle{
    return [self demoListDarkModeEnabled] ? @"主题切换：黑夜".tr : @"主题切换：白天".tr;
}

-(NSString *)deallocTipsSwitchTitle{
    return JobsControllerDeallocTipsEnabled() ? @"销毁提示：开".tr : @"销毁提示：关".tr;
}

-(NSArray<NSString *> *)generalSettingTitleArr{
    return @[
        [self splashSwitchTitle],
        [self returnSwitchTitle],
        [self suspendTimeButtonSwitchTitle],
        [self themeSwitchTitle],
        [NSUserDefaults.standardUserDefaults boolForKey:@"JobsOCDemoSideDrawerFixed"] ? @"侧滑菜单：内容固定".tr : @"侧滑菜单：内容跟随".tr,
        JobsOCDemoListUsesTabBarEntry() ? @"启动入口：TabBar".tr : @"启动入口：Demo 列表".tr,
        [self deallocTipsSwitchTitle]
    ];
}

-(NSArray<NSString *> *)languageTitleArr{
    return @[
        @"中文".tr,
        @"英文".tr,
        @"他加禄语".tr
    ];
}

-(NSArray<NSString *> *)cellTextDisplayStrategyTitleArr{
    return @[
        @"一般模式".tr,
        @"省略号模式".tr,
        @"缩小字体模式".tr,
        @"连续跑马灯".tr,
        @"左右来回滚动".tr
    ];
}

-(NSArray<NSString *> *)splashContentTitleArr{
    return @[
        @"本地图片".tr,
        @"本地 GIF".tr,
        @"远程图片".tr,
        @"本地视频".tr,
        @"远程视频".tr
    ];
}

-(JobsOCSplashContentType)splashContentTypeByRow:(NSInteger)row{
    if (row < JobsOCSplashContentTypeLocalImage || row > JobsOCSplashContentTypeRemoteVideo) {
        return JobsOCSplashContentTypeLocalImage;
    };return (JobsOCSplashContentType)row;
}

-(AppLanguage)appLanguageByRow:(NSInteger)row{
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
}

-(AppLanguage)currentEffectiveAppLanguage{
    NSString *languageCode = LanMgr.languageCodeByAppLanguage(LanMgr.language).lowercaseString;
    if ([languageCode hasPrefix:@"zh"]) return AppLanguageChineseSimplified;
    if ([languageCode hasPrefix:@"fil"] || [languageCode hasPrefix:@"tl"]) return AppLanguageTagalog;
    return AppLanguageEnglish;
}

-(JobsOCDemoListCellTextDisplayStrategy)cellTextDisplayStrategyByRow:(NSInteger)row{
    if (row < JobsOCDemoListCellTextDisplayStrategyNormal ||
        row > JobsOCDemoListCellTextDisplayStrategyPingPong) {
        return JobsOCDemoListCellTextDisplayStrategyContinuous;
    };return (JobsOCDemoListCellTextDisplayStrategy)row;
}

-(NSString *)expandableSectionTitleBySection:(JobsOCDemoListSettingSection)section{
    if (section == JobsOCDemoListSettingSectionSplashContent) {
        JobsOCSplashContentType contentType = JobsOCSplashPreferences.contentTypeForNextLaunch;
        return [NSString stringWithFormat:@"开屏内容：%@".tr,
                                          self.splashContentTitleArr[contentType]];
    }
    if (section == JobsOCDemoListSettingSectionLanguage) {
        AppLanguage currentLanguage = [self currentEffectiveAppLanguage];
        NSInteger currentRow = 0;
        for (NSInteger row = 0; row < self.languageTitleArr.count; row++) {
            if ([self appLanguageByRow:row] == currentLanguage) {
                currentRow = row;
                break;
            }
        };return [NSString stringWithFormat:@"应用语言：%@".tr,
                                            self.languageTitleArr[currentRow]];
    }
    JobsOCDemoListCellTextDisplayStrategy strategy = JobsOCCurrentDemoListCellTextDisplayStrategy();
    return [NSString stringWithFormat:@"列表主/副标题：%@".tr,
                                      self.cellTextDisplayStrategyTitleArr[strategy]];
}

-(UIView *)expansionAccessoryViewBySection:(JobsOCDemoListSettingSection)section{
    BOOL expanded = [self.expandedSettingSectionIndexSet containsIndex:section];
    return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(expanded ? @"收起".tr : @"展开".tr)
            .byFont(UIFontWeightRegularSize(13))
            .byTextCor(HEXCOLOR(0x1D7FF2))
            .byTextAlignment(NSTextAlignmentRight)
            .byFrame(CGRectMake(0, 0, JobsWidth(76), JobsWidth(24)));
    });
}

-(NSString *)titleByIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == JobsOCDemoListSettingSectionGeneral) return self.generalSettingTitleArr[indexPath.row];
    if (indexPath.row == 0) return [self expandableSectionTitleBySection:indexPath.section];
    NSInteger optionRow = indexPath.row - 1;
    if (indexPath.section == JobsOCDemoListSettingSectionSplashContent) return self.splashContentTitleArr[optionRow];
    if (indexPath.section == JobsOCDemoListSettingSectionLanguage) return self.languageTitleArr[optionRow];
    return self.cellTextDisplayStrategyTitleArr[optionRow];
}

-(UITableViewCellAccessoryType)accessoryTypeByIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == JobsOCDemoListSettingSectionGeneral) {
        return UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row == 0) return UITableViewCellAccessoryNone;
    NSInteger optionRow = indexPath.row - 1;
    if (indexPath.section == JobsOCDemoListSettingSectionSplashContent) {
        return [self splashContentTypeByRow:optionRow] == JobsOCSplashPreferences.contentTypeForNextLaunch ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    }
    if (indexPath.section == JobsOCDemoListSettingSectionLanguage) {
        return [self appLanguageByRow:optionRow] == [self currentEffectiveAppLanguage] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    };return [self cellTextDisplayStrategyByRow:optionRow] == JobsOCCurrentDemoListCellTextDisplayStrategy() ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}

@end
