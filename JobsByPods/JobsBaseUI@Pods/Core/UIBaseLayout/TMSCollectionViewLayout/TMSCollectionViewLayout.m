//
//  TMSCollectionViewLayout.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TMSCollectionViewLayout.h"

#import <JobsBaseUI/NSString+ID.h>
#import <JobsBaseUI/UICollectionViewLayoutAttributes+Extra.h>

static CGFloat const TMSCollectionViewLayoutDefaultItemHeight = 76; // cell高度
static CGFloat const TMSCollectionViewLayoutDefaultOverlapRatio = 0.5; // 默认盖住50%
static CGFloat const TMSCollectionViewLayoutDefaultExpandedItemSpacing = 10; // 展开后的正常间距

@interface TMSCollectionViewLayout ()

Prop_strong()NSMutableArray <UICollectionViewLayoutAttributes *>* attrubutesArray;
/** 点击的item */
Prop_strong()NSIndexPath *clickIndexPath;
/** 是否展开 */
Prop_assign()BOOL isExpand;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN TMSCollectionViewLayout
@interface TMSCollectionViewLayout (JobsPropertyDSLSetterAutogen_fbde58f114)
-(void)setClickIndexPath:(NSIndexPath * _Nullable)data;
-(void)setIsExpand:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END TMSCollectionViewLayout

@implementation TMSCollectionViewLayout
#pragma mark —— 覆写 UICollectionViewLayout 父类方法
-(instancetype)init{
    if ((self = [super init])) {
        _itemHeight = TMSCollectionViewLayoutDefaultItemHeight;
        _overlapRatio = TMSCollectionViewLayoutDefaultOverlapRatio;
        _expandedItemSpacing = TMSCollectionViewLayoutDefaultExpandedItemSpacing;
    };return self;
}

-(void)prepareLayout {
    (((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TMSCollectionViewLayout.class, @selector(jobsPrepareLayout)))(self, @selector(jobsPrepareLayout)))();
}

-(jobsByVoidBlock _Nonnull)jobsPrepareLayout {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super prepareLayout];
        [self.attrubutesArray removeAllObjects];
        NSInteger section = self.collectionView.numberOfSections;
        for (NSInteger i = 0; i < section; i++) {
            NSInteger itemsCount = [self.collectionView numberOfItemsInSection:i];
            UICollectionViewLayoutAttributes *headerAttributes = [self layoutAttributesForSupplementaryViewOfKind:TMSCollectionViewSectionHeader
                                                                                                      atIndexPath:[NSIndexPath indexPathForRow:0 inSection:i]];
            if (headerAttributes) {
                [self.attrubutesArray addObject:headerAttributes];
            }
            for (NSInteger j = 0; j < itemsCount; j++) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
                UICollectionViewLayoutAttributes * attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
                [self.attrubutesArray addObject:attributes];
            }
            UICollectionViewLayoutAttributes *footerAttributes = [self layoutAttributesForSupplementaryViewOfKind:TMSCollectionViewSectionFooter
                                                                                                      atIndexPath:[NSIndexPath indexPathForRow:itemsCount - 1 inSection:i]];
            if (footerAttributes) {
                [self.attrubutesArray addObject:footerAttributes];
            }
        }
    };
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return ((((JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TMSCollectionViewLayout.class, @selector(layoutAttributesForItemAtIndexPath)))(self, @selector(layoutAttributesForItemAtIndexPath))))(indexPath);
}
-(JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)layoutAttributesForItemAtIndexPath{
    @jobs_weakify(self)
    return ^UICollectionViewLayoutAttributes *(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return nil;
        UICollectionViewLayoutAttributes *attribute = UICollectionViewLayoutAttributes.initBy(indexPath);
        UICollectionViewLayoutAttributes *lastAttributes = self.attrubutesArray.lastObject;
        attribute.byZIndex(indexPath.item * 2);
        CGRect frame;
        frame.size = CGSizeMake(JobsMainScreen_WIDTH() - 2 * self.padding, self.itemHeight);
        BOOL isExpandClickedCell = self.isExpand &&
                                   self.clickIndexPath &&
                                   self.clickIndexPath.section == indexPath.section &&
                                   self.clickIndexPath.item + 1 == indexPath.item;
        CGFloat itemOffsetY = 0;
        if (indexPath.item > 0) {
            itemOffsetY = isExpandClickedCell ? self.expandedItemSpacing : -self.itemHeight * self.overlapRatio;
        }
        frame.origin = CGPointMake(self.padding, CGRectGetMaxY(lastAttributes.frame) + itemOffsetY);
        attribute.byFrame(frame);
        return attribute;
    };
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind
                                                                    atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = elementKind.initCollectionViewLayoutAttributesForSupplementaryViewBy(indexPath);
    UICollectionViewLayoutAttributes *lastAttributes = self.attrubutesArray.lastObject;
    CGRect frame;
    if([elementKind isEqual:TMSCollectionViewSectionHeader]){
        CGFloat headerViewH = [self.layout_delegate collectionView:self.collectionView resuableHeaderViewHeightForIndexPath:indexPath];
        if (headerViewH <= 0) {
            return nil;
        }frame.size = CGSizeMake(JobsMainScreen_WIDTH(), headerViewH);
    } else {
        CGFloat footerViewH = [self.layout_delegate collectionView:self.collectionView resuableFooterViewHeightForIndexPath:indexPath];
        if (footerViewH <= 0) {
            return nil;
        }frame.size = CGSizeMake(JobsMainScreen_WIDTH(), footerViewH);
    }
    frame.origin = CGPointMake(0, CGRectGetMaxY(lastAttributes.frame));
    attributes.byFrame(frame);
    return attributes;
}

-(CGSize)collectionViewContentSize {
    return (((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TMSCollectionViewLayout.class, @selector(jobsCollectionViewContentSize)))(self, @selector(jobsCollectionViewContentSize)))();
}

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsCollectionViewContentSize {
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        UICollectionViewLayoutAttributes *attribute = self.attrubutesArray.lastObject;
        CGFloat safeAreaBottom = 0;
        if (@available(iOS 11.0, *)) {
            safeAreaBottom = self.collectionView.safeAreaInsets.bottom;
        };return CGSizeMake(JobsMainScreen_WIDTH(), CGRectGetMaxY(attribute.frame) + 5 + safeAreaBottom);
    };
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    JobsRetNSArrayByCGRectBlock action = ((JobsRetNSArrayByCGRectBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TMSCollectionViewLayout.class, @selector(jobsLayoutAttributesForElementsInRect)))(self, @selector(jobsLayoutAttributesForElementsInRect));
    return action ? action(rect) : nil;
}

-(JobsRetNSArrayByCGRectBlock _Nonnull)jobsLayoutAttributesForElementsInRect{
    @jobs_weakify(self)
    return ^NSArray *(CGRect rect){
        @jobs_strongify(self)
        if (!self) return nil;
        return self.attrubutesArray;
    };
}

//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
//    return YES;
//}
#pragma mark —— 一些公有方法
/// 点击item
-(void)didClickWithIndexPath:(NSIndexPath *)clickIndexPath isExpand:(BOOL)isExpand {
    self.byExpand(isExpand);
    self.byClickIndexPath(self.isExpand ? clickIndexPath : nil);
    @jobs_weakify(self)
    [UIView animateWithDuration:0.28
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        @jobs_strongify(self)
        [self invalidateLayout];
        [self.collectionView layoutIfNeeded];
    } completion:nil];
    // 使用该方法，最底部的item会闪动
//    [UIView animateWithDuration:2 animations:^{
//        [self invalidateLayout];
//    }];
}
#pragma mark —— lazyLoad
-(void)setOverlapRatio:(CGFloat)overlapRatio{
    _overlapRatio = MIN(MAX(overlapRatio, 0), 0.95);
}

-(NSMutableArray<UICollectionViewLayoutAttributes *> *)attrubutesArray{
    if (!_attrubutesArray) {
        _attrubutesArray = NSMutableArray.array;
    };return _attrubutesArray;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN TMSCollectionViewLayout
-(JobsRetTMSCollectionViewLayoutByBOOLBlock _Nonnull)byExpand{
    @jobs_weakify(self)
    return ^__kindof TMSCollectionViewLayout * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsExpand:data];
        return self;
    };
}

-(JobsRetTMSCollectionViewLayoutByNSIndexPathBlock _Nonnull)byClickIndexPath{
    @jobs_weakify(self)
    return ^__kindof TMSCollectionViewLayout * _Nullable(NSIndexPath * _Nullable data){
        @jobs_strongify(self)
        [self setClickIndexPath:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END TMSCollectionViewLayout
@end
