//
//  BaseCollectionCell.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseCollectionCell.h"

@implementation BaseCollectionCell

+ (NSString *)cellIdentifier {
    return [NSString stringWithFormat:@"%@", [self class]];
}

+ (NSNumber *)cellSizeByClass {
    return @(YES);
}

+ (NSValue *)cellSizeValue {
    return [NSValue valueWithCGSize:[self cellSize]];
}

+ (void)registerCellInCollectionView:(UICollectionView *)collectionView {
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:[self cellIdentifier]];
}

+ (instancetype)cellWithIndexPath:(NSIndexPath *)indexPath atCollectionView:(UICollectionView *)collectionView {
    return [collectionView dequeueReusableCellWithReuseIdentifier:[self cellIdentifier] forIndexPath:indexPath];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)updateWithModel:(id)model {
    self.model = model;
}

+ (CGSize)cellSize {
    return CGSizeMake(1, 1);
}

@end
