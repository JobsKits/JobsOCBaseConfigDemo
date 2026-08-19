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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsExcelTopHeadView
@interface JobsExcelTopHeadView (JobsPropertyDSLSetterAutogen_53d13725eb)
-(void)setExcelConfigureData:(JobsExcelConfigureViewModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsExcelTopHeadView

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
        self.byExcelConfigureData(model);
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
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsExcelTopHeadView.class, @selector(jobsScrollViewDidScroll)))(self, @selector(jobsScrollViewDidScroll));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewDidScroll{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        self.excelConfigureData.byHorizontalScrollValue(NSValue.byPoint(scrollView.contentOffset));
        JobsLog(@"JobsExcelTopHeadView - scrollView.contentOffset.x = %f", scrollView.contentOffset.x);
        /// 防止在初始情况下，无意义的往右拉动👉🏻
        if (scrollView.contentOffset.x < 0) scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
        /// 防止在初始情况下，无意义的往左拉动👈🏻
        CGFloat d = (self.excelConfigureData.colNumber * self.excelConfigureData.itemW - self.excelConfigureData.XZExcelW) + self.excelConfigureData.itemW + self.excelConfigureData.scrollOffsetX;
        if(scrollView.contentOffset.x > d) scrollView.contentOffset = CGPointMake(d, scrollView.contentOffset.y);
    };
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
            data
                .byMinimumLineSpacing(0)
                .byMinimumInteritemSpacing(0);
        })];
        _collectionView
            .dataLink(self)
            .byBgColor(JobsClearColor);
        _collectionView.byShowsVerticalScrollIndicator(NO);
        _collectionView.byShowsHorizontalScrollIndicator(NO);
        _collectionView.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        });
    };return _collectionView;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsExcelTopHeadView
-(JobsRetJobsExcelTopHeadViewByJobsExcelConfigureViewModelBlock _Nonnull)byExcelConfigureData{
    @jobs_weakify(self)
    return ^__kindof JobsExcelTopHeadView * _Nullable(JobsExcelConfigureViewModel * _Nullable data){
        @jobs_strongify(self)
        [self setExcelConfigureData:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsExcelTopHeadView
@end
