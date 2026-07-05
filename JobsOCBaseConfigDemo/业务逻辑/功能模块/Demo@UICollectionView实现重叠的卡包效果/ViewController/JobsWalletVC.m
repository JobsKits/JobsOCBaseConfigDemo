//
//  JobsWalletVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsWalletVC.h"

@interface JobsWalletVC ()
/// Data
Prop_strong()TMSCollectionViewLayout *tms_layout;
Prop_strong()NSMutableArray <NSMutableArray <UIViewModel *>*>*dataSourceMutArr; // Cell的数据源
Prop_strong()NSMutableArray <UIViewModel *>*sectionHeaderDataSource;
            // sectionHeader的数据源
Prop_strong()NSMutableArray <UIViewModel *>*sectionFooterDataSource;
            // sectionFooter的数据源

@end

@implementation JobsWalletVC

- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
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
        })
        //        self.viewModel.textModel.text = @"JobsWallet".tr;
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"银行卡".tr);
            data.byFont(UIFontWeightSemiboldSize(17));
        })
    
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(HEXCOLOR(0xF5F7FB))
        //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        .byNavBgCor(HEXCOLOR(0xFFF1E4))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(HEXCOLOR(0xF5F7FB));

    self.collectionView.byShow(self);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— 一些私有方法

#pragma mark —— UICollectionViewDelegate,UICollectionViewDataSource
-(CGFloat)collectionView:(UICollectionView *)collectionView
resuableHeaderViewHeightForIndexPath:(NSIndexPath *)indexPath {
//    return indexPath.section == 0 ? 30 : 0;
    if (indexPath.section == 0) {
        return JobsWidth(48);
    };return JobsWidth(22);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView
resuableFooterViewHeightForIndexPath:(NSIndexPath *)indexPath {
//    return 30;
    return 0;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSourceMutArr.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    NSArray *sectionArray = self.dataSourceMutArr[section];
    return sectionArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == self.dataSourceMutArr.count - 1) {
        JobsBtnStyleCVCell *cell = [collectionView collectionViewCellClass:JobsBtnStyleCVCell.class forIndexPath:indexPath];
        UIViewModel *viewModel = self.dataSourceMutArr[indexPath.section][indexPath.item];
        viewModel.byItem(indexPath.item);
        cell.jobsRichElementsCollectionViewCellBy(viewModel);
        cell
            .byBgColor(JobsClearColor)
            .byClipsToBounds(NO)
            .byLayer(^(CALayer *layer) {
                layer
                    .byMasksToBounds(NO)
                    .byShadowColor(RGBA_COLOR(32, 58, 86, 0.10).CGColor)
                    .byShadowOpacity(1)
                    .byShadowOffset(CGSizeMake(0, JobsWidth(4)))
                    .byShadowRadius(JobsWidth(10));
            });
        return cell;
    }else{
        BaiShaETProjBankAccMgmtCVCell *cell = [collectionView collectionViewCellClass:BaiShaETProjBankAccMgmtCVCell.class forIndexPath:indexPath];
        UIViewModel *viewModel = self.dataSourceMutArr[indexPath.section][indexPath.item];
        viewModel.byItem(indexPath.item);
        cell.jobsRichElementsCollectionViewCellBy(viewModel);
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.dataSourceMutArr enumerateObjectsUsingBlock:^(NSArray<UIViewModel *> *sectionArray,
                                                        NSUInteger section,
                                                        BOOL * _Nonnull stopSection) {
        [sectionArray enumerateObjectsUsingBlock:^(UIViewModel *model,
                                                   NSUInteger item,
                                                   BOOL * _Nonnull stopItem) {
            // 只要不是当前点击的那个 indexPath，全部置为未选中
            if (section != indexPath.section || item != indexPath.item) {
                model.byJobsSelected(NO);
                return;
            }
            // 命中当前点击的 cell（section 和 item 都相等）
            model.byJobsSelected(!model.jobsSelected);

            BOOL isLastItemInSection = (item == sectionArray.count - 1);
            BOOL shouldExpand = !isLastItemInSection && model.jobsSelected;

            [self.tms_layout didClickWithIndexPath:indexPath isExpand:shouldExpand];
        }];
    }]; [collectionView reloadData];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    TMSWalletCollectionReusableView *reusableView = nil;
    reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass(TMSWalletCollectionReusableView.class) forIndexPath:indexPath];
    reusableView.byBgColor(HEXCOLOR(0xF5F7FB));
    if ([kind isEqualToString:TMSCollectionViewSectionHeader]) {
        if(indexPath.section < self.sectionHeaderDataSource.count){
            UIViewModel *viewModel = self.sectionHeaderDataSource[indexPath.section];
            reusableView.jobsRichViewByModel(viewModel);
            reusableView.label
                .byFont(UIFontWeightSemiboldSize(16))
                .byTextCor(HEXCOLOR(0x2F3A46))
                .byHidden(!isValue(viewModel.textModel.text));
        }
    }

    if ([kind isEqualToString:TMSCollectionViewSectionFooter]) {
        if(indexPath.section < self.sectionFooterDataSource.count){
            UIViewModel *viewModel = self.sectionFooterDataSource[indexPath.section];
            reusableView.jobsRichViewByModel(viewModel);
            reusableView.label.byHidden(YES);
        }
    };return reusableView;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = UICollectionView.initByLayout(self.tms_layout);
        _collectionView.byBgColor(HEXCOLOR(0xF5F7FB));

        
        {
            _collectionView.registerCollectionElementKindSectionHeaderClass_(TMSWalletCollectionReusableView.class,TMSCollectionViewSectionHeader);
            _collectionView.registerCollectionElementKindSectionHeaderClass_(TMSWalletCollectionReusableView.class,TMSCollectionViewSectionFooter);

            _collectionView.registerCollectionViewCellClass(JobsBtnStyleCVCell.class,@"");
            _collectionView.registerCollectionViewCellClass(TMSWalletCollectionViewCell.class,@"");
            _collectionView.registerCollectionViewCellClass(BaiShaETProjBankAccMgmtCVCell.class,@"");
        }

        _collectionView.dataLink(self);
        _collectionView.byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
        self.view.addSubview(_collectionView);
        [self fullScreenConstraintTargetView:_collectionView topViewOffset:0];
    };return _collectionView;
}

-(TMSCollectionViewLayout *)tms_layout{
    if (!_tms_layout) {
        @jobs_weakify(self)
        _tms_layout = jobsMakeTMSCollectionViewLayout(^(__kindof TMSCollectionViewLayout * _Nullable layout) {
            @jobs_strongify(self)
            layout.padding = JobsWidth(15);
            layout.layout_delegate = self;
        });
    };return _tms_layout;
}

-(NSMutableArray<NSMutableArray<UIViewModel *> *> *)dataSourceMutArr{
    if (!_dataSourceMutArr) {
        _dataSourceMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSMutableArray<UIViewModel *>*>* _Nullable data) {
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>* _Nullable data1) {
                data1.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data2) {
                    data2.textModel.byText(@"上海银行".tr);
                    data2.subTextModel.byText(@"**** 7895".tr);
                    data2.byImage(@"第一银行".img);
                }))
                .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data2) {
                    data2.textModel.byText(@"国泰世华".tr);
                    data2.subTextModel.byText(@"**** 2345".tr);
                    data2.byImage(@"国泰世华".img);
                }))
                .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data2) {
                    data2.textModel.byText(@"台湾银行".tr);
                    data2.subTextModel.byText(@"**** 7654".tr);
                    data2.byImage(@"台湾银行".img);
                }))
                .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data2) {
                    data2.textModel.byText(@"嘉华银行".tr);
                    data2.subTextModel.byText(@"**** 2345".tr);
                    data2.byImage(@"嘉华银行".img);
                }))
                .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data2) {
                    data2.textModel.byText(@"包头银行".tr);
                    data2.subTextModel.byText(@"**** 7654".tr);
                    data2.byImage(@"包头银行".img);
                }))
                .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data2) {
                    data2.textModel.byText(@"成都银行".tr);
                    data2.subTextModel.byText(@"**** 2345".tr);
                    data2.byImage(@"成都银行".img);
                }))
                .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data2) {
                    data2.textModel.byText(@"南充商业银行".tr);
                    data2.subTextModel.byText(@"**** 7654".tr);
                    data2.byImage(@"南充商业银行".img);
                }));
            }));
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>* _Nullable data1) {
                data1.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data2) {
                    data2
                        .byBgCor(JobsWhiteColor)
                        .byBgSelectedCor(HEXCOLOR(0xEEF4FF))
                        .byLayerCornerRadius(JobsWidth(14))
                        .byJobsEnabled(NO);
                    data2.textModel
                        .byText(@"＋ 添加新的银行卡".tr)
                        .byFont(UIFontWeightSemiboldSize(16))
                        .byTextCor(HEXCOLOR(0x3A4653));
                    data2.subTextModel
                        .bySubText(@"安全管理银行卡".tr)
                        .bySubFont(UIFontWeightRegularSize(12))
                        .bySubTextCor(HEXCOLOR(0x8A96A3));
                }));
            }));
        });
    };return _dataSourceMutArr;
}

-(NSMutableArray<UIViewModel *> *)sectionHeaderDataSource{
    if (!_sectionHeaderDataSource) {
        _sectionHeaderDataSource = jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>* _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.byText(@"我的银行卡".tr);
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.byText(@"");
            }));
        });
    };return _sectionHeaderDataSource;
}

-(NSMutableArray<UIViewModel *> *)sectionFooterDataSource{
    if (!_sectionFooterDataSource) {
        _sectionFooterDataSource = jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>* _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.byText(@"");
            }));
        });
    };return _sectionFooterDataSource;
}

@end
