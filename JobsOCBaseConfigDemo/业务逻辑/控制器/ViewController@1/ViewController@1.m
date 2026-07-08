//
//  ViewController@1.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ViewController@1.h"
#import "JobsOCDemoListSettingsVC.h"

BOOL ISLogin;
static NSString *const JobsOCDemoListReturnToTopAndRefreshUserDefaultsKey = @"com.BSports.JobsOCDemoListReturnToTopAndRefreshUserDefaultsKey";
static NSString *const JobsOCDemoListDarkModeUserDefaultsKey = @"com.BSports.JobsOCDemoListDarkModeUserDefaultsKey";
static NSString *const JobsOCDemoListSectionOrderUserDefaultsKey = @"com.BSports.JobsOCDemoListSectionOrderUserDefaultsKey";
static NSString *const JobsOCDemoSearchHistoryUserDefaultsKey = @"com.BSports.JobsOCDemoSearchHistoryUserDefaultsKey";
static NSString *const JobsOCDemoPinnedDemoUserDefaultsKey = @"com.BSports.JobsOCDemoPinnedDemoUserDefaultsKey";
static NSString *const JobsOCFunctionMenuCellReuseIdentifier = @"UITableViewCell";
static NSString *const JobsOCDemoSearchHistoryCellReuseIdentifier = @"JobsOCDemoSearchHistoryCell";
static NSString *const JobsOCDemoPinnedCellReuseIdentifier = @"JobsOCDemoPinnedCell";

typedef NS_ENUM(NSInteger, JobsOCFunctionMenuItem) {
    JobsOCFunctionMenuItemSearch = 0,
    JobsOCFunctionMenuItemDemoFold,
    JobsOCFunctionMenuItemSetting
};

@interface ViewController_1 ()
/// UI
Prop_strong()BaseButton *userHeadBtn;
Prop_strong()UIButton *functionMenuBtn;
Prop_strong()UITableView *functionMenuTableView;
Prop_strong()UITapGestureRecognizer *functionMenuDismissTapGesture;
Prop_strong()UILongPressGestureRecognizer *demoSectionReorderLongPressGesture;
Prop_strong()UIView *demoSectionDragSnapshotView;
Prop_strong()NSIndexPath *demoSectionDragIndexPath;
Prop_strong()UIView *demoSearchHeaderView;
Prop_strong()UISearchBar *demoSearchBar;
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
Prop_assign()AppLanguage demoListRenderedLanguage;

-(BOOL)demoListReturnToTopAndRefreshEnabled;
-(void)setDemoListReturnToTopAndRefreshEnabled:(BOOL)enabled;
-(BOOL)demoListDarkModeEnabled;
-(void)applyDemoListInterfaceStyle;
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
-(NSString *)demoFoldSwitchTitle;
-(CGFloat)functionMenuTableWidth;
-(CGFloat)functionMenuTableHeight;
-(UIImage *)functionMenuImageByTintColor:(UIColor *)tintColor;
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
-(void)deleteDemoSearchHistoryByButton:(UIButton *)button;
-(void)deleteDemoSearchHistoryAtIndex:(NSUInteger)index;
-(void)clearDemoSearchHistory;
-(BOOL)anyVisibleDemoSectionExpanded;
-(BOOL)allVisibleDemoSectionsExpanded;
-(void)foldDemoSectionsWithFirstUnfolded;
-(void)unfoldAllDemoSections;
-(void)setAllDemoSectionsExpanded:(BOOL)expanded;
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
    [self updateLocalizedContent];
    @jobs_weakify(self)
    [self addNotificationName:语言切换
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
        [self reloadLocalizedDemoListContent];
    }];
    /// 装填用户信息数据
    /// json生成器 ： https://www.site24x7.com/zhcn/tools/json-generator.html
    self.saveUserInfo(JobsUserModel.byData(@"UserData".readLocalFileWithName));// 保存全局唯一的一份用户档案
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self applyDemoListInterfaceStyle];
    self.view.byBgColor(JobsWhiteColor);
    if (@available(iOS 11.0, *)) {
        self.view.byBgColor(@"TextColor0".namedCor);

    }else{
        self.view.byBgColor(JobsWhiteColor);
    }
    @jobs_weakify(self)
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        data.add(UIBarButtonItem.initBy(self.userHeadBtn));
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        data.add(UIBarButtonItem.initBy(self.functionMenuBtn));
    });
    self.makeNavByAlpha(1);
    self.navBar.backBtn.jobsVisible = NO;
    self.navBar.titleLab.byText(self.viewModel.textModel.text);
    
    self.tableView.byShow(self);
    [self foldDemoSectionsWithFirstUnfolded];
    self.functionMenuTableView.byHidden(YES);
    self.functionMenuDismissTapGesture.byEnabled(YES);
    self.suspendBtn.byAlpha(1);

    self.objBlock = ^(id data) {
        @jobs_strongify(self)
        if ([data isKindOfClass:JobsSuspendBtn.class]) {
            JobsSuspendBtn *suspendBtn = (JobsSuspendBtn *)data;
            if (suspendBtn.selected) {
                NSInteger s = self.tableView.numberOfSections; // 有多少组
                if (s < 1) return;
                NSInteger r = [self.tableView numberOfRowsInSection:s - 1]; // 最后一组有多少行
                if (r < 1) return;
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:r - 1 inSection:s - 1]; // 取最后一行数据
                [self.tableView scrollToRowAtIndexPath:indexPath
                                      atScrollPosition:UITableViewScrollPositionBottom
                                              animated:YES]; // 滚动到最后一行
            }else{
                NSInteger s = self.tableView.numberOfSections;
                if (s < 1) return;
                NSInteger r = [self.tableView numberOfRowsInSection:0];
                if (r < 1) {
                    [self.tableView setContentOffset:CGPointMake(0, -self.tableView.contentInset.top)
                                            animated:YES];
                    return;
                }
                NSIndexPath *indexPath = jobsMakeIndexPathZero(); // 取第一行数据
                [self.tableView scrollToRowAtIndexPath:indexPath
                                      atScrollPosition:UITableViewScrollPositionTop
                                              animated:YES]; // 滚动到第一行
            }
        }
    };
//    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
//    UIInterfaceOrientation s = self.getInterfaceOrientation;
//    DeviceOrientation d = self.getDeviceOrientation;
    JobsLog(@"");
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadLocalizedDemoListContentIfNeeded];
    if ([self demoListReturnToTopAndRefreshEnabled]) {
        [self reloadDemoListToTopAndRefresh];
    }else if (!self.demoListHasAppeared){
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
//    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
//    UIInterfaceOrientation s = self.getInterfaceOrientation;
//    DeviceOrientation d = self.getDeviceOrientation;
//    self.menuView.alpha = JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == _functionMenuTableView) return 1;
    if ([self demoSearchLandingActive]) return 1;
    return [self hasPinnedDemoSection] ? 2 : 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _functionMenuTableView) return JobsWidth(52);
    if ([self demoSearchLandingActive]) return JobsWidth(54);
    if ([self isPinnedDemoIndexPath:indexPath]) return [JobsOCRootFoldTableCell expandedHeightByItemCount:self.pinnedDemoMutArr.count];
    if (![self isDemoFoldIndexPath:indexPath]) return CGFLOAT_MIN;
    JobsOCDemoSectionModel *sectionModel = self.visibleDemoSectionArr[indexPath.row];
    return [self.expandedDemoSectionIndexSet containsIndex:indexPath.row]
        ? [JobsOCRootFoldTableCell expandedHeightByItemCount:sectionModel.dataMutArr.count
                                          sectionDescription:sectionModel.sectionDescription]
        : JobsOCRootFoldTableCell.collapsedHeight;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
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
    if (tableView == _functionMenuTableView) return nil;
    if ([self demoSearchLandingActive]) {
        @jobs_weakify(self)
        return jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.byBgColor(JobsClearColor);
            jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                label
                    .byText(@"搜索历史".tr)
                    .byTextCor(HEXCOLOR(0x202733))
                    .byFont(UIFontWeightSemiboldSize(JobsWidth(17)))
                    .addOn(view)
                    .byAdd(^(MASConstraintMaker *make) {
                        make.left.equalTo(view).offset(JobsWidth(24));
                        make.centerY.equalTo(view);
                    });
            });
            UIButton.jobsInit()
                .jobsResetBtnTitle(@"清空".tr)
                .jobsResetBtnTitleCor(HEXCOLOR(0x8A93A1))
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(JobsWidth(13)))
                .onClickBy(^(UIButton *x) {
                    @jobs_strongify(self)
                    [self clearDemoSearchHistory];
                })
                .byBgColor(JobsClearColor)
                .addOn(view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.right.equalTo(view).offset(-JobsWidth(24));
                    make.centerY.equalTo(view);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(52), JobsWidth(32)));
                });
        });
    };return UIView.new;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
    if (tableView == _functionMenuTableView) return self.functionMenuTitles.count;
    if ([self demoSearchLandingActive]) return self.demoSearchHistoryMutArr.count;
    if ([self hasPinnedDemoSection] && section == 0) return 1;
    return self.visibleDemoSectionArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _functionMenuTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCFunctionMenuCellReuseIdentifier
                                                                forIndexPath:indexPath];
        return cell
            .byTextLabel(^(__kindof UILabel * _Nullable label) {
                label.byText(self.functionMenuTitles[indexPath.row])
                    .byFont(UIFontWeightRegularSize(15))
                    .byTextCor(HEXCOLOR(0x3D4A58));
            })
            .bySelectionStyle(UITableViewCellSelectionStyleDefault);
    }
    if ([self demoSearchLandingActive]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCDemoSearchHistoryCellReuseIdentifier
                                                                forIndexPath:indexPath];
        NSString *historyText = indexPath.row < self.demoSearchHistoryMutArr.count ? self.demoSearchHistoryMutArr[indexPath.row] : @"";
        @jobs_weakify(self)
        UIButton *deleteBtn = UIButton.jobsInit()
            .jobsResetBtnImage(@"删除".img)
            .byImageEdgeInsets(UIEdgeInsetsMake(JobsWidth(8), JobsWidth(8), JobsWidth(8), JobsWidth(8)))
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                [self deleteDemoSearchHistoryByButton:x];
            })
            .byBgColor(JobsClearColor)
            .bySize(CGSizeMake(JobsWidth(38), JobsWidth(38)));
        deleteBtn.tag = indexPath.row;
        if (@available(iOS 14.0, *)) {
            UIBackgroundConfiguration *backgroundConfiguration = UIBackgroundConfiguration.clearConfiguration;
            backgroundConfiguration.backgroundColor = JobsWhiteColor;
            backgroundConfiguration.cornerRadius = 0;
            cell.byBackgroundConfiguration(backgroundConfiguration);
        }else{
            cell.byBackgroundView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                view.byBgColor(JobsWhiteColor);
            }));
        }
        cell.bySelectedBackgroundView(nil);
        cell.contentView
            .byCornerRadius(0)
            .byClipsToBounds(NO);
        return cell
            .bySelectionStyle(UITableViewCellSelectionStyleNone)
            .byAccessoryType(UITableViewCellAccessoryNone)
            .byAccessoryView(deleteBtn)
            .byContentViewBgCor(JobsWhiteColor)
            .byTextLabel(^(__kindof UILabel * _Nullable label) {
                label
                    .byText(historyText)
                    .byFont(UIFontWeightRegularSize(JobsWidth(16)))
                    .byTextCor(HEXCOLOR(0x3D4A58));
            })
            .byCellImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView.byImage(@"时钟".img);
            })
            .byBgColor(JobsClearColor);
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
    return !self.demoSearchEnabled && [self isDemoFoldIndexPath:indexPath];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
       editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView != _functionMenuTableView && [self demoSearchLandingActive]) return UITableViewCellEditingStyleDelete;
    return UITableViewCellEditingStyleNone;
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
           [self isDemoFoldIndexPath:indexPath] &&
           self.visibleDemoSectionArr.count > 1;
}

- (NSIndexPath *)tableView:(UITableView *)tableView
targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    if (tableView == _functionMenuTableView ||
        self.demoSearchEnabled ||
        ![self isDemoFoldIndexPath:sourceIndexPath] ||
        ![self isDemoFoldIndexPath:proposedDestinationIndexPath] ||
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
        ![self isDemoFoldIndexPath:sourceIndexPath] ||
        ![self isDemoFoldIndexPath:destinationIndexPath]) return;
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

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self setSearchEnabled:NO];
}
#pragma mark —— lazyLoad
-(BaseButton *)userHeadBtn{
    if (!_userHeadBtn) {
        @jobs_weakify(self)
        _userHeadBtn = BaseButton
            .initByNormalImage(@"首页_头像".img)
            .bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
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
                            requestParams:viewModel]; // 测试专用
            })
            .onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .bySize(CGSizeMake(JobsWidth(32), JobsWidth(32)));
    };return _userHeadBtn;
}

-(UIButton *)functionMenuBtn{
    if (!_functionMenuBtn) {
        @jobs_weakify(self)
        UIColor *normalTintColor = HEXCOLOR(0x3D4A58);
        UIImage *normalMenuImage = [self functionMenuImageByTintColor:normalTintColor];
        UIImage *activeMenuImage = [self functionMenuImageByTintColor:HEXCOLOR(0x1D7FF2)];
        _functionMenuBtn = UIButton.jobsInit()
            .jobsResetBtnImage(normalMenuImage)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self toggleFunctionMenu];
            })
            .byTintColor(normalTintColor)
            .byBgColor(JobsClearColor)
            .bySize(CGSizeMake(JobsWidth(44), JobsWidth(44)));
        [_functionMenuBtn setImage:activeMenuImage
                           forState:UIControlStateSelected];
        [_functionMenuBtn setImage:activeMenuImage
                           forState:UIControlStateHighlighted];
        [_functionMenuBtn setImage:activeMenuImage
                           forState:UIControlStateSelected | UIControlStateHighlighted];
        _functionMenuBtn.adjustsImageWhenHighlighted = NO;
        _functionMenuBtn.adjustsImageWhenDisabled = NO;
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
    id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsOCDemoListDarkModeUserDefaultsKey];
    if (value) return [value boolValue];
    if (@available(iOS 13.0, *)) {
        return self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark;
    };return NO;
}

-(void)applyDemoListInterfaceStyle{
    if (@available(iOS 13.0, *)) {
        UIUserInterfaceStyle style = [self demoListDarkModeEnabled] ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight;
        for (UIWindow *window in UIApplication.sharedApplication.windows) {
            window.overrideUserInterfaceStyle = style;
        }
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
                .byRowHeight(JobsWidth(52))
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
                .byCornerRadius(JobsWidth(8))
                .byClipsToBounds(YES)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.navBar.mas_bottom);
                    make.right.equalTo(self.view).offset(-JobsWidth(12));
                    make.width.mas_equalTo(self.functionMenuTableWidth);
                    make.height.mas_equalTo(self.functionMenuTableHeight);
                });
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
            if (self.functionMenuTableView.hidden) return;
            CGPoint point = [gesture locationInView:self.view];
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
            view.byFrame(CGRectMake(0, 0, JobsMainScreen_WIDTH(), JobsWidth(56)))
                .byBgColor(JobsClearColor);
            self.demoSearchBar.byFrame(CGRectMake(JobsWidth(12),
                                                  JobsWidth(6),
                                                  JobsMainScreen_WIDTH() - JobsWidth(24),
                                                  JobsWidth(44)))
                .addOn(view);
        });
    };return _demoSearchHeaderView;
}

-(UISearchBar *)demoSearchBar{
    if (!_demoSearchBar) {
        _demoSearchBar = jobsMakeUISearchBar(^(__kindof UISearchBar *_Nullable searchBar) {
            searchBar
                .byPlaceholder(@"输入关键词搜索 Demo".tr)
                .byDelegate(self)
                .byShowsCancelButton(YES)
                .bySearchBarStyle(UISearchBarStyleMinimal)
                .byBackgroundImage(UIImage.new);
        });
    };return _demoSearchBar;
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
    };return [self demoSectionArrByFilteringPinnedFromSectionArr:result];
}

-(BOOL)hasPinnedDemoSection{
    return self.pinnedDemoMutArr.count > 0 && ![self demoSearchLandingActive];
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
        @"MultiTimer".inStr(key)) {
        return @"Timer".tr;
    }
    if (@"FMDB".inStr(key) ||
        @"Realm".inStr(key) ||
        @"YTK".inStr(key) ||
        @"CoreText".inStr(key) ||
        @"Excel".inStr(key) ||
        @"字符串".inStr(key) ||
        @"OCDynamic".inStr(key)) {
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
        @"CountryCode".inStr(key)) {
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
        @"Label".inStr(key) ||
        @"Btn".inStr(key) ||
        @"Button".inStr(key) ||
        @"Custom".inStr(key) ||
        @"JXCategory".inStr(key) ||
        @"Keyboard".inStr(key) ||
        @"键盘".inStr(key) ||
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
        @"PointLab".inStr(key)) {
        return @"UI 控件与动效".tr;
    }
    if (@"Door".inStr(key) ||
        @"Gesture".inStr(key) ||
        @"Post".inStr(key) ||
        @"IM".inStr(key) ||
        @"Protocol".inStr(key) ||
        @"CXB".inStr(key) ||
        @"用户".inStr(key)) {
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
        @"滑动开锁".inStr(key)) {
        return @"基础功能与导航容器".tr;
    };return @"其他".tr;
}

-(NSString *)sectionDescriptionForTitle:(NSString *)title{
    if ([title isEqualToString:@"Timer".tr]) {
        return @"Timer 在 OC / Swift 侧只是语言不同：OC 侧 JobsOCTimer、Swift 侧 JobsSwiftTimer，都是把系统 Timer / GCD / DisplayLink / RunLoop 的杂乱细节收口成少量参数。\n\n正计时和倒计时按钮已收口到 Timer Demo 列表页：先进入列表，再分别点击正计时 DemoVC 和倒计时按钮 DemoVC。\n\nTimerMgr 是多个 Timer 的统一注册表：OC 侧 JobsOCTimerMgr、Swift 侧 JobsSwiftTimerMgr，都按 identifier 管理 start / pause / resume / stop。\n\nJobsMarqueeView 用 JobsOCTimerMgr 做统一内核，把跑马灯和轮播图收口成同一个 UIScrollView + UIButton 数据源组件。";
    }else if ([title isEqualToString:@"直播项目相关".tr]){
        return @"对照 Swift 侧直播项目 Demo：直播间滚动留言保持应用层封装，直播推流用 AVFoundation 完成采集预览并预留 RTMP SDK 接入点。";
    }else if ([title isEqualToString:@"炫技特效".tr]){
        return @"对照 Swift 侧炫技特效 Demo：打马赛克拆成图片处理与手势涂抹组件，球形标签云复用老工程主工程内置的 XLSphereView。";
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
        case UIGestureRecognizerStateBegan:{
            NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:point];
            if ([self isPinnedDemoIndexPath:indexPath]) return;
            if ([self isDemoFoldInnerRowPoint:point
                                    indexPath:indexPath]) return;
            if (![self canDragDemoSectionAtIndexPath:indexPath]) return;
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            UIView *snapshotView = [cell snapshotViewAfterScreenUpdates:NO];
            snapshotView.frame = cell.frame;
            snapshotView.layer.shadowColor = JobsBlackColor.CGColor;
            snapshotView.layer.shadowOpacity = .18f;
            snapshotView.layer.shadowRadius = JobsWidth(10);
            snapshotView.layer.shadowOffset = CGSizeMake(0, JobsWidth(6));
            [self.tableView addSubview:snapshotView];
            self.demoSectionDragSnapshotView = snapshotView;
            self.demoSectionDragIndexPath = indexPath;
            self.demoSectionDragTouchOffsetY = point.y - CGRectGetMidY(cell.frame);
            cell.hidden = YES;
            NSObject.feedbackGenerator(nil);
            break;
        }
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
                visibleCell.hidden = NO;
            }
            [self.tableView cellForRowAtIndexPath:destinationIndexPath].hidden = YES;
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:{
            [self finishDemoSectionDrag];
            break;
        }
        default:
            break;
    }
}

-(BOOL)canDragDemoSectionAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath &&
           indexPath.section == self.demoFoldTableSection &&
           indexPath.row >= 0 &&
           indexPath.row < (NSInteger)self.visibleDemoSectionArr.count &&
           self.visibleDemoSectionArr.count > 1;
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
    [self moveExpandedDemoSectionStateFromRow:(NSUInteger)sourceRow
                                        toRow:(NSUInteger)destinationRow];
}

-(void)finishDemoSectionDrag{
    if (!self.demoSectionDragSnapshotView) return;
    NSIndexPath *indexPath = self.demoSectionDragIndexPath;
    UITableViewCell *cell = indexPath ? [self.tableView cellForRowAtIndexPath:indexPath] : nil;
    void (^clearState)(void) = ^{
        cell.hidden = NO;
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
    [UIView animateWithDuration:.2f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
        self.demoSectionDragSnapshotView.frame = cell.frame;
    } completion:^(BOOL finished) {
        clearState();
    }];
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
    if (!orderArr.count || _demoSectionMutArr.count < 2) return;
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

-(void)saveDemoSectionOrder{
    NSMutableArray <NSString *>*orderMutArr = NSMutableArray.array;
    for (JobsOCDemoSectionModel *sectionModel in self.demoSectionMutArr) {
        if (sectionModel.title.length) [orderMutArr addObject:sectionModel.title];
    }
    [NSUserDefaults.standardUserDefaults setObject:orderMutArr.copy
                                           forKey:JobsOCDemoListSectionOrderUserDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
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
    CGFloat maxTextWidth = 0;
    NSDictionary *attributes = @{NSFontAttributeName: UIFontWeightRegularSize(15)};
    for (NSString *title in self.functionMenuTitles) {
        CGFloat width = ceil([title sizeWithAttributes:attributes].width);
        maxTextWidth = MAX(maxTextWidth, width);
    };return MAX(JobsWidth(112), maxTextWidth + JobsWidth(48));
}

-(CGFloat)functionMenuTableHeight{
    return JobsWidth(52) * self.functionMenuTitles.count;
}

-(UIImage *)functionMenuImageByTintColor:(UIColor *)tintColor{
    UIImage *image = @"ellipsis.circle.fill".sys_img;
    if (@available(iOS 13.0, *)) {
        return [image imageWithTintColor:tintColor
                           renderingMode:UIImageRenderingModeAlwaysOriginal];
    };return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

-(void)toggleFunctionMenu{
    [self showFunctionMenu:self.functionMenuTableView.hidden];
}

-(void)showFunctionMenu:(BOOL)show{
    self.functionMenuBtn.selected = show;
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

-(void)deleteDemoSearchHistoryByButton:(UIButton *)button{
    [self deleteDemoSearchHistoryAtIndex:button.tag];
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

-(void)updateLocalizedContent{
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(@"演武堂".tr);
            data.byFont(UIFontWeightRegularSize(16));
        })
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

-(void)reloadLocalizedDemoListContent{
    self.demoListRenderedLanguage = LanMgr.language;
    [self updateLocalizedContent];
    self.navBar.titleLab.byText(self.viewModel.textModel.text);
    if (_demoSearchBar) {
        _demoSearchBar.byPlaceholder(@"输入关键词搜索 Demo".tr);
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
            .byTextCor(HEXCOLOR(0xB0B0B0))
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
        model.byTitle(@"JobsOCCountryCodeCtrl".tr)
             .bySubTitle(@"国家 / 地区代码选择".tr)
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
        viewModel.subTextModel.byText(self.selectedCountryCodePlainText);
        viewModel.subTextModel.byAttributedTitle(self.selectedCountryCodeAttributedText);
    }else{
        viewModel.subTextModel.byText(@"国家 / 地区代码选择".tr);
        viewModel.subTextModel.byAttributedTitle(nil);
    }
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
                model.byTitle(@"JobsNavigationDemoVC".tr)
                     .bySubTitle(@"系统导航栏".tr)
                     .byCls(JobsNavigationDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Timer Demo 列表".tr)
                     .bySubTitle(@"进入列表后分别查看正计时和倒计时按钮 DemoVC".tr)
                     .byCls(JobsTimerDemoListVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"模拟时钟".tr)
                     .bySubTitle(@"JobsClockView：基于 Timer 驱动的模拟时钟".tr)
                     .byCls(JobsClockDemoVC.class);
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
                model.byTitle(@"CalendarVC".tr)
                     .bySubTitle(@"日历功能".tr)
                     .byCls(CalendarVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsVerticalMenuMainVC".tr)
                     .bySubTitle(@"竖形菜单选择功能".tr)
                     .byCls(JobsVerticalMenuMainVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsLinkageMenuViewDemoVC".tr)
                     .bySubTitle(@"首页联动切换子页面：左侧 UIScrollView 菜单联动右侧 UIView 内容".tr)
                     .byCls(JobsLinkageMenuViewDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsOCRefresher".tr)
                     .bySubTitle(@"横向 / 纵向刷新与加载更多".tr)
                     .byCls(JobsOCRefresherDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsViewPushDemoVC".tr)
                     .bySubTitle(@"让 UIView 像 UINavigationController 支持上下左右 Push/Pop、比例覆盖和原路交互退出".tr)
                     .byCls(JobsViewPushDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsOCKeyboardMgr".tr)
                     .bySubTitle(@"键盘遮挡处理".tr)
                     .byCls(JobsOCKeyboardMgrDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsGraphicCaptcha".tr)
                     .bySubTitle(@"图形验证码：数字 / 英文 / 汉字 / 混合随机".tr)
                     .byCls(JobsGraphicCaptchaDemoVC.class);
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
                model.byTitle(@"Excel".tr)
                     .bySubTitle(@"Excel".tr)
                     .byCls(ExcelVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JXCategoryViewVerticalShowVC".tr)
                     .bySubTitle(@"JXCategoryView垂直表达".tr)
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
                model.byTitle(@"文本前有小圆点".tr)
                     .bySubTitle(@"包括对齐".tr)
                     .byCls(PointLabTestVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"iOS Widget".tr)
                     .bySubTitle(@"".tr)
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
                model.byTitle(@"JobsAppDoor-1".tr)
                     .bySubTitle(@"登录注册的第一种表现形式".tr)
                     .byCls(JobsAppDoorVC.class)
                     .byRequestParams(@(JobsAppDoorBgType_Video));
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsAppDoor-2".tr)
                     .bySubTitle(@"登录注册的第二种表现形式".tr)
                     .byCls(JobsAppDoorVC_Style2.class)
                     .byRequestParams(@(JobsAppDoorBgType_Video));
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Douyin_ZFPlayer_1".tr)
                     .bySubTitle(@"播放效果 1".tr)
                     .byCls(Douyin_ZFPlayerVC_1.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"Douyin_ZFPlayer_2".tr)
                     .bySubTitle(@"播放效果 2".tr)
                     .byCls(Douyin_ZFPlayerVC_2.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"TransparentRegion".tr)
                     .bySubTitle(@"镂空特效".tr)
                     .byCls(TransparentRegionVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🧩 打马赛克".tr)
                     .bySubTitle(@"整图粗细 / 手势涂抹两种马赛克效果".tr)
                     .byCls(JobsMosaicDemoListVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🌍 球形特效（可拖动点选）".tr)
                     .bySubTitle(@"XLSphereView：拖动旋转、惯性滚动、点按标签".tr)
                     .byCls(JobsSphereDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsOCComment".tr)
                     .bySubTitle(@"评论 Pod：网易 / 今日头条 / 自定义三种回复模式".tr)
                     .byCls(JobsOCCommentDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsOCSearcher".tr)
                     .bySubTitle(@"搜索功能".tr)
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
                model.byTitle(@"DynamicView".tr)
                     .bySubTitle(@"Gif图片读取".tr)
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
                model.byTitle(@"🟩⬜⬜ 系统进度条".tr)
                     .bySubTitle(@"UIProgressView + JobsOCTimer 倒计时".tr)
                     .byCls(JobsSysProgressDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"🟩🟩⬜ 自定义进度条（进度值+前进方向）".tr)
                     .bySubTitle(@"JobsProgressBar：进度值、方向、拖动和自动进度".tr)
                     .byCls(JobsProgressDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"IrregularView".tr)
                     .bySubTitle(@"不规则的按钮".tr)
                     .byCls(TestIrregularViewTestVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsIMShowVC".tr)
                     .bySubTitle(@"IM模块".tr)
                     .byCls(JobsIMShowVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"TestLabelVC".tr)
                     .bySubTitle(@"Label的科学管理".tr)
                     .byCls(TestLabelVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsDropDownListVC".tr)
                     .bySubTitle(@"👇🏻下拉列表".tr)
                     .byCls(JobsDropDownListVC.class);
            })))
            .add(self.jobs_countryCodeDemoViewModel)
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"YTKNetworkStudyVC".tr)
                     .bySubTitle(@"探究猿题库网络框架（YTKNetwork）".tr)
                     .byCls(YTKNetworkStudyVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"CoreTextLearningVC".tr)
                     .bySubTitle(@"探究CoreText".tr)
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
                model.byTitle(@"JobsSettingGestureVC".tr)
                     .bySubTitle(@"设置手势密码".tr)
                     .byCls(JobsSettingGestureVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"CXBVC".tr)
                     .bySubTitle(@"CXB自研科技".tr)
                     .byCls(CXBVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"OCDynamicRegisterVC".tr)
                     .bySubTitle(@"OC动态添加类、方法列表、属性列表".tr)
                     .byCls(OCDynamicRegisterVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JXCategoryViewWithHeaderViewVC".tr)
                     .bySubTitle(@"JXCategoryView下拉放大头部视图".tr)
                     .byCls(JXCategoryViewWithHeaderViewVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"UILabelWordRotatingVC".tr)
                     .bySubTitle(@"UILabel文字旋转".tr)
                     .byCls(UILabelWordRotatingVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"TestBaseLabelVC".tr)
                     .bySubTitle(@"测试 -BaseLabel-".tr)
                     .byCls(TestBaseLabelVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"RandomTestVC".tr)
                     .bySubTitle(@"随机数测试模块".tr)
                     .byCls(RandomTestVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"CustomTableViewCellVC".tr)
                     .bySubTitle(@"自定义UITableViewCell内置控件距离并添加复制按钮".tr)
                     .byCls(CustomTableViewCellVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"CustomBtnVC".tr)
                     .bySubTitle(@"自定义UIButton子控件的排布".tr)
                     .byCls(CustomBtnVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"GXCardViewDemoVC".tr)
                     .bySubTitle(@"卡片式布局(探探附近/QQ配对)，可以设置卡片堆叠效果，可以设置循环效果".tr)
                     .byCls(GXCardViewDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsWalletVC".tr)
                     .bySubTitle(@"UICollectionView实现重叠的卡包效果".tr)
                     .byCls(JobsWalletVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsScrollViewVC".tr)
                     .bySubTitle(@"在指定的y区间内滑动视图(带吸边效果)".tr)
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
                model.byTitle(@"ProtocolKitVC")
                     .bySubTitle(@"Objective-C中实现协议扩展".tr)
                     .byCls(ProtocolKitVC.class);
            })));
        });
    };return _dataMutArr;
}

@end
