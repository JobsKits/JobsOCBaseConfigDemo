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

-(jobsByAppLanguageBlock _Nonnull)jobsSetDemoListRenderedLanguage;
-(jobsByJobsOCDemoListCellTextDisplayStrategyBlock _Nonnull)jobsSetAppliedCellTextDisplayStrategy;
-(jobsByBOOLBlock _Nonnull)jobsSetDemoListHasAppeared;
-(jobsByBOOLBlock _Nonnull)jobsSetDemoSearchEnabled;
-(jobsByBOOLBlock _Nonnull)jobsSetDemoSideMenuOpen;
-(jobsByBOOLBlock _Nonnull)jobsSetSuspendFuseLongPressConsumed;
-(jobsByNSIntegerBlock _Nonnull)jobsSetSuspendSpinSeconds;
-(jobsByCGFloatBlock _Nonnull)jobsSetDemoSectionDragTouchOffsetY;
-(jobsByStrBlock _Nonnull)jobsSetDemoSearchKeyword;
-(jobsByJobsSideDrawerBlock _Nonnull)jobsSetDemoSideDrawer;
-(jobsByViewBlock _Nonnull)jobsSetDemoSectionDragSnapshotView;
-(jobsByIndexPathBlock _Nonnull)jobsSetDemoSectionDragIndexPath;
-(jobsByUIAlertControllerBlock _Nonnull)jobsSetSuspendTimeVisibilityAlertController;
-(jobsByStrBlock _Nonnull)jobsSetSelectedCountryCodePlainText;
-(jobsByNSAttributedStringBlock _Nonnull)jobsSetSelectedCountryCodeAttributedText;

-(jobsByVoidBlock _Nonnull)setupSuspendButtons;
-(jobsByVoidBlock _Nonnull)setupSuspendTimers;
-(jobsByVoidBlock _Nonnull)refreshSuspendTimeButtonTitle;
-(jobsByVoidBlock _Nonnull)showSuspendTimeButtonVisibilityAlert;
-(JobsRetBOOLByVoidBlock _Nonnull)showsSuspendTimeButton;
-(jobsByBOOLBlock _Nonnull)setShowsSuspendTimeButton;
-(jobsByVoidBlock _Nonnull)refreshSuspendTimeButtonVisibility;
-(JobsRetAttributedStringByStrBlock _Nonnull)suspendTimeAttributedTitleByClock;
-(JobsRetBOOLByVoidBlock _Nonnull)demoListReturnToTopAndRefreshEnabled;
-(jobsByBOOLBlock _Nonnull)setDemoListReturnToTopAndRefreshEnabled;
-(JobsRetBOOLByVoidBlock _Nonnull)demoListDarkModeEnabled;
-(jobsByVoidBlock _Nonnull)applyDemoListInterfaceStyle;
-(JobsRetCorByVoidBlock _Nonnull)demoListPageBackgroundColor;
-(JobsRetCorByVoidBlock _Nonnull)demoListNavigationBackgroundColor;
-(JobsRetCorByVoidBlock _Nonnull)demoListPrimaryTextColor;
-(JobsRetCorByVoidBlock _Nonnull)demoListSecondaryTextColor;
-(JobsRetCorByVoidBlock _Nonnull)demoListCellBackgroundColor;
-(JobsRetCorByVoidBlock _Nonnull)demoListFunctionMenuBackgroundColor;
-(JobsRetCorByVoidBlock _Nonnull)demoListCellSelectedBackgroundColor;
-(JobsRetCorByVoidBlock _Nonnull)demoListSeparatorColor;
-(jobsByVoidBlock _Nonnull)applyDemoListNavigationInterfaceStyle;
-(jobsByVoidBlock _Nonnull)applyDemoListTabBarInterfaceStyle;
-(jobsByVoidBlock _Nonnull)refreshUserHeadButtonTheme;
-(jobsByVoidBlock _Nonnull)refreshFunctionMenuButtonTheme;
-(jobsByVoidBlock _Nonnull)refreshDemoSearchTheme;
-(JobsRetNSArrayJobsOCDemoSectionModelByVoidBlock _Nonnull)visibleDemoSectionArr;
-(JobsRetBOOLByVoidBlock _Nonnull)hasPinnedDemoSection;
-(JobsRetNSIntegerByVoidBlock _Nonnull)demoFoldTableSection;
-(JobsRetBOOLByNSIndexPathBlock _Nonnull)isPinnedDemoIndexPath;
-(JobsRetBOOLByNSIndexPathBlock _Nonnull)isDemoFoldIndexPath;
-(JobsRetNSArrayJobsOCDemoSectionModelByNSArrayJobsOCDemoSectionModelBlock _Nonnull)demoSectionArrByFilteringPinnedFromSectionArr;
-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoTitleByViewModel;
-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoSubTextByViewModel;
-(JobsRetNSAttributedStringByUIViewModelBlock _Nonnull)demoSubAttributedTextByViewModel;
-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoKeyByViewModel;
-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoPersistentKeyByViewModel;
-(JobsRetBOOLByUIViewModelBlock _Nonnull)isPinnedDemoViewModel;
-(JobsRetJobsOCDemoSectionModelByVoidBlock _Nonnull)pinnedDemoSectionModel;
-(jobsByViewModelBlock _Nonnull)pinDemoViewModel;
-(jobsByNSIntegerBlock _Nonnull)unpinPinnedDemoAtIndex;
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)savedPinnedDemoKeyArr;
-(jobsByVoidBlock _Nonnull)applySavedPinnedDemosIfNeeded;
-(jobsByVoidBlock _Nonnull)savePinnedDemos;
-(jobsByViewModelBlock _Nonnull)pushDemoViewModel;
-(JobsRetNSUIntegerByNSStringBlock _Nonnull)demoSectionIndexByTitle;
-(BOOL)isDemoFoldInnerRowPoint:(CGPoint)point
                     indexPath:(NSIndexPath *)indexPath;
-(BOOL)viewModel:(UIViewModel *)viewModel containsKeyword:(NSString *)keyword;
-(JobsRetNSStringByUIViewModelBlock _Nonnull)sectionTitleForViewModel;
-(JobsRetStrByStrBlock _Nonnull)sectionDescriptionForTitle;
-(JobsOCDemoSectionModel *)sectionModelInArr:(NSMutableArray <JobsOCDemoSectionModel *>*)data
                                       title:(NSString *)title;
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)functionMenuTitles;
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)demoSideMenuTitles;
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)demoSideMenuSymbolNames;
-(JobsRetCGFloatByVoidBlock _Nonnull)demoSideMenuWidth;
-(JobsRetViewByVoidBlock _Nonnull)demoSideMenuMainView;
-(jobsByVoidBlock _Nonnull)prepareDemoSideMenuIfNeeded;
-(jobsByVoidBlock _Nonnull)toggleDemoSideMenu;
-(void)showDemoSideMenu:(BOOL)show
               animated:(BOOL)animated;
-(jobsByNSIntegerBlock _Nonnull)handleDemoSideMenuItemAtIndex;
-(jobsByVoidBlock _Nonnull)pushUserInfoDisplayVC;
-(jobsByVoidBlock _Nonnull)pushCrashLogVC;
-(JobsRetStrByVoidBlock _Nonnull)demoFoldSwitchTitle;
-(JobsRetCGFloatByVoidBlock _Nonnull)functionMenuTableWidth;
-(JobsRetCGFloatByVoidBlock _Nonnull)functionMenuTableHeight;
-(JobsRetImageByCorBlock _Nonnull)demoSideMenuImageByTintColor;
-(UIImage *)functionMenuImageBySymbolName:(NSString *)symbolName
                                tintColor:(UIColor *)tintColor;
-(jobsByVoidBlock _Nonnull)toggleFunctionMenu;
-(jobsByBOOLBlock _Nonnull)showFunctionMenu;
-(jobsByVoidBlock _Nonnull)pushDemoListSettingsVC;
-(jobsByBOOLBlock _Nonnull)setSearchEnabled;
-(JobsRetBOOLByVoidBlock _Nonnull)demoSearchActive;
-(JobsRetBOOLByVoidBlock _Nonnull)demoSearchLandingActive;
-(JobsRetStrByStrBlock _Nonnull)normalizedDemoSearchTextBy;
-(void)applyDemoSearchKeyword:(NSString *)keyword
                  saveHistory:(BOOL)saveHistory;
-(jobsByStrBlock _Nonnull)saveDemoSearchHistoryByText;
-(jobsByNSUIntegerBlock _Nonnull)deleteDemoSearchHistoryAtIndex;
-(jobsByVoidBlock _Nonnull)clearDemoSearchHistory;
-(JobsRetBOOLByVoidBlock _Nonnull)anyVisibleDemoSectionExpanded;
-(JobsRetBOOLByVoidBlock _Nonnull)allVisibleDemoSectionsExpanded;
-(jobsByVoidBlock _Nonnull)foldDemoSectionsWithFirstUnfolded;
-(jobsByVoidBlock _Nonnull)unfoldAllDemoSections;
-(jobsByBOOLBlock _Nonnull)setAllDemoSectionsExpanded;
-(JobsRetStrByVoidBlock _Nonnull)demoProjectFolderName;
-(JobsRetAttributedStringByVoidBlock _Nonnull)demoNavigationAttributedTitle;
-(jobsByVoidBlock _Nonnull)refreshDemoNavigationTitle;
-(jobsByVoidBlock _Nonnull)updateLocalizedContent;
-(jobsByVoidBlock _Nonnull)reloadLocalizedDemoListContent;
-(jobsByVoidBlock _Nonnull)reloadLocalizedDemoListContentIfNeeded;
-(JobsRetViewByVoidBlock _Nonnull)demoListTableFooterView;
-(JobsRetUIButtonModelByVoidBlock _Nonnull)demoListEmptyDataButtonModel;
-(jobsByVoidBlock _Nonnull)reloadDemoListToTopAndRefresh;
-(void)handleDemoSectionReorderLongPress:(UILongPressGestureRecognizer *)gesture;
-(jobsByLongPressGestureRecognizerBlock _Nonnull)jobsHandleDemoSectionReorderLongPress;
-(JobsRetBOOLByNSIndexPathBlock _Nonnull)canDragDemoSectionAtIndexPath;
-(void)moveDemoSectionFromIndexPath:(NSIndexPath *)sourceIndexPath
                        toIndexPath:(NSIndexPath *)destinationIndexPath;
-(jobsByVoidBlock _Nonnull)finishDemoSectionDrag;
-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)savedDemoSectionOrderArr;
-(jobsByVoidBlock _Nonnull)applySavedDemoSectionOrderIfNeeded;
-(jobsByVoidBlock _Nonnull)saveDemoSectionOrder;
-(jobsByNSMutableArrayJobsOCDemoSectionModelBlock _Nonnull)moveOtherDemoSectionToEndInArr;
-(void)moveExpandedDemoSectionStateFromRow:(NSUInteger)sourceRow
                                     toRow:(NSUInteger)destinationRow;
-(JobsRetViewModelByVoidBlock _Nonnull)jobs_countryCodeDemoViewModel;
-(JobsRetBOOLByUIViewModelBlock _Nonnull)jobs_isCountryCodeDemoViewModel;
-(jobsByViewModelBlock _Nonnull)jobs_pushCountryCodeCtrlWithViewModel;
-(void)jobs_updateSelectedCountryCodeWithCountryName:(NSString *)countryName
                                                code:(NSString *)code;
-(jobsByViewModelBlock _Nonnull)jobs_applySelectedCountryCodeToViewModel;
-(JobsRetCorByVoidBlock _Nonnull)jobs_countryCodeDemoSubTextColor;

@end

@implementation ViewController_1
- (void)dealloc{
    JobsTimerMgr.shared()
        .byStopAndRemove(JobsOCDemoSuspendTimeTimerIdentifier)
        .byStopAndRemove(JobsOCDemoSuspendSpinTimerIdentifier);
    if (_suspendSpinBtn) _suspendSpinBtn.bySpinStop();
    if (_suspendFuseBtn) _suspendFuseBtn.byFusePressStop(NO);
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

-(jobsByAppLanguageBlock _Nonnull)jobsSetDemoListRenderedLanguage{
    @jobs_weakify(self)
    return ^(NSInteger language) {
        @jobs_strongify(self)
        if (!self) return;
        self->_demoListRenderedLanguage = (AppLanguage)language;
    };
}

-(jobsByJobsOCDemoListCellTextDisplayStrategyBlock _Nonnull)jobsSetAppliedCellTextDisplayStrategy{
    @jobs_weakify(self)
    return ^(NSInteger strategy) {
        @jobs_strongify(self)
        if (!self) return;
        self->_appliedCellTextDisplayStrategy = (JobsOCDemoListCellTextDisplayStrategy)strategy;
    };
}

-(jobsByBOOLBlock _Nonnull)jobsSetDemoListHasAppeared{
    @jobs_weakify(self)
    return ^(BOOL appeared) {
        @jobs_strongify(self)
        if (!self) return;
        self->_demoListHasAppeared = appeared;
    };
}

-(jobsByBOOLBlock _Nonnull)jobsSetDemoSearchEnabled{
    @jobs_weakify(self)
    return ^(BOOL enabled) {
        @jobs_strongify(self)
        if (!self) return;
        self->_demoSearchEnabled = enabled;
    };
}

-(jobsByBOOLBlock _Nonnull)jobsSetDemoSideMenuOpen{
    @jobs_weakify(self)
    return ^(BOOL open) {
        @jobs_strongify(self)
        if (!self) return;
        self->_demoSideMenuOpen = open;
    };
}

-(jobsByBOOLBlock _Nonnull)jobsSetSuspendFuseLongPressConsumed{
    @jobs_weakify(self)
    return ^(BOOL consumed) {
        @jobs_strongify(self)
        if (!self) return;
        self->_suspendFuseLongPressConsumed = consumed;
    };
}

-(jobsByNSIntegerBlock _Nonnull)jobsSetSuspendSpinSeconds{
    @jobs_weakify(self)
    return ^(NSInteger seconds) {
        @jobs_strongify(self)
        if (!self) return;
        self->_suspendSpinSeconds = seconds;
    };
}

-(jobsByCGFloatBlock _Nonnull)jobsSetDemoSectionDragTouchOffsetY{
    @jobs_weakify(self)
    return ^(CGFloat offsetY) {
        @jobs_strongify(self)
        if (!self) return;
        self->_demoSectionDragTouchOffsetY = offsetY;
    };
}

-(jobsByStrBlock _Nonnull)jobsSetDemoSearchKeyword{
    @jobs_weakify(self)
    return ^(NSString *_Nullable keyword) {
        @jobs_strongify(self)
        if (!self) return;
        self->_demoSearchKeyword = keyword.copy;
    };
}

-(jobsByJobsSideDrawerBlock _Nonnull)jobsSetDemoSideDrawer{
    @jobs_weakify(self)
    return ^(JobsSideDrawer *_Nullable sideDrawer) {
        @jobs_strongify(self)
        if (!self) return;
        self->_demoSideDrawer = sideDrawer;
    };
}

-(jobsByViewBlock _Nonnull)jobsSetDemoSectionDragSnapshotView{
    @jobs_weakify(self)
    return ^(__kindof UIView *_Nullable snapshotView) {
        @jobs_strongify(self)
        if (!self) return;
        self->_demoSectionDragSnapshotView = snapshotView;
    };
}

-(jobsByIndexPathBlock _Nonnull)jobsSetDemoSectionDragIndexPath{
    @jobs_weakify(self)
    return ^(NSIndexPath *_Nullable indexPath) {
        @jobs_strongify(self)
        if (!self) return;
        self->_demoSectionDragIndexPath = indexPath;
    };
}

-(jobsByUIAlertControllerBlock _Nonnull)jobsSetSuspendTimeVisibilityAlertController{
    @jobs_weakify(self)
    return ^(UIAlertController *_Nullable alertController) {
        @jobs_strongify(self)
        if (!self) return;
        self->_suspendTimeVisibilityAlertController = alertController;
    };
}

-(jobsByStrBlock _Nonnull)jobsSetSelectedCountryCodePlainText{
    @jobs_weakify(self)
    return ^(NSString *_Nullable text) {
        @jobs_strongify(self)
        if (!self) return;
        self->_selectedCountryCodePlainText = text.copy;
    };
}

-(jobsByNSAttributedStringBlock _Nonnull)jobsSetSelectedCountryCodeAttributedText{
    @jobs_weakify(self)
    return ^(NSAttributedString *_Nullable attributedText) {
        @jobs_strongify(self)
        if (!self) return;
        self->_selectedCountryCodeAttributedText = attributedText;
    };
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_1.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.bySetupNavigationBarHidden(YES);
        self.jobsSetDemoListRenderedLanguage(LanMgr.language);
        self.jobsSetAppliedCellTextDisplayStrategy(JobsOCCurrentDemoListCellTextDisplayStrategy());
        self.updateLocalizedContent();
        @jobs_weakify(self)
        [self addNotificationName:语言切换
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            self.reloadLocalizedDemoListContent();
        }];
        [self addNotificationName:JobsThemeDidChangeNotification
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            self.applyDemoListInterfaceStyle();
        }];
        /// 装填用户信息数据
        /// json生成器 ： https://www.site24x7.com/zhcn/tools/json-generator.html
        self.saveUserInfo(JobsUserModel.byData(@"UserData".readLocalFileWithName()));// 保存全局唯一的一份用户档案
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_1.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLoad];
            self.view.byBgColor(JobsSecondarySystemBackgroundColor);
            if (@available(iOS 11.0, *)) {
                self.view.byBgColor(@"TextColor0".namedCor());
            }else{
                self.view.byBgColor(JobsSecondarySystemBackgroundColor);
            }
            @jobs_weakify(self)
            self.byLeftBarButtonItems(jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                @jobs_strongify(self)
                UIBarButtonItem *item = UIBarButtonItem.initBy(self.userHeadBtn);
                if (@available(iOS 26.0, *)) {
                    item
                        .byHidesSharedBackground(YES)
                        .bySharesBackground(NO);
                }
                data.add(item);
            }))
            .byRightBarButtonItems(jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                @jobs_strongify(self)
                UIBarButtonItem *item = UIBarButtonItem.initBy(self.functionMenuBtn);
                if (@available(iOS 26.0, *)) {
                    item
                        .byHidesSharedBackground(YES)
                        .bySharesBackground(NO);
                }
                data.add(item);
            }));
            self.makeNavByAlpha(1);
            self.navBar.backBtn.byJobsVisible(NO);
            self.navBar.titleLab.byHidden(YES);
            self.demoNavigationTitleView.byHidden(NO);
            self.refreshDemoNavigationTitle();
            self.applyDemoListInterfaceStyle();
            self.tableView.byShow(self);
            self.foldDemoSectionsWithFirstUnfolded();
            self.functionMenuTableView.byHidden(YES);
            if (self.functionMenuDismissTapGesture) self.functionMenuDismissTapGesture.byEnabled(YES);
            self.setupSuspendButtons();
            self.setupSuspendTimers();
            self.refreshSuspendTimeButtonVisibility();
        //    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
        //    UIInterfaceOrientation s = self.getInterfaceOrientation;
        //    DeviceOrientation d = self.getDeviceOrientation;
            JobsLog(@"");
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_1.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewWillAppear:animated];
            JobsOCDemoListCellTextDisplayStrategy strategy = JobsOCCurrentDemoListCellTextDisplayStrategy();
            BOOL textDisplayStrategyChanged = strategy != self.appliedCellTextDisplayStrategy;
            self.jobsSetAppliedCellTextDisplayStrategy(strategy);
            self.reloadLocalizedDemoListContentIfNeeded();
            self.applyDemoListInterfaceStyle();
            self.refreshSuspendTimeButtonVisibility();
            if ([self demoListReturnToTopAndRefreshEnabled]()) {
                self.reloadDemoListToTopAndRefresh();
            }else if (!self.demoListHasAppeared || textDisplayStrategyChanged){
                [self.tableView reloadData];
            }
            self.jobsSetDemoListHasAppeared(YES);
        //    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
        //    UIInterfaceOrientation s = self.getInterfaceOrientation;
        //    DeviceOrientation d = self.getDeviceOrientation;
            JobsLog(@"");
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_1.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidAppear:animated];
            self.refreshSuspendTimeButtonVisibility();
            JobsTimerMgr.shared().byResume(JobsOCDemoSuspendSpinTimerIdentifier);
        //    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
        //    UIInterfaceOrientation s = self.getInterfaceOrientation;
        //    DeviceOrientation d = self.getDeviceOrientation;
        //    self.menuView.alpha = JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape;
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_1.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        if (self.demoSideMenuOpen) {
            [self showDemoSideMenu:NO
                          animated:NO];
        }
    };
}

#pragma mark —— 三个悬浮按钮
-(jobsByVoidBlock _Nonnull)setupSuspendButtons{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.view layoutIfNeeded];
        self.suspendSpinBtn.bySpinStart();
        self.suspendTimeBtn.byAlpha(1);
        self.suspendFuseBtn.byAlpha(1);
    };
}

-(jobsByVoidBlock _Nonnull)showSuspendTimeButtonVisibilityAlert{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        self.jobsSetSuspendTimeVisibilityAlertController(self.makeAlertControllerByAlertModel(jobsMakeAlertModel(^(__kindof JobsAlertModel * _Nullable data) {
            data.byAlertControllerTitle(@"隐藏悬浮时间？".jobsTr())
                .byMessage(@"隐藏后可在“设置”中重新开启。".jobsTr())
                .byPreferredStyle(UIAlertControllerStyleAlert)
                .byAlertActionTitle(@"隐藏".jobsTr())
                .byAlertActionStyle(UIAlertActionStyleDestructive)
                .byCancelAlertActionTitle(@"取消".jobsTr())
                .byCancelAlertActionStyle(UIAlertActionStyleCancel)
                .byAlertActionBlock(^(__unused UIAlertAction * _Nullable action) {
                    @jobs_strongify(self)
                    self.setShowsSuspendTimeButton(NO);
                    self.refreshSuspendTimeButtonVisibility();
                });
        })));
        /// 普通系统 Alert 不进入页面转场导航链路
        [self presentViewController:self.suspendTimeVisibilityAlertController
                           animated:YES
                         completion:nil];
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

-(jobsByVoidBlock _Nonnull)refreshSuspendTimeButtonVisibility{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        BOOL visible = self.showsSuspendTimeButton();
        self.suspendTimeBtn.byHidden(!visible);
        if (visible) {
            JobsTimerMgr.shared().byResume(JobsOCDemoSuspendTimeTimerIdentifier);
        }else{
            JobsTimerMgr.shared().byPause(JobsOCDemoSuspendTimeTimerIdentifier);
        }
    };
}

-(jobsByVoidBlock _Nonnull)setupSuspendTimers{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.jobsSetSuspendSpinSeconds(0);
        @jobs_weakify(self)
        JobsTimerMgr.shared()
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
                self.refreshSuspendTimeButtonTitle();
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
                self.jobsSetSuspendSpinSeconds(self.suspendSpinSeconds + 1);
                self.suspendSpinBtn
                    .jobsResetBtnTitle([NSString stringWithFormat:@"%ld",(long)self.suspendSpinSeconds])
                    .jobsResetBtnTitleFont(UIFontWeightBoldSize(22));
            });
    };
}

-(jobsByVoidBlock _Nonnull)refreshSuspendTimeButtonTitle{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSString *clock = self.currentTimeStringBy(@"HH:mm:ss");
        if (@available(iOS 16.0, *)) {
            _suspendTimeBtn
                .jobsResetBtnTitle(@"当前时间".jobsTr())
                .jobsResetBtnTitleFont(UIFontWeightBoldSize(18))
                .jobsResetBtnSubTitle(clock)
                .jobsResetBtnSubTitleFont(UIFontWeightRegularSize(13));
        }else{
            _suspendTimeBtn.jobsResetBtnNormalAttributedTitle(self.suspendTimeAttributedTitleByClock(clock));
        }
    };
}

-(JobsRetAttributedStringByStrBlock _Nonnull)suspendTimeAttributedTitleByClock{
    @jobs_weakify(self)
    return ^NSAttributedString *(NSString * clock){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *title = @"当前时间".jobsTr();
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
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_1.class, @selector(jobsScrollViewWillBeginDragging)))(self, @selector(jobsScrollViewWillBeginDragging));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewWillBeginDragging{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        if (scrollView != _tableView) return;
        self.showFunctionMenu(NO);
    };
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_1.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
    return action ? action(tableView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUITableViewBlock _Nonnull)jobsNumberOfSectionsInTableView{
    @jobs_weakify(self)
    return ^NSInteger(UITableView * tableView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        if (tableView == _demoSideMenuTableView) return 1;
        if (tableView == _functionMenuTableView) return 1;
        if ([self demoSearchLandingActive]()) return 1;
        return [self hasPinnedDemoSection]() ? 2 : 1;
    };
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _demoSideMenuTableView) return JobsWidth(64);
    if (tableView == _functionMenuTableView) return 44;
    if ([self demoSearchLandingActive]()) return JobsWidth(54);
    BOOL pinnedDemo = self.isPinnedDemoIndexPath(indexPath);
    BOOL expandedDemo = self.isDemoFoldIndexPath(indexPath) &&
                        [self.expandedDemoSectionIndexSet containsIndex:indexPath.row];
    if (pinnedDemo || expandedDemo) {
        CGFloat innerTableWidth = CGRectGetWidth(tableView.bounds) - 20;
        if (innerTableWidth <= 0) innerTableWidth = JobsMainScreen_WIDTH() - 20;
        JobsOCDemoSectionModel *sectionModel = pinnedDemo
            ? self.pinnedDemoSectionModel()
            : self.visibleDemoSectionArr()[indexPath.row];
        return [JobsOCRootFoldTableCell expandedHeightByItemCount:sectionModel.dataMutArr.count
                                               sectionDescription:sectionModel.sectionDescription
                                                  innerTableWidth:innerTableWidth];
    }
    if (!self.isDemoFoldIndexPath(indexPath)) return CGFLOAT_MIN;
    return JobsOCRootFoldTableCell.collapsedHeight();
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    if (tableView == _demoSideMenuTableView) return CGFLOAT_MIN;
    if (tableView == _functionMenuTableView) return CGFLOAT_MIN;
    if (tableView != _functionMenuTableView && [self demoSearchLandingActive]()) return JobsWidth(48);
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
    if ([self demoSearchLandingActive]()) {
        @jobs_weakify(self)
        return jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.byBgColor(JobsClearColor);
            jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                label
                    .byText(@"搜索历史".jobsTr())
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
                    .jobsResetBtnTitle(@"清空".jobsTr())
                    .jobsResetBtnTitleCor(JobsSecondaryLabelColor)
                    .jobsResetBtnTitleFont(UIFontWeightRegularSize(JobsWidth(13)))
                    .jobsResetBtnBgCor(JobsClearColor)
                    .onClickBy(^(UIButton *x) {
                        @jobs_strongify(self)
                        self.clearDemoSearchHistory();
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
        self.handleDemoSideMenuItemAtIndex(indexPath.row);
        return;
    }
    if (tableView == _functionMenuTableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        self.showFunctionMenu(NO);
        if (indexPath.row == JobsOCFunctionMenuItemSearch) {
            self.setSearchEnabled(YES);
        }else if (indexPath.row == JobsOCFunctionMenuItemDemoFold){
            self.setAllDemoSectionsExpanded(![self anyVisibleDemoSectionExpanded]());
        }else{
            self.pushDemoListSettingsVC();
        };return;
    }
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    if ([self demoSearchLandingActive]()) {
        if (indexPath.row < self.demoSearchHistoryMutArr.count) {
            [self applyDemoSearchKeyword:self.demoSearchHistoryMutArr[indexPath.row]
                             saveHistory:NO];
        };return;
    }
    if (self.isPinnedDemoIndexPath(indexPath)) return;
    if (self.demoSectionDragSnapshotView || tableView.editing) return;
    if (!self.isDemoFoldIndexPath(indexPath)) return;
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
    if (tableView == _demoSideMenuTableView) return self.demoSideMenuTitles().count;
    if (tableView == _functionMenuTableView) return self.functionMenuTitles().count;
    if ([self demoSearchLandingActive]()) return self.demoSearchHistoryMutArr.count;
    if ([self hasPinnedDemoSection]() && section == 0) return 1;
    return self.visibleDemoSectionArr().count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _demoSideMenuTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCDemoSideMenuCellReuseIdentifier
                                                                forIndexPath:indexPath];
        NSString *symbolName = indexPath.row < self.demoSideMenuSymbolNames().count ? self.demoSideMenuSymbolNames()[indexPath.row] : @"square.grid.2x2";
        return cell
            .byTextLabel(^(__kindof UILabel * _Nullable label) {
                label
                    .byText(self.demoSideMenuTitles()[indexPath.row])
                    .byTextCor(self.demoListPrimaryTextColor())
                    .byFont(UIFontWeightRegularSize(15));
            })
            .byCellImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView
                    .byImage([symbolName.sys_img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate])
                    .byTintColor(self.demoListSecondaryTextColor());
            })
            .byAccessoryType(UITableViewCellAccessoryNone)
            .byAccessoryView(jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView
                    .byImage([@"chevron.right".sys_img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate])
                    .byTintColor(self.demoListSecondaryTextColor())
                    .bySize(CGSizeMake(JobsWidth(14), JobsWidth(14)));
            }))
            .bySelectionStyle(UITableViewCellSelectionStyleDefault)
            .bySelectedBackgroundView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                view.byBgColor(self.demoListCellSelectedBackgroundColor());
            }))
            .byContentView(^(__kindof UIView * _Nullable contentView) {
                contentView.byBgColor(JobsClearColor);
            })
            .byBgColor(JobsClearColor);
    }
    if (tableView == _functionMenuTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCFunctionMenuCellReuseIdentifier
                                                                forIndexPath:indexPath];
        UIColor *backgroundColor = self.demoListFunctionMenuBackgroundColor();
        return cell
            .byTextLabel(^(__kindof UILabel * _Nullable label) {
                label.byText(self.functionMenuTitles()[indexPath.row])
                    .byFont(UIFontWeightMediumSize(15))
                    .byTextCor(self.demoListPrimaryTextColor());
            })
            .bySelectionStyle(UITableViewCellSelectionStyleDefault)
            .bySelectedBackgroundView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                view.byBgColor(self.demoListCellSelectedBackgroundColor());
            }))
            .byContentView(^(__kindof UIView * _Nullable contentView) {
                contentView.byBgColor(backgroundColor);
            })
            .byBgColor(backgroundColor);
    }
    if ([self demoSearchLandingActive]()) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCDemoSearchHistoryCellReuseIdentifier
                                                                forIndexPath:indexPath];
        UIColor *cellBackgroundColor = self.demoListCellBackgroundColor();
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
                    .byTextCor(self.demoListPrimaryTextColor());
            })
            .byCellImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView.byImage(@"时钟".img);
            })
            .byBgColor(cellBackgroundColor);
    }
    if (self.isPinnedDemoIndexPath(indexPath)) {
        JobsOCRootFoldTableCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCDemoPinnedCellReuseIdentifier];
        if (!cell) {
            cell = [[JobsOCRootFoldTableCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:JobsOCDemoPinnedCellReuseIdentifier];
        }
        @jobs_weakify(self)
        [cell configurePinnedWithSectionModel:self.pinnedDemoSectionModel()
                                  selectBlock:^(NSInteger itemIndex) {
            @jobs_strongify(self)
            if (itemIndex >= 0 && itemIndex < (NSInteger)self.pinnedDemoMutArr.count) {
                self.pushDemoViewModel(self.pinnedDemoMutArr[itemIndex]);
            }
        } unpinBlock:^(NSInteger itemIndex) {
            @jobs_strongify(self)
            self.unpinPinnedDemoAtIndex(itemIndex);
        }];
        return cell;
    }
    if (!self.isDemoFoldIndexPath(indexPath)) return UITableViewCell.new;
    JobsOCRootFoldTableCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCRootFoldTableCellReuseIdentifier];
    if (!cell) {
        cell = [[JobsOCRootFoldTableCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:JobsOCRootFoldTableCellReuseIdentifier];
    }
    cell
        .byShowsReorderControl(NO)
        .byShouldIndentWhileEditing(NO);
    JobsOCDemoSectionModel *sectionModel = self.visibleDemoSectionArr()[indexPath.row];
    @jobs_weakify(self)
    [cell configureWithSectionModel:sectionModel
                            expanded:[self.expandedDemoSectionIndexSet containsIndex:indexPath.row]
                         selectBlock:^(NSInteger itemIndex) {
        @jobs_strongify(self)
        if ([self demoSearchActive]()) self.saveDemoSearchHistoryByText(self.demoSearchKeyword);
        UIViewModel *viewModel = sectionModel.dataMutArr[itemIndex];
        self.pushDemoViewModel(viewModel);
    } pinBlock:^(NSInteger itemIndex) {
        @jobs_strongify(self)
        if (itemIndex >= 0 && itemIndex < (NSInteger)sectionModel.dataMutArr.count) {
            self.pinDemoViewModel(sectionModel.dataMutArr[itemIndex]);
        }
    }];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView
canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _functionMenuTableView) return NO;
    if ([self demoSearchLandingActive]()) return indexPath.row < self.demoSearchHistoryMutArr.count;
    return !self.demoSearchEnabled && self.canDragDemoSectionAtIndexPath(indexPath);
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
       editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView != _functionMenuTableView && [self demoSearchLandingActive]()) return UITableViewCellEditingStyleDelete;
    return UITableViewCellEditingStyleNone;
}

- (NSString *)tableView:(UITableView *)tableView
titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView != _functionMenuTableView && [self demoSearchLandingActive]()) return @"删除".jobsTr();
    return nil;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _functionMenuTableView ||
        editingStyle != UITableViewCellEditingStyleDelete ||
        ![self demoSearchLandingActive]()) return;
    self.deleteDemoSearchHistoryAtIndex(indexPath.row);
}

- (BOOL)tableView:(UITableView *)tableView
canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView != _functionMenuTableView &&
           !self.demoSearchEnabled &&
           self.canDragDemoSectionAtIndexPath(indexPath);
}

- (NSIndexPath *)tableView:(UITableView *)tableView
targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    if (tableView == _functionMenuTableView ||
        self.demoSearchEnabled ||
        !self.canDragDemoSectionAtIndexPath(sourceIndexPath) ||
        !self.canDragDemoSectionAtIndexPath(proposedDestinationIndexPath) ||
        proposedDestinationIndexPath.section != sourceIndexPath.section ||
        proposedDestinationIndexPath.row < 0 ||
        proposedDestinationIndexPath.row >= (NSInteger)self.visibleDemoSectionArr().count) {
        return sourceIndexPath;
    };return proposedDestinationIndexPath;
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath{
    if (tableView == _functionMenuTableView ||
        self.demoSearchEnabled ||
        !self.canDragDemoSectionAtIndexPath(sourceIndexPath) ||
        !self.canDragDemoSectionAtIndexPath(destinationIndexPath)) return;
    NSInteger sourceRow = sourceIndexPath.row;
    NSInteger destinationRow = destinationIndexPath.row;
    if (sourceRow == destinationRow) return;
    [self moveDemoSectionFromIndexPath:sourceIndexPath
                           toIndexPath:destinationIndexPath];
    self.saveDemoSectionOrder();
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
    self.jobsSetDemoSearchKeyword(self.normalizedDemoSearchTextBy(searchText));
    if ([self demoSearchActive]() && self.tableView.editing) {
        [self.tableView setEditing:NO
                          animated:YES];
    }
    if ([self demoSearchActive]()) {
        self.unfoldAllDemoSections();
    }else{
        self.foldDemoSectionsWithFirstUnfolded();
    }
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    ((((jobsByUISearchBarBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_1.class, @selector(searchBarSearchButtonClicked)))(self, @selector(searchBarSearchButtonClicked))))(searchBar);
}
-(jobsByUISearchBarBlock _Nonnull)searchBarSearchButtonClicked{
    @jobs_weakify(self)
    return ^(UISearchBar * searchBar){
        @jobs_strongify(self)
        if (!self) return;
        self.saveDemoSearchHistoryByText(searchBar.text);
        [searchBar resignFirstResponder];
    };
}

-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)demoSideMenuTitles{
    @jobs_weakify(self)
    return ^NSArray<NSString *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @[
            @"用户信息".jobsTr(),
            @"崩溃日志".jobsTr(),
            @"收藏".jobsTr(),
            @"设置".jobsTr(),
            @"关于".jobsTr()
        ];
    };
}

-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)demoSideMenuSymbolNames{
    @jobs_weakify(self)
    return ^NSArray<NSString *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @[
            @"person.text.rectangle",
            @"exclamationmark.triangle",
            @"star",
            @"gearshape",
            @"info.circle"
        ];
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)demoSideMenuWidth{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return MIN(JobsWidth(320), JobsMainScreen_WIDTH() * 0.50);
    };
}

-(JobsRetViewByVoidBlock _Nonnull)demoSideMenuMainView{
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        if (!self) return nil;
        UIView *mainView = AppDelegate.jobsCustomTabBarNavCtrl.view;
        if (!mainView.window) mainView = self.navigationController.view;
        return mainView ?: self.view;
    };
}

-(jobsByVoidBlock _Nonnull)prepareDemoSideMenuIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIView *mainView = self.demoSideMenuMainView();
        UIView *hostView = mainView.superview;
        if (!hostView) return;
        UIView *menuView = self.demoSideMenuView;
        menuView
            .byFrame(CGRectMake(0, 0, self.demoSideMenuWidth(), CGRectGetHeight(hostView.bounds)))
            .byAutoresizingMask(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin);
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
        menuTableView
            .byFrame(menuView.bounds)
            .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        if (!self.demoSideDrawer) {
            JobsSideDrawerConfiguration *configuration = JobsSideDrawerConfiguration.new
                .byDirection(JobsSideDrawerDirectionLeft)
                .byPresentedRatio(0.5)
                .byContentMode([NSUserDefaults.standardUserDefaults boolForKey:@"JobsOCDemoSideDrawerFixed"] ? JobsSideDrawerContentModeFixed : JobsSideDrawerContentModeFollowing);
            self.jobsSetDemoSideDrawer([[JobsSideDrawer alloc] initWithHostView:hostView drawerView:menuView contentView:mainView configuration:configuration]);
            @jobs_weakify(self)
            self.demoSideDrawer.stateChanged = ^(BOOL open) {
                @jobs_strongify(self)
                self.jobsSetDemoSideMenuOpen(open);
                self.userHeadBtn.bySelected(open);
            };
        }
    };
}

-(jobsByVoidBlock _Nonnull)toggleDemoSideMenu{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self showDemoSideMenu:!self.demoSideMenuOpen
                      animated:YES];
    };
}

-(void)showDemoSideMenu:(BOOL)show
               animated:(BOOL)animated{
    if (!show && !_demoSideMenuView) return;
    self.prepareDemoSideMenuIfNeeded();
    UIView *mainView = self.demoSideMenuMainView();
    if (!_demoSideMenuView.superview || !mainView.superview) return;
    self.demoSideDrawer.configuration.byContentMode([NSUserDefaults.standardUserDefaults boolForKey:@"JobsOCDemoSideDrawerFixed"] ? JobsSideDrawerContentModeFixed : JobsSideDrawerContentModeFollowing);
    if (show) {
        self.showFunctionMenu(NO);
        [self.demoSideMenuTableView reloadData];
        self.demoSideDrawer.openAnimated(animated);
    }else{
        self.demoSideDrawer.closeAnimated(animated);
    }
    self.jobsSetDemoSideMenuOpen(show);
    self.userHeadBtn.bySelected(show);
    if (show) {
        self.showFunctionMenu(NO);
        self.demoSideMenuDimButton.byHidden(NO);
        [self.demoSideMenuTableView reloadData];
    }
    void (^changes)(void) = ^{
        mainView.byTransform(show ? CGAffineTransformMakeTranslation(self.demoSideMenuWidth(), 0) : CGAffineTransformIdentity);
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

-(jobsByNSIntegerBlock _Nonnull)handleDemoSideMenuItemAtIndex{
    @jobs_weakify(self)
    return ^(NSInteger index){
        @jobs_strongify(self)
        if (!self) return;
        [self showDemoSideMenu:NO
                      animated:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.30 * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
            if (index == JobsOCDemoSideMenuItemUserInfo) {
                self.pushUserInfoDisplayVC();
            }else if (index == JobsOCDemoSideMenuItemCrashLog){
                self.pushCrashLogVC();
            }else if (index == JobsOCDemoSideMenuItemFavorites){
                toastBy(@"收藏".jobsTr());
            }else if (index == JobsOCDemoSideMenuItemSettings){
                self.pushDemoListSettingsVC();
            }else{
                toastBy(@"关于".jobsTr());
            }
        });
    };
}

-(jobsByVoidBlock _Nonnull)pushUserInfoDisplayVC{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsUserModel *userInfo = self.readUserInfoByUserName(JobsUserModel.class,用户信息);
        if (!userInfo) {
            userInfo = JobsUserModel.byData(@"UserData".readLocalFileWithName());
            if (userInfo) self.saveUserInfo(userInfo);
        }
        UIViewModel *viewModel = self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
            model.byTitle(@"用户信息展示(开发测试专用)".jobsTr())
                .bySubTitle(@"")
                .byCls(JobsShowObjInfoVC.class)
                .byRequestParams(userInfo);
        }));
        [self forceComingToPushVC:viewModel.cls.new
                    requestParams:viewModel];
    };
}

-(jobsByVoidBlock _Nonnull)pushCrashLogVC{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIViewModel *viewModel = self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
            model.byTitle(@"崩溃日志".jobsTr())
                .bySubTitle(@"")
                .byCls(JobsOCCrashLogVC.class);
        }));
        [self forceComingToPushVC:viewModel.cls.new
                    requestParams:viewModel];
    };
}
#pragma mark —— lazyLoad
-(UIButton *)suspendTimeBtn{
    if (!_suspendTimeBtn) {
        @jobs_weakify(self)
        _suspendTimeBtn = UIButton.jobsInit()
            .jobsResetBtnTitle(@"当前时间".jobsTr())
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(18))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(JobsSystemBlueColor)
            .jobsResetBtnCornerRadiusValue(10)
            .onClickBy(^(__unused UIButton *x) {
                toastBy(@"点击了悬浮按钮".jobsTr());
            })
            .onLongPressGestureBy(^(UIButton *x) {
                if (JobsOCDemoSuspendLongPressGesture(x).state != UIGestureRecognizerStateBegan) return;
                @jobs_strongify(self)
                self.showSuspendTimeButtonVisibilityAlert();
            })
            .byTitleLabel(^(__kindof UILabel * _Nullable label) {
                label.byNumberOfLines(2);
            })
            .byTitleAlignment(NSTextAlignmentCenter)
            .byButtonBlock(^(__kindof UIButton * _Nullable button) {
                button.layer.byMasksToBounds(YES);
                if (@available(iOS 16.0, *)) {
                    button.jobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable configuration) {
                        configuration.byTitleAlignment(UIButtonConfigurationTitleAlignmentCenter);
                    });
                }
                JobsOCDemoSuspendLongPressGesture(button).byMinimumPressDuration(0.8);
                button.panRcognize.byEnabled(YES);
            })
            .byAlpha(1)
            .byFrame(CGRectMake(0, 0, 110, 66))
            .addOn(self.view)
            .bySuspendOriginInSafeArea(CGPointMake(15, 120))
            .byHapticOnDock(YES);
        self.refreshSuspendTimeButtonTitle();
    };return _suspendTimeBtn;
}

-(UIButton *)suspendSpinBtn{
    if (!_suspendSpinBtn) {
        @jobs_weakify(self)
        _suspendSpinBtn = UIButton.jobsInit()
            .jobsResetBtnTitle(@"0")
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(22))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(JobsSystemOrangeColor)
            .jobsResetBtnCornerRadiusValue(25)
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                if (x.jobs_isSpinning()) {
                    x.bySpinPause();
                    JobsTimerMgr.shared().byPause(JobsOCDemoSuspendSpinTimerIdentifier);
                    toastBy(@"已暂停旋转 & 计时".jobsTr());
                }else{
                    x.bySpinStart();
                    JobsTimerMgr.shared().byResume(JobsOCDemoSuspendSpinTimerIdentifier);
                    toastBy(@"继续旋转 & 计时".jobsTr());
                }
                x.byFuseTapScale();
                NSObject.feedbackGenerator(x);
            })
            .onLongPressGestureBy(^(__unused UIButton *x) {
                toastBy(@"长按了悬浮按钮".jobsTr());
            })
            .byButtonBlock(^(__kindof UIButton * _Nullable button) {
                button.layer.byMasksToBounds(YES);
                JobsOCDemoSuspendLongPressGesture(button).byMinimumPressDuration(0.8);
                button.panRcognize.byEnabled(YES);
            })
            .byAlpha(1)
            .byFrame(CGRectMake(0, 0, 50, 50))
            .addOn(self.view)
            .bySuspendOriginInSafeArea(CGPointMake(CGRectGetWidth(self.view.bounds) - 60,
                                                   CGRectGetHeight(self.view.bounds) - 100))
            .byHapticOnDock(YES);
    };return _suspendSpinBtn;
}

-(UIButton *)suspendFuseBtn{
    if (!_suspendFuseBtn) {
        @jobs_weakify(self)
        _suspendFuseBtn = UIButton.jobsInit()
            .jobsResetBtnTitle(@"按".jobsTr())
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(16))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(JobsSystemPurpleColor)
            .jobsResetBtnCornerRadiusValue(25)
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                if (self.suspendFuseLongPressConsumed) return;
                x.byFusePlaySound(@"Sound.wav");
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
                        self.jobsSetSuspendFuseLongPressConsumed(YES);
                        JobsFuseOuterRingConfig *config = JobsFuseOuterRingConfig.config()
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
                        x.byFusePressStop(YES);
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.20 * NSEC_PER_SEC)),
                                       dispatch_get_main_queue(), ^{
                            self.jobsSetSuspendFuseLongPressConsumed(NO);
                        });
                    }
                        break;
                    /// 未匹配已知分支时执行兜底处理
                    default:
                        break;
                }
            })
            .byButtonBlock(^(__kindof UIButton * _Nullable button) {
                button.layer.byMasksToBounds(YES);
                if (@available(iOS 13.4, *)) button.byPointerInteractionEnabled(NO);
                JobsOCDemoSuspendLongPressGesture(button).byMinimumPressDuration(0.8);
                button.panRcognize.byEnabled(YES);
            })
            .byAccessibilityIdentifier(@"ViewController_1.suspendFuseBtn")
            .byAlpha(1)
            .byFrame(CGRectMake(0, 0, 50, 50))
            .addOn(self.view)
            .bySuspendOriginInSafeArea(CGPointMake(15,
                                                   CGRectGetHeight(self.view.bounds) - 100))
            .byHapticOnDock(YES);
    };return _suspendFuseBtn;
}

-(UIView *)demoSideMenuView{
    if (!_demoSideMenuView) {
        _demoSideMenuView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsSecondarySystemBackgroundColor);
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
                .byText(@"演武堂".jobsTr())
                .byTextCor(self.demoListPrimaryTextColor())
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
                .byText(self.demoProjectFolderName())
                .byTextCor(self.demoListSecondaryTextColor())
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
        UIColor *menuTintColor = self.demoListPrimaryTextColor();
        UIImage *menuImage = self.demoSideMenuImageByTintColor(menuTintColor);
        _userHeadBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnImage(menuImage)
                .selectedStateImageBy(menuImage)
                .highlightedStateImageBy(menuImage)
                .imageForStateBy(menuImage, UIControlStateSelected | UIControlStateHighlighted)
                .onClickBy(^(UIButton *x){
                    @jobs_strongify(self)
                    self.toggleDemoSideMenu();
                })
                .byAdjustsImageWhenHighlighted(NO)
                .byTintColor(menuTintColor)
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
                    self.toggleFunctionMenu();
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

-(JobsRetBOOLByVoidBlock _Nonnull)demoListDarkModeEnabled{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return JobsThemeCenter.shared.isDarkMode;
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
        self.refreshDemoNavigationTitle();
        self.applyDemoListNavigationInterfaceStyle();
        self.applyDemoListTabBarInterfaceStyle();
        self.refreshUserHeadButtonTheme();
        self.refreshFunctionMenuButtonTheme();
        self.refreshDemoSearchTheme();
        if (_functionMenuTableView) {
            _functionMenuTableView
                .bySeparatorColor(self.demoListSeparatorColor())
                .byBgColor(self.demoListFunctionMenuBackgroundColor());
            if (_functionMenuTableView.window && !_functionMenuTableView.hidden) {
                [_functionMenuTableView reloadData];
            }
        }
        if (_demoSideMenuView) {
            _demoSideMenuView.byBgColor(self.demoListFunctionMenuBackgroundColor());
            _demoSideMenuTableView.byBgColor(JobsClearColor);
            if (_demoSideMenuTableView.window && self.demoSideMenuOpen) {
                [_demoSideMenuTableView reloadData];
            }
        }
    };
}

-(JobsRetCorByVoidBlock _Nonnull)demoListPageBackgroundColor{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsSystemBackgroundColor;
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

-(JobsRetCorByVoidBlock _Nonnull)demoListSecondaryTextColor{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsSecondaryLabelColor;
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

-(JobsRetCorByVoidBlock _Nonnull)demoListFunctionMenuBackgroundColor{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsSecondarySystemBackgroundColor;
    };
}

-(JobsRetCorByVoidBlock _Nonnull)demoListCellSelectedBackgroundColor{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsTertiarySystemBackgroundColor;
    };
}

-(JobsRetCorByVoidBlock _Nonnull)demoListSeparatorColor{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsQuaternaryLabelColor;
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
            .byGKNavShadowColor(JobsClearColor)
            .byGKNavLineHidden(YES)
            .byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar * _Nullable navigationBar) {
                navigationBar
                    .byTintColor(self.demoListPrimaryTextColor())
                    .layer.byShadowOpacity(0);
            });
        self.navBar.byBgColor(self.demoListNavigationBackgroundColor());
        self.navBar.layer.byShadowOpacity(0);
        self.navBar.titleLab.byTextCor(self.demoListPrimaryTextColor());
        self.demoNavigationTitleLab.byTextCor(self.demoListPrimaryTextColor());
        self.demoNavigationProjectLab.byTextCor(self.demoListSecondaryTextColor());
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

-(jobsByVoidBlock _Nonnull)refreshUserHeadButtonTheme{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!_userHeadBtn) return;
        UIColor *menuTintColor = self.demoListPrimaryTextColor();
        UIImage *menuImage = self.demoSideMenuImageByTintColor(menuTintColor);
        _userHeadBtn
            .jobsResetBtnImage(menuImage)
            .selectedStateImageBy(menuImage)
            .highlightedStateImageBy(menuImage)
            .imageForStateBy(menuImage, UIControlStateSelected | UIControlStateHighlighted)
            .byTintColor(menuTintColor);
    };
}

-(jobsByVoidBlock _Nonnull)refreshFunctionMenuButtonTheme{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!_functionMenuBtn) return;
        UIColor *normalTintColor = self.demoListPrimaryTextColor();
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
    };
}

-(jobsByVoidBlock _Nonnull)refreshDemoSearchTheme{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIColor *selectedTintColor = HEXCOLOR(0x1D7FF2);
        if (_demoSearchBar) {
            _demoSearchBar
                .byBarTintColor(self.demoListPageBackgroundColor())
                .byTintColor(selectedTintColor)
                .byBgColor(JobsClearColor);
            if (@available(iOS 13.0, *)) {
                UITextField *searchTextField = _demoSearchBar.searchTextField;
                searchTextField
                    .byAttributedPlaceholder(JobsAttributedStringByAttributes(@"输入关键词搜索 Demo".jobsTr(), @{
                        NSForegroundColorAttributeName: self.demoListSecondaryTextColor(),
                        NSFontAttributeName: UIFontWeightRegularSize(15)
                    }))
                    .byFont(UIFontWeightRegularSize(15))
                    .byTextCor(self.demoListPrimaryTextColor())
                    .byTintColor(selectedTintColor)
                    .byBgColor(JobsSecondarySystemBackgroundColor)
                    .byCornerRadius(18)
                    .byClipsToBounds(YES)
                    .byLayer(^(__kindof CALayer * _Nullable layer) {
                        layer
                            .byBorderWidth(1)
                            .byBorderColorUIColor(self.demoListSeparatorColor());
                    });
                searchTextField.leftView.byTintColor(self.demoListSecondaryTextColor());
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
    };
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
                .byBgColor(self.demoListFunctionMenuBackgroundColor())
                .byCornerRadius(8)
                .byClipsToBounds(YES)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.navBar.mas_bottom).offset(6);
                    make.right.equalTo(self.view).offset(-12);
                    make.width.mas_equalTo(self.functionMenuTableWidth());
                    make.height.mas_equalTo(self.functionMenuTableHeight());
                });
            tableView.layer.byShadowOpacity(0);
        });
    };return _functionMenuTableView;
}

-(UITapGestureRecognizer *)functionMenuDismissTapGesture{
    if (!_functionMenuDismissTapGesture) {
        @jobs_weakify(self)
        _functionMenuDismissTapGesture = (jobsMakeTapGesture(^(UITapGestureRecognizer * _Nullable gesture) {
            gesture.byCancelsTouchesInView(NO);
        })).GestureActionBy(^(__kindof UIGestureRecognizer * _Nullable gesture) {
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
            self.showFunctionMenu(NO);
        });
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
        self.refreshDemoSearchTheme();
    };return _demoSearchHeaderView;
}

-(UISearchBar *)demoSearchBar{
    if (!_demoSearchBar) {
        _demoSearchBar = jobsMakeUISearchBar(^(__kindof UISearchBar *_Nullable searchBar) {
            searchBar
                .byPlaceholder(@"输入关键词搜索 Demo".jobsTr())
                .byDelegate(self)
                .byShowsCancelButton(NO)
                .bySearchBarStyle(UISearchBarStyleMinimal)
                .byTranslucent(YES)
                .byBackgroundImage(jobsMakeImage(^(UIImage *object){}))
                .byBarTintColor(self.demoListPageBackgroundColor())
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
                .jobsResetBtnTitle(@"取消".jobsTr())
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
                    weak_self.setSearchEnabled(NO);
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
                .byTableFooterView(self.demoListTableFooterView())/// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .byFoldable(NO)
                .emptyDataByButtonModel(self.demoListEmptyDataButtonModel())
                /// 普通的MJRefreshHeader（触发事件）@二选一
                .byMJRefreshHeader([MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshHeaderConfigModel(self.jobsMjHeaderDefaultConfig()))
                /// MJRefreshHeader的拓展：下拉刷新Lottie动画@二选一
                //.byMJRefreshHeader(self.lotAnimMJRefreshHeader.byRefreshConfigModel(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable model) {})))
                /// 普通的MJRefreshFooter（触发事件）
                .byMJRefreshFooter([MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshFooterConfigModel(self.jobsMjFooterDefaultConfig()))
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
        self.applySavedPinnedDemosIfNeeded();
    };return _pinnedDemoMutArr;
}

-(NSMutableArray<NSString *> *)demoSearchHistoryMutArr{
    if (!_demoSearchHistoryMutArr) {
        _demoSearchHistoryMutArr = NSMutableArray.array;
        NSArray *historyArr = [NSUserDefaults.standardUserDefaults arrayForKey:JobsOCDemoSearchHistoryUserDefaultsKey];
        if ([historyArr isKindOfClass:NSArray.class]) {
            for (id obj in historyArr) {
                NSString *text = self.normalizedDemoSearchTextBy([obj isKindOfClass:NSString.class] ? obj : @"");
                if (text.length) [_demoSearchHistoryMutArr addObject:text];
            }
        }
    };return _demoSearchHistoryMutArr;
}

-(UILongPressGestureRecognizer *)demoSectionReorderLongPressGesture{
    if (!_demoSectionReorderLongPressGesture) {
        _demoSectionReorderLongPressGesture = [UILongPressGestureRecognizer.alloc initWithTarget:self
                                                                                          action:@selector(handleDemoSectionReorderLongPress:)]
            .byMinimumPressDuration(0.45)
            .byCancelsTouchesInView(NO);
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

-(JobsRetNSArrayJobsOCDemoSectionModelByVoidBlock _Nonnull)visibleDemoSectionArr{
    @jobs_weakify(self)
    return ^NSArray <JobsOCDemoSectionModel *>*{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *keyword = (self.demoSearchKeyword ?: @"").byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
        if (!keyword.length) return self.demoSectionArrByFilteringPinnedFromSectionArr(self.demoSectionMutArr);
        NSMutableArray <JobsOCDemoSectionModel *>*result = NSMutableArray.array;
        for (JobsOCDemoSectionModel *sectionModel in self.demoSectionMutArr) {
            JobsOCDemoSectionModel *filteredSectionModel = JobsOCDemoSectionModel.sectionWithTitle(sectionModel.title);
            filteredSectionModel.bySectionDescription(sectionModel.sectionDescription);
            for (UIViewModel *viewModel in sectionModel.dataMutArr) {
                if ([self viewModel:viewModel containsKeyword:keyword]) {
                    [filteredSectionModel.dataMutArr addObject:viewModel];
                }
            }
            if (filteredSectionModel.dataMutArr.count) {
                [result addObject:filteredSectionModel];
            }
        };return result;
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)hasPinnedDemoSection{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.pinnedDemoMutArr.count > 0 &&
               ![self demoSearchLandingActive]() &&
               ![self demoSearchActive]();
    };
}

-(JobsRetNSIntegerByVoidBlock _Nonnull)demoFoldTableSection{
    @jobs_weakify(self)
    return ^NSInteger{
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return [self hasPinnedDemoSection]() ? 1 : 0;
    };
}

-(JobsRetBOOLByNSIndexPathBlock _Nonnull)isPinnedDemoIndexPath{
    @jobs_weakify(self)
    return ^BOOL(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return indexPath &&
               [self hasPinnedDemoSection]() &&
               indexPath.section == 0 &&
               indexPath.row == 0;
    };
}

-(JobsRetBOOLByNSIndexPathBlock _Nonnull)isDemoFoldIndexPath{
    @jobs_weakify(self)
    return ^BOOL(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSArray <JobsOCDemoSectionModel *>*visibleSectionArr = self.visibleDemoSectionArr();
        return indexPath &&
               indexPath.section == self.demoFoldTableSection() &&
               indexPath.row >= 0 &&
               indexPath.row < (NSInteger)visibleSectionArr.count;
    };
}

-(JobsRetNSArrayJobsOCDemoSectionModelByNSArrayJobsOCDemoSectionModelBlock _Nonnull)demoSectionArrByFilteringPinnedFromSectionArr{
    @jobs_weakify(self)
    return ^NSArray <JobsOCDemoSectionModel *>*(NSArray<JobsOCDemoSectionModel *> * sectionArr){
        @jobs_strongify(self)
        if (!self) return nil;
        if (!self.pinnedDemoMutArr.count) return sectionArr;
        NSMutableArray <JobsOCDemoSectionModel *>*result = NSMutableArray.array;
        for (JobsOCDemoSectionModel *sectionModel in sectionArr) {
            JobsOCDemoSectionModel *filteredSectionModel = JobsOCDemoSectionModel.sectionWithTitle(sectionModel.title);
            filteredSectionModel.bySectionDescription(sectionModel.sectionDescription);
            for (UIViewModel *viewModel in sectionModel.dataMutArr) {
                if (!self.isPinnedDemoViewModel(viewModel)) {
                    [filteredSectionModel.dataMutArr addObject:viewModel];
                }
            }
            if (filteredSectionModel.dataMutArr.count) {
                [result addObject:filteredSectionModel];
            }
        };return result;
    };
}

-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoTitleByViewModel{
    @jobs_weakify(self)
    return ^NSString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        return viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text ?: @"";
    };
}

-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoSubTextByViewModel{
    @jobs_weakify(self)
    return ^NSString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *subText = viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text ?: @"";
        if (subText.length) return subText;
        return viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
    };
}

-(JobsRetNSAttributedStringByUIViewModelBlock _Nonnull)demoSubAttributedTextByViewModel{
    @jobs_weakify(self)
    return ^NSAttributedString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        return viewModel.subTextModel.attributedTitle;
    };
}

-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoKeyByViewModel{
    @jobs_weakify(self)
    return ^NSString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        if (!viewModel) return @"";
        NSString *title = self.demoTitleByViewModel(viewModel);
        NSString *subTitle = self.demoSubTextByViewModel(viewModel);
        NSString *clsName = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
        return [NSString stringWithFormat:@"%@|%@|%@",title,subTitle,clsName];
    };
}

-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoPersistentKeyByViewModel{
    @jobs_weakify(self)
    return ^NSString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        if (!viewModel) return @"";
        NSString *clsName = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
        if (clsName.length) return [NSString stringWithFormat:@"cls:%@",clsName];
        NSString *demoKey = self.demoKeyByViewModel(viewModel);
        return demoKey.length ? [NSString stringWithFormat:@"demo:%@",demoKey] : @"";
    };
}

-(JobsRetBOOLByUIViewModelBlock _Nonnull)isPinnedDemoViewModel{
    @jobs_weakify(self)
    return ^BOOL(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSString *key = self.demoPersistentKeyByViewModel(viewModel);
        if (!key.length) return NO;
        for (UIViewModel *pinnedViewModel in self.pinnedDemoMutArr) {
            if ([self.demoPersistentKeyByViewModel(pinnedViewModel) isEqualToString:key]) return YES;
        };return NO;
    };
}

-(JobsRetJobsOCDemoSectionModelByVoidBlock _Nonnull)pinnedDemoSectionModel{
    @jobs_weakify(self)
    return ^JobsOCDemoSectionModel *{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsOCDemoSectionModel *sectionModel = JobsOCDemoSectionModel.sectionWithTitle(@"置顶".jobsTr());
        [sectionModel.dataMutArr addObjectsFromArray:self.pinnedDemoMutArr];
        return sectionModel;
    };
}

-(jobsByViewModelBlock _Nonnull)pinDemoViewModel{
    @jobs_weakify(self)
    return ^(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return;
        if (!viewModel || self.isPinnedDemoViewModel(viewModel)) return;
        [self.pinnedDemoMutArr addObject:viewModel];
        self.savePinnedDemos();
        [self.tableView reloadData];
        [self.tableView layoutIfNeeded];
        [self.tableView setContentOffset:CGPointMake(0, -self.tableView.contentInset.top)
                                animated:YES];
    };
}

-(jobsByNSIntegerBlock _Nonnull)unpinPinnedDemoAtIndex{
    @jobs_weakify(self)
    return ^(NSInteger index){
        @jobs_strongify(self)
        if (!self) return;
        if (index < 0 || index >= (NSInteger)self.pinnedDemoMutArr.count) return;
        UIViewModel *viewModel = self.pinnedDemoMutArr[index];
        [self.pinnedDemoMutArr removeObjectAtIndex:index];
        self.savePinnedDemos();
        NSString *key = self.demoPersistentKeyByViewModel(viewModel);
        NSArray <JobsOCDemoSectionModel *>*visibleSectionArr = self.visibleDemoSectionArr();
        [visibleSectionArr enumerateObjectsUsingBlock:^(JobsOCDemoSectionModel * _Nonnull sectionModel,
                                                        NSUInteger idx,
                                                        BOOL * _Nonnull stop) {
            for (UIViewModel *itemViewModel in sectionModel.dataMutArr) {
                if ([self.demoPersistentKeyByViewModel(itemViewModel) isEqualToString:key]) {
                    [self.expandedDemoSectionIndexSet addIndex:idx];
                    *stop = YES;
                    break;
                }
            }
        }];
        [self.tableView reloadData];
    };
}

-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)savedPinnedDemoKeyArr{
    @jobs_weakify(self)
    return ^NSArray <NSString *>*{
        @jobs_strongify(self)
        if (!self) return nil;
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
    };
}

-(jobsByVoidBlock _Nonnull)applySavedPinnedDemosIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSArray <NSString *>*savedKeyArr = self.savedPinnedDemoKeyArr();
        if (!savedKeyArr.count) return;
        for (NSString *key in savedKeyArr) {
            for (UIViewModel *viewModel in self.dataMutArr) {
                NSString *viewModelKey = self.demoPersistentKeyByViewModel(viewModel);
                if (viewModelKey.length &&
                    [viewModelKey isEqualToString:key] &&
                    ![_pinnedDemoMutArr containsObject:viewModel]) {
                    [_pinnedDemoMutArr addObject:viewModel];
                    break;
                }
            }
        }
        if (_pinnedDemoMutArr.count != savedKeyArr.count) self.savePinnedDemos();
    };
}

-(jobsByVoidBlock _Nonnull)savePinnedDemos{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSMutableArray <NSString *>*keyMutArr = NSMutableArray.array;
        for (UIViewModel *viewModel in self.pinnedDemoMutArr) {
            NSString *key = self.demoPersistentKeyByViewModel(viewModel);
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
    };
}

-(jobsByViewModelBlock _Nonnull)pushDemoViewModel{
    @jobs_weakify(self)
    return ^(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return;
        if (self.jobs_isCountryCodeDemoViewModel(viewModel)) {
            self.jobs_pushCountryCodeCtrlWithViewModel(viewModel);
            return;
        }
        if (viewModel.cls) {
            self.comingToPushVCByRequestParams(viewModel.cls.new,
                                               viewModel);
        }else @"尚未接入此功能".jobsTr().toast();
    };
}

-(JobsRetNSUIntegerByNSStringBlock _Nonnull)demoSectionIndexByTitle{
    @jobs_weakify(self)
    return ^NSUInteger(NSString * title){
        @jobs_strongify(self)
        if (!self) return (NSUInteger){0};
        if (!title.length) return NSNotFound;
        return [self.demoSectionMutArr indexOfObjectPassingTest:^BOOL(JobsOCDemoSectionModel * _Nonnull sectionModel,
                                                                      NSUInteger idx,
                                                                      BOOL * _Nonnull stop) {
            return [sectionModel.title isEqualToString:title];
        }];
    };
}

-(BOOL)isDemoFoldInnerRowPoint:(CGPoint)point
                     indexPath:(NSIndexPath *)indexPath{
    if (!self.isDemoFoldIndexPath(indexPath)) return NO;
    CGRect rowRect = [self.tableView rectForRowAtIndexPath:indexPath];
    CGFloat pointYInCell = point.y - CGRectGetMinY(rowRect);
    return pointYInCell >= JobsOCRootFoldTableCell.collapsedHeight() &&
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

-(JobsRetNSStringByUIViewModelBlock _Nonnull)sectionTitleForViewModel{
    @jobs_weakify(self)
    return ^NSString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *title = viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text ?: @"";
        NSString *subTitle = viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text ?: @"";
        NSString *clsName = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
        NSString *key = [NSString stringWithFormat:@"%@ %@ %@",title,subTitle,clsName];
        if (viewModel.cls == CXBVC.class ||
            viewModel.cls == RandomTestVC.class) {
            return @"其他".jobsTr();
        }
        if (viewModel.cls == JobsLongPressLikeDemoVC.class ||
            viewModel.cls == JobsOCNumberStepperDemoVC.class) {
            return @"UI 控件与动效".jobsTr();
        }
        if (@"JobsIconfont".inStr(key) ||
            @"阿里巴巴矢量图标库".inStr(key)) {
            return @"阿里巴巴矢量图标库".jobsTr();
        }
        if (viewModel.cls == PointLabTestVC.class) {
            return @"Label".jobsTr();
        }
        if (@"Label".inStr(key)) {
            return @"Label".jobsTr();
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
            return @"Timer".jobsTr();
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
            return @"数据、网络与文本".jobsTr();
        }
        if (@"直播间".inStr(key) ||
            @"直播推流".inStr(key) ||
            @"LiveComment".inStr(key) ||
            @"LiveStream".inStr(key) ||
            @"ZFPlayer".inStr(key) ||
            @"Douyin".inStr(key) ||
            @"长按录制视频".inStr(key) ||
            @"VideoRecorder".inStr(key)) {
            return @"直播项目相关".jobsTr();
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
            return @"系统能力与多媒体".jobsTr();
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
            return @"炫技特效".jobsTr();
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
            return @"UI 控件与动效".jobsTr();
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
            return @"业务模块与页面".jobsTr();
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
            return @"基础功能与导航容器".jobsTr();
        };return @"业务模块与页面".jobsTr();
    };
}

-(JobsRetStrByStrBlock _Nonnull)sectionDescriptionForTitle{
    @jobs_weakify(self)
    return ^NSString *(NSString * title){
        @jobs_strongify(self)
        if (!self) return nil;
        if ([title isEqualToString:@"Timer".jobsTr()]) {
            return @"Timer 相关能力把系统 Timer / GCD / DisplayLink / RunLoop 的杂乱细节收口成少量参数。\n\n正计时和倒计时按钮已收口到“正计时/倒计时”入口：先进入列表，再分别点击正计时 DemoVC 和倒计时按钮 DemoVC。\n\nJobsOCTimerMgr 是多个 Timer 的统一注册表，按 identifier 管理 start / pause / resume / stop。\n\nJobsMarqueeView 用 JobsOCTimerMgr 做统一内核，把跑马灯和轮播图收口成同一个 UIScrollView + UIButton 数据源组件。";
        }else if ([title isEqualToString:@"阿里巴巴矢量图标库".jobsTr()]){
            return @"JobsIconfont 把远程图片、占位与错误兜底、复用取消、缓存、Icon Font、Unicode 转图和阿里妈妈文字字体统一封装。业务层只面对资源 ID 与语义枚举，不直接维护 iconfont 地址、字体名和 Unicode。";
        }else if ([title isEqualToString:@"直播项目相关".jobsTr()]){
            return @"直播间滚动留言保持应用层封装，直播推流用 AVFoundation 完成采集预览并预留 RTMP SDK 接入点。";
        }else if ([title isEqualToString:@"炫技特效".jobsTr()]){
            return @"打马赛克拆成图片处理与手势涂抹组件，球形标签云复用现有 XLSphereView。";
        };return nil;
    };
}

-(JobsOCDemoSectionModel *)sectionModelInArr:(NSMutableArray <JobsOCDemoSectionModel *>*)data
                                       title:(NSString *)title{
    for (JobsOCDemoSectionModel *sectionModel in data) {
        if ([sectionModel.title isEqualToString:title]) return sectionModel;
    }
    JobsOCDemoSectionModel *sectionModel = JobsOCDemoSectionModel.sectionWithTitle(title);
    sectionModel.bySectionDescription(self.sectionDescriptionForTitle(title));
    [data addObject:sectionModel];
    return sectionModel;
}

-(void)handleDemoSectionReorderLongPress:(UILongPressGestureRecognizer *)gesture{
    jobsByLongPressGestureRecognizerBlock action = ((jobsByLongPressGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_1.class, @selector(jobsHandleDemoSectionReorderLongPress)))(self, @selector(jobsHandleDemoSectionReorderLongPress));
    if (action) action(gesture);
}

-(jobsByLongPressGestureRecognizerBlock _Nonnull)jobsHandleDemoSectionReorderLongPress{
    @jobs_weakify(self)
    return ^(UILongPressGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        if (gesture.view != _tableView) return;
        if (self.demoSearchEnabled) {
            if (self.tableView.editing) [self.tableView setEditing:NO
                                                          animated:YES];
            @"搜索状态下不可排序".jobsTr().toast();
            return;
        }
        CGPoint point = [gesture locationInView:self.tableView];
        switch (gesture.state) {
            /// 处理 UIGestureRecognizerStateBegan 分支
            case UIGestureRecognizerStateBegan:{
                NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:point];
                if (self.isPinnedDemoIndexPath(indexPath)) return;
                if ([self isDemoFoldInnerRowPoint:point
                                        indexPath:indexPath]) return;
                if (!self.canDragDemoSectionAtIndexPath(indexPath)) return;
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
                UIView *snapshotView = [cell snapshotViewAfterScreenUpdates:NO];
                snapshotView.byFrame(cell.frame);
                snapshotView.layer
                    .byShadowColor(JobsBlackColor.CGColor)
                    .byShadowOpacity(.18f)
                    .byShadowRadius(JobsWidth(10))
                    .byShadowOffset(CGSizeMake(0, JobsWidth(6)));
                snapshotView.addOn(self.tableView);
                self.jobsSetDemoSectionDragSnapshotView(snapshotView);
                self.jobsSetDemoSectionDragIndexPath(indexPath);
                self.jobsSetDemoSectionDragTouchOffsetY(point.y - CGRectGetMidY(cell.frame));
                cell.byHidden(YES);
                NSObject.feedbackGenerator(nil);
                break;
            }
            /// 处理 UIGestureRecognizerStateChanged 分支
            case UIGestureRecognizerStateChanged:{
                if (!self.demoSectionDragSnapshotView || !self.demoSectionDragIndexPath) return;
                CGPoint center = self.demoSectionDragSnapshotView.center;
                center.y = point.y - self.demoSectionDragTouchOffsetY;
                self.demoSectionDragSnapshotView.byCenter(center.x, center.y);
                NSIndexPath *destinationIndexPath = [self.tableView indexPathForRowAtPoint:center];
                if (!self.canDragDemoSectionAtIndexPath(destinationIndexPath) ||
                    [destinationIndexPath isEqual:self.demoSectionDragIndexPath]) return;
                [self moveDemoSectionFromIndexPath:self.demoSectionDragIndexPath
                                       toIndexPath:destinationIndexPath];
                [self.tableView beginUpdates];
                [self.tableView moveRowAtIndexPath:self.demoSectionDragIndexPath
                                       toIndexPath:destinationIndexPath];
                [self.tableView endUpdates];
                self.jobsSetDemoSectionDragIndexPath(destinationIndexPath);
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
                self.finishDemoSectionDrag();
                break;
            }
            /// 未匹配已知分支时执行兜底处理
            default:
                break;
        }
    };
}

-(JobsRetBOOLByNSIndexPathBlock _Nonnull)canDragDemoSectionAtIndexPath{
    @jobs_weakify(self)
    return ^BOOL(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSArray <JobsOCDemoSectionModel *>*visibleSectionArr = self.visibleDemoSectionArr();
        if (!indexPath ||
            indexPath.section != self.demoFoldTableSection() ||
            indexPath.row < 0 ||
            indexPath.row >= (NSInteger)visibleSectionArr.count ||
            visibleSectionArr.count <= 1) return NO;
        return ![visibleSectionArr[indexPath.row].title isEqualToString:@"其他".jobsTr()];
    };
}

-(void)moveDemoSectionFromIndexPath:(NSIndexPath *)sourceIndexPath
                        toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSInteger sourceRow = sourceIndexPath.row;
    NSInteger destinationRow = destinationIndexPath.row;
    if (sourceRow == destinationRow ||
        sourceRow < 0 ||
        destinationRow < 0 ||
        sourceRow >= (NSInteger)self.visibleDemoSectionArr().count ||
        destinationRow >= (NSInteger)self.visibleDemoSectionArr().count) return;
    JobsOCDemoSectionModel *sourceVisibleSectionModel = self.visibleDemoSectionArr()[sourceRow];
    JobsOCDemoSectionModel *destinationVisibleSectionModel = self.visibleDemoSectionArr()[destinationRow];
    NSUInteger sourceIndex = self.demoSectionIndexByTitle(sourceVisibleSectionModel.title);
    NSUInteger destinationIndex = self.demoSectionIndexByTitle(destinationVisibleSectionModel.title);
    if (sourceIndex == NSNotFound ||
        destinationIndex == NSNotFound ||
        sourceIndex >= self.demoSectionMutArr.count ||
        destinationIndex > self.demoSectionMutArr.count) return;
    JobsOCDemoSectionModel *sectionModel = self.demoSectionMutArr[sourceIndex];
    [self.demoSectionMutArr removeObjectAtIndex:sourceIndex];
    [self.demoSectionMutArr insertObject:sectionModel
                                 atIndex:MIN(destinationIndex, self.demoSectionMutArr.count)];
    self.moveOtherDemoSectionToEndInArr(self.demoSectionMutArr);
    [self moveExpandedDemoSectionStateFromRow:(NSUInteger)sourceRow
                                        toRow:(NSUInteger)destinationRow];
}

-(jobsByVoidBlock _Nonnull)finishDemoSectionDrag{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.demoSectionDragSnapshotView) return;
        NSIndexPath *indexPath = self.demoSectionDragIndexPath;
        UITableViewCell *cell = indexPath ? [self.tableView cellForRowAtIndexPath:indexPath] : nil;
        void (^clearState)(void) = ^{
            cell.byHidden(NO);
            [self.demoSectionDragSnapshotView removeFromSuperview];
            self.jobsSetDemoSectionDragSnapshotView(nil);
            self.jobsSetDemoSectionDragIndexPath(nil);
            self.jobsSetDemoSectionDragTouchOffsetY(0);
            self.saveDemoSectionOrder();
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
    };
}

-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)savedDemoSectionOrderArr{
    @jobs_weakify(self)
    return ^NSArray<NSString *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        NSArray *orderArr = [NSUserDefaults.standardUserDefaults arrayForKey:JobsOCDemoListSectionOrderUserDefaultsKey];
        if (![orderArr isKindOfClass:NSArray.class]) return @[];
        NSMutableArray <NSString *>*result = NSMutableArray.array;
        for (id obj in orderArr) {
            if ([obj isKindOfClass:NSString.class] && ((NSString *)obj).length) {
                [result addObject:obj];
            }
        };return result.copy;
    };
}

-(jobsByVoidBlock _Nonnull)applySavedDemoSectionOrderIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSArray <NSString *>*orderArr = self.savedDemoSectionOrderArr();
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
        self.moveOtherDemoSectionToEndInArr(_demoSectionMutArr);
    };
}

-(jobsByVoidBlock _Nonnull)saveDemoSectionOrder{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.moveOtherDemoSectionToEndInArr(self.demoSectionMutArr);
        NSMutableArray <NSString *>*orderMutArr = NSMutableArray.array;
        for (JobsOCDemoSectionModel *sectionModel in self.demoSectionMutArr) {
            if (sectionModel.title.length) [orderMutArr addObject:sectionModel.title];
        }
        [NSUserDefaults.standardUserDefaults setObject:orderMutArr.copy
                                               forKey:JobsOCDemoListSectionOrderUserDefaultsKey];
        [NSUserDefaults.standardUserDefaults synchronize];
    };
}

-(jobsByNSMutableArrayJobsOCDemoSectionModelBlock _Nonnull)moveOtherDemoSectionToEndInArr{
    @jobs_weakify(self)
    return ^(NSMutableArray <JobsOCDemoSectionModel *>* sectionMutArr){
        @jobs_strongify(self)
        if (!self) return;
        if (sectionMutArr.count < 2) return;
        NSString *otherTitle = @"其他".jobsTr();
        NSUInteger otherIndex = [sectionMutArr indexOfObjectPassingTest:^BOOL(JobsOCDemoSectionModel * _Nonnull sectionModel,
                                                                              __unused NSUInteger idx,
                                                                              __unused BOOL * _Nonnull stop) {
            return [sectionModel.title isEqualToString:otherTitle];
        }];
        if (otherIndex == NSNotFound || otherIndex == sectionMutArr.count - 1) return;
        JobsOCDemoSectionModel *otherSectionModel = sectionMutArr[otherIndex];
        [sectionMutArr removeObjectAtIndex:otherIndex];
        [sectionMutArr addObject:otherSectionModel];
    };
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

-(JobsRetNSArrayNSStringByVoidBlock _Nonnull)functionMenuTitles{
    @jobs_weakify(self)
    return ^NSArray <NSString *>*{
        @jobs_strongify(self)
        if (!self) return nil;
        return @[
            @"搜索 Demo".jobsTr(),
            self.demoFoldSwitchTitle(),
            @"设置".jobsTr()
        ];
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoFoldSwitchTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [self anyVisibleDemoSectionExpanded]() ? @"全部收缩".jobsTr() : @"全部展开".jobsTr();
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)functionMenuTableWidth{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return 210;
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)functionMenuTableHeight{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return 44 * self.functionMenuTitles().count;
    };
}

-(JobsRetImageByCorBlock _Nonnull)demoSideMenuImageByTintColor{
    @jobs_weakify(self)
    return ^UIImage *(UIColor * tintColor){
        @jobs_strongify(self)
        if (!self) return nil;
        UIImage *image = @"list.bullet".sys_img ?: @"首页_头像".img;
        if (@available(iOS 13.0, *)) {
            return [image imageWithTintColor:tintColor
                               renderingMode:UIImageRenderingModeAlwaysOriginal];
        };return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    };
}

-(UIImage *)functionMenuImageBySymbolName:(NSString *)symbolName
                                tintColor:(UIColor *)tintColor{
    UIImage *image = symbolName.sys_img;
    if (@available(iOS 13.0, *)) {
        return [image imageWithTintColor:tintColor
                           renderingMode:UIImageRenderingModeAlwaysOriginal];
    };return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

-(jobsByVoidBlock _Nonnull)toggleFunctionMenu{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.showFunctionMenu(self.functionMenuTableView.hidden);
    };
}

-(jobsByBOOLBlock _Nonnull)showFunctionMenu{
    @jobs_weakify(self)
    return ^(BOOL show){
        @jobs_strongify(self)
        if (!self) return;
        self.functionMenuBtn.bySelected(show);
        self.functionMenuTableView.byHidden(!show);
        if (show) {
            [self.functionMenuTableView reloadData];
            [self.functionMenuTableView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(self.functionMenuTableWidth());
                make.height.mas_equalTo(self.functionMenuTableHeight());
            }];
            [self.view bringSubviewToFront:self.functionMenuTableView];
        }
    };
}

-(jobsByVoidBlock _Nonnull)pushDemoListSettingsVC{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsOCDemoListSettingsVC *settingsVC = JobsOCDemoListSettingsVC.new
            .byTitle(@"设置".jobsTr());
        self.comingToPushVCByRequestParams(settingsVC, nil);
    };
}

-(jobsByBOOLBlock _Nonnull)setSearchEnabled{
    @jobs_weakify(self)
    return ^(BOOL enabled){
        @jobs_strongify(self)
        if (!self) return;
        if (enabled && self.tableView.editing) {
            [self.tableView setEditing:NO
                              animated:YES];
        }
        self.jobsSetDemoSearchEnabled(enabled);
        self.tableView.byTableHeaderView(enabled ? self.demoSearchHeaderView : nil);
        if (enabled) {
            [self.demoSearchBar becomeFirstResponder];
            [self.tableView reloadData];
        }else{
            self.jobsSetDemoSearchKeyword(@"");
            self.demoSearchBar.byText(@"");
            [self.demoSearchBar resignFirstResponder];
            self.foldDemoSectionsWithFirstUnfolded();
            [self.tableView reloadData];
        }
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)demoSearchActive{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSString *keyword = self.normalizedDemoSearchTextBy(self.demoSearchKeyword);
        return keyword.length > 0;
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)demoSearchLandingActive{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.demoSearchEnabled && ![self demoSearchActive]() && self.demoSearchHistoryMutArr.count > 0;
    };
}

-(JobsRetStrByStrBlock _Nonnull)normalizedDemoSearchTextBy{
    @jobs_weakify(self)
    return ^NSString *(NSString * text){
        @jobs_strongify(self)
        if (!self) return nil;
        return [(text ? : @"") stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] ? : @"";
    };
}

-(void)applyDemoSearchKeyword:(NSString *)keyword
                  saveHistory:(BOOL)saveHistory{
    NSString *text = self.normalizedDemoSearchTextBy(keyword);
    if (!text.length) return;
    if (saveHistory) self.saveDemoSearchHistoryByText(text);
    self.jobsSetDemoSearchKeyword(text);
    self.demoSearchBar.byText(text);
    self.unfoldAllDemoSections();
    [self.tableView reloadData];
}

-(jobsByStrBlock _Nonnull)saveDemoSearchHistoryByText{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        NSString *historyText = self.normalizedDemoSearchTextBy(text);
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
    };
}

-(jobsByNSUIntegerBlock _Nonnull)deleteDemoSearchHistoryAtIndex{
    @jobs_weakify(self)
    return ^(NSUInteger index){
        @jobs_strongify(self)
        if (!self) return;
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
    };
}

-(jobsByVoidBlock _Nonnull)clearDemoSearchHistory{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.demoSearchHistoryMutArr removeAllObjects];
        [NSUserDefaults.standardUserDefaults removeObjectForKey:JobsOCDemoSearchHistoryUserDefaultsKey];
        [NSUserDefaults.standardUserDefaults synchronize];
        [self.tableView reloadData];
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)anyVisibleDemoSectionExpanded{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSUInteger visibleSectionCount = self.visibleDemoSectionArr().count;
        if (!visibleSectionCount) return NO;
        for (NSUInteger idx = 0; idx < visibleSectionCount; idx++) {
            if ([self.expandedDemoSectionIndexSet containsIndex:idx]) return YES;
        };return NO;
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)allVisibleDemoSectionsExpanded{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSUInteger visibleSectionCount = self.visibleDemoSectionArr().count;
        if (!visibleSectionCount) return NO;
        for (NSUInteger idx = 0; idx < visibleSectionCount; idx++) {
            if (![self.expandedDemoSectionIndexSet containsIndex:idx]) return NO;
        };return YES;
    };
}

-(jobsByVoidBlock _Nonnull)foldDemoSectionsWithFirstUnfolded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if ([self demoSearchActive]()) {
            self.unfoldAllDemoSections();
            return;
        }
        [self.expandedDemoSectionIndexSet removeAllIndexes];
        if (self.visibleDemoSectionArr().count) {
            [self.expandedDemoSectionIndexSet addIndex:0];
        }
    };
}

-(jobsByVoidBlock _Nonnull)unfoldAllDemoSections{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.expandedDemoSectionIndexSet removeAllIndexes];
        [self.expandedDemoSectionIndexSet addIndexesInRange:NSMakeRange(0, self.visibleDemoSectionArr().count)];
    };
}

-(jobsByBOOLBlock _Nonnull)setAllDemoSectionsExpanded{
    @jobs_weakify(self)
    return ^(BOOL expanded){
        @jobs_strongify(self)
        if (!self) return;
        if (expanded) {
            self.unfoldAllDemoSections();
        }else{
            [self.expandedDemoSectionIndexSet removeAllIndexes];
        }
        [self.tableView reloadData];
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoProjectFolderName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        id value = NSBundle.mainBundle.objectForInfoDictionaryKey(JobsOCDemoProjectFolderInfoKey);
        if (![value isKindOfClass:NSString.class]) return JobsOCDemoProjectFolderFallbackName;
        NSString *folderName = (NSString *)value;
        if (!folderName.length || [folderName containsString:@"$("]) return JobsOCDemoProjectFolderFallbackName;
        return folderName;
    };
}

-(JobsRetAttributedStringByVoidBlock _Nonnull)demoNavigationAttributedTitle{
    @jobs_weakify(self)
    return ^NSAttributedString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *pageTitle = self.viewModel.textModel.text ?: @"演武堂".jobsTr();
        NSString *folderName = self.demoProjectFolderName();
        NSString *displayTitle = [NSString stringWithFormat:@"%@\n%@",pageTitle,folderName];
        NSRange displayTitleRange = NSMakeRange(0, displayTitle.length);
        NSRange folderNameRange = NSMakeRange(pageTitle.length + 1, folderName.length);
        return JobsMutAttributedString(displayTitle)
            .addFontAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.byValue(UIFontWeightRegularSize(16))
                    .byRange(displayTitleRange);
            }))
            .addForegroundColorAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.byValue(self.demoListPrimaryTextColor())
                    .byRange(displayTitleRange);
            }))
            .addFontAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.byValue(UIFontWeightRegularSize(10))
                    .byRange(folderNameRange);
            }))
            .addForegroundColorAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
                data.byValue(self.demoListSecondaryTextColor())
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
    };
}

-(jobsByVoidBlock _Nonnull)refreshDemoNavigationTitle{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.navBar.titleLab.byHidden(YES);
        self.demoNavigationTitleLab.byText(self.viewModel.textModel.text ?: @"演武堂".jobsTr());
        self.demoNavigationProjectLab.byText(self.demoProjectFolderName());
        self
            .byGKNavTitle(nil)
            .byGKNavTitleView(self.demoNavigationTitleView);
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
                data
                    .byTextCor(titleColor)
                    .byText(@"演武堂".jobsTr())
                    .byFont(UIFontWeightRegularSize(16));
            })
            .byBgCor(navBgColor)
            .byNavBgCor(navBgColor)
            .byNavBgImage([self demoListDarkModeEnabled]() ? nil : @"导航栏左侧底图".img);
    };
}

-(jobsByVoidBlock _Nonnull)reloadLocalizedDemoListContent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.jobsSetDemoListRenderedLanguage(LanMgr.language);
        self.updateLocalizedContent();
        self.refreshDemoNavigationTitle();
        if (_demoSearchBar) {
            _demoSearchBar.byPlaceholder(@"输入关键词搜索 Demo".jobsTr());
        }
        if (_demoSearchCancelBtn) {
            _demoSearchCancelBtn.jobsResetBtnTitle(@"取消".jobsTr());
        }
        if (_tableView) {
            _tableView
                .byTableFooterView(self.demoListTableFooterView())
                .emptyDataByButtonModel(self.demoListEmptyDataButtonModel());
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
                make.width.mas_equalTo(self.functionMenuTableWidth());
                make.height.mas_equalTo(self.functionMenuTableHeight());
            }];
        }
        if (_tableView) [_tableView reloadData];
    };
}

-(jobsByVoidBlock _Nonnull)reloadLocalizedDemoListContentIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.demoListRenderedLanguage == LanMgr.language) return;
        self.reloadLocalizedDemoListContent();
    };
}

-(JobsRetViewByVoidBlock _Nonnull)demoListTableFooterView{
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
            label
                .byText(@"- 没有更多的内容了 -".jobsTr())
                .byFont(UIFontWeightRegularSize(12))
                .byTextAlignment(NSTextAlignmentCenter)
                .byTextCor(JobsSecondaryLabelColor)
                .makeLabelByShowingType(UILabelShowingType_03);
        });
    };
}

-(JobsRetUIButtonModelByVoidBlock _Nonnull)demoListEmptyDataButtonModel{
    @jobs_weakify(self)
    return ^UIButtonModel *{
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.byTitle(@"NO MESSAGES FOUND".jobsTr())
                .byTitleCor(JobsWhiteColor)
                .byTitleFont(bayonRegular(JobsWidth(30)))
                .byNormalImage(@"小狮子".img);
        });
    };
}

-(jobsByVoidBlock _Nonnull)reloadDemoListToTopAndRefresh{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (_dataMutArr.count) {
            [self.dataMutArr removeAllObjects];
            _dataMutArr = nil;
            _demoSectionMutArr = nil;
            _pinnedDemoMutArr = nil;
            _tbvCellMutArr = nil;
            _expandedDemoSectionIndexSet = nil;
        }
        self.foldDemoSectionsWithFirstUnfolded();
        [self.tableView reloadData];
        [self.tableView setContentOffset:CGPointMake(0, -self.tableView.contentInset.top)
                                animated:NO];
        [self.tableView.mj_header beginRefreshing];
    };
}

-(JobsRetViewModelByVoidBlock _Nonnull)jobs_countryCodeDemoViewModel{
    @jobs_weakify(self)
    return ^UIViewModel *{
        @jobs_strongify(self)
        if (!self) return nil;
        UIViewModel *viewModel = self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
            model.byTitle(@"国家 / 地区代码选择".jobsTr())
                 .bySubTitle(@"JobsOCCountryCodeCtrl".jobsTr())
                 .byCls(JobsOCCountryCodeCtrl.class);
        }));
        self.jobs_applySelectedCountryCodeToViewModel(viewModel);
        return viewModel;
    };
}

-(JobsRetBOOLByUIViewModelBlock _Nonnull)jobs_isCountryCodeDemoViewModel{
    @jobs_weakify(self)
    return ^BOOL(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return [viewModel.cls isSubclassOfClass:JobsOCCountryCodeCtrl.class];
    };
}

-(jobsByViewModelBlock _Nonnull)jobs_pushCountryCodeCtrlWithViewModel{
    @jobs_weakify(self)
    return ^(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return;
        JobsOCCountryCodeCtrl *countryCodeCtrl = JobsOCCountryCodeCtrl.new;
        @jobs_weakify(self)
        countryCodeCtrl.byCountryCodeBlock(^(__kindof NSString * _Nullable countryName,
                                             __kindof NSString * _Nullable code) {
            @jobs_strongify(self)
            [self jobs_updateSelectedCountryCodeWithCountryName:countryName
                                                           code:code];
            self.jobs_applySelectedCountryCodeToViewModel(viewModel);
            [self.tableView reloadData];
        });
        self.comingToPushVCByRequestParams(countryCodeCtrl,
                                           viewModel);
    };
}

-(void)jobs_updateSelectedCountryCodeWithCountryName:(NSString *)countryName
                                                code:(NSString *)code{
    self.jobsSetSelectedCountryCodePlainText([JobsOCCountryCodeCtrl jobs_countryCodeTextByCountryName:countryName
                                                                                                  code:code]);
    self.jobsSetSelectedCountryCodeAttributedText([JobsOCCountryCodeCtrl jobs_countryCodeAttributedTextByCountryName:countryName
                                                                                                                 code:code
                                                                                                                 font:UIFontWeightRegularSize(11)
                                                                                                            textColor:self.jobs_countryCodeDemoSubTextColor()]);
}

-(jobsByViewModelBlock _Nonnull)jobs_applySelectedCountryCodeToViewModel{
    @jobs_weakify(self)
    return ^(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return;
        if (!viewModel) return;
        if (self.selectedCountryCodePlainText.length) {
            viewModel.textModel
                .byText(self.selectedCountryCodePlainText)
                .byAttributedTitle(self.selectedCountryCodeAttributedText);
        }else{
            viewModel.textModel
                .byText(@"国家 / 地区代码选择".jobsTr())
                .byAttributedTitle(nil);
        }
        viewModel.subTextModel
            .byText(@"JobsOCCountryCodeCtrl".jobsTr())
            .byAttributedTitle(nil);
    };
}

-(JobsRetCorByVoidBlock _Nonnull)jobs_countryCodeDemoSubTextColor{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 13.0, *)) {
            return UIColor.secondaryLabelColor;
        };return HEXCOLOR(0x8A93A1);
    };
}

-(NSMutableArray<JobsOCDemoSectionModel *> *)demoSectionMutArr{
    if (!_demoSectionMutArr) {
        _demoSectionMutArr = NSMutableArray.array;
        for (UIViewModel *viewModel in self.dataMutArr) {
            NSString *sectionTitle = self.sectionTitleForViewModel(viewModel);
            [([self sectionModelInArr:_demoSectionMutArr
                                title:sectionTitle].dataMutArr) addObject:viewModel];
        }
        self.applySavedDemoSectionOrderIfNeeded();
    };return _demoSectionMutArr;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"朋友圈图文浏览与图片预览".jobsTr())
                     .bySubTitle(@"图文卡片与图片填充 / 适配预览".jobsTr())
                     .byCls(JobsSwiftParityMomentsPreviewDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"节流、防抖".jobsTr())
                     .bySubTitle(@"高频事件节流与延迟回调防抖".jobsTr())
                     .byCls(JobsSwiftParityThrottleDebounceDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"多任务依赖、顺序与状态编排".jobsTr())
                     .bySubTitle(@"TaskCenter依赖任务编排".jobsTr())
                     .byCls(JobsSwiftParityTaskCenterDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"动效数字按钮".jobsTr())
                     .bySubTitle(@"按钮标题数值平滑过渡".jobsTr())
                     .byCls(JobsSwiftParityAnimatedButtonNumberDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"仪表盘".jobsTr())
                     .bySubTitle(@"随机进度与动效同步".jobsTr())
                     .byCls(JobsSwiftParityDashboardDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"ControlEvents".jobsTr())
                     .bySubTitle(@"UIControl 事件触发与 once / on 语义".jobsTr())
                     .byCls(JobsSwiftParityControlEventsDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"主题与界面环境变化监听".jobsTr())
                     .bySubTitle(@"TraitChange".jobsTr())
                     .byCls(JobsSwiftParityTraitChangeDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"编辑个人资料".jobsTr())
                     .bySubTitle(@"昵称编辑、保存与再次进入回填".jobsTr())
                     .byCls(JobsSwiftParityEditProfileDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"PDF 浏览".jobsTr())
                     .bySubTitle(@"PDFKit DSL 装载本地文档".jobsTr())
                     .byCls(JobsSwiftParityPDFDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"轻量提示反馈".jobsTr())
                     .bySubTitle(@"Toast".jobsTr())
                     .byCls(JobsSwiftParityToastDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"确认与取消系统弹框".jobsTr())
                     .bySubTitle(@"UIAlert".jobsTr())
                     .byCls(JobsSwiftParityAlertDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"统一打开外部 URL".jobsTr())
                     .bySubTitle(@"JobsOpen".jobsTr())
                     .byCls(JobsSwiftParityOpenDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"雪花算法".jobsTr())
                     .bySubTitle(@"使用数据中心与机器 ID 生成唯一编号".jobsTr())
                     .byCls(JobsSwiftParitySnowflakeDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsTabBarCtr".jobsTr())
                     .bySubTitle(@"JobsTabBarCtr".jobsTr())
                     .byCls(JobsTabBarCtrlDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"苹果滑动开锁".jobsTr())
                     .bySubTitle(@"苹果滑动开锁".jobsTr())
                     .byCls(SlideToUnlockDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"系统导航栏".jobsTr())
                     .bySubTitle(@"JobsNavigationDemoVC".jobsTr())
                     .byCls(JobsNavigationDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"正计时/倒计时".jobsTr())
                     .bySubTitle(@"进入列表后分别查看正计时和倒计时按钮 DemoVC".jobsTr())
                     .byCls(JobsTimerDemoListVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"本地录音与音频管理".jobsTr())
                     .bySubTitle(@"短按住录音、后台长录音、播放与删除本地文件".jobsTr())
                     .byCls(JobsOCAudioRecorderDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsBluetooth".jobsTr())
                     .bySubTitle(@"BLE 扫描、连接、读写、Notify、Mock、协议和 DSL 全能力 Demo".jobsTr())
                     .byCls(JobsBluetoothDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"陀螺仪、加速度计、磁力计与设备".jobsTr())
                     .bySubTitle(@"CoreMotion DSL".jobsTr())
                     .byCls(JobsCoreMotionDemoVC.class);
            })))
            .add(
                self.makeDatas(
                    jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                        model.byTitle(@"SceneDelegate 多场景与窗口会话".jobsTr())
                             .bySubTitle(@"新建、激活、关闭 Scene，验证独立状态、生命周期与恢复".jobsTr())
                             .byCls(JobsOCSceneDelegateDemoVC.class);
                    })
                ).byImage(
                    [JobsIconfontManager.shared iconImageForGlyph:JobsIconfontGlyphSwitcher
                                                             size:CGSizeMake(JobsWidth(30),JobsWidth(30))
                                                            color:UIColor.systemBlueColor]
                )
            )
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"截屏后 Tips 提示".jobsTr())
                     .bySubTitle(@"截屏完成后更新页面状态并弹出提示".jobsTr())
                     .byCls(JobsScreenshotTipsDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"禁止截屏：敏感内容保护".jobsTr())
                     .bySubTitle(@"安全渲染容器隐藏截图中的敏感区域，并支持开关对比".jobsTr())
                     .byCls(JobsScreenshotProtectionDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"UILabel 数字动效".jobsTr())
                     .bySubTitle(@"UILabel 文本数值按 1/60 秒间隔从起点平滑过渡到终点".jobsTr())
                     .byCls(JobsAnimatedNumberLabelDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"UILabel+Scrolling｜四种定尺寸文字策略".jobsTr())
                     .bySubTitle(@"缩放适配、单行省略、多行省略与滚动展示".jobsTr())
                     .byCls(UILabelScrollingDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"时钟".jobsTr())
                     .bySubTitle(@"JobsClockView：基于 Timer 驱动的模拟时钟".jobsTr())
                     .byCls(JobsClockDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"动态时钟图标｜顺/逆时针".jobsTr())
                     .bySubTitle(@"无刻度、固定时针，仅分针旋转；方向与 Timer 间隔由外界传入".jobsTr())
                     .byCls(JobsImageRotationDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"幸运轮盘".jobsTr())
                     .bySubTitle(@"抽奖轮盘：Timer 相关应用层 Demo".jobsTr())
                     .byCls(LotteryVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"红包雨".jobsTr())
                     .bySubTitle(@"JobsLuckyEnvelopeRain：基于 JobsOCTimer 的红包雨封装".jobsTr())
                     .byCls(JobsRedPacketRainDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsOCTimerMgr 多任务管理".jobsTr())
                     .bySubTitle(@"按 identifier 统一注册、启动、暂停、恢复和移除多个 Timer".jobsTr())
                     .byCls(JobsOCTimerMgrDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🎲 时时彩@单页面管理多个Timer".jobsTr())
                     .bySubTitle(@"JobsOCTimerMgr 管理表格里的多个倒计时".jobsTr())
                     .byCls(JobsMultiTimerTableDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsMarqueeView 跑马灯 / 轮播图".jobsTr())
                     .bySubTitle(@"JobsOCTimerMgr 驱动：连续公告、间隔翻页、分页轮播".jobsTr())
                     .byCls(JobsMarqueeViewDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"日历功能".jobsTr())
                     .bySubTitle(@"CalendarVC".jobsTr())
                     .byCls(CalendarVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"竖形菜单选择功能".jobsTr())
                     .bySubTitle(@"JobsVerticalMenuMainVC".jobsTr())
                     .byCls(JobsVerticalMenuMainVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsLinkageMenuViewDemoVC".jobsTr())
                     .bySubTitle(@"首页联动切换子页面：左侧 UIScrollView 菜单联动右侧 UIView 内容".jobsTr())
                     .byCls(JobsLinkageMenuViewDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"横向 / 纵向刷新与加载更多".jobsTr())
                     .bySubTitle(@"重写MJRefresh".jobsTr())
                     .byCls(JobsOCRefresherDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🔴 抖音双球刷新动画".jobsTr())
                     .bySubTitle(@"红、绿双球交叉换位并错峰跳跃，支持开始、暂停、继续与停止".jobsTr())
                     .byCls(JobsDouyinRefreshDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"ViewPushView".jobsTr())
                     .bySubTitle(@"让 UIView 像 UINavigationController 支持上下左右 Push/Pop、比例覆盖和原路交互退出".jobsTr())
                     .byCls(JobsViewPushDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"侧滑方向/比例/跟随模式".jobsTr())
                     .bySubTitle(@"JobsSideDrawerDemoVC".jobsTr())
                     .byCls(JobsSideDrawerDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"键盘遮挡处理".jobsTr())
                     .bySubTitle(@"JobsOCKeyboardMgr".jobsTr())
                     .byCls(JobsOCKeyboardMgrDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"购物车".jobsTr())
                     .bySubTitle(@"减号 + 数字输入 + 加号；可选上下限自动控制按钮状态".jobsTr())
                     .byCls(JobsOCNumberStepperDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"图形验证码".jobsTr())
                     .bySubTitle(@"阿拉伯数字/英文（区分大小写）/汉字（区分简繁）".jobsTr())
                     .byCls(JobsOCGraphicCaptchaDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🐎 二维码/条形码".jobsTr())
                     .bySubTitle(@"CoreImage 生成二维码、带 Logo 二维码和 Code128 条形码".jobsTr())
                     .byCls(JobsQRCodeDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"👮 中国大陆公民身份证号码校验".jobsTr())
                     .bySubTitle(@"15 / 18 位身份证号码格式、生日、顺序码和校验位校验".jobsTr())
                     .byCls(JobsCNIDDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"☠️ 骨架屏".jobsTr())
                     .bySubTitle(@"JobsOCSkeletonView：Skeleton / shimmer / pulse".jobsTr())
                     .byCls(JobsOCSkeletonViewDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsOCExcel｜任意冻结列与四种文字策略".jobsTr())
                     .bySubTitle(@"Jobs 自研 Excel UI，可嵌入 UITableViewCell / UICollectionViewCell".jobsTr())
                     .byCls(JobsOCExcelDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"📚 Markdown 文档浏览器".jobsTr())
                     .bySubTitle(@"按工程相对路径浏览并渲染全部 Jobs 自有 Markdown 文档".jobsTr())
                     .byCls(JobsOCMarkdownDocumentsDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"✍️ 手写板｜本地保存与离开确认".jobsTr())
                     .bySubTitle(@"手指或 Apple Pencil 书写；保存后恢复，未保存离开时确认".jobsTr())
                     .byCls(JobsHandwritingDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Excel".jobsTr())
                     .bySubTitle(@"Excel".jobsTr())
                     .byCls(ExcelVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JXCategoryView演示".jobsTr())
                     .bySubTitle(@"JXCategoryViewVerticalShowVC".jobsTr())
                     .byCls(JXCategoryViewVerticalShowVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"发帖（图文）功能".jobsTr())
                     .bySubTitle(@"相册获取资源+存/取未完成字符串".jobsTr())
                     .byCls(JobsPostVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"将图片用字符串（加盐）进行存取".jobsTr())
                     .bySubTitle(@"一种图片加密的手段，简单而粗暴.".jobsTr())
                     .byCls(PicToStrStoreVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"iOS 热更新".jobsTr())
                     .bySubTitle(@"".jobsTr())
                     .byCls(HotRefreshVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"FMDB示例".jobsTr())
                     .bySubTitle(@"增删查改".jobsTr())
                     .byCls(FMDB_VC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Realm示例".jobsTr())
                     .bySubTitle(@"增删查改".jobsTr())
                     .byCls(Realm_VC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"• 带小圆点文本及对齐".jobsTr())
                     .bySubTitle(@"圆点颜色、图片圆点与多行悬挂缩进对齐".jobsTr())
                     .byCls(PointLabTestVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"iOS Widget".jobsTr())
                     .bySubTitle(@"尺寸预览、状态更新与 Extension 接入说明".jobsTr())
                     .byCls(WidgetVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"手机横屏".jobsTr())
                     .bySubTitle(@"全局设定".jobsTr())
                     .byCls(LandscapeSwitchVC.class);
            })))
//            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
//                model.title = @"Texture".jobsTr();
//                model.subTitle = @"byFaceBook".jobsTr();
//                model.cls = TextureDemoVC.class;
//            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"本地推送通知".jobsTr())
                     .bySubTitle(@"本地推送通知".jobsTr())
                     .byCls(LocalNotificationsVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"字符串解压缩".jobsTr())
                     .bySubTitle(@"字符串解压缩".jobsTr())
                     .byCls(CompressStrVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"动态切换App图标".jobsTr())
                     .bySubTitle(@"只能跑真机，模拟器编译报错，且iOS 10.3 或更高版本".jobsTr())
                     .byCls(AppIconSwitchingVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"长按Cell出3D-Touch的菜单".jobsTr())
                     .bySubTitle(@"PeekAndPop".jobsTr())
                     .byCls(MyTableTableVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"系统剪切板测试".jobsTr())
                     .bySubTitle(@"尝试控制粘贴提示".jobsTr())
                     .byCls(CtrlClipboardCueVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"注册/登陆/忘记密码".jobsTr())
                     .bySubTitle(@"JobsAppDoor（2种表现形式）".jobsTr())
                     .byCls(JobsAppDoorDemoListVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Douyin_ZFPlayer".jobsTr())
                     .bySubTitle(@"2 种播放效果，进入列表后分别查看".jobsTr())
                     .byCls(JobsZFPlayerDemoListVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"镂空特效".jobsTr())
                     .bySubTitle(@"TransparentRegion".jobsTr())
                     .byCls(TransparentRegionVC.class);
            })))
            .add(
                self.makeDatas(
                    jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                        model.byTitle(@"JobsIconfont｜图片、图标字体与文字字体".jobsTr())
                             .bySubTitle(@"iconfont 全功能封装：业务层不直接接触 URL、Unicode 和字体文件名".jobsTr())
                             .byCls(JobsIconfontDemoListVC.class);
                    })
                ).byImage(
                    [JobsIconfontManager.shared iconImageForGlyph:JobsIconfontGlyphComponent
                                                             size:CGSizeMake(JobsWidth(30),JobsWidth(30))
                                                            color:UIColor.systemBlueColor]
                )
            )
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🧩 打马赛克".jobsTr())
                     .bySubTitle(@"整图粗细 / 手势涂抹两种马赛克效果".jobsTr())
                     .byCls(JobsMosaicDemoListVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"😂 按钮完全覆盖在 Cell 上".jobsTr())
                     .bySubTitle(@"UITableViewCell / UICollectionViewCell 两种表现形式".jobsTr())
                     .byCls(JobsButtonCoverCellDemoListVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🌍 球形特效（可拖动点选）".jobsTr())
                     .bySubTitle(@"XLSphereView：拖动旋转、惯性滚动、点按标签".jobsTr())
                     .byCls(JobsSphereDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"评论功能".jobsTr())
                     .bySubTitle(@"评论 Pod：网易 / 今日头条 / 自定义三种回复模式".jobsTr())
                     .byCls(JobsOCCommentDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"搜索功能".jobsTr())
                     .bySubTitle(@"JobsOCSearcher".jobsTr())
                     .byCls(JobsOCSearcherDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"相册选取图片和视频".jobsTr())
                     .bySubTitle(@"".jobsTr())
                     .byCls(JobsShootingVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"长按录制视频".jobsTr())
                     .bySubTitle(@"全屏摄像头预览 + AVAssetWriter 音视频录制 + 画中画预览保存".jobsTr())
                     .byCls(JobsOCVideoRecorderVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🌘 直播间@滚动留言".jobsTr())
                     .bySubTitle(@"输入留言后自动追加并滚动到最新消息".jobsTr())
                     .byCls(JobsLiveCommentDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"📺 直播推流".jobsTr())
                     .bySubTitle(@"AVFoundation 采集预览 + RTMP 地址入口".jobsTr())
                     .byCls(JobsLiveStreamDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Gif图片读取".jobsTr())
                     .bySubTitle(@"DynamicView".jobsTr())
                     .byCls(DynamicViewTestVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Progress".jobsTr())
                     .bySubTitle(@"进度条".jobsTr())
                     .byCls(JobsProgressVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"💣 任意UIView.layer@导火索倒计时效果".jobsTr())
                     .bySubTitle(@"任意 UIView.layer 外圈导火索倒计时".jobsTr())
                     .byCls(JobsCountdownLayerDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"👍 长按点赞冒泡".jobsTr())
                     .bySubTitle(@"长按持续冒泡 + 震动反馈 + 声音反馈 + 点赞变红".jobsTr())
                     .byCls(JobsLongPressLikeDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"系统进度条".jobsTr())
                     .bySubTitle(@"UIProgressView + JobsOCTimer 倒计时".jobsTr())
                     .byCls(JobsSysProgressDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"自定义进度条（进度值+前进方向）".jobsTr())
                     .bySubTitle(@"JobsProgressBar：进度值、方向、拖动和自动进度".jobsTr())
                     .byCls(JobsProgressDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"不规则的按钮".jobsTr())
                     .bySubTitle(@"IrregularView".jobsTr())
                     .byCls(TestIrregularViewTestVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"IM模块".jobsTr())
                     .bySubTitle(@"JobsIM".jobsTr())
                     .byCls(JobsIMShowVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"UILabel / UIButton.titleLabel 表现列表".jobsTr())
                     .bySubTitle(@"省略、滚动、自适应、缩放、换行与富文本".jobsTr())
                     .byCls(TestLabelVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"👇🏻下拉列表".jobsTr())
                     .bySubTitle(@"JobsDropDownListVC".jobsTr())
                     .byCls(JobsDropDownListVC.class);
            })))
            .add(self.jobs_countryCodeDemoViewModel())
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"探究猿题库网络框架（YTKNetwork）".jobsTr())
                     .bySubTitle(@"YTKNetworkStudyVC".jobsTr())
                     .byCls(YTKNetworkStudyVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"WebSocket 双向通信".jobsTr())
                     .bySubTitle(@"连接、发送、断开与 Echo 回显".jobsTr())
                     .byCls(JobsWebSocketDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"探究CoreText".jobsTr())
                     .bySubTitle(@"CoreTextLearningVC".jobsTr())
                     .byCls(CoreTextLearningVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JXCategoryPopupVC".jobsTr())
                     .bySubTitle(@"JXCategoryView+PopupView".jobsTr())
                     .byCls(JXCategoryPopupVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"站内信".jobsTr())
                     .bySubTitle(@"替换系统UITableViewCell编辑状态下前面的按钮UI样式，及其一部分逻辑".jobsTr())
                     .byCls(UITableViewCellEditorVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"手势解锁".jobsTr())
                     .bySubTitle(@"设置手势密码".jobsTr())
                     .byCls(JobsSettingGestureVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"CXB自研科技".jobsTr())
                     .bySubTitle(@"CXBVC".jobsTr())
                     .byCls(CXBVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"OC动态添加类、方法列表、属性列表".jobsTr())
                     .bySubTitle(@"OCDynamicRegisterVC".jobsTr())
                     .byCls(OCDynamicRegisterVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JXCategoryViewWithHeaderViewVC".jobsTr())
                     .bySubTitle(@"JXCategoryView下拉放大头部视图".jobsTr())
                     .byCls(JXCategoryViewWithHeaderViewVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🔄 UILabel 文字旋转".jobsTr())
                     .bySubTitle(@"UILabel文字旋转".jobsTr())
                     .byCls(UILabelWordRotatingVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"可交互自定义 Label".jobsTr())
                     .bySubTitle(@"内边距、异形圆角、背景与轻点/长按手势".jobsTr())
                     .byCls(TestBaseLabelVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"随机数测试模块".jobsTr())
                     .bySubTitle(@"RandomTestVC".jobsTr())
                     .byCls(RandomTestVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"CustomTableViewCellVC".jobsTr())
                     .bySubTitle(@"自定义UITableViewCell内置控件距离并添加复制按钮".jobsTr())
                     .byCls(CustomTableViewCellVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"自定义UIButton子控件的排布".jobsTr())
                     .bySubTitle(@"CustomBtnVC".jobsTr())
                     .byCls(CustomBtnVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"GXCardViewDemoVC".jobsTr())
                     .bySubTitle(@"卡片式布局(探探附近/QQ配对)，可以设置卡片堆叠效果，可以设置循环效果".jobsTr())
                     .byCls(GXCardViewDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"UICollectionView实现重叠的卡包效果".jobsTr())
                     .bySubTitle(@"JobsWalletVC".jobsTr())
                     .byCls(JobsWalletVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"在指定的y区间内滑动视图(带吸边效果)".jobsTr())
                     .bySubTitle(@"JobsScrollViewVC".jobsTr())
                     .byCls(JobsScrollViewVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"转场动画探究".jobsTr())
                     .bySubTitle(@"UIPresentationController的使用".jobsTr())
                     .byCls(JobsPresentingVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Masonry的应用与实践".jobsTr())
                     .bySubTitle(@"UIPresentationController的使用".jobsTr())
                     .byCls(MasonryVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"UITableViewCell的折叠效果".jobsTr())
                     .bySubTitle(@"UITableViewCell的折叠效果".jobsTr())
                     .byCls(UITBVCellFoldVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Objc中实现协议扩展".jobsTr())
                     .bySubTitle(@"ProtocolKitVC".jobsTr())
                     .byCls(ProtocolKitVC.class);
            })));
        });
    };return _dataMutArr;
}

@end
