//
//  JXCategoryTimelineCell.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryTimelineCell.h"

@interface JXCategoryTimelineCell ()

Prop_strong()UILabel *timeLabel;

@end

@implementation JXCategoryTimelineCell

-(void)initializeViews{
    [super initializeViews];
    self.timeLabel.alpha = 1;
}

-(void)reloadData:(JXCategoryBaseCellModel *)cellModel{
    [super reloadData:cellModel];
    JXCategoryTimelineCellModel *myCellModel = (JXCategoryTimelineCellModel *)cellModel;
    self.timeLabel.text = myCellModel.timeTitle;
    if (myCellModel.isSelected) {
        self.timeLabel.textColor = myCellModel.timeTitleSelectedColor;
        self.timeLabel.font = myCellModel.timeTitleSelectedFont;
    }else {
        self.timeLabel.textColor = myCellModel.timeTitleNormalColor;
        self.timeLabel.font = myCellModel.timeTitleFont;
    }
}
#pragma mark —— lazyLoad
-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = UILabel.new;
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_timeLabel];
        [NSLayoutConstraint activateConstraints:@[
            [_timeLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor],
            [_timeLabel.centerYAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:20]
        ]];
    }return _timeLabel;
}

@end
