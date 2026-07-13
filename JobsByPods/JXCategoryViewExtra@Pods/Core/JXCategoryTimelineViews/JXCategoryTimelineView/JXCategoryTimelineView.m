//
//  JXCategoryTimelineView.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryTimelineView.h"

@implementation JXCategoryTimelineView

- (void)initializeData {
    [super initializeData];

    _timeTitleFont = UIFontBoldSystemFontOfSize(JobsWidth(13));
    self.titleFont = UIFontWeightRegularSize(JobsWidth(10));
    _timeTitleSelectedFont = UIFontBoldSystemFontOfSize(JobsWidth(15));
    self.titleSelectedFont = UIFontWeightRegularSize(JobsWidth(10));
    _timeTitleNormalColor = UIColor.lightGrayColor;
    self.titleColor = UIColor.lightGrayColor;
    _timeTitleSelectedColor = UIColor.whiteColor;
    self.titleSelectedColor = UIColor.whiteColor;
}
//返回自定义的cell class
-(Class)preferredCellClass{
    return JXCategoryTimelineCell.class;
}

- (void)refreshDataSource {
    NSMutableArray *tempArray = NSMutableArray.array;
    for (int i = 0; i < self.timeTitles.count; i++) {
        JXCategoryTimelineCellModel *cellModel = JXCategoryTimelineCellModel.new;
        [tempArray addObject:cellModel];
    }self.dataSource = (NSMutableArray *)tempArray;
}

- (void)refreshCellModel:(JXCategoryBaseCellModel *)cellModel
                   index:(NSInteger)index {
    [super refreshCellModel:cellModel
                      index:index];

    JXCategoryTimelineCellModel *model = (JXCategoryTimelineCellModel *)cellModel;
    model.timeTitle = self.timeTitles[index];
    model.timeTitleNormalColor = self.timeTitleNormalColor;
    model.timeTitleSelectedColor = self.timeTitleSelectedColor;
    model.timeTitleFont = self.timeTitleFont;
    model.timeTitleSelectedFont = self.timeTitleSelectedFont;
}

@end
