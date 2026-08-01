//
//  ViewController@1.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ViewController@1.h"
#import "JobsOCDemoListSettingsVC.h"
#import "UIViewController+BaseNavigationBar.h"
#import "JobsViewPush.h"

BOOL ISLogin;
static NSString *const JobsOCDemoListReturnToTopAndRefreshUserDefaultsKey = @"com.BSports.JobsOCDemoListReturnToTopAndRefreshUserDefaultsKey";
static NSString *const JobsOCDemoListSectionOrderUserDefaultsKey = @"com.BSports.JobsOCDemoListSectionOrderUserDefaultsKey";
static NSString *const JobsOCDemoSearchHistoryUserDefaultsKey = @"com.BSports.JobsOCDemoSearchHistoryUserDefaultsKey";
static NSString *const JobsOCDemoPinnedDemoUserDefaultsKey = @"com.BSports.JobsOCDemoPinnedDemoUserDefaultsKey";
static NSString *const JobsOCDemoSuspendTimeButtonVisibleUserDefaultsKey = @"com.jobs.demoList.showsSuspendTimeButton";
static NSString *const JobsOCDemoProjectFolderInfoKey = @"JobsProjectFolderName";
static NSString *const JobsOCDemoProjectFolderFallbackName = @"JobsOCBaseConfigDemo@ByPods";
static NSString *const JobsOCFunctionMenuCellReuseIdentifier = @"UITableViewCell";
static NSString *const JobsOCDemoSideMenuCellReuseIdentifier = @"JobsOCDemoSideMenuCell";
static NSString *const JobsOCDemoSearchHistoryCellReuseIdentifier = @"JobsOCDemoSearchHistoryCell";
static NSString *const JobsOCDemoPinnedCellReuseIdentifier = @"JobsOCDemoPinnedCell";
static NSString *const JobsOCDemoSuspendTimeTimerIdentifier = @"ViewController_1.suspendTimeBtn.timer";
static NSString *const JobsOCDemoSuspendSpinTimerIdentifier = @"ViewController_1.suspendSpinBtn.timer";

typedef NS_ENUM(NSInteger, JobsOCFunctionMenuItem) {
    JobsOCFunctionMenuItemSearch = 0,
    JobsOCFunctionMenuItemDemoFold,
    JobsOCFunctionMenuItemSetting
};

typedef NS_ENUM(NSInteger, JobsOCDemoSideMenuItem) {
    JobsOCDemoSideMenuItemUserInfo = 0,
    JobsOCDemoSideMenuItemCrashLog,
    JobsOCDemoSideMenuItemFavorites,
    JobsOCDemoSideMenuItemSettings,
    JobsOCDemoSideMenuItemAbout
};

static UILongPressGestureRecognizer *JobsOCDemoSuspendLongPressGesture(UIView *view) {
    for (UIGestureRecognizer *gesture in view.gestureRecognizers) {
        if ([gesture isKindOfClass:UILongPressGestureRecognizer.class]) {
            return (UILongPressGestureRecognizer *)gesture;
        }
    };return nil;
}

@interface ViewController_1 ()
/// UI
Prop_strong()UIButton *userHeadBtn;
Prop_strong()UILabel *demoNavigationTitleLab;
Prop_strong()UILabel *demoNavigationProjectLab;
Prop_strong()UIView *demoNavigationTitleView;
Prop_strong()UIView *demoSideMenuView;
Prop_strong()UITableView *demoSideMenuTableView;
Prop_strong()UIButton *demoSideMenuDimButton;
Prop_strong()JobsSideDrawer *demoSideDrawer;
Prop_strong()UIButton *functionMenuBtn;
Prop_strong()UITableView *functionMenuTableView;
Prop_strong()UITapGestureRecognizer *functionMenuDismissTapGesture;
Prop_strong()UILongPressGestureRecognizer *demoSectionReorderLongPressGesture;
Prop_strong()UIView *demoSectionDragSnapshotView;
Prop_strong()NSIndexPath *demoSectionDragIndexPath;
Prop_strong()UIView *demoSearchHeaderView;
Prop_strong()UISearchBar *demoSearchBar;
Prop_strong()UIButton *demoSearchCancelBtn;
Prop_strong()UIButton *suspendTimeBtn;
Prop_strong()UIButton *suspendSpinBtn;
Prop_strong()UIButton *suspendFuseBtn;
Prop_strong()UIAlertController *suspendTimeVisibilityAlertController;
/// Data
Prop_strong()NSMutableArray <__kindof UITableViewCell *>*tbvCellMutArr;
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;
Prop_strong()NSMutableArray <JobsOCDemoSectionModel *>*demoSectionMutArr;
Prop_strong()NSMutableArray <UIViewModel *>*pinnedDemoMutArr;
Prop_strong()NSMutableArray <NSString *>*demoSearchHistoryMutArr;
Prop_strong()NSMutableIndexSet *expandedDemoSectionIndexSet;
Prop_copy()NSString *demoSearchKeyword;
Prop_copy()NSString *selectedCountryCodePlainText;
Prop_strong()NSAttributedString *selectedCountryCodeAttributedText;
Prop_assign()CGFloat demoSectionDragTouchOffsetY;
Prop_assign()BOOL demoListHasAppeared;
Prop_assign()BOOL demoSearchEnabled;
Prop_assign()BOOL demoSideMenuOpen;
Prop_assign()BOOL suspendFuseLongPressConsumed;
Prop_assign()NSInteger suspendSpinSeconds;
Prop_assign()AppLanguage demoListRenderedLanguage;
Prop_assign()JobsOCDemoListCellTextDisplayStrategy appliedCellTextDisplayStrategy;

-(void)setupSuspendButtons;
-(void)setupSuspendTimers;
-(void)refreshSuspendTimeButtonTitle;
-(void)showSuspendTimeButtonVisibilityAlert;
-(BOOL)showsSuspendTimeButton;
-(void)setShowsSuspendTimeButton:(BOOL)showsSuspendTimeButton;
-(void)refreshSuspendTimeButtonVisibility;
-(NSAttributedString *)suspendTimeAttributedTitleByClock:(NSString *)clock;
-(BOOL)demoListReturnToTopAndRefreshEnabled;
-(void)setDemoListReturnToTopAndRefreshEnabled:(BOOL)enabled;
-(BOOL)demoListDarkModeEnabled;
-(void)applyDemoListInterfaceStyle;
-(UIColor *)demoListPageBackgroundColor;
-(UIColor *)demoListNavigationBackgroundColor;
-(UIColor *)demoListPrimaryTextColor;
-(UIColor *)demoListSecondaryTextColor;
-(UIColor *)demoListCellBackgroundColor;
-(UIColor *)demoListFunctionMenuBackgroundColor;
-(UIColor *)demoListCellSelectedBackgroundColor;
-(UIColor *)demoListSeparatorColor;
-(void)applyDemoListNavigationInterfaceStyle;
-(void)applyDemoListTabBarInterfaceStyle;
-(void)refreshFunctionMenuButtonTheme;
-(void)refreshDemoSearchTheme;
-(NSArray <JobsOCDemoSectionModel *>*)visibleDemoSectionArr;
-(BOOL)hasPinnedDemoSection;
-(NSInteger)demoFoldTableSection;
-(BOOL)isPinnedDemoIndexPath:(NSIndexPath *)indexPath;
-(BOOL)isDemoFoldIndexPath:(NSIndexPath *)indexPath;
-(NSArray <JobsOCDemoSectionModel *>*)demoSectionArrByFilteringPinnedFromSectionArr:(NSArray <JobsOCDemoSectionModel *>*)sectionArr;
-(NSString *)demoTitleByViewModel:(UIViewModel *)viewModel;
-(NSString *)demoSubTextByViewModel:(UIViewModel *)viewModel;
-(NSAttributedString *)demoSubAttributedTextByViewModel:(UIViewModel *)viewModel;
-(NSString *)demoKeyByViewModel:(UIViewModel *)viewModel;
-(NSString *)demoPersistentKeyByViewModel:(UIViewModel *)viewModel;
-(BOOL)isPinnedDemoViewModel:(UIViewModel *)viewModel;
-(JobsOCDemoSectionModel *)pinnedDemoSectionModel;
-(void)pinDemoViewModel:(UIViewModel *)viewModel;
-(void)unpinPinnedDemoAtIndex:(NSInteger)index;
-(NSArray <NSString *>*)savedPinnedDemoKeyArr;
-(void)applySavedPinnedDemosIfNeeded;
-(void)savePinnedDemos;
-(void)pushDemoViewModel:(UIViewModel *)viewModel;
-(NSUInteger)demoSectionIndexByTitle:(NSString *)title;
-(BOOL)isDemoFoldInnerRowPoint:(CGPoint)point
                     indexPath:(NSIndexPath *)indexPath;
-(BOOL)viewModel:(UIViewModel *)viewModel containsKeyword:(NSString *)keyword;
-(NSString *)sectionTitleForViewModel:(UIViewModel *)viewModel;
-(NSString *)sectionDescriptionForTitle:(NSString *)title;
-(JobsOCDemoSectionModel *)sectionModelInArr:(NSMutableArray <JobsOCDemoSectionModel *>*)data
                                       title:(NSString *)title;
-(NSArray <NSString *>*)functionMenuTitles;
-(NSArray <NSString *>*)demoSideMenuTitles;
-(NSArray <NSString *>*)demoSideMenuSymbolNames;
-(CGFloat)demoSideMenuWidth;
-(UIView *)demoSideMenuMainView;
-(void)prepareDemoSideMenuIfNeeded;
-(void)toggleDemoSideMenu;
-(void)showDemoSideMenu:(BOOL)show
               animated:(BOOL)animated;
-(void)handleDemoSideMenuItemAtIndex:(NSInteger)index;
-(void)pushUserInfoDisplayVC;
-(void)pushCrashLogVC;
-(NSString *)demoFoldSwitchTitle;
-(CGFloat)functionMenuTableWidth;
-(CGFloat)functionMenuTableHeight;
-(UIImage *)functionMenuImageBySymbolName:(NSString *)symbolName
                                tintColor:(UIColor *)tintColor;
-(void)toggleFunctionMenu;
-(void)showFunctionMenu:(BOOL)show;
-(void)pushDemoListSettingsVC;
-(void)setSearchEnabled:(BOOL)enabled;
-(BOOL)demoSearchActive;
-(BOOL)demoSearchLandingActive;
-(NSString *)normalizedDemoSearchTextBy:(NSString *)text;
-(void)applyDemoSearchKeyword:(NSString *)keyword
                  saveHistory:(BOOL)saveHistory;
-(void)saveDemoSearchHistoryByText:(NSString *)text;
-(void)deleteDemoSearchHistoryAtIndex:(NSUInteger)index;
-(void)clearDemoSearchHistory;
-(BOOL)anyVisibleDemoSectionExpanded;
-(BOOL)allVisibleDemoSectionsExpanded;
-(void)foldDemoSectionsWithFirstUnfolded;
-(void)unfoldAllDemoSections;
-(void)setAllDemoSectionsExpanded:(BOOL)expanded;
-(NSString *)demoProjectFolderName;
-(NSAttributedString *)demoNavigationAttributedTitle;
-(void)refreshDemoNavigationTitle;
-(void)updateLocalizedContent;
-(void)reloadLocalizedDemoListContent;
-(void)reloadLocalizedDemoListContentIfNeeded;
-(UIView *)demoListTableFooterView;
-(UIButtonModel *)demoListEmptyDataButtonModel;
-(void)reloadDemoListToTopAndRefresh;
-(void)handleDemoSectionReorderLongPress:(UILongPressGestureRecognizer *)gesture;
-(BOOL)canDragDemoSectionAtIndexPath:(NSIndexPath *)indexPath;
-(void)moveDemoSectionFromIndexPath:(NSIndexPath *)sourceIndexPath
                        toIndexPath:(NSIndexPath *)destinationIndexPath;
-(void)finishDemoSectionDrag;
-(NSArray <NSString *>*)savedDemoSectionOrderArr;
-(void)applySavedDemoSectionOrderIfNeeded;
-(void)saveDemoSectionOrder;
-(void)moveOtherDemoSectionToEndInArr:(NSMutableArray <JobsOCDemoSectionModel *>*)sectionMutArr;
-(void)moveExpandedDemoSectionStateFromRow:(NSUInteger)sourceRow
                                     toRow:(NSUInteger)destinationRow;
-(UIViewModel *)jobs_countryCodeDemoViewModel;
-(BOOL)jobs_isCountryCodeDemoViewModel:(UIViewModel *)viewModel;
-(void)jobs_pushCountryCodeCtrlWithViewModel:(UIViewModel *)viewModel;
-(void)jobs_updateSelectedCountryCodeWithCountryName:(NSString *)countryName
                                                code:(NSString *)code;
-(void)jobs_applySelectedCountryCodeToViewModel:(UIViewModel *)viewModel;
-(UIColor *)jobs_countryCodeDemoSubTextColor;

@end

@implementation ViewController_1
- (void)dealloc{
    JobsTimerMgr.shared
        .byStopAndRemove(JobsOCDemoSuspendTimeTimerIdentifier)
        .byStopAndRemove(JobsOCDemoSuspendSpinTimerIdentifier);
    if (_suspendSpinBtn) _suspendSpinBtn.bySpinStop();
    if (_suspendFuseBtn) [_suspendFuseBtn byFusePressStop:NO];
    [self showDemoSideMenu:NO
                  animated:NO];
    [_demoSideMenuView removeFromSuperview];
    [_demoSideMenuDimButton removeFromSuperview];
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

- (instancetype)init{
    if (self = [super init]) {
        JobsLog(@"");
    };return self;
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.setupNavigationBarHidden = YES;
    self.demoListRenderedLanguage = LanMgr.language;
    self.appliedCellTextDisplayStrategy = JobsOCCurrentDemoListCellTextDisplayStrategy();
    [self updateLocalizedContent];
    @jobs_weakify(self)
    [self addNotificationName:语言切换
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
        [self reloadLocalizedDemoListContent];
    }];
    [self addNotificationName:JobsThemeDidChangeNotification
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
        [self applyDemoListInterfaceStyle];
    }];
    /// 装填用户信息数据
    /// json生成器 ： https://www.site24x7.com/zhcn/tools/json-generator.html
    self.saveUserInfo(JobsUserModel.byData(@"UserData".readLocalFileWithName));// 保存全局唯一的一份用户档案
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsSecondarySystemBackgroundColor);
    if (@available(iOS 11.0, *)) {
        self.view.byBgColor(@"TextColor0".namedCor);
    }else{
        self.view.byBgColor(JobsSecondarySystemBackgroundColor);
    }
    @jobs_weakify(self)
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        UIBarButtonItem *item = UIBarButtonItem.initBy(self.userHeadBtn);
        if (@available(iOS 26.0, *)) {
            item
                .byHidesSharedBackground(YES)
                .bySharesBackground(NO);
        }
        data.add(item);
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        UIBarButtonItem *item = UIBarButtonItem.initBy(self.functionMenuBtn);
        if (@available(iOS 26.0, *)) {
            item
                .byHidesSharedBackground(YES)
                .bySharesBackground(NO);
        }
        data.add(item);
    });
    self.makeNavByAlpha(1);
    self.navBar.backBtn.jobsVisible = NO;
    self.navBar.titleLab.byHidden(YES);
    self.demoNavigationTitleView.byHidden(NO);
    [self refreshDemoNavigationTitle];
    [self applyDemoListInterfaceStyle];
    self.tableView.byShow(self);
    [self foldDemoSectionsWithFirstUnfolded];
    self.functionMenuTableView.byHidden(YES);
    self.functionMenuDismissTapGesture.byEnabled(YES);
    [self setupSuspendButtons];
    [self setupSuspendTimers];
    [self refreshSuspendTimeButtonVisibility];
//    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
//    UIInterfaceOrientation s = self.getInterfaceOrientation;
//    DeviceOrientation d = self.getDeviceOrientation;
    JobsLog(@"");
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    JobsOCDemoListCellTextDisplayStrategy strategy = JobsOCCurrentDemoListCellTextDisplayStrategy();
    BOOL textDisplayStrategyChanged = strategy != self.appliedCellTextDisplayStrategy;
    self.appliedCellTextDisplayStrategy = strategy;
    [self reloadLocalizedDemoListContentIfNeeded];
    [self applyDemoListInterfaceStyle];
    [self refreshSuspendTimeButtonVisibility];
    if ([self demoListReturnToTopAndRefreshEnabled]) {
        [self reloadDemoListToTopAndRefresh];
    }else if (!self.demoListHasAppeared || textDisplayStrategyChanged){
        [self.tableView reloadData];
    }
    self.demoListHasAppeared = YES;
//    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
//    UIInterfaceOrientation s = self.getInterfaceOrientation;
//    DeviceOrientation d = self.getDeviceOrientation;
    JobsLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self refreshSuspendTimeButtonVisibility];
    JobsTimerMgr.shared.byResume(JobsOCDemoSuspendSpinTimerIdentifier);
//    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
//    UIInterfaceOrientation s = self.getInterfaceOrientation;
//    DeviceOrientation d = self.getDeviceOrientation;
//    self.menuView.alpha = JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.demoSideMenuOpen) {
        [self showDemoSideMenu:NO
                      animated:NO];
    }
}

#pragma mark —— 三个悬浮按钮
-(void)setupSuspendButtons{
    [self.view layoutIfNeeded];
    self.suspendSpinBtn.bySpinStart();
    self.suspendTimeBtn.byAlpha(1);
    self.suspendFuseBtn.byAlpha(1);
}

-(void)showSuspendTimeButtonVisibilityAlert{
    @jobs_weakify(self)
    self.suspendTimeVisibilityAlertController = self.makeAlertControllerByAlertModel(jobsMakeAlertModel(^(__kindof JobsAlertModel * _Nullable data) {
        data.byAlertControllerTitle(@"隐藏悬浮时间？".tr)
            .byMessage(@"隐藏后可在“设置”中重新开启。".tr)
            .byPreferredStyle(UIAlertControllerStyleAlert)
            .byAlertActionTitle(@"隐藏".tr)
            .byAlertActionStyle(UIAlertActionStyleDestructive)
            .byCancelAlertActionTitle(@"取消".tr)
            .byCancelAlertActionStyle(UIAlertActionStyleCancel)
            .byAlertActionBlock(^(__unused UIAlertAction * _Nullable action) {
                @jobs_strongify(self)
                [self setShowsSuspendTimeButton:NO];
                [self refreshSuspendTimeButtonVisibility];
            });
    }));
    /// 普通系统 Alert 不进入页面转场导航链路
    [self presentViewController:self.suspendTimeVisibilityAlertController
                       animated:YES
                     completion:nil];
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

-(void)refreshSuspendTimeButtonVisibility{
    BOOL visible = [self showsSuspendTimeButton];
    self.suspendTimeBtn.byHidden(!visible);
    if (visible) {
        JobsTimerMgr.shared.byResume(JobsOCDemoSuspendTimeTimerIdentifier);
    }else{
        JobsTimerMgr.shared.byPause(JobsOCDemoSuspendTimeTimerIdentifier);
    }
}

-(void)setupSuspendTimers{
    self.suspendSpinSeconds = 0;
    @jobs_weakify(self)
    JobsTimerMgr.shared
        .byUpsertTimer(JobsOCDemoSuspendTimeTimerIdentifier,
                       JobsTimerTypeGCD,
                       JobsTimerBackgroundPolicyPauseAndResume,
                       YES,
                       ^(JobsTimer *timer) {
            timer.byTimerStyle(TimerStyle_clockwise)
                .byTimeInterval(1)
                .byQueue(dispatch_get_main_queue());
        }, ^{
            @jobs_strongify(self)
            [self refreshSuspendTimeButtonTitle];
        })
        .byUpsertTimer(JobsOCDemoSuspendSpinTimerIdentifier,
                       JobsTimerTypeGCD,
                       JobsTimerBackgroundPolicyPauseAndResume,
                       YES,
                       ^(JobsTimer *timer) {
            timer.byTimerStyle(TimerStyle_clockwise)
                .byTimeInterval(1)
                .byQueue(dispatch_get_main_queue());
        }, ^{
            @jobs_strongify(self)
            self.suspendSpinSeconds += 1;
            self.suspendSpinBtn
                .jobsResetBtnTitle([NSString stringWithFormat:@"%ld",(long)self.suspendSpinSeconds])
                .jobsResetBtnTitleFont(UIFontWeightBoldSize(22));
        });
}

-(void)refreshSuspendTimeButtonTitle{
    NSString *clock = self.currentTimeStringBy(@"HH:mm:ss");
    if (@available(iOS 16.0, *)) {
        _suspendTimeBtn
            .jobsResetBtnTitle(@"当前时间".tr)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(18))
            .jobsResetBtnSubTitle(clock)
            .jobsResetBtnSubTitleFont(UIFontWeightRegularSize(13));
    }else{
        _suspendTimeBtn.jobsResetBtnNormalAttributedTitle([self suspendTimeAttributedTitleByClock:clock]);
    }
}

-(NSAttributedString *)suspendTimeAttributedTitleByClock:(NSString *)clock{
    NSString *title = @"当前时间".tr;
    NSString *displayTitle = [NSString stringWithFormat:@"%@\n%@",title,clock];
    NSRange displayTitleRange = NSMakeRange(0, displayTitle.length);
    NSRange titleRange = NSMakeRange(0, title.length);
    NSRange clockRange = NSMakeRange(title.length + 1, clock.length);
    return JobsMutAttributedString(displayTitle)
        .addForegroundColorAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
            data.byValue(JobsWhiteColor)
                .byRange(displayTitleRange);
        }))
        .addFontAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
            data.byValue(UIFontWeightBoldSize(18))
                .byRange(titleRange);
        }))
        .addFontAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
            data.byValue(UIFontWeightRegularSize(13))
                .byRange(clockRange);
        }))
        .addAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
            data.byValue(jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable paragraphStyle) {
                paragraphStyle.byAlignment(NSTextAlignmentCenter);
            }))
                .byRange(displayTitleRange);
        }));
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView != _tableView) return;
    [self showFunctionMenu:NO];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == _demoSideMenuTableView) return 1;
    if (tableView == _functionMenuTableView) return 1;
    if ([self demoSearchLandingActive]) return 1;
    return [self hasPinnedDemoSection] ? 2 : 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _demoSideMenuTableView) return JobsWidth(64);
    if (tableView == _functionMenuTableView) return 44;
    if ([self demoSearchLandingActive]) return JobsWidth(54);
    BOOL pinnedDemo = [self isPinnedDemoIndexPath:indexPath];
    BOOL expandedDemo = [self isDemoFoldIndexPath:indexPath] &&
                        [self.expandedDemoSectionIndexSet containsIndex:indexPath.row];
    if (pinnedDemo || expandedDemo) {
        CGFloat innerTableWidth = CGRectGetWidth(tableView.bounds) - 20;
        if (innerTableWidth <= 0) innerTableWidth = JobsMainScreen_WIDTH() - 20;
        JobsOCDemoSectionModel *sectionModel = pinnedDemo
            ? self.pinnedDemoSectionModel
            : self.visibleDemoSectionArr[indexPath.row];
        return [JobsOCRootFoldTableCell expandedHeightByItemCount:sectionModel.dataMutArr.count
                                               sectionDescription:sectionModel.sectionDescription
                                                  innerTableWidth:innerTableWidth];
    }
    if (![self isDemoFoldIndexPath:indexPath]) return CGFLOAT_MIN;
    return JobsOCRootFoldTableCell.collapsedHeight;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    if (tableView == _demoSideMenuTableView) return CGFLOAT_MIN;
    if (tableView == _functionMenuTableView) return CGFLOAT_MIN;
    if (tableView != _functionMenuTableView && [self demoSearchLandingActive]) return JobsWidth(48);
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    if (tableView == _demoSideMenuTableView) return nil;
    if (tableView == _functionMenuTableView) return nil;
    if ([self demoSearchLandingActive]) {
        @jobs_weakify(self)
        return jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.byBgColor(JobsClearColor);
            jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                label
                    .byText(@"搜索历史".tr)
                    .byTextCor(JobsLabelColor)
                    .byFont(UIFontWeightSemiboldSize(JobsWidth(17)))
                    .addOn(view)
                    .byAdd(^(MASConstraintMaker *make) {
                        make.left.equalTo(view).offset(JobsWidth(24));
                        make.centerY.equalTo(view);
                    });
            });
            jobsMakeButton(^(__kindof UIButton * _Nullable button) {
                button
                    .jobsResetBtnTitle(@"清空".tr)
                    .jobsResetBtnTitleCor(JobsSecondaryLabelColor)
                    .jobsResetBtnTitleFont(UIFontWeightRegularSize(JobsWidth(13)))
                    .jobsResetBtnBgCor(JobsClearColor)
                    .onClickBy(^(UIButton *x) {
                        @jobs_strongify(self)
                        [self clearDemoSearchHistory];
                    })
                    .addOn(view)
                    .byAdd(^(MASConstraintMaker *make) {
                        make.right.equalTo(view).offset(-JobsWidth(24));
                        make.centerY.equalTo(view);
                        make.size.mas_equalTo(CGSizeMake(JobsWidth(52), JobsWidth(32)));
                    });
            });
        });
    };return jobsMakeView(^(__kindof UIView * _Nullable view) {});
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _demoSideMenuTableView) {
        [tableView deselectRowAtIndexPath:indexPath
                                 animated:YES];
        [self handleDemoSideMenuItemAtIndex:indexPath.row];
        return;
    }
    if (tableView == _functionMenuTableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self showFunctionMenu:NO];
        if (indexPath.row == JobsOCFunctionMenuItemSearch) {
            [self setSearchEnabled:YES];
        }else if (indexPath.row == JobsOCFunctionMenuItemDemoFold){
            [self setAllDemoSectionsExpanded:![self anyVisibleDemoSectionExpanded]];
        }else{
            [self pushDemoListSettingsVC];
        };return;
    }
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    if ([self demoSearchLandingActive]) {
        if (indexPath.row < self.demoSearchHistoryMutArr.count) {
            [self applyDemoSearchKeyword:self.demoSearchHistoryMutArr[indexPath.row]
                             saveHistory:NO];
        };return;
    }
    if ([self isPinnedDemoIndexPath:indexPath]) return;
    if (self.demoSectionDragSnapshotView || tableView.editing) return;
    if (![self isDemoFoldIndexPath:indexPath]) return;
    BOOL expanded = ![self.expandedDemoSectionIndexSet containsIndex:indexPath.row];
    if (expanded) {
        [self.expandedDemoSectionIndexSet addIndex:indexPath.row];
    }else{
        [self.expandedDemoSectionIndexSet removeIndex:indexPath.row];
    }
    JobsOCRootFoldTableCell *cell = (JobsOCRootFoldTableCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell setExpanded:expanded
             animated:YES];
    [tableView beginUpdates];
    [tableView endUpdates];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    if (tableView == _demoSideMenuTableView) return self.demoSideMenuTitles.count;
    if (tableView == _functionMenuTableView) return self.functionMenuTitles.count;
    if ([self demoSearchLandingActive]) return self.demoSearchHistoryMutArr.count;
    if ([self hasPinnedDemoSection] && section == 0) return 1;
    return self.visibleDemoSectionArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _demoSideMenuTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCDemoSideMenuCellReuseIdentifier
                                                                forIndexPath:indexPath];
        NSString *symbolName = indexPath.row < self.demoSideMenuSymbolNames.count ? self.demoSideMenuSymbolNames[indexPath.row] : @"square.grid.2x2";
        return cell
            .byTextLabel(^(__kindof UILabel * _Nullable label) {
                label
                    .byText(self.demoSideMenuTitles[indexPath.row])
                    .byTextCor([self demoListPrimaryTextColor])
                    .byFont(UIFontWeightRegularSize(15));
            })
            .byCellImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView
                    .byImage([symbolName.sys_img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate])
                    .byTintColor([self demoListSecondaryTextColor]);
            })
            .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
            .bySelectionStyle(UITableViewCellSelectionStyleDefault)
            .byContentView(^(__kindof UIView * _Nullable contentView) {
                contentView.byBgColor(JobsClearColor);
            })
            .byBgColor(JobsClearColor);
    }
    if (tableView == _functionMenuTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCFunctionMenuCellReuseIdentifier
                                                                forIndexPath:indexPath];
        UIColor *backgroundColor = [self demoListFunctionMenuBackgroundColor];
        return cell
            .byTextLabel(^(__kindof UILabel * _Nullable label) {
                label.byText(self.functionMenuTitles[indexPath.row])
                    .byFont(UIFontWeightMediumSize(15))
                    .byTextCor([self demoListPrimaryTextColor]);
            })
            .bySelectionStyle(UITableViewCellSelectionStyleDefault)
            .bySelectedBackgroundView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                view.byBgColor([self demoListCellSelectedBackgroundColor]);
            }))
            .byContentView(^(__kindof UIView * _Nullable contentView) {
                contentView.byBgColor(backgroundColor);
            })
            .byBgColor(backgroundColor);
    }
    if ([self demoSearchLandingActive]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCDemoSearchHistoryCellReuseIdentifier
                                                                forIndexPath:indexPath];
        UIColor *cellBackgroundColor = [self demoListCellBackgroundColor];
        NSString *historyText = indexPath.row < self.demoSearchHistoryMutArr.count ? self.demoSearchHistoryMutArr[indexPath.row] : @"";
        if (@available(iOS 14.0, *)) {
            UIBackgroundConfiguration *backgroundConfiguration = UIBackgroundConfiguration.clearConfiguration;
            backgroundConfiguration
                .byBackgroundColor(cellBackgroundColor)
                .byCornerRadius(0);
            cell.byBackgroundConfiguration(backgroundConfiguration);
        }else{
            cell.byBackgroundView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                view.byBgColor(cellBackgroundColor);
            }));
        }
        cell.bySelectedBackgroundView(nil);
        cell.contentView
            .byBgColor(JobsClearColor)
            .byCornerRadius(0)
            .byClipsToBounds(NO);
        return cell
            .bySelectionStyle(UITableViewCellSelectionStyleNone)
            .byAccessoryType(UITableViewCellAccessoryNone)
            .byAccessoryView(nil)
            .byTextLabel(^(__kindof UILabel * _Nullable label) {
                label
                    .byText(historyText)
                    .byFont(UIFontWeightRegularSize(JobsWidth(16)))
                    .byTextCor([self demoListPrimaryTextColor]);
            })
            .byCellImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView.byImage(@"时钟".img);
            })
            .byBgColor(cellBackgroundColor);
    }
    if ([self isPinnedDemoIndexPath:indexPath]) {
        JobsOCRootFoldTableCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCDemoPinnedCellReuseIdentifier];
        if (!cell) {
            cell = [[JobsOCRootFoldTableCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:JobsOCDemoPinnedCellReuseIdentifier];
        }
        @jobs_weakify(self)
        [cell configurePinnedWithSectionModel:self.pinnedDemoSectionModel
                                  selectBlock:^(NSInteger itemIndex) {
            @jobs_strongify(self)
            if (itemIndex >= 0 && itemIndex < (NSInteger)self.pinnedDemoMutArr.count) {
                [self pushDemoViewModel:self.pinnedDemoMutArr[itemIndex]];
            }
        } unpinBlock:^(NSInteger itemIndex) {
            @jobs_strongify(self)
            [self unpinPinnedDemoAtIndex:itemIndex];
        }];
        return cell;
    }
    if (![self isDemoFoldIndexPath:indexPath]) return UITableViewCell.new;
    JobsOCRootFoldTableCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCRootFoldTableCellReuseIdentifier];
    if (!cell) {
        cell = [[JobsOCRootFoldTableCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:JobsOCRootFoldTableCellReuseIdentifier];
    }
    cell.showsReorderControl = NO;
    cell.shouldIndentWhileEditing = NO;
    JobsOCDemoSectionModel *sectionModel = self.visibleDemoSectionArr[indexPath.row];
    @jobs_weakify(self)
    [cell configureWithSectionModel:sectionModel
                            expanded:[self.expandedDemoSectionIndexSet containsIndex:indexPath.row]
                         selectBlock:^(NSInteger itemIndex) {
        @jobs_strongify(self)
        if ([self demoSearchActive]) [self saveDemoSearchHistoryByText:self.demoSearchKeyword];
        UIViewModel *viewModel = sectionModel.dataMutArr[itemIndex];
        [self pushDemoViewModel:viewModel];
    } pinBlock:^(NSInteger itemIndex) {
        @jobs_strongify(self)
        if (itemIndex >= 0 && itemIndex < (NSInteger)sectionModel.dataMutArr.count) {
            [self pinDemoViewModel:sectionModel.dataMutArr[itemIndex]];
        }
    }];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView
canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _functionMenuTableView) return NO;
    if ([self demoSearchLandingActive]) return indexPath.row < self.demoSearchHistoryMutArr.count;
    return !self.demoSearchEnabled && [self canDragDemoSectionAtIndexPath:indexPath];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
       editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView != _functionMenuTableView && [self demoSearchLandingActive]) return UITableViewCellEditingStyleDelete;
    return UITableViewCellEditingStyleNone;
}

- (NSString *)tableView:(UITableView *)tableView
titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView != _functionMenuTableView && [self demoSearchLandingActive]) return @"删除".tr;
    return nil;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _functionMenuTableView ||
        editingStyle != UITableViewCellEditingStyleDelete ||
        ![self demoSearchLandingActive]) return;
    [self deleteDemoSearchHistoryAtIndex:indexPath.row];
}

- (BOOL)tableView:(UITableView *)tableView
canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView != _functionMenuTableView &&
           !self.demoSearchEnabled &&
           [self canDragDemoSectionAtIndexPath:indexPath];
}

- (NSIndexPath *)tableView:(UITableView *)tableView
targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    if (tableView == _functionMenuTableView ||
        self.demoSearchEnabled ||
        ![self canDragDemoSectionAtIndexPath:sourceIndexPath] ||
        ![self canDragDemoSectionAtIndexPath:proposedDestinationIndexPath] ||
        proposedDestinationIndexPath.section != sourceIndexPath.section ||
        proposedDestinationIndexPath.row < 0 ||
        proposedDestinationIndexPath.row >= (NSInteger)self.visibleDemoSectionArr.count) {
        return sourceIndexPath;
    };return proposedDestinationIndexPath;
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath{
    if (tableView == _functionMenuTableView ||
        self.demoSearchEnabled ||
        ![self canDragDemoSectionAtIndexPath:sourceIndexPath] ||
        ![self canDragDemoSectionAtIndexPath:destinationIndexPath]) return;
    NSInteger sourceRow = sourceIndexPath.row;
    NSInteger destinationRow = destinationIndexPath.row;
    if (sourceRow == destinationRow) return;
    [self moveDemoSectionFromIndexPath:sourceIndexPath
                           toIndexPath:destinationIndexPath];
    [self saveDemoSectionOrder];
}

- (BOOL)tableView:(UITableView *)tableView
shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath
                                  cell:cell];
}
#pragma mark —— UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText{
    self.demoSearchKeyword = [self normalizedDemoSearchTextBy:searchText];
    if ([self demoSearchActive] && self.tableView.editing) {
        [self.tableView setEditing:NO
                          animated:YES];
    }
    if ([self demoSearchActive]) {
        [self unfoldAllDemoSections];
    }else{
        [self foldDemoSectionsWithFirstUnfolded];
    }
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self saveDemoSearchHistoryByText:searchBar.text];
    [searchBar resignFirstResponder];
}

-(NSArray<NSString *> *)demoSideMenuTitles{
    return @[
        @"用户信息".tr,
        @"崩溃日志".tr,
        @"收藏".tr,
        @"设置".tr,
        @"关于".tr
    ];
}

-(NSArray<NSString *> *)demoSideMenuSymbolNames{
    return @[
        @"person.text.rectangle",
        @"exclamationmark.triangle",
        @"star",
        @"gearshape",
        @"info.circle"
    ];
}

-(CGFloat)demoSideMenuWidth{
    return MIN(JobsWidth(320), JobsMainScreen_WIDTH() * 0.50);
}

-(UIView *)demoSideMenuMainView{
    UIView *mainView = AppDelegate.jobsCustomTabBarNavCtrl.view;
    if (!mainView.window) mainView = self.navigationController.view;
    return mainView ?: self.view;
}

-(void)prepareDemoSideMenuIfNeeded{
    UIView *mainView = self.demoSideMenuMainView;
    UIView *hostView = mainView.superview;
    if (!hostView) return;
    UIView *menuView = self.demoSideMenuView;
    menuView.byFrame(CGRectMake(0, 0, self.demoSideMenuWidth, CGRectGetHeight(hostView.bounds)));
    menuView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin;
    if (menuView.superview != hostView) {
        [menuView removeFromSuperview];
        [hostView insertSubview:menuView
                  belowSubview:mainView];
    }
    UITableView *menuTableView = self.demoSideMenuTableView;
    if (menuTableView.superview != menuView) {
        [menuTableView removeFromSuperview];
        menuTableView.addOn(menuView);
    }
    menuTableView.byFrame(menuView.bounds);
    menuTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    if (!self.demoSideDrawer) {
        JobsSideDrawerConfiguration *configuration = JobsSideDrawerConfiguration.new;
        configuration.direction = JobsSideDrawerDirectionLeft;
        configuration.presentedRatio = 0.5;
        configuration.contentMode = [NSUserDefaults.standardUserDefaults boolForKey:@"JobsOCDemoSideDrawerFixed"] ? JobsSideDrawerContentModeFixed : JobsSideDrawerContentModeFollowing;
        self.demoSideDrawer = [[JobsSideDrawer alloc] initWithHostView:hostView drawerView:menuView contentView:mainView configuration:configuration];
        @jobs_weakify(self)
        self.demoSideDrawer.stateChanged = ^(BOOL open) {
            @jobs_strongify(self)
            self.demoSideMenuOpen = open;
            self.userHeadBtn.bySelected(open);
        };
    }
}

-(void)toggleDemoSideMenu{
    [self showDemoSideMenu:!self.demoSideMenuOpen
                  animated:YES];
}

-(void)showDemoSideMenu:(BOOL)show
               animated:(BOOL)animated{
    if (!show && !_demoSideMenuView) return;
    [self prepareDemoSideMenuIfNeeded];
    UIView *mainView = self.demoSideMenuMainView;
    if (!_demoSideMenuView.superview || !mainView.superview) return;
    self.demoSideDrawer.configuration.contentMode = [NSUserDefaults.standardUserDefaults boolForKey:@"JobsOCDemoSideDrawerFixed"] ? JobsSideDrawerContentModeFixed : JobsSideDrawerContentModeFollowing;
    if (show) {
        [self showFunctionMenu:NO];
        [self.demoSideMenuTableView reloadData];
        [self.demoSideDrawer openAnimated:animated];
    }else{
        [self.demoSideDrawer closeAnimated:animated];
    };return;
    self.demoSideMenuOpen = show;
    self.userHeadBtn.bySelected(show);
    if (show) {
        [self showFunctionMenu:NO];
        self.demoSideMenuDimButton.byHidden(NO);
        [self.demoSideMenuTableView reloadData];
    }
    void (^changes)(void) = ^{
        mainView.byTransform(show ? CGAffineTransformMakeTranslation(self.demoSideMenuWidth, 0) : CGAffineTransformIdentity);
        mainView.layer
            .byCornerRadius(show ? JobsWidth(16) : 0)
            .byMasksToBounds(show);
        self.demoSideMenuDimButton.byAlpha(show ? 1 : 0);
    };
    void (^completion)(BOOL) = ^(BOOL finished) {
        if (!show) self.demoSideMenuDimButton.byHidden(YES);
    };
    if (animated) {
        UIView.jobsAnimateWithSpring(0.28,
            0,
            0.92,
            0,
            UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState,
            changes,
            completion);
    }else{
        changes();
        completion(YES);
    }
}

-(void)handleDemoSideMenuItemAtIndex:(NSInteger)index{
    [self showDemoSideMenu:NO
                  animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.30 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        if (index == JobsOCDemoSideMenuItemUserInfo) {
            [self pushUserInfoDisplayVC];
        }else if (index == JobsOCDemoSideMenuItemCrashLog){
            [self pushCrashLogVC];
        }else if (index == JobsOCDemoSideMenuItemFavorites){
            toastBy(@"收藏".tr);
        }else if (index == JobsOCDemoSideMenuItemSettings){
            [self pushDemoListSettingsVC];
        }else{
            toastBy(@"关于".tr);
        }
    });
}

-(void)pushUserInfoDisplayVC{
    JobsUserModel *userInfo = self.readUserInfoByUserName(JobsUserModel.class,用户信息);
    if (!userInfo) {
        userInfo = JobsUserModel.byData(@"UserData".readLocalFileWithName);
        if (userInfo) self.saveUserInfo(userInfo);
    }
    UIViewModel *viewModel = self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
        model.byTitle(@"用户信息展示(开发测试专用)".tr)
            .bySubTitle(@"")
            .byCls(JobsShowObjInfoVC.class)
            .byRequestParams(userInfo);
    }));
    [self forceComingToPushVC:viewModel.cls.new
                requestParams:viewModel];
}

-(void)pushCrashLogVC{
    UIViewModel *viewModel = self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
        model.byTitle(@"崩溃日志".tr)
            .bySubTitle(@"")
            .byCls(JobsOCCrashLogVC.class);
    }));
    [self forceComingToPushVC:viewModel.cls.new
                requestParams:viewModel];
}
#pragma mark —— lazyLoad
-(UIButton *)suspendTimeBtn{
    if (!_suspendTimeBtn) {
        @jobs_weakify(self)
        _suspendTimeBtn = UIButton.jobsInit();
        _suspendTimeBtn
            .jobsResetBtnTitle(@"当前时间".tr)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(18))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(JobsSystemBlueColor)
            .jobsResetBtnCornerRadiusValue(10)
            .onClickBy(^(__unused UIButton *x) {
                toastBy(@"点击了悬浮按钮".tr);
            })
            .onLongPressGestureBy(^(UIButton *x) {
                if (JobsOCDemoSuspendLongPressGesture(x).state != UIGestureRecognizerStateBegan) return;
                @jobs_strongify(self)
                [self showSuspendTimeButtonVisibilityAlert];
            })
            .byAlpha(1)
            .byFrame(CGRectMake(0, 0, 110, 66))
            .addOn(self.view)
            .bySuspendOriginInSafeArea(CGPointMake(15, 120))
            .byHapticOnDock(YES);
        _suspendTimeBtn.titleLabel.numberOfLines = 2;
        _suspendTimeBtn.byTitleAlignment(NSTextAlignmentCenter);
        if (@available(iOS 16.0, *)) {
            [_suspendTimeBtn jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable configuration) {
                configuration.byTitleAlignment(UIButtonConfigurationTitleAlignmentCenter);
            }];
        }
        _suspendTimeBtn.layer.byMasksToBounds(YES);
        JobsOCDemoSuspendLongPressGesture(_suspendTimeBtn).minimumPressDuration = 0.8;
        _suspendTimeBtn.panRcognize.byEnabled(YES);
        [self refreshSuspendTimeButtonTitle];
    };return _suspendTimeBtn;
}

-(UIButton *)suspendSpinBtn{
    if (!_suspendSpinBtn) {
        @jobs_weakify(self)
        _suspendSpinBtn = UIButton.jobsInit();
        _suspendSpinBtn
            .jobsResetBtnTitle(@"0")
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(22))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(JobsSystemOrangeColor)
            .jobsResetBtnCornerRadiusValue(25)
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                if (x.jobs_isSpinning) {
                    x.bySpinPause();
                    JobsTimerMgr.shared.byPause(JobsOCDemoSuspendSpinTimerIdentifier);
                    toastBy(@"已暂停旋转 & 计时".tr);
                }else{
                    x.bySpinStart();
                    JobsTimerMgr.shared.byResume(JobsOCDemoSuspendSpinTimerIdentifier);
                    toastBy(@"继续旋转 & 计时".tr);
                }
                [x byFuseTapScale];
                NSObject.feedbackGenerator(x);
            })
            .onLongPressGestureBy(^(__unused UIButton *x) {
                toastBy(@"长按了悬浮按钮".tr);
            })
            .byAlpha(1)
            .byFrame(CGRectMake(0, 0, 50, 50))
            .addOn(self.view)
            .bySuspendOriginInSafeArea(CGPointMake(CGRectGetWidth(self.view.bounds) - 60,
                                                   CGRectGetHeight(self.view.bounds) - 100))
            .byHapticOnDock(YES);
        _suspendSpinBtn.layer.byMasksToBounds(YES);
        JobsOCDemoSuspendLongPressGesture(_suspendSpinBtn).minimumPressDuration = 0.8;
        _suspendSpinBtn.panRcognize.byEnabled(YES);
    };return _suspendSpinBtn;
}

-(UIButton *)suspendFuseBtn{
    if (!_suspendFuseBtn) {
        @jobs_weakify(self)
        _suspendFuseBtn = UIButton.jobsInit();
        _suspendFuseBtn
            .jobsResetBtnTitle(@"按".tr)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(16))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(JobsSystemPurpleColor)
            .jobsResetBtnCornerRadiusValue(25)
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                if (self.suspendFuseLongPressConsumed) return;
                [x byFusePlaySound:@"Sound.wav"];
                BOOL scrollsToBottom = !x.jobs_isSelected;
                x.bySelected(scrollsToBottom);
                UITableView *tableView = self.tableView;
                CGFloat topOffsetY = -tableView.adjustedContentInset.top;
                CGFloat bottomOffsetY = MAX(topOffsetY,
                                            tableView.contentSize.height
                                                - CGRectGetHeight(tableView.bounds)
                                                + tableView.adjustedContentInset.bottom);
                tableView.setContentOffsetByYES(
                    CGPointMake(tableView.contentOffset.x,
                                scrollsToBottom ? bottomOffsetY : topOffsetY)
                );
            })
            .onLongPressGestureBy(^(UIButton *x) {
                @jobs_strongify(self)
                UILongPressGestureRecognizer *gesture = JobsOCDemoSuspendLongPressGesture(x);
                switch (gesture.state) {
                    /// 处理 UIGestureRecognizerStateBegan 分支
                    case UIGestureRecognizerStateBegan:{
                        self.suspendFuseLongPressConsumed = YES;
                        JobsFuseOuterRingConfig *config = JobsFuseOuterRingConfig.config
                            .byLineWidth(4)
                            .byStrokeColor(JobsWhiteColor)
                            .byTrackColor([JobsWhiteColor colorWithAlphaComponent:0.22])
                            .byFromOpacity(1)
                            .byToOpacity(1)
                            .byGrowDuration(1.2)
                            .byTimerInterval(1.0 / 60.0)
                            .byRepeatsWhileHolding(NO)
                            .byFadeOutDuration(0.18)
                            .byInset(1)
                            .byStartsFromTop(YES);
                        [x byFusePressStart:config scale:1.18];
                    }
                        break;
                    /// 处理 UIGestureRecognizerStateEnded 分支
                    case UIGestureRecognizerStateEnded:
                    /// 处理 UIGestureRecognizerStateCancelled 分支
                    case UIGestureRecognizerStateCancelled:
                    /// 处理 UIGestureRecognizerStateFailed 分支
                    case UIGestureRecognizerStateFailed:{
                        [x byFusePressStop:YES];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.20 * NSEC_PER_SEC)),
                                       dispatch_get_main_queue(), ^{
                            self.suspendFuseLongPressConsumed = NO;
                        });
                    }
                        break;
                    /// 未匹配已知分支时执行兜底处理
                    default:
                        break;
                }
            })
            .byAlpha(1)
            .byFrame(CGRectMake(0, 0, 50, 50))
            .addOn(self.view)
            .bySuspendOriginInSafeArea(CGPointMake(15,
                                                   CGRectGetHeight(self.view.bounds) - 100))
            .byHapticOnDock(YES);
        _suspendFuseBtn.layer.byMasksToBounds(YES);
        _suspendFuseBtn.accessibilityIdentifier = @"ViewController_1.suspendFuseBtn";
        if (@available(iOS 13.4, *)) _suspendFuseBtn.byPointerInteractionEnabled(NO);
        JobsOCDemoSuspendLongPressGesture(_suspendFuseBtn).minimumPressDuration = 0.8;
        _suspendFuseBtn.panRcognize.byEnabled(YES);
    };return _suspendFuseBtn;
}

-(UIView *)demoSideMenuView{
    if (!_demoSideMenuView) {
        _demoSideMenuView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            if (@available(iOS 13.0, *)) {
                view.byBgColor(UIColor.systemGray6Color);
            }else{
                view.byBgColor(JobsSecondarySystemBackgroundColor);
            }
        });
    };return _demoSideMenuView;
}

-(UITableView *)demoSideMenuTableView{
    if (!_demoSideMenuTableView) {
        _demoSideMenuTableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            [tableView registerClass:UITableViewCell.class
               forCellReuseIdentifier:JobsOCDemoSideMenuCellReuseIdentifier];
            tableView.byDelegate(self)
                .byDataSource(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byRowHeight(JobsWidth(64))
                .byEstimatedRowHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .bySectionHeaderTopPadding(0)
                .byShowsVerticalScrollIndicator(NO)
                .byShowsHorizontalScrollIndicator(NO)
                .byContentInset(UIEdgeInsetsMake(JobsTopSafeAreaHeight(), 0, JobsBottomSafeAreaHeight(), 0))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsClearColor);
        });
    };return _demoSideMenuTableView;
}

-(UIButton *)demoSideMenuDimButton{
    if (!_demoSideMenuDimButton) {
        @jobs_weakify(self)
        _demoSideMenuDimButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .onClickBy(^(UIButton *x) {
                    @jobs_strongify(self)
                    [self showDemoSideMenu:NO
                                  animated:YES];
                })
                .byBgColor([JobsBlackColor colorWithAlphaComponent:0.18])
                .byAlpha(0)
                .byHidden(YES)
                .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        });
    };return _demoSideMenuDimButton;
}

-(UILabel *)demoNavigationTitleLab{
    if (!_demoNavigationTitleLab) {
        _demoNavigationTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"演武堂".tr)
                .byTextCor([self demoListPrimaryTextColor])
                .byFont(UIFontWeightMediumSize(17))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(1);
        });
    };return _demoNavigationTitleLab;
}

-(UILabel *)demoNavigationProjectLab{
    if (!_demoNavigationProjectLab) {
        _demoNavigationProjectLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(self.demoProjectFolderName)
                .byTextCor([self demoListSecondaryTextColor])
                .byFont(UIFontWeightRegularSize(10))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(1)
                .byLineBreakMode(NSLineBreakByTruncatingMiddle)
                .byAdjustsFontSizeToFitWidth(YES)
                .byMinimumScaleFactor(0.75);
        });
    };return _demoNavigationProjectLab;
}

-(UIView *)demoNavigationTitleView{
    if (!_demoNavigationTitleView) {
        _demoNavigationTitleView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byFrame(CGRectMake(0, 0, 280, 34))
                .byBgColor(JobsClearColor);
            self.demoNavigationTitleLab
                .addOn(view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.left.right.equalTo(view);
                    make.height.mas_equalTo(20);
                });
            self.demoNavigationProjectLab
                .addOn(view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.demoNavigationTitleLab.mas_bottom).offset(1);
                    make.left.right.bottom.equalTo(view);
                });
        });
    };return _demoNavigationTitleView;
}

-(UIButton *)userHeadBtn{
    if (!_userHeadBtn) {
        @jobs_weakify(self)
        UIImage *menuImage = @"list.bullet".sys_img ?: @"首页_头像".img;
        _userHeadBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnImage(menuImage)
                .selectedStateImageBy(menuImage)
                .highlightedStateImageBy(menuImage)
                .onClickBy(^(UIButton *x){
                    @jobs_strongify(self)
                    [self toggleDemoSideMenu];
                })
                .byAdjustsImageWhenHighlighted(NO)
                .byTintColor([self demoListPrimaryTextColor])
                .byBgColor(JobsClearColor)
                .byClipsToBounds(YES)
                .bySize(CGSizeMake(32, 32));
            button.layer
                .byShadowOpacity(0)
                .byShadowRadius(0)
                .byShadowOffset(CGSizeZero);
        });
    };return _userHeadBtn;
}

-(UIButton *)functionMenuBtn{
    if (!_functionMenuBtn) {
        @jobs_weakify(self)
        UIColor *normalTintColor = HEXCOLOR(0x3D4A58);
        UIImage *normalMenuImage = [self functionMenuImageBySymbolName:@"ellipsis.circle"
                                                             tintColor:normalTintColor];
        UIImage *activeMenuImage = normalMenuImage;
        _functionMenuBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnImage(normalMenuImage)
                .selectedStateImageBy(activeMenuImage)
                .highlightedStateImageBy(normalMenuImage)
                .imageForStateBy(activeMenuImage, UIControlStateSelected | UIControlStateHighlighted)
                .onClickBy(^(UIButton *x){
                    @jobs_strongify(self)
                    [self toggleFunctionMenu];
                })
                .byAdjustsImageWhenHighlighted(NO)
                .byAdjustsImageWhenDisabled(NO)
                .byTintColor(normalTintColor)
                .byBgColor(JobsClearColor)
                .byClipsToBounds(YES)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byShadowOpacity(0)
                        .byShadowRadius(0)
                        .byShadowOffset(CGSizeZero);
                })
                .bySize(CGSizeMake(32, 32));
        });
    };return _functionMenuBtn;
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
    return JobsThemeCenter.shared.isDarkMode;
}

-(void)applyDemoListInterfaceStyle{
    self.view.byBgColor([self demoListPageBackgroundColor]);
    [self updateLocalizedContent];
    self.makeNavByAlpha(1);
    [self refreshDemoNavigationTitle];
    [self applyDemoListNavigationInterfaceStyle];
    [self applyDemoListTabBarInterfaceStyle];
    [self refreshFunctionMenuButtonTheme];
    [self refreshDemoSearchTheme];
    if (_functionMenuTableView) {
        _functionMenuTableView
            .bySeparatorColor([self demoListSeparatorColor])
            .byBgColor([self demoListFunctionMenuBackgroundColor]);
        if (_functionMenuTableView.window && !_functionMenuTableView.hidden) {
            [_functionMenuTableView reloadData];
        }
    }
    if (_userHeadBtn) _userHeadBtn.byTintColor([self demoListPrimaryTextColor]);
    if (_demoSideMenuView) {
        if (@available(iOS 13.0, *)) {
            _demoSideMenuView.byBgColor(UIColor.systemGray6Color);
        }else{
            _demoSideMenuView.byBgColor(JobsSecondarySystemBackgroundColor);
        }
    }
}

-(UIColor *)demoListPageBackgroundColor{
    return JobsSystemBackgroundColor;
}

-(UIColor *)demoListNavigationBackgroundColor{
    return JobsSystemBackgroundColor;
}

-(UIColor *)demoListPrimaryTextColor{
    return JobsLabelColor;
}

-(UIColor *)demoListSecondaryTextColor{
    return JobsSecondaryLabelColor;
}

-(UIColor *)demoListCellBackgroundColor{
    return JobsSecondarySystemGroupedBackgroundColor;
}

-(UIColor *)demoListFunctionMenuBackgroundColor{
    return JobsSecondarySystemBackgroundColor;
}

-(UIColor *)demoListCellSelectedBackgroundColor{
    return JobsTertiarySystemBackgroundColor;
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
        .byGKNavShadowColor(JobsClearColor)
        .byGKNavLineHidden(YES)
        .byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar * _Nullable navigationBar) {
            navigationBar
                .byTintColor([self demoListPrimaryTextColor])
                .layer.byShadowOpacity(0);
        });
    self.navBar.byBgColor([self demoListNavigationBackgroundColor]);
    self.navBar.layer.byShadowOpacity(0);
    self.navBar.titleLab.byTextCor([self demoListPrimaryTextColor]);
    self.demoNavigationTitleLab.byTextCor([self demoListPrimaryTextColor]);
    self.demoNavigationProjectLab.byTextCor([self demoListSecondaryTextColor]);
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

-(void)refreshFunctionMenuButtonTheme{
    if (!_functionMenuBtn) return;
    UIColor *normalTintColor = [self demoListPrimaryTextColor];
    UIImage *normalMenuImage = [self functionMenuImageBySymbolName:@"ellipsis.circle"
                                                         tintColor:normalTintColor];
    UIImage *activeMenuImage = normalMenuImage;
    _functionMenuBtn
        .jobsResetBtnImage(normalMenuImage)
        .byTintColor(normalTintColor);
    _functionMenuBtn
        .selectedStateImageBy(activeMenuImage)
        .highlightedStateImageBy(normalMenuImage);
    _functionMenuBtn.imageForStateBy(activeMenuImage, UIControlStateSelected | UIControlStateHighlighted);
}

-(void)refreshDemoSearchTheme{
    UIColor *selectedTintColor = HEXCOLOR(0x1D7FF2);
    if (_demoSearchBar) {
        _demoSearchBar
            .byBarTintColor([self demoListPageBackgroundColor])
            .byTintColor(selectedTintColor)
            .byBgColor(JobsClearColor);
        if (@available(iOS 13.0, *)) {
            UITextField *searchTextField = _demoSearchBar.searchTextField;
            searchTextField
                .byAttributedPlaceholder(JobsAttributedStringByAttributes(@"输入关键词搜索 Demo".tr, @{
                    NSForegroundColorAttributeName: [self demoListSecondaryTextColor],
                    NSFontAttributeName: UIFontWeightRegularSize(15)
                }))
                .byFont(UIFontWeightRegularSize(15))
                .byTextCor([self demoListPrimaryTextColor])
                .byTintColor(selectedTintColor)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(18)
                .byClipsToBounds(YES)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byBorderWidth(1)
                        .byBorderColorUIColor([self demoListSeparatorColor]);
                });
            searchTextField.leftView.byTintColor([self demoListSecondaryTextColor]);
        }
    }
    if (_demoSearchCancelBtn) {
        _demoSearchCancelBtn
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(selectedTintColor)
            .jobsResetBtnCornerRadiusValue(10)
            .highlightedStateTitleColorBy([JobsWhiteColor colorWithAlphaComponent:0.78])
            .highlightedStateBackgroundImageBy(UIColor.imageWithColor([selectedTintColor colorWithAlphaComponent:0.72]));
    }
}

-(UITableView *)functionMenuTableView{
    if (!_functionMenuTableView) {
        _functionMenuTableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            [tableView registerClass:UITableViewCell.class
               forCellReuseIdentifier:JobsOCFunctionMenuCellReuseIdentifier];
            tableView
                .byDelegate(self)
                .byDataSource(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byRowHeight(44)
                .byEstimatedRowHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .bySectionHeaderTopPadding(0)
                .byTableHeaderView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    view.byFrame(CGRectMake(0, 0, 0, CGFLOAT_MIN));
                }))
                .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    view.byFrame(CGRectMake(0, 0, 0, CGFLOAT_MIN));
                }))
                .byScrollEnabled(NO)
                .byContentInset(UIEdgeInsetsZero)
                .byScrollIndicatorInsets(UIEdgeInsetsZero)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor([self demoListFunctionMenuBackgroundColor])
                .byCornerRadius(8)
                .byClipsToBounds(YES)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.navBar.mas_bottom).offset(6);
                    make.right.equalTo(self.view).offset(-12);
                    make.width.mas_equalTo(self.functionMenuTableWidth);
                    make.height.mas_equalTo(self.functionMenuTableHeight);
                });
            tableView.layer.byShadowOpacity(0);
        });
    };return _functionMenuTableView;
}

-(UITapGestureRecognizer *)functionMenuDismissTapGesture{
    if (!_functionMenuDismissTapGesture) {
        @jobs_weakify(self)
        _functionMenuDismissTapGesture = [jobsMakeTapGesture(^(UITapGestureRecognizer * _Nullable gesture) {
            gesture.byCancelsTouchesInView(NO);
        }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            CGPoint point = [gesture locationInView:self.view];
            BOOL pointInSearchBar = NO;
            if (self.demoSearchEnabled && _demoSearchBar) {
                CGRect searchBarFrame = [_demoSearchBar convertRect:_demoSearchBar.bounds
                                                             toView:self.view];
                pointInSearchBar = CGRectContainsPoint(searchBarFrame, point);
            }
            if (!pointInSearchBar) self.view.byEndEditing(YES);
            if (self.functionMenuTableView.hidden) return;
            CGRect functionMenuButtonFrame = [self.functionMenuBtn convertRect:self.functionMenuBtn.bounds
                                                                        toView:self.view];
            BOOL pointInFunctionMenu = !self.functionMenuTableView.hidden && CGRectContainsPoint(self.functionMenuTableView.frame, point);
            if (pointInFunctionMenu ||
                CGRectContainsPoint(functionMenuButtonFrame, point)) return;
            [self showFunctionMenu:NO];
        }];
        self.view.addGesture(_functionMenuDismissTapGesture);
    };return _functionMenuDismissTapGesture;
}

-(UIView *)demoSearchHeaderView{
    if (!_demoSearchHeaderView) {
        @jobs_weakify(self)
        _demoSearchHeaderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            CGFloat headerWidth = JobsMainScreen_WIDTH();
            view.byFrame(CGRectMake(0, 0, headerWidth, 56))
                .byBgColor(JobsClearColor);
            self.demoSearchCancelBtn
                .addOn(view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(view).offset(10);
                    make.right.equalTo(view).offset(-12);
                    make.width.mas_greaterThanOrEqualTo(64);
                    make.height.mas_equalTo(36);
                });
            self.demoSearchBar
                .addOn(view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(view);
                    make.left.equalTo(view).offset(8);
                    make.right.equalTo(self.demoSearchCancelBtn.mas_left).offset(-4);
                    make.height.mas_equalTo(56);
                });
        });
        [self refreshDemoSearchTheme];
    };return _demoSearchHeaderView;
}

-(UISearchBar *)demoSearchBar{
    if (!_demoSearchBar) {
        _demoSearchBar = jobsMakeUISearchBar(^(__kindof UISearchBar *_Nullable searchBar) {
            searchBar
                .byPlaceholder(@"输入关键词搜索 Demo".tr)
                .byDelegate(self)
                .byShowsCancelButton(NO)
                .bySearchBarStyle(UISearchBarStyleMinimal)
                .byTranslucent(YES)
                .byBackgroundImage(jobsMakeImage())
                .byBarTintColor([self demoListPageBackgroundColor])
                .byBgColor(JobsClearColor);
        });
    };return _demoSearchBar;
}

-(UIButton *)demoSearchCancelBtn{
    if (!_demoSearchCancelBtn) {
        @jobs_weakify(self)
        UIColor *selectedTintColor = HEXCOLOR(0x1D7FF2);
        _demoSearchCancelBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"取消".tr)
                .jobsResetBtnTitleCor(JobsWhiteColor)
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(15))
                .jobsResetBtnBgCor(selectedTintColor)
                .jobsResetBtnCornerRadiusValue(10)
                .highlightedStateTitleColorBy([JobsWhiteColor colorWithAlphaComponent:0.78])
                .highlightedStateBackgroundImageBy(UIColor.imageWithColor([selectedTintColor colorWithAlphaComponent:0.72]))
                .byTitleLabel(^(__kindof UILabel * _Nullable label) {
                    label
                        .byNumberOfLines(1)
                        .byLineBreakMode(NSLineBreakByClipping)
                        .byAdjustsFontSizeToFitWidth(YES)
                        .byMinimumScaleFactor(0.8);
                })
                .byContentEdgeInsets(UIEdgeInsetsMake(0, 12, 0, 12))
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    [weak_self setSearchEnabled:NO];
                })
                .byContentHorizontalAlignment(UIControlContentHorizontalAlignmentCenter)
                .byClipsToBounds(YES);
        });
    };return _demoSearchCancelBtn;
}
/// self.tableView.dataLink(self);不要写在Block里面，会引起循环调用。用它进行唤起
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        /// 一般用 initWithStylePlain。initWithStyleGrouped会自己预留一块空间
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            [tableView registerClass:UITableViewCell.class
               forCellReuseIdentifier:JobsOCDemoSearchHistoryCellReuseIdentifier];
            tableView.bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .bySeparatorColor(HEXCOLOR(0xEEE2C8))
                .byAllowsSelectionDuringEditing(NO)
                .bySectionHeaderTopPadding(0)
                .byTableFooterView(self.demoListTableFooterView)/// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .byFoldable(NO)
                .emptyDataByButtonModel(self.demoListEmptyDataButtonModel)
                /// 普通的MJRefreshHeader（触发事件）@二选一
                .byMJRefreshHeader([MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshHeaderConfigModel(self.mjHeaderDefaultConfig))
                /// MJRefreshHeader的拓展：下拉刷新Lottie动画@二选一
                //.byMJRefreshHeader(self.lotAnimMJRefreshHeader.byRefreshConfigModel(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable model) {})))
                /// 普通的MJRefreshFooter（触发事件）
                .byMJRefreshFooter([MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshFooterConfigModel(self.mjFooterDefaultConfig))
                .byShowsVerticalScrollIndicator(NO)
                .byShowsHorizontalScrollIndicator(NO)
                .byScrollEnabled(YES)
                .byContentInset(UIEdgeInsetsMake(JobsWidth(8), 0, JobsBottomSafeAreaHeight(), 0))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsClearColor);
            [tableView addGestureRecognizer:self.demoSectionReorderLongPressGesture];
//            {
//                tableView.MJRefreshNormalHeaderBy([self refreshHeaderDataBy:^id _Nullable(id  _Nullable data) {
//                    @jobs_strongify(self)
//                    self.feedbackGenerator(nil);//震动反馈
//                    self->_tableView.endRefreshing(YES);
//                    return nil;
//                }]);
//                tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
//            }
//            {/// 设置tabAnimated相关属性
//                // 可以不进行手动初始化，将使用默认属性
//                tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:JobsBaseTableViewCell.class
//                                                                      cellHeight:[JobsBaseTableViewCell cellHeightWithModel:nil]];
//                tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//                [tableView tab_startAnimation];   // 开启动画
//            }
//            {
//              [tableView xzm_addNormalHeaderWithTarget:self
//                                                 action:selectorBlocks(^id _Nullable(id _Nullable weakSelf,
//                                                                                     id _Nullable arg) {
//                  NSLog(@"SSSS加载新的数据，参数: %@", arg);
//                  @jobs_strongify(self)
//                  /// 在需要结束刷新的时候调用（只能调用一次）
//                  /// _tableView.endRefreshing();
//                  return nil;
//              }, MethodName(self), self)];
//
//              [tableView xzm_addNormalFooterWithTarget:self
//                                                 action:selectorBlocks(^id _Nullable(id _Nullable weakSelf,
//                                                                                     id _Nullable arg) {
//                  NSLog(@"SSSS加载新的数据，参数: %@", arg);
//                  @jobs_strongify(self)
//                  /// 在需要结束刷新的时候调用（只能调用一次）
//                  /// _tableView.endRefreshing();
//                  return nil;
//              }, MethodName(self), self)];
//              [tableView.xzm_header beginRefreshing];
//          }
        })
        .addOn(self.view)
        .byAdd(^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.left.right.bottom.equalTo(self.view);
            [self make:make topOffset:JobsWidth(18)];
        });
    };return _tableView;
}

-(NSMutableIndexSet *)expandedDemoSectionIndexSet{
    if (!_expandedDemoSectionIndexSet) {
        _expandedDemoSectionIndexSet = jobsMakeMutIndexSet(nil);
    };return _expandedDemoSectionIndexSet;
}

-(NSMutableArray<UIViewModel *> *)pinnedDemoMutArr{
    if (!_pinnedDemoMutArr) {
        _pinnedDemoMutArr = NSMutableArray.array;
        [self applySavedPinnedDemosIfNeeded];
    };return _pinnedDemoMutArr;
}

-(NSMutableArray<NSString *> *)demoSearchHistoryMutArr{
    if (!_demoSearchHistoryMutArr) {
        _demoSearchHistoryMutArr = NSMutableArray.array;
        NSArray *historyArr = [NSUserDefaults.standardUserDefaults arrayForKey:JobsOCDemoSearchHistoryUserDefaultsKey];
        if ([historyArr isKindOfClass:NSArray.class]) {
            for (id obj in historyArr) {
                NSString *text = [self normalizedDemoSearchTextBy:[obj isKindOfClass:NSString.class] ? obj : @""];
                if (text.length) [_demoSearchHistoryMutArr addObject:text];
            }
        }
    };return _demoSearchHistoryMutArr;
}

-(UILongPressGestureRecognizer *)demoSectionReorderLongPressGesture{
    if (!_demoSectionReorderLongPressGesture) {
        _demoSectionReorderLongPressGesture = [UILongPressGestureRecognizer.alloc initWithTarget:self
                                                                                          action:@selector(handleDemoSectionReorderLongPress:)];
        _demoSectionReorderLongPressGesture.minimumPressDuration = 0.45;
        _demoSectionReorderLongPressGesture.cancelsTouchesInView = NO;
    };return _demoSectionReorderLongPressGesture;
}

-(NSMutableArray<__kindof UITableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        @jobs_weakify(self)
        _tbvCellMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof UITableViewCell *>*_Nullable data) {
            @jobs_strongify(self)
            [self.dataMutArr enumerateObjectsUsingBlock:^(UIViewModel * _Nonnull obj,
                                                          NSUInteger idx,
                                                          BOOL * _Nonnull stop) {
                @jobs_strongify(self)
                data.add(JobsBaseTableViewCell.cellStyleValue1ByTableView(self.tableView));
            }];
        });
    };return _tbvCellMutArr;
}

-(NSArray <JobsOCDemoSectionModel *>*)visibleDemoSectionArr{
    NSString *keyword = (self.demoSearchKeyword ?: @"").byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
    if (!keyword.length) return [self demoSectionArrByFilteringPinnedFromSectionArr:self.demoSectionMutArr];
    NSMutableArray <JobsOCDemoSectionModel *>*result = NSMutableArray.array;
    for (JobsOCDemoSectionModel *sectionModel in self.demoSectionMutArr) {
        JobsOCDemoSectionModel *filteredSectionModel = [JobsOCDemoSectionModel sectionWithTitle:sectionModel.title];
        filteredSectionModel.sectionDescription = sectionModel.sectionDescription;
        for (UIViewModel *viewModel in sectionModel.dataMutArr) {
            if ([self viewModel:viewModel containsKeyword:keyword]) {
                [filteredSectionModel.dataMutArr addObject:viewModel];
            }
        }
        if (filteredSectionModel.dataMutArr.count) {
            [result addObject:filteredSectionModel];
        }
    };return result;
}

-(BOOL)hasPinnedDemoSection{
    return self.pinnedDemoMutArr.count > 0 &&
           ![self demoSearchLandingActive] &&
           ![self demoSearchActive];
}

-(NSInteger)demoFoldTableSection{
    return [self hasPinnedDemoSection] ? 1 : 0;
}

-(BOOL)isPinnedDemoIndexPath:(NSIndexPath *)indexPath{
    return indexPath &&
           [self hasPinnedDemoSection] &&
           indexPath.section == 0 &&
           indexPath.row == 0;
}

-(BOOL)isDemoFoldIndexPath:(NSIndexPath *)indexPath{
    NSArray <JobsOCDemoSectionModel *>*visibleSectionArr = self.visibleDemoSectionArr;
    return indexPath &&
           indexPath.section == self.demoFoldTableSection &&
           indexPath.row >= 0 &&
           indexPath.row < (NSInteger)visibleSectionArr.count;
}

-(NSArray <JobsOCDemoSectionModel *>*)demoSectionArrByFilteringPinnedFromSectionArr:(NSArray<JobsOCDemoSectionModel *> *)sectionArr{
    if (!self.pinnedDemoMutArr.count) return sectionArr;
    NSMutableArray <JobsOCDemoSectionModel *>*result = NSMutableArray.array;
    for (JobsOCDemoSectionModel *sectionModel in sectionArr) {
        JobsOCDemoSectionModel *filteredSectionModel = [JobsOCDemoSectionModel sectionWithTitle:sectionModel.title];
        filteredSectionModel.sectionDescription = sectionModel.sectionDescription;
        for (UIViewModel *viewModel in sectionModel.dataMutArr) {
            if (![self isPinnedDemoViewModel:viewModel]) {
                [filteredSectionModel.dataMutArr addObject:viewModel];
            }
        }
        if (filteredSectionModel.dataMutArr.count) {
            [result addObject:filteredSectionModel];
        }
    };return result;
}

-(NSString *)demoTitleByViewModel:(UIViewModel *)viewModel{
    return viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text ?: @"";
}

-(NSString *)demoSubTextByViewModel:(UIViewModel *)viewModel{
    NSString *subText = viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text ?: @"";
    if (subText.length) return subText;
    return viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
}

-(NSAttributedString *)demoSubAttributedTextByViewModel:(UIViewModel *)viewModel{
    return viewModel.subTextModel.attributedTitle;
}

-(NSString *)demoKeyByViewModel:(UIViewModel *)viewModel{
    if (!viewModel) return @"";
    NSString *title = [self demoTitleByViewModel:viewModel];
    NSString *subTitle = [self demoSubTextByViewModel:viewModel];
    NSString *clsName = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
    return [NSString stringWithFormat:@"%@|%@|%@",title,subTitle,clsName];
}

-(NSString *)demoPersistentKeyByViewModel:(UIViewModel *)viewModel{
    if (!viewModel) return @"";
    NSString *clsName = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
    if (clsName.length) return [NSString stringWithFormat:@"cls:%@",clsName];
    NSString *demoKey = [self demoKeyByViewModel:viewModel];
    return demoKey.length ? [NSString stringWithFormat:@"demo:%@",demoKey] : @"";
}

-(BOOL)isPinnedDemoViewModel:(UIViewModel *)viewModel{
    NSString *key = [self demoPersistentKeyByViewModel:viewModel];
    if (!key.length) return NO;
    for (UIViewModel *pinnedViewModel in self.pinnedDemoMutArr) {
        if ([[self demoPersistentKeyByViewModel:pinnedViewModel] isEqualToString:key]) return YES;
    };return NO;
}

-(JobsOCDemoSectionModel *)pinnedDemoSectionModel{
    JobsOCDemoSectionModel *sectionModel = [JobsOCDemoSectionModel sectionWithTitle:@"置顶".tr];
    [sectionModel.dataMutArr addObjectsFromArray:self.pinnedDemoMutArr];
    return sectionModel;
}

-(void)pinDemoViewModel:(UIViewModel *)viewModel{
    if (!viewModel || [self isPinnedDemoViewModel:viewModel]) return;
    [self.pinnedDemoMutArr addObject:viewModel];
    [self savePinnedDemos];
    [self.tableView reloadData];
    [self.tableView layoutIfNeeded];
    [self.tableView setContentOffset:CGPointMake(0, -self.tableView.contentInset.top)
                            animated:YES];
}

-(void)unpinPinnedDemoAtIndex:(NSInteger)index{
    if (index < 0 || index >= (NSInteger)self.pinnedDemoMutArr.count) return;
    UIViewModel *viewModel = self.pinnedDemoMutArr[index];
    [self.pinnedDemoMutArr removeObjectAtIndex:index];
    [self savePinnedDemos];
    NSString *key = [self demoPersistentKeyByViewModel:viewModel];
    NSArray <JobsOCDemoSectionModel *>*visibleSectionArr = self.visibleDemoSectionArr;
    [visibleSectionArr enumerateObjectsUsingBlock:^(JobsOCDemoSectionModel * _Nonnull sectionModel,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
        for (UIViewModel *itemViewModel in sectionModel.dataMutArr) {
            if ([[self demoPersistentKeyByViewModel:itemViewModel] isEqualToString:key]) {
                [self.expandedDemoSectionIndexSet addIndex:idx];
                *stop = YES;
                break;
            }
        }
    }];
    [self.tableView reloadData];
}

-(NSArray <NSString *>*)savedPinnedDemoKeyArr{
    NSArray *keyArr = [NSUserDefaults.standardUserDefaults arrayForKey:JobsOCDemoPinnedDemoUserDefaultsKey];
    if (![keyArr isKindOfClass:NSArray.class]) return @[];
    NSMutableArray <NSString *>*result = NSMutableArray.array;
    for (id obj in keyArr) {
        if ([obj isKindOfClass:NSString.class] &&
            ((NSString *)obj).length &&
            ![result containsObject:obj]) {
            [result addObject:obj];
        }
    };return result.copy;
}

-(void)applySavedPinnedDemosIfNeeded{
    NSArray <NSString *>*savedKeyArr = self.savedPinnedDemoKeyArr;
    if (!savedKeyArr.count) return;
    for (NSString *key in savedKeyArr) {
        for (UIViewModel *viewModel in self.dataMutArr) {
            NSString *viewModelKey = [self demoPersistentKeyByViewModel:viewModel];
            if (viewModelKey.length &&
                [viewModelKey isEqualToString:key] &&
                ![_pinnedDemoMutArr containsObject:viewModel]) {
                [_pinnedDemoMutArr addObject:viewModel];
                break;
            }
        }
    }
    if (_pinnedDemoMutArr.count != savedKeyArr.count) [self savePinnedDemos];
}

-(void)savePinnedDemos{
    NSMutableArray <NSString *>*keyMutArr = NSMutableArray.array;
    for (UIViewModel *viewModel in self.pinnedDemoMutArr) {
        NSString *key = [self demoPersistentKeyByViewModel:viewModel];
        if (key.length && ![keyMutArr containsObject:key]) {
            [keyMutArr addObject:key];
        }
    }
    if (keyMutArr.count) {
        [NSUserDefaults.standardUserDefaults setObject:keyMutArr.copy
                                                forKey:JobsOCDemoPinnedDemoUserDefaultsKey];
    }else{
        [NSUserDefaults.standardUserDefaults removeObjectForKey:JobsOCDemoPinnedDemoUserDefaultsKey];
    }
    [NSUserDefaults.standardUserDefaults synchronize];
}

-(void)pushDemoViewModel:(UIViewModel *)viewModel{
    if ([self jobs_isCountryCodeDemoViewModel:viewModel]) {
        [self jobs_pushCountryCodeCtrlWithViewModel:viewModel];
        return;
    }
    if (viewModel.cls) {
        self.comingToPushVCByRequestParams(viewModel.cls.new,
                                           viewModel);
    }else @"尚未接入此功能".tr.toast();
}

-(NSUInteger)demoSectionIndexByTitle:(NSString *)title{
    if (!title.length) return NSNotFound;
    return [self.demoSectionMutArr indexOfObjectPassingTest:^BOOL(JobsOCDemoSectionModel * _Nonnull sectionModel,
                                                                  NSUInteger idx,
                                                                  BOOL * _Nonnull stop) {
        return [sectionModel.title isEqualToString:title];
    }];
}

-(BOOL)isDemoFoldInnerRowPoint:(CGPoint)point
                     indexPath:(NSIndexPath *)indexPath{
    if (![self isDemoFoldIndexPath:indexPath]) return NO;
    CGRect rowRect = [self.tableView rectForRowAtIndexPath:indexPath];
    CGFloat pointYInCell = point.y - CGRectGetMinY(rowRect);
    return pointYInCell >= JobsOCRootFoldTableCell.collapsedHeight &&
           pointYInCell <= CGRectGetHeight(rowRect);
}

-(BOOL)viewModel:(UIViewModel *)viewModel containsKeyword:(NSString *)keyword{
    NSString *title = viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text ?: @"";
    NSString *subTitle = viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text ?: @"";
    NSString *clsName = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
    return keyword.inStr(title) ||
           keyword.inStr(subTitle) ||
           keyword.inStr(clsName);
}

-(NSString *)sectionTitleForViewModel:(UIViewModel *)viewModel{
    NSString *title = viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text ?: @"";
    NSString *subTitle = viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text ?: @"";
    NSString *clsName = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
    NSString *key = [NSString stringWithFormat:@"%@ %@ %@",title,subTitle,clsName];
    if (viewModel.cls == CXBVC.class ||
        viewModel.cls == RandomTestVC.class) {
        return @"其他".tr;
    }
    if (viewModel.cls == JobsLongPressLikeDemoVC.class ||
        viewModel.cls == JobsOCNumberStepperDemoVC.class) {
        return @"UI 控件与动效".tr;
    }
    if (@"JobsIconfont".inStr(key) ||
        @"阿里巴巴矢量图标库".inStr(key)) {
        return @"阿里巴巴矢量图标库".tr;
    }
    if (viewModel.cls == PointLabTestVC.class) {
        return @"Label".tr;
    }
    if (@"Label".inStr(key)) {
        return @"Label".tr;
    }
    if (@"JobsOCTimer".inStr(key) ||
        @"JobsOCTimerMgr".inStr(key) ||
        @"JobsTimer".inStr(key) ||
        @"TimerMgr".inStr(key) ||
        @"倒计时".inStr(key) ||
        @"模拟时钟".inStr(key) ||
        @"Clock".inStr(key) ||
        @"幸运轮盘".inStr(key) ||
        @"Lottery".inStr(key) ||
        @"红包雨".inStr(key) ||
        @"RedPacketRain".inStr(key) ||
        @"时时彩".inStr(key) ||
        @"JobsImageRotation".inStr(key) ||
        @"图片定时旋转".inStr(key) ||
        @"MultiTimer".inStr(key)) {
        return @"Timer".tr;
    }
    if (@"FMDB".inStr(key) ||
        @"Realm".inStr(key) ||
        @"YTK".inStr(key) ||
        @"WebSocket".inStr(key) ||
        @"CoreText".inStr(key) ||
        @"Excel".inStr(key) ||
        @"字符串".inStr(key) ||
        @"OCDynamic".inStr(key) ||
        @"Snowflake".inStr(key) ||
        @"雪花算法".inStr(key)) {
        return @"数据、网络与文本".tr;
    }
    if (@"直播间".inStr(key) ||
        @"直播推流".inStr(key) ||
        @"LiveComment".inStr(key) ||
        @"LiveStream".inStr(key) ||
        @"ZFPlayer".inStr(key) ||
        @"Douyin".inStr(key) ||
        @"长按录制视频".inStr(key) ||
        @"VideoRecorder".inStr(key)) {
        return @"直播项目相关".tr;
    }
    if (@"ZFPlayer".inStr(key) ||
        @"Douyin".inStr(key) ||
        @"相册".inStr(key) ||
        @"Camera".inStr(key) ||
        @"摄像头".inStr(key) ||
        @"DynamicView".inStr(key) ||
        @"Progress".inStr(key) ||
        @"Widget".inStr(key) ||
        @"AppIcon".inStr(key) ||
        @"本地推送".inStr(key) ||
        @"剪切板".inStr(key) ||
        @"热更新".inStr(key) ||
        @"多语言".inStr(key) ||
        @"CountryCode".inStr(key) ||
        @"Screenshot".inStr(key) ||
        @"截屏".inStr(key) ||
        @"TraitChange".inStr(key) ||
        @"PDF".inStr(key) ||
        @"JobsOpen".inStr(key)) {
        return @"系统能力与多媒体".tr;
    }
    if (@"UITableViewCell的折叠效果".inStr(key) ||
        @"UITBVCellFold".inStr(key) ||
        @"Wallet".inStr(key) ||
        @"Card".inStr(key) ||
        @"Transparent".inStr(key) ||
        @"镂空".inStr(key) ||
        @"Irregular".inStr(key) ||
        @"不规则".inStr(key) ||
        @"打马赛克".inStr(key) ||
        @"Mosaic".inStr(key) ||
        @"球形".inStr(key) ||
        @"Sphere".inStr(key) ||
        @"滑动开锁".inStr(key)) {
        return @"炫技特效".tr;
    }
    if (@"UITableView".inStr(key) ||
        @"Cell".inStr(key) ||
        @"Btn".inStr(key) ||
        @"Button".inStr(key) ||
        @"Custom".inStr(key) ||
        @"JXCategory".inStr(key) ||
        @"Handwriting".inStr(key) ||
        @"手写板".inStr(key) ||
        @"Keyboard".inStr(key) ||
        @"键盘".inStr(key) ||
        @"Skeleton".inStr(key) ||
        @"骨架".inStr(key) ||
        @"DropDown".inStr(key) ||
        @"Search".inStr(key) ||
        @"Comment".inStr(key) ||
        @"Wallet".inStr(key) ||
        @"Card".inStr(key) ||
        @"Irregular".inStr(key) ||
        @"Transparent".inStr(key) ||
        @"Lottery".inStr(key) ||
        @"Shadow".inStr(key) ||
        @"Masonry".inStr(key) ||
        @"PointLab".inStr(key) ||
        @"Dashboard".inStr(key) ||
        @"仪表盘".inStr(key) ||
        @"ControlEvents".inStr(key) ||
        @"Toast".inStr(key) ||
        @"UIAlert".inStr(key)) {
        return @"UI 控件与动效".tr;
    }
    if (@"Door".inStr(key) ||
        @"Gesture".inStr(key) ||
        @"Post".inStr(key) ||
        @"IM".inStr(key) ||
        @"Protocol".inStr(key) ||
        @"用户".inStr(key) ||
        @"朋友圈".inStr(key) ||
        @"EditProfile".inStr(key) ||
        @"编辑个人资料".inStr(key)) {
        return @"业务模块与页面".tr;
    }
    if (@"TabBar".inStr(key) ||
        @"Navigation".inStr(key) ||
        @"Scroll".inStr(key) ||
        @"VerticalMenu".inStr(key) ||
        @"ViewPush".inStr(key) ||
        @"Landscape".inStr(key) ||
        @"Clock".inStr(key) ||
        @"Timer".inStr(key) ||
        @"Calendar".inStr(key) ||
        @"滑动开锁".inStr(key) ||
        @"Throttle".inStr(key) ||
        @"Debounce".inStr(key) ||
        @"节流".inStr(key) ||
        @"防抖".inStr(key) ||
        @"TaskCenter".inStr(key)) {
        return @"基础功能与导航容器".tr;
    };return @"业务模块与页面".tr;
}

-(NSString *)sectionDescriptionForTitle:(NSString *)title{
    if ([title isEqualToString:@"Timer".tr]) {
        return @"Timer 相关能力把系统 Timer / GCD / DisplayLink / RunLoop 的杂乱细节收口成少量参数。\n\n正计时和倒计时按钮已收口到“正计时/倒计时”入口：先进入列表，再分别点击正计时 DemoVC 和倒计时按钮 DemoVC。\n\nJobsOCTimerMgr 是多个 Timer 的统一注册表，按 identifier 管理 start / pause / resume / stop。\n\nJobsMarqueeView 用 JobsOCTimerMgr 做统一内核，把跑马灯和轮播图收口成同一个 UIScrollView + UIButton 数据源组件。";
    }else if ([title isEqualToString:@"阿里巴巴矢量图标库".tr]){
        return @"JobsIconfont 把远程图片、占位与错误兜底、复用取消、缓存、Icon Font、Unicode 转图和阿里妈妈文字字体统一封装。业务层只面对资源 ID 与语义枚举，不直接维护 iconfont 地址、字体名和 Unicode。";
    }else if ([title isEqualToString:@"直播项目相关".tr]){
        return @"直播间滚动留言保持应用层封装，直播推流用 AVFoundation 完成采集预览并预留 RTMP SDK 接入点。";
    }else if ([title isEqualToString:@"炫技特效".tr]){
        return @"打马赛克拆成图片处理与手势涂抹组件，球形标签云复用现有 XLSphereView。";
    };return nil;
}

-(JobsOCDemoSectionModel *)sectionModelInArr:(NSMutableArray <JobsOCDemoSectionModel *>*)data
                                       title:(NSString *)title{
    for (JobsOCDemoSectionModel *sectionModel in data) {
        if ([sectionModel.title isEqualToString:title]) return sectionModel;
    }
    JobsOCDemoSectionModel *sectionModel = [JobsOCDemoSectionModel sectionWithTitle:title];
    sectionModel.sectionDescription = [self sectionDescriptionForTitle:title];
    [data addObject:sectionModel];
    return sectionModel;
}

-(void)handleDemoSectionReorderLongPress:(UILongPressGestureRecognizer *)gesture{
    if (gesture.view != _tableView) return;
    if (self.demoSearchEnabled) {
        if (self.tableView.editing) [self.tableView setEditing:NO
                                                      animated:YES];
        @"搜索状态下不可排序".tr.toast();
        return;
    }
    CGPoint point = [gesture locationInView:self.tableView];
    switch (gesture.state) {
        /// 处理 UIGestureRecognizerStateBegan 分支
        case UIGestureRecognizerStateBegan:{
            NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:point];
            if ([self isPinnedDemoIndexPath:indexPath]) return;
            if ([self isDemoFoldInnerRowPoint:point
                                    indexPath:indexPath]) return;
            if (![self canDragDemoSectionAtIndexPath:indexPath]) return;
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            UIView *snapshotView = [cell snapshotViewAfterScreenUpdates:NO];
            snapshotView.byFrame(cell.frame);
            snapshotView.layer
                .byShadowColor(JobsBlackColor.CGColor)
                .byShadowOpacity(.18f)
                .byShadowRadius(JobsWidth(10))
                .byShadowOffset(CGSizeMake(0, JobsWidth(6)));
            snapshotView.addOn(self.tableView);
            self.demoSectionDragSnapshotView = snapshotView;
            self.demoSectionDragIndexPath = indexPath;
            self.demoSectionDragTouchOffsetY = point.y - CGRectGetMidY(cell.frame);
            cell.byHidden(YES);
            NSObject.feedbackGenerator(nil);
            break;
        }
        /// 处理 UIGestureRecognizerStateChanged 分支
        case UIGestureRecognizerStateChanged:{
            if (!self.demoSectionDragSnapshotView || !self.demoSectionDragIndexPath) return;
            CGPoint center = self.demoSectionDragSnapshotView.center;
            center.y = point.y - self.demoSectionDragTouchOffsetY;
            self.demoSectionDragSnapshotView.center = center;
            NSIndexPath *destinationIndexPath = [self.tableView indexPathForRowAtPoint:center];
            if (![self canDragDemoSectionAtIndexPath:destinationIndexPath] ||
                [destinationIndexPath isEqual:self.demoSectionDragIndexPath]) return;
            [self moveDemoSectionFromIndexPath:self.demoSectionDragIndexPath
                                   toIndexPath:destinationIndexPath];
            [self.tableView beginUpdates];
            [self.tableView moveRowAtIndexPath:self.demoSectionDragIndexPath
                                   toIndexPath:destinationIndexPath];
            [self.tableView endUpdates];
            self.demoSectionDragIndexPath = destinationIndexPath;
            for (UITableViewCell *visibleCell in self.tableView.visibleCells) {
                visibleCell.byHidden(NO);
            }
            [self.tableView cellForRowAtIndexPath:destinationIndexPath].byHidden(YES);
            break;
        }
        /// 处理 UIGestureRecognizerStateEnded 分支
        case UIGestureRecognizerStateEnded:
        /// 处理 UIGestureRecognizerStateCancelled 分支
        case UIGestureRecognizerStateCancelled:
        /// 处理 UIGestureRecognizerStateFailed 分支
        case UIGestureRecognizerStateFailed:{
            [self finishDemoSectionDrag];
            break;
        }
        /// 未匹配已知分支时执行兜底处理
        default:
            break;
    }
}

-(BOOL)canDragDemoSectionAtIndexPath:(NSIndexPath *)indexPath{
    NSArray <JobsOCDemoSectionModel *>*visibleSectionArr = self.visibleDemoSectionArr;
    if (!indexPath ||
        indexPath.section != self.demoFoldTableSection ||
        indexPath.row < 0 ||
        indexPath.row >= (NSInteger)visibleSectionArr.count ||
        visibleSectionArr.count <= 1) return NO;
    return ![visibleSectionArr[indexPath.row].title isEqualToString:@"其他".tr];
}

-(void)moveDemoSectionFromIndexPath:(NSIndexPath *)sourceIndexPath
                        toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSInteger sourceRow = sourceIndexPath.row;
    NSInteger destinationRow = destinationIndexPath.row;
    if (sourceRow == destinationRow ||
        sourceRow < 0 ||
        destinationRow < 0 ||
        sourceRow >= (NSInteger)self.visibleDemoSectionArr.count ||
        destinationRow >= (NSInteger)self.visibleDemoSectionArr.count) return;
    JobsOCDemoSectionModel *sourceVisibleSectionModel = self.visibleDemoSectionArr[sourceRow];
    JobsOCDemoSectionModel *destinationVisibleSectionModel = self.visibleDemoSectionArr[destinationRow];
    NSUInteger sourceIndex = [self demoSectionIndexByTitle:sourceVisibleSectionModel.title];
    NSUInteger destinationIndex = [self demoSectionIndexByTitle:destinationVisibleSectionModel.title];
    if (sourceIndex == NSNotFound ||
        destinationIndex == NSNotFound ||
        sourceIndex >= self.demoSectionMutArr.count ||
        destinationIndex > self.demoSectionMutArr.count) return;
    JobsOCDemoSectionModel *sectionModel = self.demoSectionMutArr[sourceIndex];
    [self.demoSectionMutArr removeObjectAtIndex:sourceIndex];
    [self.demoSectionMutArr insertObject:sectionModel
                                 atIndex:MIN(destinationIndex, self.demoSectionMutArr.count)];
    [self moveOtherDemoSectionToEndInArr:self.demoSectionMutArr];
    [self moveExpandedDemoSectionStateFromRow:(NSUInteger)sourceRow
                                        toRow:(NSUInteger)destinationRow];
}

-(void)finishDemoSectionDrag{
    if (!self.demoSectionDragSnapshotView) return;
    NSIndexPath *indexPath = self.demoSectionDragIndexPath;
    UITableViewCell *cell = indexPath ? [self.tableView cellForRowAtIndexPath:indexPath] : nil;
    void (^clearState)(void) = ^{
        cell.byHidden(NO);
        [self.demoSectionDragSnapshotView removeFromSuperview];
        self.demoSectionDragSnapshotView = nil;
        self.demoSectionDragIndexPath = nil;
        self.demoSectionDragTouchOffsetY = 0;
        [self saveDemoSectionOrder];
    };
    if (!cell) {
        clearState();
        return;
    }
    UIView.jobsAnimateWithOptions(.2f,
        0,
        UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction,
        ^{
        self.demoSectionDragSnapshotView.byFrame(cell.frame);
    },
        ^(BOOL finished) {
        clearState();
    });
}

-(NSArray<NSString *> *)savedDemoSectionOrderArr{
    NSArray *orderArr = [NSUserDefaults.standardUserDefaults arrayForKey:JobsOCDemoListSectionOrderUserDefaultsKey];
    if (![orderArr isKindOfClass:NSArray.class]) return @[];
    NSMutableArray <NSString *>*result = NSMutableArray.array;
    for (id obj in orderArr) {
        if ([obj isKindOfClass:NSString.class] && ((NSString *)obj).length) {
            [result addObject:obj];
        }
    };return result.copy;
}

-(void)applySavedDemoSectionOrderIfNeeded{
    NSArray <NSString *>*orderArr = self.savedDemoSectionOrderArr;
    if (orderArr.count && _demoSectionMutArr.count > 1) {
        NSMutableArray <JobsOCDemoSectionModel *>*unorderedSectionMutArr = _demoSectionMutArr.mutableCopy;
        NSMutableArray <JobsOCDemoSectionModel *>*orderedSectionMutArr = NSMutableArray.array;
        for (NSString *title in orderArr) {
            NSUInteger idx = [unorderedSectionMutArr indexOfObjectPassingTest:^BOOL(JobsOCDemoSectionModel * _Nonnull sectionModel,
                                                                                    NSUInteger idx,
                                                                                    BOOL * _Nonnull stop) {
                return [sectionModel.title isEqualToString:title];
            }];
            if (idx != NSNotFound) {
                [orderedSectionMutArr addObject:unorderedSectionMutArr[idx]];
                [unorderedSectionMutArr removeObjectAtIndex:idx];
            }
        }
        [orderedSectionMutArr addObjectsFromArray:unorderedSectionMutArr];
        if (orderedSectionMutArr.count == _demoSectionMutArr.count) {
            [_demoSectionMutArr setArray:orderedSectionMutArr];
        }
    }
    [self moveOtherDemoSectionToEndInArr:_demoSectionMutArr];
}

-(void)saveDemoSectionOrder{
    [self moveOtherDemoSectionToEndInArr:self.demoSectionMutArr];
    NSMutableArray <NSString *>*orderMutArr = NSMutableArray.array;
    for (JobsOCDemoSectionModel *sectionModel in self.demoSectionMutArr) {
        if (sectionModel.title.length) [orderMutArr addObject:sectionModel.title];
    }
    [NSUserDefaults.standardUserDefaults setObject:orderMutArr.copy
                                           forKey:JobsOCDemoListSectionOrderUserDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

-(void)moveOtherDemoSectionToEndInArr:(NSMutableArray <JobsOCDemoSectionModel *>*)sectionMutArr{
    if (sectionMutArr.count < 2) return;
    NSString *otherTitle = @"其他".tr;
    NSUInteger otherIndex = [sectionMutArr indexOfObjectPassingTest:^BOOL(JobsOCDemoSectionModel * _Nonnull sectionModel,
                                                                          __unused NSUInteger idx,
                                                                          __unused BOOL * _Nonnull stop) {
        return [sectionModel.title isEqualToString:otherTitle];
    }];
    if (otherIndex == NSNotFound || otherIndex == sectionMutArr.count - 1) return;
    JobsOCDemoSectionModel *otherSectionModel = sectionMutArr[otherIndex];
    [sectionMutArr removeObjectAtIndex:otherIndex];
    [sectionMutArr addObject:otherSectionModel];
}

-(void)moveExpandedDemoSectionStateFromRow:(NSUInteger)sourceRow
                                     toRow:(NSUInteger)destinationRow{
    if (sourceRow == destinationRow) return;
    NSMutableIndexSet *nextIndexSet = NSMutableIndexSet.indexSet;
    [self.expandedDemoSectionIndexSet enumerateIndexesUsingBlock:^(NSUInteger idx,
                                                                    BOOL * _Nonnull stop) {
        if (idx == sourceRow) {
            [nextIndexSet addIndex:destinationRow];
        }else if (sourceRow < destinationRow && idx > sourceRow && idx <= destinationRow){
            [nextIndexSet addIndex:idx - 1];
        }else if (destinationRow < sourceRow && idx >= destinationRow && idx < sourceRow){
            [nextIndexSet addIndex:idx + 1];
        }else{
            [nextIndexSet addIndex:idx];
        }
    }];
    [self.expandedDemoSectionIndexSet removeAllIndexes];
    [self.expandedDemoSectionIndexSet addIndexes:nextIndexSet];
}

-(NSArray <NSString *>*)functionMenuTitles{
    return @[
        @"搜索 Demo".tr,
        [self demoFoldSwitchTitle],
        @"设置".tr
    ];
}

-(NSString *)demoFoldSwitchTitle{
    return [self anyVisibleDemoSectionExpanded] ? @"全部收缩".tr : @"全部展开".tr;
}

-(CGFloat)functionMenuTableWidth{
    return 210;
}

-(CGFloat)functionMenuTableHeight{
    return 44 * self.functionMenuTitles.count;
}

-(UIImage *)functionMenuImageBySymbolName:(NSString *)symbolName
                                tintColor:(UIColor *)tintColor{
    UIImage *image = symbolName.sys_img;
    if (@available(iOS 13.0, *)) {
        return [image imageWithTintColor:tintColor
                           renderingMode:UIImageRenderingModeAlwaysOriginal];
    };return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

-(void)toggleFunctionMenu{
    [self showFunctionMenu:self.functionMenuTableView.hidden];
}

-(void)showFunctionMenu:(BOOL)show{
    self.functionMenuBtn.bySelected(show);
    self.functionMenuTableView.byHidden(!show);
    if (show) {
        [self.functionMenuTableView reloadData];
        [self.functionMenuTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.functionMenuTableWidth);
            make.height.mas_equalTo(self.functionMenuTableHeight);
        }];
        [self.view bringSubviewToFront:self.functionMenuTableView];
    }
}

-(void)pushDemoListSettingsVC{
    JobsOCDemoListSettingsVC *settingsVC = JobsOCDemoListSettingsVC.new;
    settingsVC.title = @"设置".tr;
    self.comingToPushVCByRequestParams(settingsVC, nil);
}

-(void)setSearchEnabled:(BOOL)enabled{
    if (enabled && self.tableView.editing) {
        [self.tableView setEditing:NO
                          animated:YES];
    }
    self.demoSearchEnabled = enabled;
    self.tableView.tableHeaderView = enabled ? self.demoSearchHeaderView : nil;
    if (enabled) {
        [self.demoSearchBar becomeFirstResponder];
        [self.tableView reloadData];
    }else{
        self.demoSearchKeyword = @"";
        self.demoSearchBar.byText(@"");
        [self.demoSearchBar resignFirstResponder];
        [self foldDemoSectionsWithFirstUnfolded];
        [self.tableView reloadData];
    }
}

-(BOOL)demoSearchActive{
    NSString *keyword = [self normalizedDemoSearchTextBy:self.demoSearchKeyword];
    return keyword.length > 0;
}

-(BOOL)demoSearchLandingActive{
    return self.demoSearchEnabled && ![self demoSearchActive] && self.demoSearchHistoryMutArr.count > 0;
}

-(NSString *)normalizedDemoSearchTextBy:(NSString *)text{
    return [(text ? : @"") stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] ? : @"";
}

-(void)applyDemoSearchKeyword:(NSString *)keyword
                  saveHistory:(BOOL)saveHistory{
    NSString *text = [self normalizedDemoSearchTextBy:keyword];
    if (!text.length) return;
    if (saveHistory) [self saveDemoSearchHistoryByText:text];
    self.demoSearchKeyword = text;
    self.demoSearchBar.byText(text);
    [self unfoldAllDemoSections];
    [self.tableView reloadData];
}

-(void)saveDemoSearchHistoryByText:(NSString *)text{
    NSString *historyText = [self normalizedDemoSearchTextBy:text];
    if (!historyText.length) return;
    NSUInteger index = [self.demoSearchHistoryMutArr indexOfObject:historyText];
    if (index != NSNotFound) [self.demoSearchHistoryMutArr removeObjectAtIndex:index];
    [self.demoSearchHistoryMutArr insertObject:historyText
                                       atIndex:0];
    while (self.demoSearchHistoryMutArr.count > 20) {
        [self.demoSearchHistoryMutArr removeLastObject];
    }
    [NSUserDefaults.standardUserDefaults setObject:self.demoSearchHistoryMutArr.copy
                                            forKey:JobsOCDemoSearchHistoryUserDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
    [self.tableView reloadData];
}

-(void)deleteDemoSearchHistoryAtIndex:(NSUInteger)index{
    if (index >= self.demoSearchHistoryMutArr.count) return;
    [self.demoSearchHistoryMutArr removeObjectAtIndex:index];
    if (self.demoSearchHistoryMutArr.count) {
        [NSUserDefaults.standardUserDefaults setObject:self.demoSearchHistoryMutArr.copy
                                                forKey:JobsOCDemoSearchHistoryUserDefaultsKey];
    }else{
        [NSUserDefaults.standardUserDefaults removeObjectForKey:JobsOCDemoSearchHistoryUserDefaultsKey];
    }
    [NSUserDefaults.standardUserDefaults synchronize];
    [self.tableView reloadData];
}

-(void)clearDemoSearchHistory{
    [self.demoSearchHistoryMutArr removeAllObjects];
    [NSUserDefaults.standardUserDefaults removeObjectForKey:JobsOCDemoSearchHistoryUserDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
    [self.tableView reloadData];
}

-(BOOL)anyVisibleDemoSectionExpanded{
    NSUInteger visibleSectionCount = self.visibleDemoSectionArr.count;
    if (!visibleSectionCount) return NO;
    for (NSUInteger idx = 0; idx < visibleSectionCount; idx++) {
        if ([self.expandedDemoSectionIndexSet containsIndex:idx]) return YES;
    };return NO;
}

-(BOOL)allVisibleDemoSectionsExpanded{
    NSUInteger visibleSectionCount = self.visibleDemoSectionArr.count;
    if (!visibleSectionCount) return NO;
    for (NSUInteger idx = 0; idx < visibleSectionCount; idx++) {
        if (![self.expandedDemoSectionIndexSet containsIndex:idx]) return NO;
    };return YES;
}

-(void)foldDemoSectionsWithFirstUnfolded{
    if ([self demoSearchActive]) {
        [self unfoldAllDemoSections];
        return;
    }
    [self.expandedDemoSectionIndexSet removeAllIndexes];
    if (self.visibleDemoSectionArr.count) {
        [self.expandedDemoSectionIndexSet addIndex:0];
    }
}

-(void)unfoldAllDemoSections{
    [self.expandedDemoSectionIndexSet removeAllIndexes];
    [self.expandedDemoSectionIndexSet addIndexesInRange:NSMakeRange(0, self.visibleDemoSectionArr.count)];
}

-(void)setAllDemoSectionsExpanded:(BOOL)expanded{
    if (expanded) {
        [self unfoldAllDemoSections];
    }else{
        [self.expandedDemoSectionIndexSet removeAllIndexes];
    }
    [self.tableView reloadData];
}

-(NSString *)demoProjectFolderName{
    id value = NSBundle.mainBundle.objectForInfoDictionaryKey(JobsOCDemoProjectFolderInfoKey);
    if (![value isKindOfClass:NSString.class]) return JobsOCDemoProjectFolderFallbackName;
    NSString *folderName = (NSString *)value;
    if (!folderName.length || [folderName containsString:@"$("]) return JobsOCDemoProjectFolderFallbackName;
    return folderName;
}

-(NSAttributedString *)demoNavigationAttributedTitle{
    NSString *pageTitle = self.viewModel.textModel.text ?: @"演武堂".tr;
    NSString *folderName = self.demoProjectFolderName;
    NSString *displayTitle = [NSString stringWithFormat:@"%@\n%@",pageTitle,folderName];
    NSRange displayTitleRange = NSMakeRange(0, displayTitle.length);
    NSRange folderNameRange = NSMakeRange(pageTitle.length + 1, folderName.length);
    return JobsMutAttributedString(displayTitle)
        .addFontAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
            data.byValue(UIFontWeightRegularSize(16))
                .byRange(displayTitleRange);
        }))
        .addForegroundColorAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
            data.byValue([self demoListPrimaryTextColor])
                .byRange(displayTitleRange);
        }))
        .addFontAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
            data.byValue(UIFontWeightRegularSize(10))
                .byRange(folderNameRange);
        }))
        .addForegroundColorAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
            data.byValue([self demoListSecondaryTextColor])
                .byRange(folderNameRange);
        }))
        .addAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
            data.byValue(jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable paragraphStyle) {
                paragraphStyle
                    .byAlignment(NSTextAlignmentCenter)
                    .byLineBreakMode(NSLineBreakByTruncatingMiddle);
            }))
                .byRange(displayTitleRange);
        }));
}

-(void)refreshDemoNavigationTitle{
    self.navBar.titleLab.byHidden(YES);
    self.demoNavigationTitleLab.byText(self.viewModel.textModel.text ?: @"演武堂".tr);
    self.demoNavigationProjectLab.byText(self.demoProjectFolderName);
    self
        .byGKNavTitle(nil)
        .byGKNavTitleView(self.demoNavigationTitleView);
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
            data
                .byTextCor(titleColor)
                .byText(@"演武堂".tr)
                .byFont(UIFontWeightRegularSize(16));
        })
        .byBgCor(navBgColor)
        .byNavBgCor(navBgColor)
        .byNavBgImage([self demoListDarkModeEnabled] ? nil : @"导航栏左侧底图".img);
}

-(void)reloadLocalizedDemoListContent{
    self.demoListRenderedLanguage = LanMgr.language;
    [self updateLocalizedContent];
    [self refreshDemoNavigationTitle];
    if (_demoSearchBar) {
        _demoSearchBar.byPlaceholder(@"输入关键词搜索 Demo".tr);
    }
    if (_demoSearchCancelBtn) {
        _demoSearchCancelBtn.jobsResetBtnTitle(@"取消".tr);
    }
    if (_tableView) {
        _tableView
            .byTableFooterView(self.demoListTableFooterView)
            .emptyDataByButtonModel(self.demoListEmptyDataButtonModel);
    }
    if (_dataMutArr.count) {
        [_dataMutArr removeAllObjects];
        _dataMutArr = nil;
        _demoSectionMutArr = nil;
        _pinnedDemoMutArr = nil;
        _tbvCellMutArr = nil;
    }
    if (_functionMenuTableView && !_functionMenuTableView.hidden) {
        [_functionMenuTableView reloadData];
        [_functionMenuTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.functionMenuTableWidth);
            make.height.mas_equalTo(self.functionMenuTableHeight);
        }];
    }
    if (_tableView) [_tableView reloadData];
}

-(void)reloadLocalizedDemoListContentIfNeeded{
    if (self.demoListRenderedLanguage == LanMgr.language) return;
    [self reloadLocalizedDemoListContent];
}

-(UIView *)demoListTableFooterView{
    return jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
        label
            .byText(@"- 没有更多的内容了 -".tr)
            .byFont(UIFontWeightRegularSize(12))
            .byTextAlignment(NSTextAlignmentCenter)
            .byTextCor(JobsSecondaryLabelColor)
            .makeLabelByShowingType(UILabelShowingType_03);
    });
}

-(UIButtonModel *)demoListEmptyDataButtonModel{
    return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
        data.byTitle(@"NO MESSAGES FOUND".tr)
            .byTitleCor(JobsWhiteColor)
            .byTitleFont(bayonRegular(JobsWidth(30)))
            .byNormalImage(@"小狮子".img);
    });
}

-(void)reloadDemoListToTopAndRefresh{
    if (_dataMutArr.count) {
        [self.dataMutArr removeAllObjects];
        _dataMutArr = nil;
        _demoSectionMutArr = nil;
        _pinnedDemoMutArr = nil;
        _tbvCellMutArr = nil;
        _expandedDemoSectionIndexSet = nil;
    }
    [self foldDemoSectionsWithFirstUnfolded];
    [self.tableView reloadData];
    [self.tableView setContentOffset:CGPointMake(0, -self.tableView.contentInset.top)
                            animated:NO];
    [self.tableView.mj_header beginRefreshing];
}

-(UIViewModel *)jobs_countryCodeDemoViewModel{
    UIViewModel *viewModel = self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
        model.byTitle(@"国家 / 地区代码选择".tr)
             .bySubTitle(@"JobsOCCountryCodeCtrl".tr)
             .byCls(JobsOCCountryCodeCtrl.class);
    }));
    [self jobs_applySelectedCountryCodeToViewModel:viewModel];
    return viewModel;
}

-(BOOL)jobs_isCountryCodeDemoViewModel:(UIViewModel *)viewModel{
    return [viewModel.cls isSubclassOfClass:JobsOCCountryCodeCtrl.class];
}

-(void)jobs_pushCountryCodeCtrlWithViewModel:(UIViewModel *)viewModel{
    JobsOCCountryCodeCtrl *countryCodeCtrl = JobsOCCountryCodeCtrl.new;
    @jobs_weakify(self)
    countryCodeCtrl.countryCodeBlock = ^(__kindof NSString * _Nullable countryName,
                                         __kindof NSString * _Nullable code) {
        @jobs_strongify(self)
        [self jobs_updateSelectedCountryCodeWithCountryName:countryName
                                                       code:code];
        [self jobs_applySelectedCountryCodeToViewModel:viewModel];
        [self.tableView reloadData];
    };
    self.comingToPushVCByRequestParams(countryCodeCtrl,
                                       viewModel);
}

-(void)jobs_updateSelectedCountryCodeWithCountryName:(NSString *)countryName
                                                code:(NSString *)code{
    self.selectedCountryCodePlainText = [JobsOCCountryCodeCtrl jobs_countryCodeTextByCountryName:countryName
                                                                                            code:code];
    self.selectedCountryCodeAttributedText = [JobsOCCountryCodeCtrl jobs_countryCodeAttributedTextByCountryName:countryName
                                                                                                           code:code
                                                                                                           font:UIFontWeightRegularSize(11)
                                                                                                      textColor:self.jobs_countryCodeDemoSubTextColor];
}

-(void)jobs_applySelectedCountryCodeToViewModel:(UIViewModel *)viewModel{
    if (!viewModel) return;
    if (self.selectedCountryCodePlainText.length) {
        viewModel.textModel
            .byText(self.selectedCountryCodePlainText)
            .byAttributedTitle(self.selectedCountryCodeAttributedText);
    }else{
        viewModel.textModel
            .byText(@"国家 / 地区代码选择".tr)
            .byAttributedTitle(nil);
    }
    viewModel.subTextModel
        .byText(@"JobsOCCountryCodeCtrl".tr)
        .byAttributedTitle(nil);
}

-(UIColor *)jobs_countryCodeDemoSubTextColor{
    if (@available(iOS 13.0, *)) {
        return UIColor.secondaryLabelColor;
    };return HEXCOLOR(0x8A93A1);
}

-(NSMutableArray<JobsOCDemoSectionModel *> *)demoSectionMutArr{
    if (!_demoSectionMutArr) {
        _demoSectionMutArr = NSMutableArray.array;
        for (UIViewModel *viewModel in self.dataMutArr) {
            NSString *sectionTitle = [self sectionTitleForViewModel:viewModel];
            [[self sectionModelInArr:_demoSectionMutArr
                                title:sectionTitle].dataMutArr addObject:viewModel];
        }
        [self applySavedDemoSectionOrderIfNeeded];
    };return _demoSectionMutArr;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"朋友圈图文浏览与图片预览".tr)
                     .bySubTitle(@"图文卡片与图片填充 / 适配预览".tr)
                     .byCls(JobsSwiftParityMomentsPreviewDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"节流、防抖".tr)
                     .bySubTitle(@"高频事件节流与延迟回调防抖".tr)
                     .byCls(JobsSwiftParityThrottleDebounceDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"多任务依赖、顺序与状态编排".tr)
                     .bySubTitle(@"TaskCenter依赖任务编排".tr)
                     .byCls(JobsSwiftParityTaskCenterDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"动效数字按钮".tr)
                     .bySubTitle(@"按钮标题数值平滑过渡".tr)
                     .byCls(JobsSwiftParityAnimatedButtonNumberDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"仪表盘".tr)
                     .bySubTitle(@"随机进度与动效同步".tr)
                     .byCls(JobsSwiftParityDashboardDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"ControlEvents".tr)
                     .bySubTitle(@"UIControl 事件触发与 once / on 语义".tr)
                     .byCls(JobsSwiftParityControlEventsDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"主题与界面环境变化监听".tr)
                     .bySubTitle(@"TraitChange".tr)
                     .byCls(JobsSwiftParityTraitChangeDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"编辑个人资料".tr)
                     .bySubTitle(@"昵称编辑、保存与再次进入回填".tr)
                     .byCls(JobsSwiftParityEditProfileDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"PDF 浏览".tr)
                     .bySubTitle(@"PDFKit DSL 装载本地文档".tr)
                     .byCls(JobsSwiftParityPDFDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"轻量提示反馈".tr)
                     .bySubTitle(@"Toast".tr)
                     .byCls(JobsSwiftParityToastDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"确认与取消系统弹框".tr)
                     .bySubTitle(@"UIAlert".tr)
                     .byCls(JobsSwiftParityAlertDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"统一打开外部 URL".tr)
                     .bySubTitle(@"JobsOpen".tr)
                     .byCls(JobsSwiftParityOpenDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"雪花算法".tr)
                     .bySubTitle(@"使用数据中心与机器 ID 生成唯一编号".tr)
                     .byCls(JobsSwiftParitySnowflakeDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsTabBarCtr".tr)
                     .bySubTitle(@"JobsTabBarCtr".tr)
                     .byCls(JobsTabBarCtrlDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"苹果滑动开锁".tr)
                     .bySubTitle(@"苹果滑动开锁".tr)
                     .byCls(SlideToUnlockDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"系统导航栏".tr)
                     .bySubTitle(@"JobsNavigationDemoVC".tr)
                     .byCls(JobsNavigationDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"正计时/倒计时".tr)
                     .bySubTitle(@"进入列表后分别查看正计时和倒计时按钮 DemoVC".tr)
                     .byCls(JobsTimerDemoListVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"本地录音与音频管理".tr)
                     .bySubTitle(@"短按住录音、后台长录音、播放与删除本地文件".tr)
                     .byCls(JobsOCAudioRecorderDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsBluetooth".tr)
                     .bySubTitle(@"BLE 扫描、连接、读写、Notify、Mock、协议和 DSL 全能力 Demo".tr)
                     .byCls(JobsBluetoothDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"陀螺仪、加速度计、磁力计与设备".tr)
                     .bySubTitle(@"CoreMotion DSL".tr)
                     .byCls(JobsCoreMotionDemoVC.class);
            })))
            .add(
                self.makeDatas(
                    jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                        model.byTitle(@"SceneDelegate 多场景与窗口会话".tr)
                             .bySubTitle(@"新建、激活、关闭 Scene，验证独立状态、生命周期与恢复".tr)
                             .byCls(JobsOCSceneDelegateDemoVC.class);
                    })
                ).byImage(
                    [JobsIconfontManager.shared iconImageForGlyph:JobsIconfontGlyphSwitcher
                                                             size:CGSizeMake(JobsWidth(30),JobsWidth(30))
                                                            color:UIColor.systemBlueColor]
                )
            )
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"截屏后 Tips 提示".tr)
                     .bySubTitle(@"截屏完成后更新页面状态并弹出提示".tr)
                     .byCls(JobsScreenshotTipsDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"禁止截屏：敏感内容保护".tr)
                     .bySubTitle(@"安全渲染容器隐藏截图中的敏感区域，并支持开关对比".tr)
                     .byCls(JobsScreenshotProtectionDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"UILabel 数字动效".tr)
                     .bySubTitle(@"UILabel 文本数值按 1/60 秒间隔从起点平滑过渡到终点".tr)
                     .byCls(JobsAnimatedNumberLabelDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"UILabel+Scrolling｜四种定尺寸文字策略".tr)
                     .bySubTitle(@"缩放适配、单行省略、多行省略与滚动展示".tr)
                     .byCls(UILabelScrollingDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"时钟".tr)
                     .bySubTitle(@"JobsClockView：基于 Timer 驱动的模拟时钟".tr)
                     .byCls(JobsClockDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"动态时钟图标｜顺/逆时针".tr)
                     .bySubTitle(@"无刻度、固定时针，仅分针旋转；方向与 Timer 间隔由外界传入".tr)
                     .byCls(JobsImageRotationDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"幸运轮盘".tr)
                     .bySubTitle(@"抽奖轮盘：Timer 相关应用层 Demo".tr)
                     .byCls(LotteryVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"红包雨".tr)
                     .bySubTitle(@"JobsLuckyEnvelopeRain：基于 JobsOCTimer 的红包雨封装".tr)
                     .byCls(JobsRedPacketRainDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsOCTimerMgr 多任务管理".tr)
                     .bySubTitle(@"按 identifier 统一注册、启动、暂停、恢复和移除多个 Timer".tr)
                     .byCls(JobsOCTimerMgrDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🎲 时时彩@单页面管理多个Timer".tr)
                     .bySubTitle(@"JobsOCTimerMgr 管理表格里的多个倒计时".tr)
                     .byCls(JobsMultiTimerTableDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsMarqueeView 跑马灯 / 轮播图".tr)
                     .bySubTitle(@"JobsOCTimerMgr 驱动：连续公告、间隔翻页、分页轮播".tr)
                     .byCls(JobsMarqueeViewDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"日历功能".tr)
                     .bySubTitle(@"CalendarVC".tr)
                     .byCls(CalendarVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"竖形菜单选择功能".tr)
                     .bySubTitle(@"JobsVerticalMenuMainVC".tr)
                     .byCls(JobsVerticalMenuMainVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsLinkageMenuViewDemoVC".tr)
                     .bySubTitle(@"首页联动切换子页面：左侧 UIScrollView 菜单联动右侧 UIView 内容".tr)
                     .byCls(JobsLinkageMenuViewDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"横向 / 纵向刷新与加载更多".tr)
                     .bySubTitle(@"重写MJRefresh".tr)
                     .byCls(JobsOCRefresherDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🔴 抖音双球刷新动画".tr)
                     .bySubTitle(@"红、绿双球交叉换位并错峰跳跃，支持开始、暂停、继续与停止".tr)
                     .byCls(JobsDouyinRefreshDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"ViewPushView".tr)
                     .bySubTitle(@"让 UIView 像 UINavigationController 支持上下左右 Push/Pop、比例覆盖和原路交互退出".tr)
                     .byCls(JobsViewPushDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"侧滑方向/比例/跟随模式".tr)
                     .bySubTitle(@"JobsSideDrawerDemoVC".tr)
                     .byCls(JobsSideDrawerDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"键盘遮挡处理".tr)
                     .bySubTitle(@"JobsOCKeyboardMgr".tr)
                     .byCls(JobsOCKeyboardMgrDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"购物车".tr)
                     .bySubTitle(@"减号 + 数字输入 + 加号；可选上下限自动控制按钮状态".tr)
                     .byCls(JobsOCNumberStepperDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"图形验证码".tr)
                     .bySubTitle(@"阿拉伯数字/英文（区分大小写）/汉字（区分简繁）".tr)
                     .byCls(JobsOCGraphicCaptchaDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🐎 二维码/条形码".tr)
                     .bySubTitle(@"CoreImage 生成二维码、带 Logo 二维码和 Code128 条形码".tr)
                     .byCls(JobsQRCodeDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"👮 中国大陆公民身份证号码校验".tr)
                     .bySubTitle(@"15 / 18 位身份证号码格式、生日、顺序码和校验位校验".tr)
                     .byCls(JobsCNIDDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"☠️ 骨架屏".tr)
                     .bySubTitle(@"JobsOCSkeletonView：Skeleton / shimmer / pulse".tr)
                     .byCls(JobsOCSkeletonViewDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsOCExcel｜任意冻结列与四种文字策略".tr)
                     .bySubTitle(@"Jobs 自研 Excel UI，可嵌入 UITableViewCell / UICollectionViewCell".tr)
                     .byCls(JobsOCExcelDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"📚 Markdown 文档浏览器".tr)
                     .bySubTitle(@"按工程相对路径浏览并渲染全部 Jobs 自有 Markdown 文档".tr)
                     .byCls(JobsOCMarkdownDocumentsDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"✍️ 手写板｜本地保存与离开确认".tr)
                     .bySubTitle(@"手指或 Apple Pencil 书写；保存后恢复，未保存离开时确认".tr)
                     .byCls(JobsHandwritingDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Excel".tr)
                     .bySubTitle(@"Excel".tr)
                     .byCls(ExcelVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JXCategoryView演示".tr)
                     .bySubTitle(@"JXCategoryViewVerticalShowVC".tr)
                     .byCls(JXCategoryViewVerticalShowVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"发帖（图文）功能".tr)
                     .bySubTitle(@"相册获取资源+存/取未完成字符串".tr)
                     .byCls(JobsPostVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"将图片用字符串（加盐）进行存取".tr)
                     .bySubTitle(@"一种图片加密的手段，简单而粗暴.".tr)
                     .byCls(PicToStrStoreVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"iOS 热更新".tr)
                     .bySubTitle(@"".tr)
                     .byCls(HotRefreshVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"FMDB示例".tr)
                     .bySubTitle(@"增删查改".tr)
                     .byCls(FMDB_VC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Realm示例".tr)
                     .bySubTitle(@"增删查改".tr)
                     .byCls(Realm_VC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"• 带小圆点文本及对齐".tr)
                     .bySubTitle(@"圆点颜色、图片圆点与多行悬挂缩进对齐".tr)
                     .byCls(PointLabTestVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"iOS Widget".tr)
                     .bySubTitle(@"尺寸预览、状态更新与 Extension 接入说明".tr)
                     .byCls(WidgetVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"手机横屏".tr)
                     .bySubTitle(@"全局设定".tr)
                     .byCls(LandscapeSwitchVC.class);
            })))
//            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
//                model.title = @"Texture".tr;
//                model.subTitle = @"byFaceBook".tr;
//                model.cls = TextureDemoVC.class;
//            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"本地推送通知".tr)
                     .bySubTitle(@"本地推送通知".tr)
                     .byCls(LocalNotificationsVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"字符串解压缩".tr)
                     .bySubTitle(@"字符串解压缩".tr)
                     .byCls(CompressStrVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"动态切换App图标".tr)
                     .bySubTitle(@"只能跑真机，模拟器编译报错，且iOS 10.3 或更高版本".tr)
                     .byCls(AppIconSwitchingVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"长按Cell出3D-Touch的菜单".tr)
                     .bySubTitle(@"PeekAndPop".tr)
                     .byCls(MyTableTableVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"系统剪切板测试".tr)
                     .bySubTitle(@"尝试控制粘贴提示".tr)
                     .byCls(CtrlClipboardCueVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"注册/登陆/忘记密码".tr)
                     .bySubTitle(@"JobsAppDoor（2种表现形式）".tr)
                     .byCls(JobsAppDoorDemoListVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Douyin_ZFPlayer".tr)
                     .bySubTitle(@"2 种播放效果，进入列表后分别查看".tr)
                     .byCls(JobsZFPlayerDemoListVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"镂空特效".tr)
                     .bySubTitle(@"TransparentRegion".tr)
                     .byCls(TransparentRegionVC.class);
            })))
            .add(
                self.makeDatas(
                    jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                        model.byTitle(@"JobsIconfont｜图片、图标字体与文字字体".tr)
                             .bySubTitle(@"iconfont 全功能封装：业务层不直接接触 URL、Unicode 和字体文件名".tr)
                             .byCls(JobsIconfontDemoListVC.class);
                    })
                ).byImage(
                    [JobsIconfontManager.shared iconImageForGlyph:JobsIconfontGlyphComponent
                                                             size:CGSizeMake(JobsWidth(30),JobsWidth(30))
                                                            color:UIColor.systemBlueColor]
                )
            )
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🧩 打马赛克".tr)
                     .bySubTitle(@"整图粗细 / 手势涂抹两种马赛克效果".tr)
                     .byCls(JobsMosaicDemoListVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"😂 按钮完全覆盖在 Cell 上".tr)
                     .bySubTitle(@"UITableViewCell / UICollectionViewCell 两种表现形式".tr)
                     .byCls(JobsButtonCoverCellDemoListVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🌍 球形特效（可拖动点选）".tr)
                     .bySubTitle(@"XLSphereView：拖动旋转、惯性滚动、点按标签".tr)
                     .byCls(JobsSphereDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"评论功能".tr)
                     .bySubTitle(@"评论 Pod：网易 / 今日头条 / 自定义三种回复模式".tr)
                     .byCls(JobsOCCommentDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"搜索功能".tr)
                     .bySubTitle(@"JobsOCSearcher".tr)
                     .byCls(JobsOCSearcherDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"相册选取图片和视频".tr)
                     .bySubTitle(@"".tr)
                     .byCls(JobsShootingVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"长按录制视频".tr)
                     .bySubTitle(@"全屏摄像头预览 + AVAssetWriter 音视频录制 + 画中画预览保存".tr)
                     .byCls(JobsOCVideoRecorderVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🌘 直播间@滚动留言".tr)
                     .bySubTitle(@"输入留言后自动追加并滚动到最新消息".tr)
                     .byCls(JobsLiveCommentDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"📺 直播推流".tr)
                     .bySubTitle(@"AVFoundation 采集预览 + RTMP 地址入口".tr)
                     .byCls(JobsLiveStreamDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Gif图片读取".tr)
                     .bySubTitle(@"DynamicView".tr)
                     .byCls(DynamicViewTestVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Progress".tr)
                     .bySubTitle(@"进度条".tr)
                     .byCls(JobsProgressVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"💣 任意UIView.layer@导火索倒计时效果".tr)
                     .bySubTitle(@"任意 UIView.layer 外圈导火索倒计时".tr)
                     .byCls(JobsCountdownLayerDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"👍 长按点赞冒泡".tr)
                     .bySubTitle(@"长按持续冒泡 + 震动反馈 + 声音反馈 + 点赞变红".tr)
                     .byCls(JobsLongPressLikeDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"系统进度条".tr)
                     .bySubTitle(@"UIProgressView + JobsOCTimer 倒计时".tr)
                     .byCls(JobsSysProgressDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"自定义进度条（进度值+前进方向）".tr)
                     .bySubTitle(@"JobsProgressBar：进度值、方向、拖动和自动进度".tr)
                     .byCls(JobsProgressDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"不规则的按钮".tr)
                     .bySubTitle(@"IrregularView".tr)
                     .byCls(TestIrregularViewTestVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"IM模块".tr)
                     .bySubTitle(@"JobsIM".tr)
                     .byCls(JobsIMShowVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"UILabel / UIButton.titleLabel 表现列表".tr)
                     .bySubTitle(@"省略、滚动、自适应、缩放、换行与富文本".tr)
                     .byCls(TestLabelVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"👇🏻下拉列表".tr)
                     .bySubTitle(@"JobsDropDownListVC".tr)
                     .byCls(JobsDropDownListVC.class);
            })))
            .add(self.jobs_countryCodeDemoViewModel)
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"探究猿题库网络框架（YTKNetwork）".tr)
                     .bySubTitle(@"YTKNetworkStudyVC".tr)
                     .byCls(YTKNetworkStudyVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"WebSocket 双向通信".tr)
                     .bySubTitle(@"连接、发送、断开与 Echo 回显".tr)
                     .byCls(JobsWebSocketDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"探究CoreText".tr)
                     .bySubTitle(@"CoreTextLearningVC".tr)
                     .byCls(CoreTextLearningVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JXCategoryPopupVC".tr)
                     .bySubTitle(@"JXCategoryView+PopupView".tr)
                     .byCls(JXCategoryPopupVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"站内信".tr)
                     .bySubTitle(@"替换系统UITableViewCell编辑状态下前面的按钮UI样式，及其一部分逻辑".tr)
                     .byCls(UITableViewCellEditorVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"手势解锁".tr)
                     .bySubTitle(@"设置手势密码".tr)
                     .byCls(JobsSettingGestureVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"CXB自研科技".tr)
                     .bySubTitle(@"CXBVC".tr)
                     .byCls(CXBVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"OC动态添加类、方法列表、属性列表".tr)
                     .bySubTitle(@"OCDynamicRegisterVC".tr)
                     .byCls(OCDynamicRegisterVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JXCategoryViewWithHeaderViewVC".tr)
                     .bySubTitle(@"JXCategoryView下拉放大头部视图".tr)
                     .byCls(JXCategoryViewWithHeaderViewVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🔄 UILabel 文字旋转".tr)
                     .bySubTitle(@"UILabel文字旋转".tr)
                     .byCls(UILabelWordRotatingVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"可交互自定义 Label".tr)
                     .bySubTitle(@"内边距、异形圆角、背景与轻点/长按手势".tr)
                     .byCls(TestBaseLabelVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"随机数测试模块".tr)
                     .bySubTitle(@"RandomTestVC".tr)
                     .byCls(RandomTestVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"CustomTableViewCellVC".tr)
                     .bySubTitle(@"自定义UITableViewCell内置控件距离并添加复制按钮".tr)
                     .byCls(CustomTableViewCellVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"自定义UIButton子控件的排布".tr)
                     .bySubTitle(@"CustomBtnVC".tr)
                     .byCls(CustomBtnVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"GXCardViewDemoVC".tr)
                     .bySubTitle(@"卡片式布局(探探附近/QQ配对)，可以设置卡片堆叠效果，可以设置循环效果".tr)
                     .byCls(GXCardViewDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"UICollectionView实现重叠的卡包效果".tr)
                     .bySubTitle(@"JobsWalletVC".tr)
                     .byCls(JobsWalletVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"在指定的y区间内滑动视图(带吸边效果)".tr)
                     .bySubTitle(@"JobsScrollViewVC".tr)
                     .byCls(JobsScrollViewVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"转场动画探究".tr)
                     .bySubTitle(@"UIPresentationController的使用".tr)
                     .byCls(JobsPresentingVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Masonry的应用与实践".tr)
                     .bySubTitle(@"UIPresentationController的使用".tr)
                     .byCls(MasonryVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"UITableViewCell的折叠效果".tr)
                     .bySubTitle(@"UITableViewCell的折叠效果".tr)
                     .byCls(UITBVCellFoldVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Objc中实现协议扩展".tr)
                     .bySubTitle(@"ProtocolKitVC".tr)
                     .byCls(ProtocolKitVC.class);
            })));
        });
    };return _dataMutArr;
}

@end
