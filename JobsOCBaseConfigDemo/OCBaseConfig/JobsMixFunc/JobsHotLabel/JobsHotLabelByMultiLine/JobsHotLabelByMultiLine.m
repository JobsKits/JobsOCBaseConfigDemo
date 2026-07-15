//
//  JobsHotLabelByMultiLine.m
//  JobsHotLabel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsHotLabelByMultiLine.h"

@interface JobsHotLabelByMultiLine ()
/// Data
Prop_strong()NSMutableArray <__kindof UICollectionViewCell *>*cvcellMutArr;
Prop_strong()JobsHotLabelWithMultiLineModel *dataModel;

@end

@implementation JobsHotLabelByMultiLine
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_hotLabelWithMultiLineOnceToken = 0;
    static_hotLabelWithMultiLine = nil;
}

static JobsHotLabelByMultiLine *static_hotLabelWithMultiLine = nil;
static dispatch_once_t static_hotLabelWithMultiLineOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_hotLabelWithMultiLineOnceToken, ^{
        static_hotLabelWithMultiLine = JobsHotLabelByMultiLine.new;
    });return static_hotLabelWithMultiLine;
}

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(HEXCOLOR(0xFFFFFF));
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.byBgColor(HEXCOLOR(0xFFFFFF));
    };return self;
}
/// 必须有frame的前提下才会进行绘制
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsHotLabelWithMultiLineModel * _Nullable model) {
        @jobs_strongify(self)
        self.dataModel = model;
        self.byBgColor(self.dataModel.bgCor);
        if (self.dataModel.viewModels.count) {
            self.collectionView.byShow(self);
        }
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(JobsHotLabelWithMultiLineModel *_Nullable data){
        NSMutableArray <UIViewModel *>*viewModels = data.viewModels;
        CGFloat width = hotLabLeft + hotLabRight;
        CGFloat height = 0;
        int row = 1;
        for (UIViewModel *viewModel in viewModels) {
            CGSize size = [UILabel sizeWithText:viewModel.textModel.text
                                           font:UIFontWeightRegularSize(JobsWidth(14))
                                        maxSize:CGSizeZero];
            width += size.width + hotLabOffsetX;
            height = size.height;
            if (width >= JobsHotLabelByMultiLineMaxWidth) {
                width = hotLabLeft + hotLabRight;
                row += 1;
            }
        }
        CGFloat offset = JobsWidth(3);// 从何而来？
        return CGSizeMake(data.jobsWidth,
                          (height + hotLabOffsetY) * row + (hotLabTop + hotLabBottom) + offset);
    };
}
#pragma mark —— UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    JobsHotLabelByMultiLineCVCell *cell = (JobsHotLabelByMultiLineCVCell *)self.cvcellMutArr[indexPath.item];
    CGSize itemSize = jobsZeroSizeValue(self.dataModel.cellSize) ? JobsHotLabelByMultiLineCVCell.cellSizeByModel(self.dataModel.viewModels[indexPath.item]) : self.dataModel.cellSize;
    cell
        .jobsRichElementsCollectionViewCellBy(self.dataModel.viewModels[indexPath.item])
        .byContentView(^(__kindof UIView * _Nullable view) {
            view.cornerCutToCircleWithCornerRadius(itemSize.height / 2);
        })
        .cornerCutToCircleWithCornerRadius(itemSize.height / 2);
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.textLab.byTextCor(HEXCOLOR(0xAE8330));
        cell.textLab.byBgColor(HEXCOLOR(0xFFEABA));
    };return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.dataModel.viewModels.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        return [collectionView UICollectionElementKindSectionHeaderClass:JobsHeaderFooterView.class
                                                            forIndexPath:indexPath].JobsRichViewByModel2(self.dataModel.headerViewModel);
    }else if (kind == UICollectionElementKindSectionFooter) {
        return [collectionView UICollectionElementKindSectionFooterClass:JobsHeaderFooterView.class
                                                            forIndexPath:indexPath].JobsRichViewByModel2(self.dataModel.footerViewModel);
    }else ReturnBaseCollectionReusableHeaderView;
}
#pragma mark —— UICollectionViewDelegate
/// 允许选中时，高亮
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
    return YES;
}
/// 高亮完成后回调
-(void)collectionView:(UICollectionView *)collectionView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
}
/// 由高亮转成非高亮完成时的回调
-(void)collectionView:(UICollectionView *)collectionView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
}
/// 设置是否允许选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
    return YES;
}
/// 设置是否允许取消选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
    return YES;
}
/// 选中操作
-(void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
    JobsHotLabelByMultiLineCVCell *_cell = (JobsHotLabelByMultiLineCVCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    self.jobsToastSuccessMsg(_cell.getViewModel.textModel.text);
    for (JobsHotLabelByMultiLineCVCell *cell in collectionView.visibleCells) {
        cell.textLab.byBgColor(HEXCOLOR(0xF3F3F3));
        cell.textLab.byTextCor(HEXCOLOR(0x757575));
    }
    _cell.textLab.byTextCor(HEXCOLOR(0xAE8330));
    _cell.textLab.byBgColor(HEXCOLOR(0xFFEABA));
    if (self.objBlock) self.objBlock(_cell);
}
/// 取消选中操作
-(void)collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
}
#pragma mark —— UICollectionViewDelegateFlowLayout
/// header 大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    /// ❤️外部传入配置优先❤️
    if (self.dataModel.headerViewModel.useHeaderView) {
        return jobsZeroSizeValue(self.dataModel.headerViewModel.jobsSize) ? JobsHeaderFooterView.collectionReusableViewSizeByModel(nil) : self.dataModel.headerViewModel.jobsSize;
    };return CGSizeZero;
}
/// footer 大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section {
    /// ❤️外部传入配置优先❤️
    if (self.dataModel.footerViewModel.useFooterView) {
        return jobsZeroSizeValue(self.dataModel.footerViewModel.jobsSize) ? JobsHeaderFooterView.collectionReusableViewSizeByModel(nil) : self.dataModel.headerViewModel.jobsSize;
    };return CGSizeZero;
}
/// item/cell 的大小
-(CGSize)collectionView:(UICollectionView *)collectionView
                 layout:(UICollectionViewLayout *)collectionViewLayout
 sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    /// ❤️外部传入配置优先❤️
    return jobsZeroSizeValue(self.dataModel.cellSize) ? JobsHotLabelByMultiLineCVCell.cellSizeByModel(self.dataModel.viewModels[indexPath.item]) : self.dataModel.cellSize;
}
/// 定义的是元素垂直之间的间距
-(CGFloat)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return hotLabOffsetY;
}
/// 定义的是UICollectionViewScrollDirectionVertical下，元素水平之间的间距。
/// UICollectionViewScrollDirectionHorizontal下，垂直和水平正好相反
/// Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
-(CGFloat)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return hotLabOffsetX;
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return jobsMakeSameEdgeInset(JobsWidth(5));
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        @jobs_weakify(self)
        _collectionView = UICollectionView.initByLayout(self.verticalLayout)
            .registerCollectionViewCellClass(JobsHotLabelByMultiLineCVCell.class, @"")
            .dataLink(self)
            .byShowsVerticalScrollIndicator(NO)
            .byScrollEnabled(NO)
            .byBgColor(JobsClearColor)
            .addOn(self)
            .byOn(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.edges.equalTo(self).insets(jobsMakeSameEdgeInset(JobsWidth(2)));
            });
    };return _collectionView;
}
-(NSMutableArray<__kindof UICollectionViewCell *> *)cvcellMutArr{
    if (!_cvcellMutArr) {
        @jobs_weakify(self)
        _cvcellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            for (UIViewModel *viewModel in self.dataModel.viewModels) {
                NSUInteger index = self.dataModel.viewModels.indexBy(viewModel);
                data.add([JobsHotLabelByMultiLineCVCell cellWithCollectionView:self.collectionView
                                                                  forIndexPath:[self myIndexPath:(JobsIndexPath){0,index}]]);
            }
        });
    };return _cvcellMutArr;
}

@end
