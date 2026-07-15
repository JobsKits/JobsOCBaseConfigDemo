//
//  NSString+ID.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+ID.h"

@implementation NSString (ID)
-(JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)initCollectionViewLayoutAttributesForSupplementaryViewBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewLayoutAttributes *_Nullable(__kindof NSIndexPath *_Nullable indexPath){
        @jobs_strongify(self)
        return [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:self withIndexPath:indexPath];;
    };
}

-(JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)initCollectionViewLayoutAttributesForDecorationViewBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewLayoutAttributes *_Nullable(__kindof NSIndexPath *_Nullable indexPath){
        @jobs_strongify(self)
        return [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:self withIndexPath:indexPath];;
    };
}

@end
