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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsWalletCollectionViewLayout
@interface JobsWalletCollectionViewLayout (JobsPropertyDSLSetterAutogen_2547b024ef)
-(void)setCurrentContentSize:(CGSize)data;
-(void)setExpandStyle:(JobsWalletCardExpandStyle)data;
-(void)setExpandedItemSpacing:(CGFloat)data;
-(void)setItemHeight:(CGFloat)data;
-(void)setOverlapRatio:(CGFloat)data;
-(void)setPadding:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsWalletCollectionViewLayout

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
    (((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWalletCollectionViewLayout.class, @selector(jobsPrepareLayout)))(self, @selector(jobsPrepareLayout)))();
}

-(jobsByVoidBlock _Nonnull)jobsPrepareLayout{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
                attributes.byZIndex(item * 2);
                attributes.byFrame(CGRectMake(self.padding, offsetY, contentWidth, self.itemHeight));
                [self.attributesArray addObject:attributes];
                offsetY = CGRectGetMaxY(attributes.frame);
                if (item < itemCount - 1) {
                    offsetY += self.isExpandedIndexPath(indexPath) ? self.expandedItemSpacing : -self.itemHeight * self.overlapRatio;
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
        self.byCurrentContentSize(CGSizeMake(collectionViewWidth, MAX(0, offsetY + self.contentBottomSpacing + safeAreaBottom)));
    };
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    JobsRetNSArrayUICollectionViewLayoutAttributesByCGRectBlock action = ((JobsRetNSArrayUICollectionViewLayoutAttributesByCGRectBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWalletCollectionViewLayout.class, @selector(jobsLayoutAttributesForElementsInRect)))(self, @selector(jobsLayoutAttributesForElementsInRect));
    return action ? action(rect) : nil;
}

-(JobsRetNSArrayUICollectionViewLayoutAttributesByCGRectBlock _Nonnull)jobsLayoutAttributesForElementsInRect{
    @jobs_weakify(self)
    return ^NSArray<UICollectionViewLayoutAttributes *> *(CGRect rect){
        @jobs_strongify(self)
        if (!self) return nil;
        NSMutableArray<UICollectionViewLayoutAttributes *> *visibleAttributes = NSMutableArray.array;
        [self.attributesArray enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj,
                                                           NSUInteger idx,
                                                           BOOL * _Nonnull stop) {
            if (CGRectIntersectsRect(rect, obj.frame)) {
                [visibleAttributes addObject:obj];
            }
        }];return visibleAttributes;
    };
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    return ((((JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWalletCollectionViewLayout.class, @selector(layoutAttributesForItemAtIndexPath)))(self, @selector(layoutAttributesForItemAtIndexPath))))(indexPath);
}
-(JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)layoutAttributesForItemAtIndexPath{
    @jobs_weakify(self)
    return ^UICollectionViewLayoutAttributes *(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return nil;
        __block UICollectionViewLayoutAttributes *targetAttributes = nil;
        [self.attributesArray enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj,
                                                           NSUInteger idx,
                                                           BOOL * _Nonnull stop) {
            if ([obj.indexPath isEqual:indexPath]) {
                targetAttributes = obj;
                *stop = YES;
            }
        }];return targetAttributes;
    };
}

-(CGSize)collectionViewContentSize{
    return (((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWalletCollectionViewLayout.class, @selector(jobsCollectionViewContentSize)))(self, @selector(jobsCollectionViewContentSize)))();
}

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsCollectionViewContentSize{
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return self.currentContentSize;
    };
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return ((((JobsRetBOOLByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWalletCollectionViewLayout.class, @selector(shouldInvalidateLayoutForBoundsChange)))(self, @selector(shouldInvalidateLayoutForBoundsChange))))(newBounds);
}
-(JobsRetBOOLByFrameBlock _Nonnull)shouldInvalidateLayoutForBoundsChange{
    @jobs_weakify(self)
    return ^BOOL(CGRect newBounds){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return YES;
    };
}

-(jobsByIndexPathBlock _Nonnull)toggleIndexPath{
    @jobs_weakify(self)
    return ^(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return;
        NSString *key = self.keyForIndexPath(indexPath);
        if ([self.expandedIndexPathKeys containsObject:key]) {
            [self.expandedIndexPathKeys removeObject:key];
        } else {
            if (self.expandStyle == JobsWalletCardExpandStyleOnlySelected) {
                [self.expandedIndexPathKeys removeAllObjects];
            }
            [self.expandedIndexPathKeys addObject:key];
        }
        self.refreshLayoutAnimated(YES);
    };
}

-(jobsByVoidBlock _Nonnull)expandAllIndexPaths{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.expandedIndexPathKeys removeAllObjects];
        NSInteger sectionCount = self.collectionView.numberOfSections;
        for (NSInteger section = 0; section < sectionCount; section++) {
            NSInteger itemCount = [self.collectionView numberOfItemsInSection:section];
            for (NSInteger item = 0; item < itemCount; item++) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
                [self.expandedIndexPathKeys addObject:self.keyForIndexPath(indexPath)];
            }
        }
        self.refreshLayoutAnimated(YES);
    };
}

-(jobsByVoidBlock _Nonnull)resetExpandedIndexPaths{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.resetExpandedIndexPathsAnimated(NO);
    };
}

-(jobsByBOOLBlock _Nonnull)resetExpandedIndexPathsAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [self.expandedIndexPathKeys removeAllObjects];
        self.refreshLayoutAnimated(animated);
    };
}

-(jobsByBOOLBlock _Nonnull)refreshLayoutAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
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
    };
}

-(void)setOverlapRatio:(CGFloat)overlapRatio{
    _overlapRatio = MIN(MAX(overlapRatio, 0), 0.95);
}

-(void)setExpandStyle:(JobsWalletCardExpandStyle)expandStyle{
    _expandStyle = expandStyle;
    self.resetExpandedIndexPaths();
}

-(JobsRetBOOLByNSIndexPathBlock _Nonnull)isExpandedIndexPath{
    @jobs_weakify(self)
    return ^BOOL(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return [self.expandedIndexPathKeys containsObject:self.keyForIndexPath(indexPath)];
    };
}

-(JobsRetNSStringByNSIndexPathBlock _Nonnull)keyForIndexPath{
    @jobs_weakify(self)
    return ^NSString *(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return nil;
        return [NSString stringWithFormat:@"%ld-%ld", (long)indexPath.section, (long)indexPath.item];
    };
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsWalletCollectionViewLayout
-(JobsRetJobsWalletCollectionViewLayoutByCGFloatBlock _Nonnull)byExpandedItemSpacing{
    @jobs_weakify(self)
    return ^__kindof JobsWalletCollectionViewLayout * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setExpandedItemSpacing:data];
        return self;
    };
}

-(JobsRetJobsWalletCollectionViewLayoutByCGFloatBlock _Nonnull)byItemHeight{
    @jobs_weakify(self)
    return ^__kindof JobsWalletCollectionViewLayout * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setItemHeight:data];
        return self;
    };
}

-(JobsRetJobsWalletCollectionViewLayoutByCGFloatBlock _Nonnull)byOverlapRatio{
    @jobs_weakify(self)
    return ^__kindof JobsWalletCollectionViewLayout * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setOverlapRatio:data];
        return self;
    };
}

-(JobsRetJobsWalletCollectionViewLayoutByCGFloatBlock _Nonnull)byPadding{
    @jobs_weakify(self)
    return ^__kindof JobsWalletCollectionViewLayout * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setPadding:data];
        return self;
    };
}

-(JobsRetJobsWalletCollectionViewLayoutByCGSizeBlock _Nonnull)byCurrentContentSize{
    @jobs_weakify(self)
    return ^__kindof JobsWalletCollectionViewLayout * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setCurrentContentSize:data];
        return self;
    };
}

-(JobsRetJobsWalletCollectionViewLayoutByJobsWalletCardExpandStyleBlock _Nonnull)byExpandStyle{
    @jobs_weakify(self)
    return ^__kindof JobsWalletCollectionViewLayout * _Nullable(JobsWalletCardExpandStyle data){
        @jobs_strongify(self)
        [self setExpandStyle:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsWalletCollectionViewLayout
@end
