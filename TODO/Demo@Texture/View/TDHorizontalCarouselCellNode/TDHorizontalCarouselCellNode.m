//
//  TDHorizontalCarouselCellNode.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TDHorizontalCarouselCellNode.h"

@interface TDHorizontalCarouselCellNode ()

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ASLayoutElementStyle
@interface ASLayoutElementStyle (JobsLocalPropertyDSLAutogen_c150210221)
-(JobsRetASLayoutElementStyleByCGSizeBlock _Nonnull)byPreferredSize;
-(void)setPreferredSize:(CGSize)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END ASLayoutElementStyle

@implementation TDHorizontalCarouselCellNode
- (instancetype)initWithCount:(NSInteger)count {
    if (self = [super init]) {
        self.automaticallyManagesSubnodes = YES;
        self.collection.inverted = NO;
        _items = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
            for (NSInteger i = 0; i < count; i++) {
                arr.add(@(i));
            }
        });
    };return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    JobsRetASLayoutSpecByASSizeRangeBlock action = ((JobsRetASLayoutSpecByASSizeRangeBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TDHorizontalCarouselCellNode.class, @selector(jobsLayoutSpecThatFits)))(self, @selector(jobsLayoutSpecThatFits));
    return action ? action(constrainedSize) : nil;
}

-(JobsRetASLayoutSpecByASSizeRangeBlock _Nonnull)jobsLayoutSpecThatFits{
    @jobs_weakify(self)
    return ^ASLayoutSpec *(ASSizeRange constrainedSize){
        @jobs_strongify(self)
        if (!self) return nil;
        return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 0, 8, 0) child:self.collection];
    };
}
#pragma mark —— ASCollection
-(NSInteger)collectionNode:(ASCollectionNode *)collectionNode
    numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

-(ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode
     nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath {
    return ^ASCellNode * _Nonnull{
        return [TDHorizontalItemNode.alloc initWithIndex:indexPath.item];
    };
}
#pragma mark —— lazyLoad
-(ASCollectionNode *)collection{
    if(!_collection){
        @jobs_weakify(self)
        _collection = jobsMakeCollectionNode(^(ASCollectionNode * _Nullable node) {
            @jobs_strongify(self)
            node = [ASCollectionNode.alloc initWithCollectionViewLayout:jobsMakeCollectionViewFlowLayout(^(__kindof UICollectionViewFlowLayout * _Nullable layout) {
                layout
                    .byScrollDirection(UICollectionViewScrollDirectionHorizontal)
                    .byMinimumInteritemSpacing(10)
                    .byMinimumLineSpacing(10)
                    .bySectionInset(UIEdgeInsetsMake(0, 10, 0, 10));
            })];
            node
                .byDataSource(self)
                .byDelegate(self)
                .byBgColor(UIColor.clearColor);
            node.style.byPreferredSize(CGSizeMake(0, 90));
            /// 预取/范围调优（水平场景）
            node
                .byLeadingScreensForBatching(1.5)
                .byInverted(NO);
        });
    };return _collection;
}

@end
