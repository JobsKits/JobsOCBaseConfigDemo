//
//  WaterFlowCollectionViewCell.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <TABAnimated/BaseCollectionCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface WaterFlowCollectionViewCell : BaseCollectionCell

@property (nonatomic,strong) UIImageView *leftImg;
@property (nonatomic,strong) UILabel *infoLab;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *contentLab;
@property (nonatomic,strong) UILabel *timeLab;
@property (nonatomic,strong) UILabel *priceLab;

- (void)updateWithModel:(id)model;

@end

NS_ASSUME_NONNULL_END
