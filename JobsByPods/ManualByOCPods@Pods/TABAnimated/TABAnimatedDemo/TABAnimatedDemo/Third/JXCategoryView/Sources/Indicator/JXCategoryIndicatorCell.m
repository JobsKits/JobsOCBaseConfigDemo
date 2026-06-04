//
//  JXCategoryIndicatorCell.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryIndicatorCell.h"
#import "JXCategoryIndicatorCellModel.h"

@interface JXCategoryIndicatorCell ()
@property (nonatomic, strong) UIView *separatorLine;

@end

@implementation JXCategoryIndicatorCell

- (void)initializeViews
{
    [super initializeViews];

    self.separatorLine = [[UIView alloc] init];
    self.separatorLine.hidden = YES;
    [self.contentView addSubview:self.separatorLine];
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    JXCategoryIndicatorCellModel *model = (JXCategoryIndicatorCellModel *)self.cellModel;
    CGFloat lineWidth = model.separatorLineSize.width;
    CGFloat lineHeight = model.separatorLineSize.height;

    self.separatorLine.frame = CGRectMake(self.bounds.size.width - lineWidth + self.cellModel.cellSpacing/2, (self.bounds.size.height - lineHeight)/2.0, lineWidth, lineHeight);
}

- (void)reloadData:(JXCategoryBaseCellModel *)cellModel {
    [super reloadData:cellModel];

    JXCategoryIndicatorCellModel *model = (JXCategoryIndicatorCellModel *)cellModel;
    self.separatorLine.backgroundColor = model.separatorLineColor;
    self.separatorLine.hidden = !model.sepratorLineShowEnabled;

    if (model.cellBackgroundColorGradientEnabled) {
        if (model.selected) {
            self.contentView.backgroundColor = model.cellBackgroundSelectedColor;
        }else {
            self.contentView.backgroundColor = model.cellBackgroundUnselectedColor;
        }
    }
}

@end
