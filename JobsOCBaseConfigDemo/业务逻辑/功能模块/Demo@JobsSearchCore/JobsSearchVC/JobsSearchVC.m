//
//  JobsSearchVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsSearchVC.h"

@interface JobsSearchVC ()
/// UI
Prop_strong()BaseButton *scanBtn;
Prop_strong()JobsSearchBar *jobsSearchBar;
Prop_strong()JobsDropDownListView *dropDownListView;
/// Data
Prop_strong()NSMutableArray <__kindof UIViewModel *>*sectionTitleMutArr;
Prop_strong()NSMutableArray <__kindof UIViewModel *>*hotSearchMutArr;
Prop_strong()NSMutableArray <__kindof UIViewModel *>*listViewData;
Prop_strong()NSMutableArray <__kindof UIViewModel *>*searchResultMutArr;
Prop_strong()UIColor *bgColour;
Prop_copy()NSString *titleStr;//标题
Prop_assign()CGRect tableViewRect;
Prop_assign()CGFloat gk_navigationBarHeight;
Prop_assign()HotSearchStyle hotSearchStyle;

@end

@implementation JobsSearchVC

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
    [self endDropDownListView];
}

-(void)loadView{
    [super loadView];

    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }

    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(data.attributedTitle.string);
            data.byFont(UIFontWeightRegularSize(16));
        })

        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
    self.isHiddenNavigationBar = YES;
    self.isOpenLetterCase = YES;/// 模糊查询时，是否开启输入字母大小写检测？默认开启
    self.hotSearchStyle = HotSearchStyle_2;

    self.gk_interactivePopDisabled = NO;
    self.gk_fullScreenPopDisabled = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    @jobs_weakify(self)
//    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
//        @jobs_strongify(self)
////        data.add(UIBarButtonItem.initBy(self.aboutBtn));
//    });
//    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
//        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.scanBtn));
//    });
//    self.makeNavByAlpha(1);

    self.getTabBar.byHidden(YES);

    self.tableView.byShow(self);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView.mj_header beginRefreshing];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    /// 加在这里，否则要停顿一秒左右才移除
    [self endDropDownListView];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self endDropDownListView];
}
#pragma mark —— 一些私有化方法
/// 数据包装
-(JobsRetViewModelByStringBlock _Nonnull)makeViewModelBy{
    return ^__kindof UIViewModel *_Nullable(NSString *_Nullable data){
        return jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.byText(data)
                               .byTextCor(JobsRandomColor);
            viewModel.byBgCor(JobsRandomColor);
            viewModel.textModel.byFont(JobsFontRegular(20));
        });
    };
}
/// 移除掉这个下拉列表
-(void)endDropDownListView{
//    [self.view endEditing:YES];
    jobsByCtrlBlock disappearBlock = _dropDownListView.dropDownListViewDisappear;
    if (disappearBlock) disappearBlock(nil);
    _dropDownListView = nil;
}
/// 逐字搜索功能
-(void)searchByString:(NSString *)string{
    NSString *keyword = [self searchTextBy:string];
    [self.searchResultMutArr removeAllObjects];
    if (!keyword.length) {
        [self endDropDownListView];
        return;
    }

    for (UIViewModel *viewModel in self.searchSourceMutArr) {
        NSString *text = [self searchTextBy:viewModel];
        if ([self searchText:text matchesKeyword:keyword]) {
            self.searchResultMutArr.add(viewModel);
        }
    }
    if (!self.searchResultMutArr.count) {
        self.searchResultMutArr.add(self.makeViewModelBy(keyword));
    }[self showSearchResultDropDownListView];
}

-(NSString *)searchTextBy:(id)data{
    NSString *text = @"";
    if ([data isKindOfClass:NSString.class]) {
        text = (NSString *)data;
    } else if ([data isKindOfClass:UIViewModel.class]) {
        UIViewModel *viewModel = (UIViewModel *)data;
        text = viewModel.textModel.text;
    };return [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] ? : @"";
}

-(BOOL)searchText:(NSString *)text
   matchesKeyword:(NSString *)keyword{
    if (!text.length || !keyword.length) return NO;
    return self.isOpenLetterCase ? [text.lowercaseString containsString:keyword.lowercaseString] : [text containsString:keyword];
}

-(NSMutableArray <UIViewModel *>*)searchSourceMutArr{
    NSMutableArray <UIViewModel *>*data = NSMutableArray.array;
    NSArray <NSArray <UIViewModel *>* >*sourceGroups = @[self.hotSearchMutArr,self.listViewData];
    for (NSArray <UIViewModel *>*source in sourceGroups) {
        for (UIViewModel *viewModel in source) {
            if (![self filtrationData:viewModel
                            atDataArr:data
                       byPropertyName:@"text"]) {
                data.add(viewModel);
            }
        }
    };return data;
}

-(void)showSearchResultDropDownListView{
    [self endDropDownListView];
    if (!self.searchResultMutArr.count) return;
    @jobs_weakify(self)
    self.dropDownListView = [self motivateFromView:self.jobsSearchBar
                     jobsDropDownListViewDirection:JobsDropDownListViewDirection_Down
                                              data:self.searchResultMutArr
                                motivateViewOffset:JobsWidth(5)
                                       finishBlock:^(UIViewModel *data) {
        @jobs_strongify(self)
        NSString *text = [self searchTextBy:data];
        self.jobsSearchBar.textField.byText(text);
        [self saveHistoryByText:text];
        [self endDropDownListView];
    }];
}

-(void)saveHistoryByText:(NSString *)text{
    NSString *historyText = [self searchTextBy:text];
    if (!historyText.length) return;
    UIViewModel *viewModel = self.makeViewModelBy(historyText);
    if (![self filtrationData:viewModel
                    atDataArr:self.listViewData
               byPropertyName:@"text"]) {
        self.listViewData.add(viewModel);
        JobsSearchStorageData(historyText);
        [self reloadSearchSectionData];
    }
}

-(void)reloadSearchSectionData{
    _sectionTitleMutArr = nil;
    [self.tableView reloadData];
}
/// 数据过滤。对照数据一样返回YES，反之返回NO
/// @param viewModel 准备取这个数据源对象里的某个属性值
/// @param dataArr 需要进行对照检查的数据源数组
/// @param propertyName 需要检查的属性名
-(BOOL)filtrationData:(UIViewModel *)viewModel
            atDataArr:(NSArray <UIViewModel *>*)dataArr
       byPropertyName:(NSString *)propertyName{
    NSString *str1 = [self checkTargetObj:viewModel.textModel propertyName:propertyName];
    for (UIViewModel *vm in dataArr) {
        NSString *str2 = [self checkTargetObj:vm.textModel propertyName:propertyName];
        if (str1.isEqualToString(str2)) return YES;
    };return NO;
}

-(void)cancelBtnEvent{
    if (isValue(self.titleStr)) {
        if (self.tableView.mj_y == self.gk_navigationBar.mj_y) {
            [self goUpAndDown:NO];
        }
    }else{
        if (self.tableView.mj_y == 0) {
            [self goUpAndDown:NO];
        }
    }
}

-(void)goUpAndDown:(BOOL)isUpAndDown{
    /*
     *    使用弹簧的描述时间曲线来执行动画 ,当dampingRatio == 1 时,动画会平稳的减速到最终的模型值,而不会震荡.
     *    小于1的阻尼比在达到完全停止之前会震荡的越来越多.
     *    如果你可以使用初始的 spring velocity 来 指定模拟弹簧末端的对象在加载之前移动的速度.
     *    他是一个单位坐标系统,其中2被定义为在一秒内移动整个动画距离.
     *    如果你在动画中改变一个物体的位置,你想在动画开始前移动到 100 pt/s 你会超过0.5,
     *    dampingRatio 阻尼
     *    velocity 速度
     */
    @jobs_weakify(self)
    [UIView animateWithDuration:1
                          delay:0
         usingSpringWithDamping:1
          initialSpringVelocity:20
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        @jobs_strongify(self)
        if (isUpAndDown) {//顶上去
            if (isValue(self.titleStr)) {
                self.gk_navigationBar.mj_h = 0;
                self.gk_navBarAlpha = 0;

                self.tableView.mj_y = self.gk_navigationBar.mj_y;
            }else{
                self.tableView.mj_y = 0;
            }
        }else{//正常状态
            if (isValue(self.titleStr)) {
                self.gk_navigationBar.byAlpha(1);

                self.gk_navigationBar.mj_h = self.gk_navigationBarHeight;
            }
            self.tableView.mj_y = self.tableViewRect.origin.y;
        }
    } completion:nil];
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            switch (self.hotSearchStyle) {
                case HotSearchStyle_1:{
                    return JobsSearchShowHotwordsTBVCell.cellHeightByModel(self.hotSearchMutArr);
                }break;
                case HotSearchStyle_2:{
                    return JobsSearchTBVCell.cellHeightByModel(self.hotSearchMutArr);
                }break;

                default:{
                    return 0;
                }break;
            }
        }break;
        case 1:{
            return JobsSearchShowHistoryDataTBVCell.cellHeightByModel(self.listViewData);
        }break;
        default:
            return 0;
            break;
    }
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self.view endEditing:YES];
    if (indexPath.section == 1 && indexPath.row < self.listViewData.count) {
        NSString *text = [self searchTextBy:self.listViewData[indexPath.row]];
        self.jobsSearchBar.textField.byText(text);
        [self saveHistoryByText:text];
    }[self endDropDownListView];
}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return 1;
        }break;
        case 1:{
            return self.listViewData.count;
        }break;
        default:
            return 0;
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    @jobs_weakify(self)
    switch (indexPath.section) {
        case 0:{/// 热门搜索
            switch (self.hotSearchStyle) {
                case HotSearchStyle_1:{
                    return JobsSearchShowHotwordsTBVCell.cellStyleValue1ByTableView(tableView)
                        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
                        .byIndexPath(indexPath)
                        .jobsRichElementsTableViewCellBy(self.hotSearchMutArr)
                            .JobsBlock1(^(JobsHotLabelByMultiLineCVCell *cell) {/// 点击的哪个btn？
                                @jobs_strongify(self)
                                NSString *text = [self searchTextBy:cell.getViewModel];
                                self.jobsSearchBar.textField.byText(text);
                                [self saveHistoryByText:text];
                                [self endDropDownListView];

                            });
                }break;
                case HotSearchStyle_2:{
                    return JobsSearchTBVCell.cellStyleValue1ByTableView(tableView)
                        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
                        .byIndexPath(indexPath)
                        .jobsRichElementsTableViewCellBy(self.hotSearchMutArr)
                        .JobsBlock1(^(UIViewModel *data) {
                                @jobs_strongify(self)
                                NSString *text = [self searchTextBy:data];
                                self.jobsSearchBar.textField.byText(text);
                                [self saveHistoryByText:text];
                                [self endDropDownListView];
                            });
                }break;

                default:{
                    return UITableViewCell.cellStyleDefaultByTableView(tableView)
                        .bySelectionStyle(UITableViewCellSelectionStyleNone);
                }break;
            }
        }break;
        case 1:{
            /// 搜索历史
            return JobsSearchShowHistoryDataTBVCell.cellStyleValue1ByTableView(tableView)
                .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
                .byIndexPath(indexPath)
                .jobsRichElementsTableViewCellBy(self.listViewData[indexPath.row])
                    .JobsBlock1(^(id _Nullable data) {;

                    });
        }break;
        default:
            return UITableViewCell.cellStyleDefaultByTableView(tableView)
                .bySelectionStyle(UITableViewCellSelectionStyleNone);
            break;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionTitleMutArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return JobsSearchTableViewHeaderView.viewHeightByModel(nil);
}

-(nullable UIView *)tableView:(UITableView *)tableView
       viewForHeaderInSection:(NSInteger)section{
    JobsSearchTableViewHeaderView *header = tableView.tableViewHeaderFooterView(JobsSearchTableViewHeaderView.class,@"");
    header.jobsRichViewByModel(self.sectionTitleMutArr[section]);
    if (section == 1) {
        header.delBtn.jobsVisible = YES;
        header.delBtn.byAlpha(1);
        @jobs_weakify(self)
        [header actionObjBlock:^(id data) {
            @jobs_strongify(self)
//            [self.view endEditing:YES];
            [self.tableView ww_foldSection:section
                                      fold:![self.tableView ww_isSectionFolded:section]];//设置可折叠
            /// 删除历史过往记录
            [self.listViewData removeAllObjects];
            NSUserDefaults.deleteWithKey(StorageID);
            [self reloadSearchSectionData];
        }];
    } else {
        header.delBtn.jobsVisible = NO;
        header.delBtn.byAlpha(0);
    }

    self.scrollViewClass = BaseTableView.class;//这一属性决定UITableViewHeaderFooterView是否悬停
    return header;

//    {
//        Class headerClass = self.isHoveringHeaderView ? JobsSearchHoveringHeaderView.class : JobsSearchTableViewHeaderView.class;
//        UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(headerClass)];
//        return header;
//    }

}
/// cell的生命周期:将要出现的cell【实现以下方法,以替换系统默认的右侧小箭头】
/// @param tableView tableView
/// @param cell willDisplayCell
/// @param indexPath forRowAtIndexPath
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.img = @"删除".img;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(BaseTableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        /// 值得注意：只能用这样的初始化方式传入UITableViewStyleGrouped进行
        /// 否则viewForHeaderInSection 和 tableHeaderView 之间会有一段距离
        _tableView = jobsMakeBaseTableViewByGrouped(^(__kindof BaseTableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byDelegate(self)
                .byDataSource(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byTableHeaderView(self.jobsSearchBar)/// 这里接入的就是一个UIView的派生类
                .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                }))
                .byFoldable(YES)
                .byShowsVerticalScrollIndicator(NO)
                .byBgColor(self.bgColour);
            [tableView registerTableViewClass];
            tableView
                .byMJRefreshHeader(self.view.MJRefreshNormalHeaderBy([self refreshHeaderDataBy:^id _Nullable(id  _Nullable data) {
                    NSObject.feedbackGenerator(nil);//震动反馈
                    tableView.endRefreshing(YES);
    //                self.endRefreshingWithNoMoreData(self->_tableView);
                    return nil;
                }]))
                .byMJRefreshFooter(self.view.MJRefreshFooterBy([self refreshFooterDataBy:^id _Nullable(id  _Nullable data) {
//                    @jobs_strongify(self)
                    tableView.endRefreshing(YES);
                    return nil;
                }]));
            [tableView actionObjBlock:^(id data) {
                @jobs_strongify(self)
                [self endDropDownListView];
            }];

            if(@available(iOS 11.0, *)) {
                tableView.byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
            }else{
                SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
            }
            tableView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view);
                if (self.gk_navBarAlpha &&
                    !self.gk_navigationBar.hidden &&
                    isNull(self.titleStr)) {//显示
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                }else{
                    make.top.equalTo(self.view);
                }
                make.bottom.equalTo(self.view);
            });
            self.view.refresh();
            self.tableViewRect = tableView.frame;
        });
    };return _tableView;
}

-(JobsSearchBar *)jobsSearchBar{
    if (!_jobsSearchBar) {
        @jobs_weakify(self)
        _jobsSearchBar = jobsMakeSearchBar(^(__kindof JobsSearchBar * _Nullable searchBar) {
            searchBar.bySize(JobsSearchBar.viewSizeByModel(nil))
                .JobsRichViewByModel2(nil)
                .JobsBlock1(^(NSString *data) {
                    @jobs_strongify(self)
                    [self searchByString:data];
                });
            [searchBar actionStringBlock:^(NSString *data) {
                @jobs_strongify(self)
                NSString *text = [self searchTextBy:data];
                self.jobsSearchBar.textField.byText(text);
                [self saveHistoryByText:text];
                [self endDropDownListView];
            }];
        });
    };return _jobsSearchBar;
}

-(BaseButton *)scanBtn{
    if (!_scanBtn) {
        @jobs_weakify(self)
        _scanBtn = BaseButton
            .initByNormalImage(@"扫描".img)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                toastBy(@"此功能尚未开发".tr);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
    };return _scanBtn;
}

-(UIColor *)bgColour{
    if (!_bgColour) {
        _bgColour = self.byPatternImage(JobsLoadBundleImage(nil, @"Telegram",nil, @"1"));
    };return _bgColour;
}

-(NSMutableArray<__kindof UIViewModel *> *)sectionTitleMutArr{
    if (!_sectionTitleMutArr) {
        @jobs_weakify(self)
        _sectionTitleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(self.makeViewModelBy(@"热门搜索".tr));
            if (self.listViewData.count) {
                data.add(self.makeViewModelBy(@"搜索历史".tr));
            }
        });
    };return _sectionTitleMutArr;
}

-(NSMutableArray<UIViewModel *> *)hotSearchMutArr{
    if (!_hotSearchMutArr) {
        @jobs_weakify(self)
        _hotSearchMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(self.makeViewModelBy(@"Java".tr))
                .add(self.makeViewModelBy(@"Python".tr))
                .add(self.makeViewModelBy(@"Objective-C".tr))
                .add(self.makeViewModelBy(@"Swift".tr))
                .add(self.makeViewModelBy(@"C".tr))
                .add(self.makeViewModelBy(@"C++".tr))
                .add(self.makeViewModelBy(@"C#".tr))
                .add(self.makeViewModelBy(@"PHP".tr))
                .add(self.makeViewModelBy(@"Perl".tr))
                .add(self.makeViewModelBy(@"Go".tr))
                .add(self.makeViewModelBy(@"JavaScript".tr))
                .add(self.makeViewModelBy(@"Ruby".tr))
                .add(self.makeViewModelBy(@"R".tr))
                .add(self.makeViewModelBy(@"MATLAB".tr));
        });
    };return _hotSearchMutArr;
}

-(NSMutableArray<__kindof UIViewModel *> *)listViewData{
    if (!_listViewData) {
        @jobs_weakify(self)
        _listViewData = jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>* _Nullable data) {
            @jobs_strongify(self)
            NSArray *storageData = JobsSearchReadData();
            if ([storageData isKindOfClass:NSArray.class]) {
                for (id obj in storageData) {
                    NSString *text = [self searchTextBy:obj];
                    if (text.length) data.add(self.makeViewModelBy(text));
                }
            }
        });
    };return _listViewData;
}

-(NSMutableArray<__kindof UIViewModel *> *)searchResultMutArr{
    if (!_searchResultMutArr) {
        _searchResultMutArr = NSMutableArray.array;
    };return _searchResultMutArr;
}

@end
