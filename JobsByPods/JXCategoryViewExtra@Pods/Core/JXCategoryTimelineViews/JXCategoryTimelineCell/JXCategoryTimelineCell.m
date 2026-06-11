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
    self.timeLabel.byAlpha(1);
}

-(void)reloadData:(JXCategoryBaseCellModel *)cellModel{
    [super reloadData:cellModel];
    JXCategoryTimelineCellModel *myCellModel = (JXCategoryTimelineCellModel *)cellModel;
    self.timeLabel.byText(myCellModel.timeTitle);

    if (myCellModel.isSelected) {
        self.timeLabel.byTextCor(myCellModel.timeTitleSelectedColor);
        self.timeLabel.byFont(myCellModel.timeTitleSelectedFont);
    }else {
        self.timeLabel.byTextCor(myCellModel.timeTitleNormalColor);
        self.timeLabel.byFont(myCellModel.timeTitleFont);
    }
}
#pragma mark —— lazyLoad
-(UILabel *)timeLabel{
    if (!_timeLabel) {
        @jobs_weakify(self)
        _timeLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self.contentView);
                    make.centerY.equalTo(self.contentView.mas_top).offset(JobsWidth(20));
                });
        });
    };return _timeLabel;
}

@end
