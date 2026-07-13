//
//  JobsVerticalMenuVC@2.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsVerticalMenuVC@2.h"

@interface JobsVerticalMenuVC_2 ()
/// UI
Prop_strong()BaseButton *editBtn;
Prop_strong()ThreeClassCell *tempCell;
Prop_strong()JobsOCSearcherBar *searchView;
Prop_strong()BaseButton *searchToggleBtn;
Prop_strong()MASConstraint *searchViewWidthConstraint;
Prop_strong()BaiShaETProjPopupView10 *popupView;
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*titleMutArr;
Prop_strong()NSMutableArray <UIViewModel *>*popupViewDataMutArr;
Prop_strong()NSMutableArray <GoodsClassModel *>*leftDataArray;// 左边的数据源
Prop_strong()NSMutableArray <GoodsClassModel *>*rightDataArray;// 右边的数据源
Prop_strong()GoodsClassModel *rightViewCurrentSelectModel;
Prop_strong()UIViewModel *leftViewCurrentSelectModel;
Prop_strong()NSMutableArray <UIButtonModel *>*cellDataMutArr;
Prop_strong()NSMutableArray <NSString *>*cellTitleMutArr;
Prop_assign()NSUInteger thisIndex;
Prop_assign()BOOL searchMode;

@end

@implementation JobsVerticalMenuVC_2

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
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
    self.loadData();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
//        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.aboutBtn));
    });
    self.rightBarButtonItems = NSMutableArray.array;
    self.makeNavByAlpha(1);
    self.searchToggleBtn.byAlpha(1);
    self.searchView.byAlpha(0);
    self.tableView.byShow(self);
    self.editBtn.byAlpha(1);
    self.collectionView.byShow(self);
    self.refreshLeftView();
    [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    self.actionBy(0);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.collectionView setContentOffset:CGPointMake(0, JobsWidth(-5)) animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
-(jobsByMutArrBlock _Nonnull)makeCellData{
    @jobs_weakify(self)
    return ^(__kindof NSMutableArray <__kindof UIButtonModel *>*_Nullable arr){
        @jobs_strongify(self)
        NSUInteger maxCount = MIN(self.thisIndex + 1, self.cellTitleMutArr.count);
        if (!maxCount) return;
        NSString *title = self.cellTitleMutArr[maxCount - 1];
        for (int i = 0; i < maxCount; i++) {
            arr.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
                model.byBackgroundImage(title.add(已点击).img)
                     .byTitleCor(HEXCOLOR(0xC4C4C4))
                     .byTitleFont(UIFontWeightRegularSize(12))
                     .byBaseBackgroundColor(HEXCOLOR(0xF2E6CD))
                     .byImagePadding(JobsWidth(5));
            }));
        }
    };
}

-(JobsRetButtonModelByString _Nonnull)makeLeftCellData{
//    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nullable(__kindof NSString *_Nullable data){
//        @jobs_strongify(self)
        return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model.byBackgroundImage(data.add(未点击).img)
                 .byTitle(@"")
                 .bySubTitle(@"")
                 .byBaseBackgroundColor(JobsClearColor);
        });
    };
}

-(jobsByNSUIntegerBlock _Nonnull)actionBy{
    @jobs_weakify(self)
    return ^(NSUInteger index){
        @jobs_strongify(self)
        self.thisIndex = index;
        self.getGoodsClassByPid(self.rightViewCurrentSelectModel.idField,index);
        if (index < self.rightDataArray.count) self.rightViewCurrentSelectModel = self.rightDataArray.objectAt(index);
        if (index < self.leftDataArray.count) self.leftViewCurrentSelectModel = self.leftDataArray.objectAt(index);
        [self.collectionView setContentOffset:CGPointMake(0, JobsWidth(-5)) animated:YES];
    };
}
/// 最初默认的数据
-(NSMutableArray<UIViewModel *> *)makeTitleMutArr{
    @jobs_weakify(self)
    return jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
            data1.textModel.byText(@"收藏".tr);
        }))
        .addBy(self.makePopViewDataMutArr);
    });;
}

-(NSMutableArray<UIViewModel *> *)makePopViewDataMutArr{
   return jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIViewModel *>* _Nullable data) {
       data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
           data1.textModel.byText(@"收藏".tr);
       }))
       .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
           data1.textModel.byText(@"真人".tr);
       }))
       .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
           data1.textModel.byText(@"体育".tr);
       }))
       .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
           data1.textModel.byText(@"电子".tr);
       }))
       .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
           data1.textModel.byText(@"棋牌".tr);
       }))
       .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
           data1.textModel.byText(@"彩票".tr);
       }));
   });
}

-(jobsByVoidBlock _Nonnull)refreshLeftView{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.tableView.reloadDatas();
        if (self.leftDataArray.count){
            @jobs_weakify(self)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                NSIndexPath *indexPath = jobsMakeIndexPathZero();
                [self.tableView selectRowAtIndexPath:indexPath
                                            animated:NO
                                      scrollPosition:UITableViewScrollPositionNone];
                if ([self.tableView.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]){
                    [self.tableView.delegate tableView:self.tableView
                               didSelectRowAtIndexPath:indexPath];
                }
            });
        }
    };
}
/// 预算高度
-(JobsRetCGFloatByArrBlock _Nonnull)getCellHeight{
    @jobs_weakify(self)
    return ^(NSMutableArray *_Nullable data){
        @jobs_strongify(self)
        /// 获取cell 的高度
        return self.tempCell.getCollectionHeight(data);
    };
}
/// 根据一级目录的id 获取二三级的分类数据
-(jobsByStringAndNSUIntegerBlock _Nonnull)getGoodsClassByPid{
    @jobs_weakify(self)
    return ^(__kindof NSString *_Nullable data1,NSUInteger data2){
        @jobs_strongify(self)
        self.rightDataArray.clean();
        self.cellDataMutArr.clean();
        self.cellDataMutArr = nil;
        /// 每个子页面的section个数
        for (int i = 0; i < self.cellDataMutArr.count; i++){
            self.rightDataArray.add(self.createTwoModel(data2,i));
        }
        [self.collectionView reloadData];
        if (self.rightDataArray.count){
            [self.collectionView scrollToItemAtIndexPath:jobsMakeIndexPathZero()
                                        atScrollPosition:UICollectionViewScrollPositionTop
                                                animated:NO];
        }
    };
}

-(jobsByVoidBlock _Nonnull)loadData{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        /// 这里可以调用接口去获取一级目录分类的数据
        for (int i = 0; i < self.titleMutArr.count; i++){
            self.leftDataArray.add(self.createOneModel(i));
        }
    };
}

-(JobsRetGoodsClassModelByIntBlock _Nonnull)createOneModel{
//    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(int iflag){
        return jobsMakeGoodsClassModel(^(GoodsClassModel * _Nullable model) {
//            @jobs_strongify(self)
            model.idField = toStringByInt(iflag);
            model.pid = @"0";
            model.name = @"一级目录".tr.add(toStringByInt(iflag));
            model.textModel.text = @"";
        });
    };
}

-(JobsRetGoodsClassModelByInt2Block _Nonnull)createTwoModel{
    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(NSUInteger data1,int iFlag){
        return jobsMakeGoodsClassModel(^(GoodsClassModel * _Nullable model) {
            @jobs_strongify(self)
            model.idField = toStringByInt(iFlag);
            model.pid = toStringByInt(iFlag);
            model.name = @"随机".tr.add(JobsDash).add(toStringByInt(iFlag));
            model.textModel.text = @"1234";
            model.subTextModel.text = toStringByInt(iFlag).add(@"球桌球".tr);
            if (iFlag < self.cellDataMutArr.count) model.bgImage = self.cellDataMutArr[iFlag].backgroundImage;
            if (data1 < self.cellTitleMutArr.count) model.title = self.cellTitleMutArr[data1];
            JobsLog(@"%@",model.bgImage);
            model.childrenList = jobsMakeMutArr(^(__kindof NSMutableArray <GoodsClassModel *>*_Nullable arr) {
                @jobs_strongify(self)
                /// 每个section里面的item数量
                for (int i = 0; i < 9; i++){
                    arr.add(self.createThreeModel(i));
                }
            });JobsLog(@"LKL = %ld",model.childrenList.count);
        });
    };
}

-(JobsRetGoodsClassModelByIntBlock _Nonnull)createThreeModel{
    return ^__kindof GoodsClassModel *_Nullable(int iflag){
        return jobsMakeGoodsClassModel(^(GoodsClassModel * _Nullable model) {
            model.idField = toStringByInt(iflag);
            model.pid = toStringByInt(iflag);
            model.name = @"三级目录".tr.add(toStringByInt(iflag));
        });
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(__kindof UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.titleMutArr.count;
}

-(__kindof UITableViewCell *)tableView:(__kindof UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    @jobs_weakify(self)
    return LeftCell.cellStyleDefaultByTableView(tableView)
        .jobsRichElementsTableViewCellBy(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            @jobs_strongify(self)
            viewModel.textModel.byText(self.titleMutArr[indexPath.row].textModel.text);
        }));
}

-(CGFloat)tableView:(__kindof UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return LeftCell.cellHeightByModel(nil);
}

-(void)tableView:(__kindof UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    self.actionBy(indexPath.row);
}
#pragma mark —— UICollectionViewDelegate,UICollectionViewDataSource ThreeTopBannerCell
-(__kindof UICollectionViewCell *)collectionView:(__kindof UICollectionView *)collectionView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ThreeClassCell *cell = [ThreeClassCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    self.rightViewCurrentSelectModel = self.rightDataArray.objectAt(indexPath.section);
    cell.getCollectionHeight((NSMutableArray <NSObject *>*)self.rightViewCurrentSelectModel.childrenList);
    cell.jobsRichElementsCollectionViewCellBy((NSMutableArray <NSObject *>*)self.rightViewCurrentSelectModel.childrenList)
        .JobsBlock1(^(GoodsClassModel *model) {
        JobsLog(@"pid : %@", model.idField);
        JobsLog(@"选中id : %@", model.idField);
    });
    cell.reloadDatas();return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(__kindof UICollectionView *)collectionView{
    return self.rightDataArray.count;
}

- (NSInteger)collectionView:(__kindof UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (__kindof UICollectionReusableView *)collectionView:(__kindof UICollectionView *)collectionView
                    viewForSupplementaryElementOfKind:(NSString *)kind
                                          atIndexPath:(NSIndexPath *)indexPath{
    if (kind.isEqualToString(UICollectionElementKindSectionHeader)){
        UICollectionReusableView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:UICollectionReusableView.class
                                                                                            forIndexPath:indexPath];
        UILabel *label = headerView.viewWithTag(666);
        if (!label){
            @jobs_weakify(self)
            label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                @jobs_strongify(self)
                label
                    .byTextCor(JobsGrayColor)
                    .byFont(JobsFontBold(JobsWidth(12)))
                .byFrame(CGRectMake(10,20,headerView.width - 20.f,17.f))
                .byTag(666)
                .addOn(headerView);
            });
        }

        GoodsClassModel *rightModel = self.rightDataArray.objectAt(indexPath.section);
        label.byText(rightModel.name ? : @"".tr);

        return headerView;
    }else if (kind.isEqualToString(UICollectionElementKindSectionFooter)){
        /// 底部视图
        return [collectionView UICollectionElementKindSectionFooterClass:UICollectionReusableView.class forIndexPath:indexPath];
    };return nil;
}

- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.collectionView.width, JobsWidth(40.f));
}

- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section{
    return section == self.rightDataArray.count ? CGSizeMake(CGRectGetWidth(self.collectionView.frame), JobsWidth(40.f)) : CGSizeZero;
}

- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.collectionView.width,
                      self.getCellHeight((NSMutableArray <NSObject *>*)[self.rightDataArray objectAtIndex:indexPath.section].childrenList));
}

-(CGFloat)expandedSearchWidth{
    return JobsMainScreen_WIDTH() - JobsWidth(96) - JobsWidth(36) - JobsWidth(12) - JobsWidth(8);
}

-(void)refreshSearchToggleBtnByActive:(BOOL)active{
    self.searchToggleBtn
        .jobsResetBtnTitle(active ? @"×" : @"")
        .jobsResetBtnImage(active ? nil : @"放大镜".img);
}

-(void)switchSearchModeByActive:(BOOL)active{
    if (self.searchMode == active) return;
    self.searchMode = active;
    if (active) {
        self.searchView.byHidden(NO);
        [self refreshSearchToggleBtnByActive:YES];
    } else {
        [self.searchView.textField resignFirstResponder];
        self.searchView.textField.byText(@"");
    }
    [self.searchViewWidthConstraint setOffset:active ? self.expandedSearchWidth : 0];
    UIViewAnimationOptions options = active ? UIViewAnimationOptionCurveEaseOut : UIViewAnimationOptionCurveEaseIn;
    UIView.jobsAnimateWithOptions(active ? .24f : .18f,
        0,
        options,
        ^{
        self.gk_navTitleBtn.byAlpha(active ? 0 : 1);
        self.searchView.byAlpha(active ? 1 : 0);
        [self.gk_navigationBar layoutIfNeeded];
    },
        ^(BOOL finished) {
        if (active) {
            [self.searchView.textField becomeFirstResponder];
        } else {
            self.searchView.byHidden(YES);
            [self refreshSearchToggleBtnByActive:NO];
        }
    });
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView){
        @jobs_weakify(self)
        _tableView = self.view.addSubview(jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byShowsVerticalScrollIndicator(NO)
                .byBounces(NO);
            tableView.byBgColor(JobsClearColor);
            tableView.byFrame(CGRectMake(0,JobsTopSafeAreaHeight() + JobsStatusBarHeight() + self.gk_navigationBar.mj_h,
                                         TableViewWidth,JobsMainScreen_HEIGHT() - JobsTopSafeAreaHeight() - JobsStatusBarHeight() - JobsTabBarHeight(AppDelegate.tabBarVC) - EditBtnHeight));
        }));
    };return _tableView;
}
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
-(UICollectionView *)collectionView{
    if (!_collectionView){
        _collectionView = UICollectionView
            .initByLayout(jobsMakeVerticalCollectionViewFlowLayout(^(UICollectionViewFlowLayout * _Nullable data) {}))
            .registerCollectionViewClass()
            .registerCollectionViewCellClass(ThreeClassCell.class,@"")
//            .registerCollectionElementKindSectionHeaderClass(UICollectionReusableView.class,@"")
//            .registerCollectionElementKindSectionFooterClass(UICollectionReusableView.class,@"")
            .byAlwaysBounceVertical(YES);
        _collectionView.byFrame(CGRectMake(self.tableView.right,self.tableView.top,
                                           JobsMainScreen_WIDTH() - self.tableView.width,self.tableView.height + EditBtnHeight));
        _collectionView.byBgColor(HEXCOLOR(0xF7F8FA));
        _collectionView.addOn(self.view);
    };return _collectionView;
}

-(ThreeClassCell *)tempCell{
    if (!_tempCell){
        _tempCell = jobsMakeThreeClassCell(^(__kindof ThreeClassCell * _Nullable cell) {
            cell.byBgColor(HEXCOLOR(0xF7F8FA));

            cell.byFrame(CGRectMake(0,
                                    0,
                                    ThreeClassCell.cellSizeByModel(nil).width,
                                    ThreeClassCell.cellSizeByModel(nil).height));
        });
    };return _tempCell;
}

-(JobsOCSearcherBar *)searchView{
    if (!_searchView) {
        @jobs_weakify(self)
        _searchView = jobsMakeOCSearcherBar(^(__kindof JobsOCSearcherBar * _Nullable searchBar) {
            @jobs_strongify(self)
            searchBar
                .bySize(CGSizeMake(0, JobsWidth(38)))
                .JobsRichViewByModel2(nil)
                .JobsBlock1(^(id  _Nullable data) {;

                })
                .addOn(self.gk_navigationBar)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    self.searchViewWidthConstraint = make.width.mas_equalTo(0);
                    make.height.mas_equalTo(JobsWidth(38));
                    make.right.equalTo(self.searchToggleBtn.mas_left).offset(JobsWidth(-8));
                    make.centerY.equalTo(self.gk_navigationBar);
                });
            searchBar.cancelBtnHidden = YES;
            searchBar.textField.byPlaceholder(@"请输入搜索内容".tr);
            searchBar.byHidden(YES);

//            [searchBar actionNSIntegerBlock:^(UITextFieldFocusType data) {
//                @jobs_strongify(self)
//                switch (data) {
//                    case UITextFieldGetFocus:{/// 输入框获得焦点
//                        if (self.listViewData.count) {
//                            /// 必须先移除，否则反复添加无法正常移除
//                            self.dropDownListView = [self motivateFromView:weak_self.jobsSearchBar
//                                                                      data:self.listViewData
//                                                        motivateViewOffset:JobsWidth(5)
//                                                               finishBlock:^(UIViewModel *data) {
//                                JobsLog(@"data = %@",data);
//                            }];
//                        }
//                    }break;
//                    case UITextFieldLoseFocus:{/// 输入框失去焦点
//                        [self endDropDownListView];
//                    }break;
//                    default:
//                        break;
//                }
//            }];
        });
    };return _searchView;
}

-(BaseButton *)searchToggleBtn{
    if (!_searchToggleBtn) {
        @jobs_weakify(self)
        _searchToggleBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnTitleCor(HEXCOLOR(0xAE8330))
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(JobsWidth(22)))
            .jobsResetBtnImage(@"放大镜".img)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self switchSearchModeByActive:!self.searchMode];
            })
            .onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self.gk_navigationBar)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.size.mas_equalTo(CGSizeMake(JobsWidth(36), JobsWidth(36)));
                make.right.equalTo(self.gk_navigationBar).offset(JobsWidth(-12));
                make.centerY.equalTo(self.gk_navigationBar);
            })
            .cornerCutToCircleWithCornerRadius(JobsWidth(18));
    };return _searchToggleBtn;
}

-(BaseButton *)editBtn{
    if (!_editBtn) {
        @jobs_weakify(self)
        _editBtn = BaseButton.jobsInit()
            .bgColorBy(HEXCOLOR(0xFCFBFB))
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(JobsWidth(5.75))
            .jobsResetBtnBgImage(@"编辑".img)
            .jobsResetBtnTitleCor(HEXCOLOR(0xB0B0B0))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(@"编辑".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
    //            toastBy(@"编辑".tr);
                self.popupParameter.dragEnable = YES;
                self.popupParameter.disuseBackgroundTouchHide = NO;
                [self.popupView tf_showSlide:jobsGetMainWindow()
                                   direction:PopupDirectionBottom
                                  popupParam:self.popupParameter];
            })
            .onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.left.equalTo(self.view);
                make.top.equalTo(self.tableView.mas_bottom);
                make.size.mas_equalTo(CGSizeMake(TableViewWidth, EditBtnHeight));
            });
    };return _editBtn;
}

-(NSMutableArray<UIButtonModel *> *)cellDataMutArr{
    if (!_cellDataMutArr) {
        /// 装载假数据
        @jobs_weakify(self)
        _cellDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            @jobs_strongify(self)
            self.makeCellData(arr);
        });
    };return _cellDataMutArr;
}

-(BaiShaETProjPopupView10 *)popupView{
    if (!_popupView) {
        @jobs_weakify(self)
        _popupView = BaiShaETProjPopupView10.BySize(BaiShaETProjPopupView10.viewSizeByModel(nil))
            .JobsRichViewByModel2(nil)
            .JobsBlock1(^(id _Nullable data) {
                @jobs_strongify(self)
                if ([data isKindOfClass:NSMutableArray.class]) {
                    NSMutableArray <UIViewModel *>*dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
                        @jobs_strongify(self)
                        arr.add(self.titleMutArr[0]);
                        arr.addBy(data);
                    });
#ifdef DEBUG
                    JobsLog(@"%@",jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
                        for (UIViewModel *viewModel in dataMutArr) {
                            arr.add(viewModel.textModel.text);
                        }
                    }));
#endif
                    self.titleMutArr = dataMutArr;
                }else if ([data isKindOfClass:UIButton.class]){
                    UIButton *btn = (UIButton *)data;
                    if (btn.titleForNormalState.isEqualToString(@"恢复默认".tr)) {
                        self.titleMutArr = self.makeTitleMutArr;
                    }
                }else{}
                self.tableView.reloadDatas();
                self.collectionView.reloadDatas();
            });
        [_popupView tf_observerDelegateProcess:^(UIView *pop, DelegateProcess pro) {
            @jobs_strongify(self)
            if (pro == DelegateProcessWillHide) self.popupView.shakeCell(NO);
        }];
    }
    JobsLog(@"self.thisIndex = %ld",self.thisIndex);
    @jobs_weakify(self)
    _popupView.jobsRichViewByModel(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
        @jobs_strongify(self)
        viewModel.byIndex(self.thisIndex)
                 .byData(self.popupViewDataMutArr);
    }));return _popupView;
}

-(NSMutableArray<NSString *> *)cellTitleMutArr{
    if(!_cellTitleMutArr){
        _cellTitleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
            arr.add(@"BTG")
                .add(@"SA")
                .add(@"RTG")
                .add(@"RedTiger")
                .add(@"PP")
                .add(@"PG")
                .add(@"NLC")
                .add(@"NE")
                .add(@"KA")
                .add(@"JILI")
                .add(@"JDB")
                .add(@"FP")
                .add(@"FC")
                .add(@"Ezugi")
                .add(@"EVO")
                .add(@"CQ9");
        });
    };return _cellTitleMutArr;
}

-(NSMutableArray<UIViewModel *> *)popupViewDataMutArr{
    if (!_popupViewDataMutArr) {
        _popupViewDataMutArr = self.makePopViewDataMutArr;
    };return _popupViewDataMutArr;
}

-(NSMutableArray<UIViewModel *> *)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = self.makeTitleMutArr;
    };return _titleMutArr;
}

-(NSMutableArray<GoodsClassModel *> *)leftDataArray{
    if (!_leftDataArray) {
        _leftDataArray = NSMutableArray.array;
    };return _leftDataArray;
}

-(NSMutableArray<GoodsClassModel *> *)rightDataArray{
    if (!_rightDataArray) {
        _rightDataArray = NSMutableArray.array;
    };return _rightDataArray;
}

@end
