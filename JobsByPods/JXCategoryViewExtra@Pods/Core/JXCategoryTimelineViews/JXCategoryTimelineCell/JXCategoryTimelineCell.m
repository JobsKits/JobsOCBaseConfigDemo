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
-(jobsByVoidBlock _Nonnull)jobsInitializeViews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super initializeViews];
        self.timeLabel.byAlpha(1);
    };
}

-(void)initializeViews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryTimelineCell.class, @selector(jobsInitializeViews)))(self, @selector(jobsInitializeViews));
    if (action) action();
}

-(jobsByJXCategoryBaseCellModelBlock _Nonnull)jobsReloadData{
    @jobs_weakify(self)
    return ^(JXCategoryBaseCellModel * cellModel){
        @jobs_strongify(self)
        if (!self) return;
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
    };
}

-(void)reloadData:(JXCategoryBaseCellModel *)cellModel{
    jobsByJXCategoryBaseCellModelBlock action = ((jobsByJXCategoryBaseCellModelBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryTimelineCell.class, @selector(jobsReloadData)))(self, @selector(jobsReloadData));
    if (action) action(cellModel);
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
