//
//  CardTableViewCell.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *leftImg;
@property (nonatomic, strong) UILabel *infoLab;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *priceLab;

@end

NS_ASSUME_NONNULL_END
