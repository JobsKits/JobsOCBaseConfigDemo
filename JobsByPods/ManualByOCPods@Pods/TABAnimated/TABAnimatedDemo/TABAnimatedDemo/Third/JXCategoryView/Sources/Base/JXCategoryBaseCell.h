//
//  JXCategoryBaseCell.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <TABAnimated/JXCategoryBaseCellModel.h>
#import <TABAnimated/JXCategoryViewAnimator.h>
#import <TABAnimated/JXCategoryViewDefines.h>

@interface JXCategoryBaseCell : UICollectionViewCell

@property (nonatomic, strong, readonly) JXCategoryBaseCellModel *cellModel;
@property (nonatomic, strong, readonly) JXCategoryViewAnimator *animator;

- (void)initializeViews NS_REQUIRES_SUPER;

- (void)reloadData:(JXCategoryBaseCellModel *)cellModel NS_REQUIRES_SUPER;

- (BOOL)checkCanStartSelectedAnimation:(JXCategoryBaseCellModel *)cellModel;

- (void)addSelectedAnimationBlock:(JXCategoryCellSelectedAnimationBlock)block;

- (void)startSelectedAnimationIfNeeded:(JXCategoryBaseCellModel *)cellModel;
@end
