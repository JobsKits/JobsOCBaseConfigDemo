//
//  ThreeClassCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ThreeClassCell.h"

@interface ThreeClassCell()
/// Data
Prop_assign()CGFloat itemHeight; // 一个cell 的高度
Prop_assign()NSInteger columns; // 一行有多少列
Prop_assign()NSInteger rowCount; // 一共有都是行
Prop_strong()NSMutableArray <GoodsClassModel *>*dataArray; // 总共有多少个cell

@end

@implementation ThreeClassCell
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    ThreeClassCell *cell = JobsRegisterDequeueCollectionViewCell(ThreeClassCell);
    cell.indexPath = indexPath;
    return cell;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.byBgColor(ThreeClassCellBgCor);
        self.contentView.byBgColor(ThreeClassCellBgCor);
        self.jobsRichElementsCollectionViewCellBy(nil);
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(id _Nullable model) {
        @jobs_strongify(self)
        self.dataArray = model;
        if (self.dataArray) self.collectionView.reloadDatas();
        return self;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH() - TableViewWidth, JobsWidth(1000));
    };
}
#pragma mark —— 一些公有方法
-(JobsRetCGFloatByArrBlock _Nonnull)getCollectionHeight{
    @jobs_weakify(self)
    return ^CGFloat(NSMutableArray <GoodsClassModel *>*_Nullable data){
        @jobs_strongify(self)
        self.dataArray = data;
        NSInteger a = self.dataArray.count % self.columns;
        self.rowCount = a ? (self.dataArray.count / self.columns) + 1 : self.dataArray.count / self.columns;
        CGFloat collectionHeight = (self.rowCount * self.itemHeight) + ((self.rowCount - 1) * self.minimumLineSpacing) + self.sectionInsetTop + self.sectionInsetBottom;
        self.collectionView.height = collectionHeight;
        return collectionHeight;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)reloadDatas{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(){
        @jobs_strongify(self)
        return self.collectionView.byShow(self);
    };
}
#pragma mark —— UICollectionViewDelegate,UICollectionViewDataSource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell <UICollectionViewCellProtocol>* cell = [self.cellCls cellWithCollectionView:self.collectionView forIndexPath:indexPath];
    /// 针对数据源第一个数据不是我们需要的
    cell.jobsRichElementsCollectionViewCellBy(self.dataArray[indexPath.item]);
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.objBlock) self.objBlock(self.dataArray.objectAt(indexPath.row));
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
-(UICollectionView *)collectionView{
    if (!_collectionView){
        @jobs_weakify(self)
        /// 创建 UICollectionView，并配置纵向布局
        _collectionView = UICollectionView.initByLayout(jobsMakeVerticalCollectionViewFlowLayout(^(UICollectionViewFlowLayout * _Nullable data) {
            @jobs_strongify(self)
            data
                .byMinimumInteritemSpacing(self.minimumInteritemSpacing)// 左右列间距
                .byMinimumLineSpacing(self.minimumLineSpacing)// 上下行间距
                .byItemSize(self.cellCls.cellSizeByModel(self.data))// cell 尺寸
                .bySectionInset(UIEdgeInsetsMake(self.sectionInsetTop, self.sectionInsetLeft, self.sectionInsetBottom, self.sectionInsetRight));// section 内边距
        }))
        .registerCollectionViewCellClass(self.cellCls, @"")// 注册 cell，放在 dataLink 之前更稳
        /// 配置空数据视图
        .showEmptyViewBy(FMMaintenanceView
                         .BySize(FMMaintenanceView.viewSizeByModel(nil))/// 设置空态视图尺寸
                         .JobsRichViewByModel2(nil)/// 绑定空态视图数据模型
                         .JobsBlock1(^(id  _Nullable data) {
                             // 空态视图点击 / 回调事件，当前暂无处理
                         }))
        .dataLink(self)// 绑定数据源和代理
        .byScrollEnabled(NO)// 禁止 UICollectionView 自身滚动
        .byContentInset(UIEdgeInsetsMake(JobsWidth(10), 0, 0, 0))/// 设置内容内边距
        .byFrame(CGRectMake(JobsWidth(8.76), 0, self.frame.size.width - JobsWidth(17.52), self.frame.size.height))// 设置 frame，左右预留间距
        .byBgColor(ThreeClassCellBgCor);// 设置 UICollectionView 背景色
        /// 配置 layer 样式和阴影
        _collectionView.layer
        .byBgColor(ThreeClassCellBgCor.CGColor)// 设置 layer 背景色
        .byShadowColor(RGBA_COLOR(0, 0, 0, 0.08).CGColor)// 设置阴影颜色
        .byShadowOffset(CGSizeZero)// 设置阴影偏移
        .byShadowOpacity(1)// 设置阴影透明度
        .byShadowRadius(JobsWidth(5))// 设置阴影模糊半径
        .byMasksToBounds(NO);// 不裁剪阴影，否则阴影会被裁掉
        /// 添加到 contentView
        self.contentView.addSubview(_collectionView);
    };return _collectionView;
}

-(CGFloat)sectionInsetTop{
    if(!_sectionInsetTop){
        _sectionInsetTop = JobsWidth(15.f);
    };return _sectionInsetTop;
}

-(CGFloat)sectionInsetLeft{
    if (!_sectionInsetLeft) {
        _sectionInsetLeft = JobsWidth(15.f);
    };return _sectionInsetLeft;
}

-(CGFloat)sectionInsetBottom{
    if(!_sectionInsetBottom){
        _sectionInsetBottom = JobsWidth(15.f);
    };return _sectionInsetBottom;
}

-(CGFloat)sectionInsetRight{
    if(!_sectionInsetRight){
        _sectionInsetRight = JobsWidth(15.f);
    };return _sectionInsetRight;
}

-(CGFloat)minimumLineSpacing{
    if(!_minimumLineSpacing){
        _minimumLineSpacing = JobsWidth(17);
    };return _minimumLineSpacing;
}

-(CGFloat)minimumInteritemSpacing{
    if(!_minimumInteritemSpacing){
        _minimumInteritemSpacing = JobsWidth(13);
    };return _minimumInteritemSpacing;
}

-(Class<UICollectionViewCellProtocol>)cellCls{
    if(!_cellCls){
        _cellCls = TreeClassItemCell.class;
    };return _cellCls;
}

-(NSInteger)columns{
    if(!_columns){
        _columns = 3;
    };return _columns;
}

-(CGFloat)itemHeight{
    if (!_itemHeight) {
        _itemHeight = self.cellCls.cellSizeByModel(self.data).height;
    };return _itemHeight;
}

@end
