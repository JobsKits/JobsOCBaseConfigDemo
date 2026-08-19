//
//  LMHWaterFallLayout.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LMHWaterFallLayout.h"

/// 默认的列数
static const CGFloat LMHDefaultColunmCount = 3;
/// 每一列之间的间距
static const CGFloat LMHDefaultColunmMargin = 10;
/// 每一行之间的间距
static const CGFloat LMHDefaultRowMargin = 10;
/// 内边距
static const UIEdgeInsets LMHDefaultEdgeInsets = {10,10,10,10};

@interface LMHWaterFallLayout()
/// 存放所有的布局属性
Prop_strong()NSMutableArray <UICollectionViewLayoutAttributes *>*attrsArr;
/// 存放所有列的当前高度
Prop_strong()NSMutableArray <NSNumber *>*columnHeights;
/// 内容的高度
Prop_assign()CGFloat contentHeight;

- (JobsRetNSUIntegerByVoidBlock _Nonnull)colunmCount;
- (JobsRetCGFloatByVoidBlock _Nonnull)columnMargin;
- (JobsRetCGFloatByVoidBlock _Nonnull)rowMargin;
- (JobsRetUIEdgeInsetsByVoidBlock _Nonnull)edgeInsets;
-(JobsRetLMHWaterFallLayoutByCGFloatBlock _Nonnull)byContentHeight;

@end

@implementation LMHWaterFallLayout
-(JobsRetLMHWaterFallLayoutByCGFloatBlock _Nonnull)byContentHeight{
    @jobs_weakify(self)
    return ^__kindof LMHWaterFallLayout *_Nullable(CGFloat contentHeight){
        @jobs_strongify(self)
        [self setContentHeight:contentHeight];
        return self;
    };
}

#pragma mark —— 数据处理
/// 列数
- (JobsRetNSUIntegerByVoidBlock _Nonnull)colunmCount{
    @jobs_weakify(self)
    return ^NSUInteger{
        @jobs_strongify(self)
        if (!self) return (NSUInteger){0};
        if ([self.delegate respondsToSelector:@selector(columnCountInWaterFallLayout:)]) {
            return [self.delegate columnCountInWaterFallLayout:self];
        }else{
            return LMHDefaultColunmCount;
        }
    };
}
/// 列间距
- (JobsRetCGFloatByVoidBlock _Nonnull)columnMargin{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        if ([self.delegate respondsToSelector:@selector(columnMarginInWaterFallLayout:)]) {
            return [self.delegate columnMarginInWaterFallLayout:self];
        }else{
            return LMHDefaultColunmMargin;
        }
    };
}
/// 行间距
- (JobsRetCGFloatByVoidBlock _Nonnull)rowMargin{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        if ([self.delegate respondsToSelector:@selector(rowMarginInWaterFallLayout:)]) {
            return [self.delegate rowMarginInWaterFallLayout:self];
        }else{
            return LMHDefaultRowMargin;
        }
    };
}
/// item的内边距
- (JobsRetUIEdgeInsetsByVoidBlock _Nonnull)edgeInsets{
    @jobs_weakify(self)
    return ^UIEdgeInsets{
        @jobs_strongify(self)
        if (!self) return (UIEdgeInsets){0};
        if ([self.delegate respondsToSelector:@selector(edgeInsetdInWaterFallLayout:)]) {
            return [self.delegate edgeInsetdInWaterFallLayout:self];
        }else{
            return LMHDefaultEdgeInsets;
        }
    };
}
/// 初始化
- (void)prepareLayout{
    (((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LMHWaterFallLayout.class, @selector(jobsPrepareLayout)))(self, @selector(jobsPrepareLayout)))();
}

- (jobsByVoidBlock _Nonnull)jobsPrepareLayout{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super prepareLayout];
        self.byContentHeight(0);
        // 清楚之前计算的所有高度
        [self.columnHeights removeAllObjects];
        // 设置每一列默认的高度
        for (NSInteger i = 0; i < LMHDefaultColunmCount ; i ++) {
            [self.columnHeights addObject:@(LMHDefaultEdgeInsets.top)];
        }
        // 清楚之前所有的布局属性
        [self.attrsArr removeAllObjects];
        // 开始创建每一个cell对应的布局属性
        NSInteger count = [self.collectionView numberOfItemsInSection:0];
        for (int i = 0; i < count; i++) {
            // 创建位置
            NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i
                                                          inSection:0];
            // 获取indexPath位置上cell对应的布局属性
            UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            [self.attrsArr addObject:attrs];
        }
    };
}
/// 返回indexPath位置cell对应的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    return ((((JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LMHWaterFallLayout.class, @selector(layoutAttributesForItemAtIndexPath)))(self, @selector(layoutAttributesForItemAtIndexPath))))(indexPath);
}
-(JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)layoutAttributesForItemAtIndexPath{
    @jobs_weakify(self)
    return ^UICollectionViewLayoutAttributes *(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return nil;
        // 创建布局属性
        UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        //collectionView的宽度
        CGFloat collectionViewW = self.collectionView.frame.size.width;
        // 设置布局属性的frame
        CGFloat cellW = (collectionViewW - self.edgeInsets().left - self.edgeInsets().right - (self.colunmCount() - 1) * self.columnMargin()) / self.colunmCount();
        CGFloat cellH = [self.delegate waterFallLayout:self heightForItemAtIndexPath:indexPath.item itemWidth:cellW];
        // 找出最短的那一列
        NSInteger destColumn = 0;
        CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
        for (int i = 1; i < LMHDefaultColunmCount; i++) {
            // 取得第i列的高度
            CGFloat columnHeight = [self.columnHeights[i] doubleValue];
            if (minColumnHeight > columnHeight) {
                minColumnHeight = columnHeight;
                destColumn = i;
            }
        }
        CGFloat cellX = self.edgeInsets().left + destColumn * (cellW + self.columnMargin());
        CGFloat cellY = minColumnHeight;
        if (cellY != self.edgeInsets().top) {
            cellY += self.rowMargin();
        }
        attrs.frame = CGRectMake(cellX,
                                 cellY,
                                 cellW,
                                 cellH);
        // 更新最短那一列的高度
        self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
        // 记录内容的高度 - 即最长那一列的高度
        CGFloat maxColumnHeight = [self.columnHeights[destColumn] doubleValue];
        if (self.contentHeight < maxColumnHeight) {
            self.byContentHeight(maxColumnHeight);
        } return attrs;
    };
}
/// 决定cell的高度
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    JobsRetNSArrayUICollectionViewLayoutAttributesByCGRectBlock action = ((JobsRetNSArrayUICollectionViewLayoutAttributesByCGRectBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LMHWaterFallLayout.class, @selector(jobsLayoutAttributesForElementsInRect)))(self, @selector(jobsLayoutAttributesForElementsInRect));
    return action ? action(rect) : nil;
}

-(JobsRetNSArrayUICollectionViewLayoutAttributesByCGRectBlock _Nonnull)jobsLayoutAttributesForElementsInRect{
    @jobs_weakify(self)
    return ^NSArray<UICollectionViewLayoutAttributes *> *(CGRect rect){
        @jobs_strongify(self)
        if (!self) return nil;
        return self.attrsArr;
    };
}
/// 内容的高度
- (CGSize)collectionViewContentSize{
    return (((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LMHWaterFallLayout.class, @selector(jobsCollectionViewContentSize)))(self, @selector(jobsCollectionViewContentSize)))();
}

- (JobsRetCGSizeByVoidBlock _Nonnull)jobsCollectionViewContentSize{
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
    //    CGFloat maxColumnHeight = [self.columnHeights[0] doubleValue];
    //    for (int i = 0; i < LMHDefaultColunmCount; i++) {
    //
    //        // 取得第i列的高度
    //        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
    //
    //        if (maxColumnHeight < columnHeight) {
    //            maxColumnHeight = columnHeight;
    //        }
    //
    //    };return CGSizeMake(0, self.contentHeight + self.edgeInsets.bottom);
    };
}
#pragma mark —— lazyLoad
-(NSMutableArray<UICollectionViewLayoutAttributes *> *)attrsArr{
    if (!_attrsArr) {
        _attrsArr = NSMutableArray.array;
    };return _attrsArr;
}

-(NSMutableArray<NSNumber *> *)columnHeights{
    if (!_columnHeights) {
        _columnHeights = NSMutableArray.array;
    };return _columnHeights;
}

@end
