//
//  JobsExcelTopHeadView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsExcelTopHeadView.h"

@interface JobsExcelTopHeadView()

Prop_strong(nonnull)JobsExcelConfigureViewModel *excelConfigureData;

@end

@implementation JobsExcelTopHeadView
/// RACProtocol
@synthesize racDisposable = _racDisposable;// 用于取消订阅
- (void)dealloc {
    [self.racDisposable dispose];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.collectionView.byAlpha(1);
    };return self;
}
#pragma mark —— BaseViewProtocol
- (jobsByIDBlock _Nonnull)jobsRichViewByModel {
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.excelConfigureData = model;
        self.collectionView.byShow(self);
    };
}
#pragma mark —— UICollectionView 代理和数据源
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section {
    return self.excelConfigureData.colNumber;
}

-(__kindof UICollectionViewCell *)collectionView:(__kindof UICollectionView *)collectionView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    @jobs_weakify(self)
    JobsTopViewItem *cell = [JobsTopViewItem cellWithCollectionView:collectionView forIndexPath:indexPath];
    cell.byBgColor(self.excelConfigureData.cor3);
    cell.jobsRichElementsCollectionViewCellBy(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable vm) {
        @jobs_strongify(self)
        vm.byData(self.excelConfigureData)
          .byButtonModel(self.excelConfigureData.topHeaderDatas[indexPath.row]);
    }));return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.excelConfigureData.itemW, self.excelConfigureData.itemH);
}
#pragma mark —— UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.excelConfigureData.HorizontalScrollValue = NSValue.byPoint(scrollView.contentOffset);
    JobsLog(@"JobsExcelTopHeadView - scrollView.contentOffset.x = %f", scrollView.contentOffset.x);
    /// 防止在初始情况下，无意义的往右拉动👉🏻
    if (scrollView.contentOffset.x < 0) scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
    /// 防止在初始情况下，无意义的往左拉动👈🏻
    CGFloat d = (self.excelConfigureData.colNumber * self.excelConfigureData.itemW - self.excelConfigureData.XZExcelW) + self.excelConfigureData.itemW + self.excelConfigureData.scrollOffsetX;
    if(scrollView.contentOffset.x > d) scrollView.contentOffset = CGPointMake(d, scrollView.contentOffset.y);
}
#pragma mark —— getter and setter
@synthesize collectionView = _collectionView;
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        @jobs_weakify(self)
        _collectionView = [UICollectionView.alloc initWithFrame:self.bounds
                                           collectionViewLayout:jobsMakeHorizontalCollectionViewFlowLayout(^(UICollectionViewFlowLayout * _Nullable data) {
            data.itemSize = jobsMakeCGSizeByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
                @jobs_strongify(self)
                data.byJobsWidth(self.excelConfigureData.itemW)
                    .byJobsHeight(self.excelConfigureData.itemH);
            });
            data.minimumLineSpacing = 0;
            data.minimumInteritemSpacing = 0;
        })];
        _collectionView.dataLink(self);
        _collectionView.byBgColor(JobsClearColor);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        });
    };return _collectionView;
}

@end
