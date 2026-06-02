//
//  UICollectionViewLayoutAttributes+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UICollectionViewLayoutAttributes+Extra.h"

@implementation UICollectionViewLayoutAttributes (Extra)

+(JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)initBy{
    return ^__kindof UICollectionViewLayoutAttributes *_Nullable(__kindof NSIndexPath *_Nullable indexPath){
        return [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    };
}

@end
