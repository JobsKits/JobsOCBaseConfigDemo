//
//  JXCategoryTitleCell.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <TABAnimated/JXCategoryIndicatorCell.h>
#import <TABAnimated/JXCategoryViewDefines.h>
@class JXCategoryTitleCellModel;

@interface JXCategoryTitleCell : JXCategoryIndicatorCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *maskTitleLabel;

- (JXCategoryCellSelectedAnimationBlock)preferredTitleZoomAnimationBlock:(JXCategoryTitleCellModel *)cellModel baseScale:(CGFloat)baseScale;

- (JXCategoryCellSelectedAnimationBlock)preferredTitleStrokeWidthAnimationBlock:(JXCategoryTitleCellModel *)cellModel attributedString:(NSMutableAttributedString *)attributedString;

- (JXCategoryCellSelectedAnimationBlock)preferredTitleColorAnimationBlock:(JXCategoryTitleCellModel *)cellModel;

@end
