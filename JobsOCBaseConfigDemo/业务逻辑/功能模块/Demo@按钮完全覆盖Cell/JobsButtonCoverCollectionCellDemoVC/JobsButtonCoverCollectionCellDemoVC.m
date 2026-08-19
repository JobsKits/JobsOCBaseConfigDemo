//
//  JobsButtonCoverCollectionCellDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import "JobsButtonCoverCollectionCellDemoVC.h"

@interface JobsButtonCoverCollectionCellDemoVC ()

Prop_strong()UICollectionView *coverCollectionView;
Prop_strong()UICollectionViewFlowLayout *flowLayout;
Prop_strong()NSArray<UIViewModel *> *demoArr;

-(UIViewModel *)demoViewModelWithTitle:(NSString *)title
                      backgroundColor:(UIColor *)backgroundColor;

@end

@implementation JobsButtonCoverCollectionCellDemoVC
-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsButtonCoverCollectionCellDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"按钮完全覆盖 UICollectionViewCell".jobsTr())
                    .byFont(UIFontWeightRegularSize(17))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(HEXCOLOR(0xF4F5F8))
            .byNavBgCor(HEXCOLOR(0xF4F5F8));
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsButtonCoverCollectionCellDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.makeNavByAlpha(1);
        self.coverCollectionView.byVisible(YES);
    };
}
#pragma mark —— UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section{
    return self.demoArr.count;
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JobsBtnStyleCVCell *cell = [JobsBtnStyleCVCell cellWithCollectionView:collectionView
                                                             forIndexPath:indexPath];
    return cell
        .jobsRichElementsCollectionViewCellBy(self.demoArr[indexPath.item])
        .byContentViewBgCor(JobsClearColor);
}
#pragma mark —— UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath
                                   animated:YES];
    JobsLog(@"点击 UICollectionViewCell：%@",self.demoArr[indexPath.item].textModel.text);
}
#pragma mark —— UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView
                 layout:(UICollectionViewLayout *)collectionViewLayout
 sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat horizontalInset = self.flowLayout.sectionInset.left + self.flowLayout.sectionInset.right;
    CGFloat totalSpacing = self.flowLayout.minimumInteritemSpacing * 2;
    CGFloat itemWidth = floor((CGRectGetWidth(collectionView.bounds) - horizontalInset - totalSpacing) / 3.0);
    return CGSizeMake(MAX(itemWidth, 1),
                      JobsWidth(118));
}
#pragma mark —— 一些私有方法
-(UIViewModel *)demoViewModelWithTitle:(NSString *)title
                      backgroundColor:(UIColor *)backgroundColor{
    return jobsMakeViewModel(^(__kindof UIViewModel * _Nullable model) {
        model.byTitle(title.jobsTr())
            .bySubTitle(@"按钮铺满整个 UICollectionViewCell".jobsTr())
            .byTitleCor(JobsWhiteColor)
            .bySubTitleCor(JobsWhiteColor.colorWithAlphaComponentBy(0.78))
            .byTitleFont(UIFontWeightSemiboldSize(14))
            .bySubTitleFont(UIFontWeightRegularSize(10))
            .byBaseBackgroundColor(backgroundColor)
            .byLayerCornerRadius(JobsWidth(12))
            .byJobsEnabled(NO)
            .byNormalImage(@"square.fill".sys_img)
            .byImageTitleSpace(JobsWidth(6))
            .byButtonEdgeInsetsStyle(NSDirectionalRectEdgeTop);
    });
}
#pragma mark —— LazyLoad
-(UICollectionView *)coverCollectionView{
    if (!_coverCollectionView) {
        _coverCollectionView = UICollectionView.initByLayout(self.flowLayout)
            .registerCollectionViewCellClass(JobsBtnStyleCVCell.class,@"")
            .byDelegate(self)
            .byDataSource(self)
            .byShowsVerticalScrollIndicator(YES)
            .byAlwaysBounceVertical(YES)
            .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
            .byBgColor(JobsClearColor)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view);
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
                make.bottom.equalTo(self.view);
            });
    };return _coverCollectionView;
}

-(UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = jobsMakeCollectionViewFlowLayout(^(__kindof UICollectionViewFlowLayout * _Nullable layout) {
            layout.byScrollDirection(UICollectionViewScrollDirectionVertical)
                .byMinimumInteritemSpacing(JobsWidth(10))
                .byMinimumLineSpacing(JobsWidth(10))
                .bySectionInset(UIEdgeInsetsMake(JobsWidth(16),
                                                 JobsWidth(16),
                                                 JobsWidth(16),
                                                 JobsWidth(16)));
        });
    };return _flowLayout;
}

-(NSArray<UIViewModel *> *)demoArr{
    if (!_demoArr) {
        _demoArr = @[
            [self demoViewModelWithTitle:@"Collection · 01"
                         backgroundColor:HEXCOLOR(0x705CF6)],
            [self demoViewModelWithTitle:@"Collection · 02"
                         backgroundColor:HEXCOLOR(0x17A2B8)],
            [self demoViewModelWithTitle:@"Collection · 03"
                         backgroundColor:HEXCOLOR(0xF59F00)],
            [self demoViewModelWithTitle:@"Collection · 04"
                         backgroundColor:HEXCOLOR(0xE64980)],
            [self demoViewModelWithTitle:@"Collection · 05"
                         backgroundColor:HEXCOLOR(0x2F9E44)],
            [self demoViewModelWithTitle:@"Collection · 06"
                         backgroundColor:HEXCOLOR(0x495057)],
            [self demoViewModelWithTitle:@"Collection · 07"
                         backgroundColor:HEXCOLOR(0x1971C2)],
            [self demoViewModelWithTitle:@"Collection · 08"
                         backgroundColor:HEXCOLOR(0x862E9C)],
            [self demoViewModelWithTitle:@"Collection · 09"
                         backgroundColor:HEXCOLOR(0xD9480F)]
        ];
    };return _demoArr;
}

@end
