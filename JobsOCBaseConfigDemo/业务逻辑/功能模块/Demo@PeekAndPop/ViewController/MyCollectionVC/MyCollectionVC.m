//
//  MyCollectionVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MyCollectionVC.h"

@interface MyCollectionVC ()
/// Data
Prop_strong()NSMutableArray <__kindof UIViewModel *>*dataMutArr;

@end

@implementation MyCollectionVC
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
            data
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byText(data.attributedTitle.string)
                .byFont(UIFontWeightRegularSize(18));
        })
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byBgImage(@"新首页的底图".img)
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsRandomColor);
    self.makeNavByAlpha(1);
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
}

#pragma mark —— UICollectionViewDelegate,UICollectionViewDataSource
- (nullable UIContextMenuConfiguration *)collectionView:(UICollectionView *)collectionView
      contextMenuConfigurationForItemAtIndexPath:(NSIndexPath *)indexPath
                                           point:(CGPoint)point {
    if (indexPath.section >= self.dataMutArr.count) return nil;
    return jobsMakeContextMenuConfiguration(indexPath,
                                             ^UIViewController * _Nullable{
        PreviewVC *previewVC = PreviewVC.new;
        previewVC.previewText = [NSString stringWithFormat:@"Preview for item %ld", (long)indexPath.item];
        return previewVC;
    },
                                             ^UIMenu * _Nullable(NSArray<UIMenuElement *> *suggestedActions) {
        UIAction *action1 = jobsMakeAction(@"Action 1".tr,
                                           nil,
                                           nil,
                                           ^(__kindof UIAction *_Nonnull action) {
            JobsLog(@"Action 1 selected for item %ld", (long)indexPath.item);
        },
                                           nil);
        UIAction *action2 = jobsMakeAction(@"Action 2".tr,
                                           nil,
                                           nil,
                                           ^(__kindof UIAction *_Nonnull action) {
            JobsLog(@"Action 2 selected for item %ld", (long)indexPath.item);
        },
                                           nil);
        return jobsMakeMenu(@"".tr, @[action1, action2], nil);
    },
                                             nil);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataMutArr.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull __kindof UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    @jobs_weakify(self)
    return [self jobsCollectionViewCellPlanAtIndexPath:indexPath
                                        collectionView:collectionView
                              collectionViewCellBlock0:^UICollectionViewCell *_Nullable{
        @jobs_strongify(self)
        BaiShaETProjOrderDetailsCVCell *cell = [BaiShaETProjOrderDetailsCVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
        cell.jobsRichElementsCollectionViewCellBy(self.dataMutArr[indexPath.section]);
        return cell;
    }
                              collectionViewCellBlock1:nil
                              collectionViewCellBlock2:nil
                              collectionViewCellBlock3:nil
                              collectionViewCellBlock4:nil];
}

- (NSInteger)collectionView:(nonnull __kindof UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 1;
}
#pragma mark —— UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
                  layout:(__kindof UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    @jobs_weakify(self)
    return [self jobsCellPlanSizeForSectionAtIndexPath:indexPath.section
                                            cellBlock0:^CGSize{
        @jobs_strongify(self)
        return BaiShaETProjOrderDetailsCVCell.cellSizeByModel(self.dataMutArr[indexPath.section]);
    }
                                            cellBlock1:nil
                                            cellBlock2:nil
                                            cellBlock3:nil
                                            cellBlock4:nil];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(__kindof UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(12);
}
/// 定义的是UICollectionViewScrollDirectionVertical下，元素水平之间的间距。
/// UICollectionViewScrollDirectionHorizontal下，垂直和水平正好相反
/// Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(__kindof UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
/// 内间距
-(UIEdgeInsets)collectionView:(__kindof UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return jobsMakeSameEdgeInset(JobsWidth(16));
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        @jobs_weakify(self)
        _collectionView = UICollectionView.initByLayout(self.verticalLayout)
            .registerCollectionViewClass()
            .dataLink(self)
            .byShowsVerticalScrollIndicator(NO)
            .byBgColor(HEXCOLOR(0xFCFBFB))
            .addOn(self.view)
            .byOn(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.left.right.equalTo(self.view);
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
                make.bottom.equalTo(self.view).offset(JobsBottomSafeAreaHeight() + JobsWidth(64));
            });
    };return _collectionView;
}

-(NSMutableArray<__kindof UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIViewModel *>* _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.jobsDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable mutArr) {
                    mutArr.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                        viewModel.textModel.byText(@"存款金额".tr);
                        viewModel.subTextModel.byText(@"10,000.00".tr);
                    }))
                    .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                        viewModel.textModel.byText(@"存款方式".tr);
                        viewModel.subTextModel.byText(@"虛擬幣充值".tr);
                    }))
                    .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                        viewModel.textModel.byText(@"訂單編號".tr);
                        viewModel.subTextModel.byText(@"YSF2025022302644565964");
                    }))
                    .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                        viewModel.textModel.byText(@"轉賬姓名".tr);
                        viewModel.subTextModel.byText(@"張三 ".tr);
                    }))
                    .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                        viewModel.textModel.byText(@"銀行賬號".tr);
                        viewModel.subTextModel.byText(@"6230 5822 0031 5762 430".tr);
                    }))
                    .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                        viewModel.textModel.byText(@"轉賬地址".tr);
                        viewModel.subTextModel.byText(@"中國平安銀行".tr);
                    }));
                });
            }));
        });
    };return _dataMutArr;
}

@end
