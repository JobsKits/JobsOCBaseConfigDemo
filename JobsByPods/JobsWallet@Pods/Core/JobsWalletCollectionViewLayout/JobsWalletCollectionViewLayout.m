//
//  JobsWalletCollectionViewLayout.m
//  JobsWallet
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsWalletCollectionViewLayout.h"

static CGFloat const JobsWalletCollectionViewLayoutDefaultItemHeight = 96;
static CGFloat const JobsWalletCollectionViewLayoutDefaultOverlapRatio = 0.5;
static CGFloat const JobsWalletCollectionViewLayoutDefaultExpandedItemSpacing = 10;
static NSTimeInterval const JobsWalletCollectionViewLayoutDefaultAnimationDuration = 0.28;

@interface JobsWalletCollectionViewLayout ()

Prop_strong()NSMutableArray<UICollectionViewLayoutAttributes *> *attributesArray;
Prop_strong()NSMutableSet<NSString *> *expandedIndexPathKeys;
Prop_assign()CGSize currentContentSize;

@end

@implementation JobsWalletCollectionViewLayout
-(instancetype)init{
    if ((self = [super init])) {
        _padding = 15;
        _itemHeight = JobsWalletCollectionViewLayoutDefaultItemHeight;
        _overlapRatio = JobsWalletCollectionViewLayoutDefaultOverlapRatio;
        _expandedItemSpacing = JobsWalletCollectionViewLayoutDefaultExpandedItemSpacing;
        _contentBottomSpacing = 12;
        _animationDuration = JobsWalletCollectionViewLayoutDefaultAnimationDuration;
        _expandStyle = JobsWalletCardExpandStyleOnlySelected;
    };return self;
}

-(void)prepareLayout{
    [super prepareLayout];
    [self.attributesArray removeAllObjects];
    CGFloat collectionViewWidth = CGRectGetWidth(self.collectionView.bounds);
    CGFloat contentWidth = MAX(0, collectionViewWidth - self.padding * 2);
    CGFloat offsetY = 0;
    NSInteger sectionCount = self.collectionView.numberOfSections;
    for (NSInteger section = 0; section < sectionCount; section++) {
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:section];
        for (NSInteger item = 0; item < itemCount; item++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            attributes.zIndex = item * 2;
            attributes.frame = CGRectMake(self.padding, offsetY, contentWidth, self.itemHeight);
            [self.attributesArray addObject:attributes];
            offsetY = CGRectGetMaxY(attributes.frame);
            if (item < itemCount - 1) {
                offsetY += [self isExpandedIndexPath:indexPath] ? self.expandedItemSpacing : -self.itemHeight * self.overlapRatio;
            }
        }
        if (section < sectionCount - 1) {
            offsetY += self.contentBottomSpacing;
        }
    }
    CGFloat safeAreaBottom = 0;
    if (@available(iOS 11.0, *)) {
        safeAreaBottom = self.collectionView.safeAreaInsets.bottom;
    }
    self.currentContentSize = CGSizeMake(collectionViewWidth, MAX(0, offsetY + self.contentBottomSpacing + safeAreaBottom));
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray<UICollectionViewLayoutAttributes *> *visibleAttributes = NSMutableArray.array;
    [self.attributesArray enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj,
                                                       NSUInteger idx,
                                                       BOOL * _Nonnull stop) {
        if (CGRectIntersectsRect(rect, obj.frame)) {
            [visibleAttributes addObject:obj];
        }
    }];return visibleAttributes;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    __block UICollectionViewLayoutAttributes *targetAttributes = nil;
    [self.attributesArray enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj,
                                                       NSUInteger idx,
                                                       BOOL * _Nonnull stop) {
        if ([obj.indexPath isEqual:indexPath]) {
            targetAttributes = obj;
            *stop = YES;
        }
    }];return targetAttributes;
}

-(CGSize)collectionViewContentSize{
    return self.currentContentSize;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

-(void)toggleIndexPath:(NSIndexPath *)indexPath{
    NSString *key = [self keyForIndexPath:indexPath];
    if ([self.expandedIndexPathKeys containsObject:key]) {
        [self.expandedIndexPathKeys removeObject:key];
    } else {
        if (self.expandStyle == JobsWalletCardExpandStyleOnlySelected) {
            [self.expandedIndexPathKeys removeAllObjects];
        }
        [self.expandedIndexPathKeys addObject:key];
    }
    [self refreshLayoutAnimated:YES];
}

-(void)expandAllIndexPaths{
    [self.expandedIndexPathKeys removeAllObjects];
    NSInteger sectionCount = self.collectionView.numberOfSections;
    for (NSInteger section = 0; section < sectionCount; section++) {
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:section];
        for (NSInteger item = 0; item < itemCount; item++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            [self.expandedIndexPathKeys addObject:[self keyForIndexPath:indexPath]];
        }
    }
    [self refreshLayoutAnimated:YES];
}

-(void)resetExpandedIndexPaths{
    [self resetExpandedIndexPathsAnimated:NO];
}

-(void)resetExpandedIndexPathsAnimated:(BOOL)animated{
    [self.expandedIndexPathKeys removeAllObjects];
    [self refreshLayoutAnimated:animated];
}

-(void)refreshLayoutAnimated:(BOOL)animated{
    if (!animated || !self.collectionView) {
        [self invalidateLayout];
        return;
    }
    @jobs_weakify(self)
    [UIView animateWithDuration:self.animationDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        @jobs_strongify(self)
        [self invalidateLayout];
        [self.collectionView layoutIfNeeded];
    } completion:nil];
}

-(void)setOverlapRatio:(CGFloat)overlapRatio{
    _overlapRatio = MIN(MAX(overlapRatio, 0), 0.95);
}

-(void)setExpandStyle:(JobsWalletCardExpandStyle)expandStyle{
    _expandStyle = expandStyle;
    [self resetExpandedIndexPaths];
}

-(BOOL)isExpandedIndexPath:(NSIndexPath *)indexPath{
    return [self.expandedIndexPathKeys containsObject:[self keyForIndexPath:indexPath]];
}

-(NSString *)keyForIndexPath:(NSIndexPath *)indexPath{
    return [NSString stringWithFormat:@"%ld-%ld", (long)indexPath.section, (long)indexPath.item];
}

-(NSMutableArray<UICollectionViewLayoutAttributes *> *)attributesArray{
    if (!_attributesArray) {
        _attributesArray = NSMutableArray.array;
    };return _attributesArray;
}

-(NSMutableSet<NSString *> *)expandedIndexPathKeys{
    if (!_expandedIndexPathKeys) {
        _expandedIndexPathKeys = NSMutableSet.set;
    };return _expandedIndexPathKeys;
}

@end
