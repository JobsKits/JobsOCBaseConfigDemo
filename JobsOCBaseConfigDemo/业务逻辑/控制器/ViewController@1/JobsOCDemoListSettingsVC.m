//
//  JobsOCDemoListSettingsVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCDemoListSettingsVC.h"

static NSString *const JobsOCDemoListSettingsCellReuseIdentifier = @"JobsOCDemoListSettingsCell";
static NSString *const JobsOCSplashEnabledUserDefaultsKey = @"com.BSports.JobsOCSplashEnabledUserDefaultsKey";
static NSString *const JobsOCDemoListReturnToTopAndRefreshUserDefaultsKey = @"com.BSports.JobsOCDemoListReturnToTopAndRefreshUserDefaultsKey";
static NSString *const JobsOCDemoListDarkModeUserDefaultsKey = @"com.BSports.JobsOCDemoListDarkModeUserDefaultsKey";

typedef NS_ENUM(NSInteger, JobsOCDemoListSettingItem) {
    JobsOCDemoListSettingItemSplash = 0,
    JobsOCDemoListSettingItemReturnBehavior,
    JobsOCDemoListSettingItemTheme
};

typedef NS_ENUM(NSInteger, JobsOCDemoListSettingSection) {
    JobsOCDemoListSettingSectionGeneral = 0,
    JobsOCDemoListSettingSectionLanguage
};

@interface JobsOCDemoListSettingsVC ()

Prop_strong()UITableView *tableView;

-(BOOL)jobsOCSplashEnabled;
-(void)setJobsOCSplashEnabled:(BOOL)jobsOCSplashEnabled;
-(BOOL)demoListReturnToTopAndRefreshEnabled;
-(void)setDemoListReturnToTopAndRefreshEnabled:(BOOL)enabled;
-(BOOL)demoListDarkModeEnabled;
-(void)setDemoListDarkModeEnabled:(BOOL)enabled;
-(void)applyDemoListInterfaceStyle;
-(NSString *)splashSwitchTitle;
-(NSString *)returnSwitchTitle;
-(NSString *)themeSwitchTitle;
-(NSArray <NSString *>*)generalSettingTitleArr;
-(NSArray <NSString *>*)languageTitleArr;
-(AppLanguage)appLanguageByRow:(NSInteger)row;
-(NSString *)titleByIndexPath:(NSIndexPath *)indexPath;
-(UITableViewCellAccessoryType)accessoryTypeByIndexPath:(NSIndexPath *)indexPath;
-(void)updateLocalizedContent;

@end

@implementation JobsOCDemoListSettingsVC

@synthesize tableView = _tableView;

-(void)loadView{
    [super loadView];
    [self updateLocalizedContent];
    @jobs_weakify(self)
    [self addNotificationName:语言切换
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
        [self updateLocalizedContent];
        self.makeNavByAlpha(1);
        [self.tableView reloadData];
    }];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self applyDemoListInterfaceStyle];
    self.view.byBgColor(HEXCOLOR(0xF4F5F8));
    self.makeNavByAlpha(1);
    self.tableView.byAlpha(1);
}

#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    if (section == JobsOCDemoListSettingSectionGeneral) return self.generalSettingTitleArr.count;
    return self.languageTitleArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return section == JobsOCDemoListSettingSectionGeneral ? JobsWidth(16) : JobsWidth(36);
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
    return section == JobsOCDemoListSettingSectionLanguage ? @"应用语言".tr : nil;
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCDemoListSettingsCellReuseIdentifier
                                                            forIndexPath:indexPath];
    return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText([self titleByIndexPath:indexPath])
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byAccessoryType([self accessoryTypeByIndexPath:indexPath])
        .bySelectionStyle(UITableViewCellSelectionStyleDefault);
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == JobsOCDemoListSettingSectionLanguage) {
        self.appLanguageAtAppLanguageBy([self appLanguageByRow:indexPath.row]);
        self.changeTabBarItemTitleBy(indexPath);
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
    }else if (item == JobsOCDemoListSettingItemTheme){
        BOOL dark = ![self demoListDarkModeEnabled];
        [self setDemoListDarkModeEnabled:dark];
        (dark ? @"主题已切换：黑夜".tr : @"主题已切换：白天".tr).toast();
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

-(BOOL)demoListDarkModeEnabled{
    id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsOCDemoListDarkModeUserDefaultsKey];
    if (value) return [value boolValue];
    if (@available(iOS 13.0, *)) {
        return self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark;
    };return NO;
}

-(void)setDemoListDarkModeEnabled:(BOOL)enabled{
    [NSUserDefaults.standardUserDefaults setBool:enabled
                                          forKey:JobsOCDemoListDarkModeUserDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
    [self applyDemoListInterfaceStyle];
}

-(void)applyDemoListInterfaceStyle{
    if (@available(iOS 13.0, *)) {
        UIUserInterfaceStyle style = [self demoListDarkModeEnabled] ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight;
        for (UIWindow *window in UIApplication.sharedApplication.windows) {
            window.overrideUserInterfaceStyle = style;
        }
    }
}

-(void)updateLocalizedContent{
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"设置".tr)
                .byFont(UIFontWeightRegularSize(18))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1));
}

-(NSString *)splashSwitchTitle{
    return [self jobsOCSplashEnabled] ? @"下次开屏：开".tr : @"下次开屏：关".tr;
}

-(NSString *)returnSwitchTitle{
    return [self demoListReturnToTopAndRefreshEnabled] ? @"返回：回顶部并刷新".tr : @"返回：保持原样".tr;
}

-(NSString *)themeSwitchTitle{
    return [self demoListDarkModeEnabled] ? @"主题切换：黑夜".tr : @"主题切换：白天".tr;
}

-(NSArray<NSString *> *)generalSettingTitleArr{
    return @[
        [self splashSwitchTitle],
        [self returnSwitchTitle],
        [self themeSwitchTitle]
    ];
}

-(NSArray<NSString *> *)languageTitleArr{
    return @[
        @"中文".tr,
        @"英文".tr,
        @"他加禄语".tr
    ];
}

-(AppLanguage)appLanguageByRow:(NSInteger)row{
    switch (row) {
        case 0:
            return AppLanguageChineseSimplified;
        case 1:
            return AppLanguageEnglish;
        default:
            return AppLanguageTagalog;
    }
}

-(NSString *)titleByIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == JobsOCDemoListSettingSectionGeneral) return self.generalSettingTitleArr[indexPath.row];
    return self.languageTitleArr[indexPath.row];
}

-(UITableViewCellAccessoryType)accessoryTypeByIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == JobsOCDemoListSettingSectionGeneral) {
        return UITableViewCellAccessoryDisclosureIndicator;
    };return [self appLanguageByRow:indexPath.row] == LanMgr.language ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}

@end
