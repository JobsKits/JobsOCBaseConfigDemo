//
//  ViewController@1.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ViewController@1.h"

BOOL ISLogin;
static NSString *const JobsOCSplashEnabledUserDefaultsKey = @"com.BSports.JobsOCSplashEnabledUserDefaultsKey";
static NSString *const JobsOCFunctionMenuCellReuseIdentifier = @"UITableViewCell";

@interface JobsOCDemoSectionModel : NSObject

Prop_copy()NSString *title;
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

+(instancetype)sectionWithTitle:(NSString *)title;

@end

@implementation JobsOCDemoSectionModel

+(instancetype)sectionWithTitle:(NSString *)title{
    JobsOCDemoSectionModel *sectionModel = JobsOCDemoSectionModel.new;
    sectionModel.title = title;
    return sectionModel;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
    };return _dataMutArr;
}

@end

@interface ViewController_1 ()
/// UI
Prop_strong()BaseButton *userHeadBtn;
Prop_strong()UIButton *splashSwitchBtn;
Prop_strong()UIButton *functionMenuBtn;
Prop_strong()UITableView *functionMenuTableView;
Prop_strong()UIView *demoSearchHeaderView;
Prop_strong()UISearchBar *demoSearchBar;
/// Data
Prop_strong()NSMutableArray <__kindof UITableViewCell *>*tbvCellMutArr;
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;
Prop_strong()NSMutableArray <JobsOCDemoSectionModel *>*demoSectionMutArr;
Prop_copy()NSString *demoSearchKeyword;

-(BOOL)jobsOCSplashEnabled;
-(void)setJobsOCSplashEnabled:(BOOL)jobsOCSplashEnabled;
-(NSString *)splashSwitchTitle;
-(NSArray <JobsOCDemoSectionModel *>*)visibleDemoSectionArr;
-(UIViewModel *)viewModelAtIndexPath:(NSIndexPath *)indexPath;
-(BOOL)viewModel:(UIViewModel *)viewModel containsKeyword:(NSString *)keyword;
-(NSString *)sectionTitleForViewModel:(UIViewModel *)viewModel;
-(JobsOCDemoSectionModel *)sectionModelInArr:(NSMutableArray <JobsOCDemoSectionModel *>*)data
                                       title:(NSString *)title;
-(NSArray <NSString *>*)functionMenuTitles;
-(void)toggleFunctionMenu;
-(void)showFunctionMenu:(BOOL)show;
-(void)setSearchEnabled:(BOOL)enabled;
-(BOOL)demoSearchActive;
-(void)foldAllDemoSections;
-(void)unfoldAllDemoSections;
-(void)demoSectionHeaderTap:(UITapGestureRecognizer *)tap;

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
    
    {
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".tr);
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byTextCor(HEXCOLOR(0x3D4A58));
                data.byText(@"相关功能列表".tr);
                data.byFont(UIFontWeightRegularSize(16));
            })
        
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
                //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);    }
    /// 装填用户信息数据
    /// json生成器 ： https://www.site24x7.com/zhcn/tools/json-generator.html
    self.saveUserInfo(JobsUserModel.byData(@"UserData".readLocalFileWithName));// 保存全局唯一的一份用户档案
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
    [self foldAllDemoSections];
    self.functionMenuTableView.byHidden(YES);
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
    if (_dataMutArr.count) {
        [self.dataMutArr removeAllObjects];
        _dataMutArr = nil;
        _demoSectionMutArr = nil;
        _tbvCellMutArr = nil;
    }
    [self foldAllDemoSections];
    [self.tableView.mj_header beginRefreshing];
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
    return self.visibleDemoSectionArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _functionMenuTableView) return JobsWidth(44);
    return JobsBaseTableViewCell.cellHeightByModel([self viewModelAtIndexPath:indexPath]) * 3;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    if (tableView == _functionMenuTableView) return CGFLOAT_MIN;
    return MSCommentTableHeaderFooterView.heightForHeaderInSection(nil);
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    if (tableView == _functionMenuTableView) return UIView.new;
    JobsOCDemoSectionModel *sectionModel = self.visibleDemoSectionArr[section];
    BOOL folded = [tableView ww_isSectionFolded:section];
    NSString *title = [NSString stringWithFormat:@"%@ %@ (%lu)",
                       folded ? @"▶︎" : @"▼",
                       sectionModel.title,
                       (unsigned long)sectionModel.dataMutArr.count];
    UIViewModel *headerModel = self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
        model.byTitle(title.tr)
             .bySubTitle(@"");
    }));
    headerModel.byTextCor(HEXCOLOR(0x3D4A58))
        .byFont(UIFontWeightRegularSize(15));
    MSCommentTableHeaderFooterView *headerView = MSCommentTableHeaderFooterView.initByReuseIdentifier(tableView,@"")
        .byStyle(JobsHeaderViewStyle)
        .bySection(section)
        .JobsRichViewByModel2(headerModel);
    headerView
        .byTag(section)
        .byUserInteractionEnabled(YES);
    headerView.contentView.byBgColor(RGBA_COLOR(255, 238, 221, 1));
    for (UIGestureRecognizer *gesture in headerView.gestureRecognizers) {
        [headerView removeGestureRecognizer:gesture];
    }
    headerView.byAddGestureRecognizer([[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(demoSectionHeaderTap:)]);
    return headerView;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _functionMenuTableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self showFunctionMenu:NO];
        if (indexPath.row == 0) {
            [self setSearchEnabled:YES];
        }else{
            [self setJobsOCSplashEnabled:![self jobsOCSplashEnabled]];
            [self.functionMenuTableView reloadData];
            ([self jobsOCSplashEnabled] ? @"下次打开开屏".tr : @"下次关闭开屏".tr).toast();
        };return;
    }
    UIViewModel *viewModel = [self viewModelAtIndexPath:indexPath];
    if (viewModel.cls) {
        self.comingToPushVCByRequestParams(viewModel.cls.new,
                                           viewModel);
    }else @"尚未接入此功能".tr.toast();
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    if (tableView == _functionMenuTableView) return self.functionMenuTitles.count;
    return self.visibleDemoSectionArr[section].dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _functionMenuTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCFunctionMenuCellReuseIdentifier
                                                                forIndexPath:indexPath];
        return cell
            .byTextLabel(^(__kindof UILabel * _Nullable label) {
                label.byText(self.functionMenuTitles[indexPath.row])
                    .byFont(UIFontWeightRegularSize(15));
            })
            .bySelectionStyle(UITableViewCellSelectionStyleDefault);
    }
    JobsBaseTableViewCell *cell = JobsBaseTableViewCell.cellStyleValue1ByTableView(tableView);
    cell.JobsRichViewByModel2([self viewModelAtIndexPath:indexPath]);
    return cell;
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
    self.demoSearchKeyword = searchText;
    if ([self demoSearchActive]) {
        [self unfoldAllDemoSections];
    }else{
        [self foldAllDemoSections];
    }
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
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

-(UIButton *)splashSwitchBtn{
    if (!_splashSwitchBtn) {
        @jobs_weakify(self)
        _splashSwitchBtn = UIButton.jobsInit()
            .byTitle([self splashSwitchTitle])
            .byTitleCor(HEXCOLOR(0x3D4A58))
            .byTitleFont(UIFontWeightRegularSize(13))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self setJobsOCSplashEnabled:![self jobsOCSplashEnabled]];
                x.byTitle([self splashSwitchTitle]);
                ([self jobsOCSplashEnabled] ? @"下次打开开屏".tr : @"下次关闭开屏".tr).toast();
            })
            .byBgColor(JobsClearColor)
            .bySize(CGSizeMake(JobsWidth(82), JobsWidth(32)));
    };return _splashSwitchBtn;
}

-(UIButton *)functionMenuBtn{
    if (!_functionMenuBtn) {
        @jobs_weakify(self)
        _functionMenuBtn = UIButton.jobsInit()
            .byTitle(@"功能".tr)
            .byTitleCor(HEXCOLOR(0x3D4A58))
            .byTitleFont(UIFontWeightRegularSize(13))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self toggleFunctionMenu];
            })
            .byBgColor(JobsClearColor)
            .bySize(CGSizeMake(JobsWidth(58), JobsWidth(32)));
    };return _functionMenuBtn;
}

-(BOOL)jobsOCSplashEnabled{
    id value = [NSUserDefaults.standardUserDefaults objectForKey:JobsOCSplashEnabledUserDefaultsKey];
    return value ? [value boolValue] : YES;
}

-(void)setJobsOCSplashEnabled:(BOOL)jobsOCSplashEnabled{
    [NSUserDefaults.standardUserDefaults setBool:jobsOCSplashEnabled
                                          forKey:JobsOCSplashEnabledUserDefaultsKey];
    [NSUserDefaults.standardUserDefaults synchronize];
}

-(NSString *)splashSwitchTitle{
    return [self jobsOCSplashEnabled] ? @"开屏：开".tr : @"开屏：关".tr;
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
                .byScrollEnabled(NO)
                .byCornerRadius(JobsWidth(8))
                .byClipsToBounds(YES)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.navBar.mas_bottom).offset(JobsWidth(6));
                    make.right.equalTo(self.view).offset(-JobsWidth(12));
                    make.width.mas_equalTo(JobsWidth(160));
                    make.height.mas_equalTo(JobsWidth(44) * self.functionMenuTitles.count);
                });
        });
    };return _functionMenuTableView;
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
            tableView.bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .bySeparatorColor(HEXCOLOR(0xEEE2C8))
                .registerHeaderFooterViewClass(MSCommentTableHeaderFooterView.class,nil)
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0))
                .byTableFooterView(jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
                    label
                        .byText(@"- 没有更多的内容了 -".tr)
                        .byFont(UIFontWeightRegularSize(12))
                        .byTextAlignment(NSTextAlignmentCenter)
                        .byTextCor(HEXCOLOR(0xB0B0B0))
                        .makeLabelByShowingType(UILabelShowingType_03);
                }))/// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .emptyDataByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.byTitle(@"NO MESSAGES FOUND".tr)
                        .byTitleCor(JobsWhiteColor)
                        .byTitleFont(bayonRegular(JobsWidth(30)))
                        .byNormalImage(@"小狮子".img);
                }))
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
                .byBgColor(JobsClearColor);
            tableView.ww_foldable = YES;

            if(@available(iOS 11.0, *)) {
                tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }else{
                SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
            }

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
            [self make:make topOffset:10];
        });
    };return _tableView;
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
    NSString *keyword = [self.demoSearchKeyword stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (!keyword.length) return self.demoSectionMutArr;
    NSMutableArray <JobsOCDemoSectionModel *>*result = NSMutableArray.array;
    for (JobsOCDemoSectionModel *sectionModel in self.demoSectionMutArr) {
        JobsOCDemoSectionModel *filteredSectionModel = [JobsOCDemoSectionModel sectionWithTitle:sectionModel.title];
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

-(UIViewModel *)viewModelAtIndexPath:(NSIndexPath *)indexPath{
    return self.visibleDemoSectionArr[indexPath.section].dataMutArr[indexPath.row];
}

-(BOOL)viewModel:(UIViewModel *)viewModel containsKeyword:(NSString *)keyword{
    NSString *title = viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text ?: @"";
    NSString *subTitle = viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text ?: @"";
    NSString *clsName = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
    return [title localizedCaseInsensitiveContainsString:keyword] ||
           [subTitle localizedCaseInsensitiveContainsString:keyword] ||
           [clsName localizedCaseInsensitiveContainsString:keyword];
}

-(NSString *)sectionTitleForViewModel:(UIViewModel *)viewModel{
    NSString *title = viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text ?: @"";
    NSString *subTitle = viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text ?: @"";
    NSString *clsName = viewModel.cls ? NSStringFromClass(viewModel.cls) : @"";
    NSString *key = [NSString stringWithFormat:@"%@ %@ %@",title,subTitle,clsName];
    if ([key localizedCaseInsensitiveContainsString:@"FMDB"] ||
        [key localizedCaseInsensitiveContainsString:@"Realm"] ||
        [key localizedCaseInsensitiveContainsString:@"YTK"] ||
        [key localizedCaseInsensitiveContainsString:@"CoreText"] ||
        [key localizedCaseInsensitiveContainsString:@"Excel"] ||
        [key localizedCaseInsensitiveContainsString:@"字符串"] ||
        [key localizedCaseInsensitiveContainsString:@"OCDynamic"]) {
        return @"数据、网络与文本".tr;
    }
    if ([key localizedCaseInsensitiveContainsString:@"ZFPlayer"] ||
        [key localizedCaseInsensitiveContainsString:@"Douyin"] ||
        [key localizedCaseInsensitiveContainsString:@"相册"] ||
        [key localizedCaseInsensitiveContainsString:@"DynamicView"] ||
        [key localizedCaseInsensitiveContainsString:@"Progress"] ||
        [key localizedCaseInsensitiveContainsString:@"Widget"] ||
        [key localizedCaseInsensitiveContainsString:@"AppIcon"] ||
        [key localizedCaseInsensitiveContainsString:@"本地推送"] ||
        [key localizedCaseInsensitiveContainsString:@"剪切板"] ||
        [key localizedCaseInsensitiveContainsString:@"热更新"] ||
        [key localizedCaseInsensitiveContainsString:@"多语言"] ||
        [key localizedCaseInsensitiveContainsString:@"CountryCode"]) {
        return @"系统能力与多媒体".tr;
    }
    if ([key localizedCaseInsensitiveContainsString:@"UITableView"] ||
        [key localizedCaseInsensitiveContainsString:@"Cell"] ||
        [key localizedCaseInsensitiveContainsString:@"Label"] ||
        [key localizedCaseInsensitiveContainsString:@"Btn"] ||
        [key localizedCaseInsensitiveContainsString:@"Button"] ||
        [key localizedCaseInsensitiveContainsString:@"Custom"] ||
        [key localizedCaseInsensitiveContainsString:@"JXCategory"] ||
        [key localizedCaseInsensitiveContainsString:@"DropDown"] ||
        [key localizedCaseInsensitiveContainsString:@"Search"] ||
        [key localizedCaseInsensitiveContainsString:@"Comment"] ||
        [key localizedCaseInsensitiveContainsString:@"Wallet"] ||
        [key localizedCaseInsensitiveContainsString:@"Card"] ||
        [key localizedCaseInsensitiveContainsString:@"Irregular"] ||
        [key localizedCaseInsensitiveContainsString:@"Transparent"] ||
        [key localizedCaseInsensitiveContainsString:@"Lottery"] ||
        [key localizedCaseInsensitiveContainsString:@"Shadow"] ||
        [key localizedCaseInsensitiveContainsString:@"Masonry"] ||
        [key localizedCaseInsensitiveContainsString:@"PointLab"]) {
        return @"UI 控件与动效".tr;
    }
    if ([key localizedCaseInsensitiveContainsString:@"Door"] ||
        [key localizedCaseInsensitiveContainsString:@"Gesture"] ||
        [key localizedCaseInsensitiveContainsString:@"Post"] ||
        [key localizedCaseInsensitiveContainsString:@"IM"] ||
        [key localizedCaseInsensitiveContainsString:@"Protocol"] ||
        [key localizedCaseInsensitiveContainsString:@"CXB"] ||
        [key localizedCaseInsensitiveContainsString:@"用户"]) {
        return @"业务模块与页面".tr;
    }
    if ([key localizedCaseInsensitiveContainsString:@"TabBar"] ||
        [key localizedCaseInsensitiveContainsString:@"Navigation"] ||
        [key localizedCaseInsensitiveContainsString:@"Scroll"] ||
        [key localizedCaseInsensitiveContainsString:@"VerticalMenu"] ||
        [key localizedCaseInsensitiveContainsString:@"ViewPush"] ||
        [key localizedCaseInsensitiveContainsString:@"Landscape"] ||
        [key localizedCaseInsensitiveContainsString:@"Clock"] ||
        [key localizedCaseInsensitiveContainsString:@"Timer"] ||
        [key localizedCaseInsensitiveContainsString:@"Calendar"] ||
        [key localizedCaseInsensitiveContainsString:@"滑动开锁"]) {
        return @"基础功能与导航容器".tr;
    };return @"其他".tr;
}

-(JobsOCDemoSectionModel *)sectionModelInArr:(NSMutableArray <JobsOCDemoSectionModel *>*)data
                                       title:(NSString *)title{
    for (JobsOCDemoSectionModel *sectionModel in data) {
        if ([sectionModel.title isEqualToString:title]) return sectionModel;
    }
    JobsOCDemoSectionModel *sectionModel = [JobsOCDemoSectionModel sectionWithTitle:title];
    [data addObject:sectionModel];
    return sectionModel;
}

-(NSArray <NSString *>*)functionMenuTitles{
    return @[@"搜索 Demo".tr,[self splashSwitchTitle]];
}

-(void)toggleFunctionMenu{
    [self showFunctionMenu:self.functionMenuTableView.hidden];
}

-(void)showFunctionMenu:(BOOL)show{
    self.functionMenuBtn.selected = show;
    self.functionMenuTableView.byHidden(!show);
    if (show) {
        [self.functionMenuTableView reloadData];
        [self.view bringSubviewToFront:self.functionMenuTableView];
    }
}

-(void)setSearchEnabled:(BOOL)enabled{
    self.tableView.tableHeaderView = enabled ? self.demoSearchHeaderView : nil;
    if (enabled) {
        [self.demoSearchBar becomeFirstResponder];
    }else{
        self.demoSearchKeyword = @"";
        self.demoSearchBar.byText(@"");
        [self.demoSearchBar resignFirstResponder];
        [self foldAllDemoSections];
        [self.tableView reloadData];
    }
}

-(BOOL)demoSearchActive{
    NSString *keyword = [self.demoSearchKeyword stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    return keyword.length > 0;
}

-(void)foldAllDemoSections{
    if ([self demoSearchActive]) return;
    [self.visibleDemoSectionArr enumerateObjectsUsingBlock:^(JobsOCDemoSectionModel * _Nonnull obj,
                                                             NSUInteger idx,
                                                             BOOL * _Nonnull stop) {
        [self.tableView ww_foldSection:idx
                                  fold:YES];
    }];
}

-(void)unfoldAllDemoSections{
    [self.visibleDemoSectionArr enumerateObjectsUsingBlock:^(JobsOCDemoSectionModel * _Nonnull obj,
                                                             NSUInteger idx,
                                                             BOOL * _Nonnull stop) {
        [self.tableView ww_foldSection:idx
                                  fold:NO];
    }];
}

-(void)demoSectionHeaderTap:(UITapGestureRecognizer *)tap{
    NSInteger section = tap.view.tag;
    [self.tableView ww_foldSection:section
                              fold:![self.tableView ww_isSectionFolded:section]];
}

-(NSMutableArray<JobsOCDemoSectionModel *> *)demoSectionMutArr{
    if (!_demoSectionMutArr) {
        _demoSectionMutArr = NSMutableArray.array;
        for (UIViewModel *viewModel in self.dataMutArr) {
            NSString *sectionTitle = [self sectionTitleForViewModel:viewModel];
            [[self sectionModelInArr:_demoSectionMutArr
                                title:sectionTitle].dataMutArr addObject:viewModel];
        }
    };return _demoSectionMutArr;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"模拟时钟".tr)
                     .bySubTitle(@"模拟时钟".tr)
                     .byCls(JobsClockDemoVC.class);
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
                model.byTitle(@"JobsNavigationDemoVC".tr)
                     .bySubTitle(@"系统导航栏".tr)
                     .byCls(JobsNavigationDemoVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsScrollLabelVC".tr)
                     .bySubTitle(@"当文本超出的时候，滚动展现文字的Label".tr)
                     .byCls(JobsScrollLabelVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsTimer".tr)
                     .bySubTitle(@"☀️时间模块".tr)
                     .byCls(JobsTimerVC.class);
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
                model.byTitle(@"JobsViewPushDemoVC".tr)
                     .bySubTitle(@"让 UIView 像 UINavigationController 支持上下左右 Push/Pop、比例覆盖和原路交互退出".tr)
                     .byCls(JobsViewPushDemoVC.class);
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
                model.byTitle(@"iOS 多语言切换".tr)
                     .bySubTitle(@"".tr)
                     .byCls(AppLanguageVC.class);
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
                model.byTitle(@"幸运轮盘".tr)
                     .bySubTitle(@"中间有抽奖按钮".tr)
                     .byCls(LotteryVC.class);
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
                     .byCls(PeekAndPopVC.class);
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
                model.byTitle(@"JobsComment".tr)
                     .bySubTitle(@"📃评论功能".tr)
                     .byCls(JobsCommentVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsSearch".tr)
                     .bySubTitle(@"🔍搜索功能".tr)
                     .byCls(JobsSearchVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"ShadowTBVCell".tr)
                     .bySubTitle(@"");
                // model.cls = nil;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"相册选取图片和视频".tr)
                     .bySubTitle(@"".tr)
                     .byCls(JobsShootingVC.class);
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
                model.byTitle(@"IrregularView".tr)
                     .bySubTitle(@"不规则的按钮".tr)
                     .byCls(TestIrregularViewTestVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsTimerTestVC".tr)
                     .bySubTitle(@"🌛JobsTimer模块测试".tr)
                     .byCls(NSTimerManagerTestVC.class);
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
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsOCCountryCodeCtrl".tr)
                     .bySubTitle(@"国家 / 地区代码选择".tr)
                     .byCls(JobsOCCountryCodeCtrlDemoVC.class);
            })))
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
                model.byTitle(@"UITableViewCellEditorVC".tr)
                     .bySubTitle(@"替换系统UITableViewCell编辑状态下前面的按钮UI样式，及其一部分逻辑".tr)
                     .byCls(UITableViewCellEditorVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsSettingGestureVC".tr)
                     .bySubTitle(@"设置手势密码".tr)
                     .byCls(JobsSettingGestureVC.class);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"JobsTestVC".tr)
                     .bySubTitle(@"进行测试的一个控制器".tr)
                     .byCls(JobsTestVC.class);
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
                model.byTitle(@"UITBVCellFoldVC")
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
