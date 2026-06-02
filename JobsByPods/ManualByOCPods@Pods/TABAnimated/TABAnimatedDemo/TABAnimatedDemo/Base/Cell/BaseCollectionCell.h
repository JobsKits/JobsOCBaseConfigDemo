//
//  BaseCollectionCell.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionCell : UICollectionViewCell

@property (nonatomic, strong) id model;

+ (NSString *)cellIdentifier;
+ (void)registerCellInCollectionView:(UICollectionView *)collectionView;
+ (NSNumber *)cellSizeByClass;
+ (NSValue *)cellSizeValue;
- (void)updateWithModel:(id)model;
+ (CGSize)cellSize;
+ (instancetype)cellWithIndexPath:(NSIndexPath *)indexPath atCollectionView:(UICollectionView *)collectionView;

@end
