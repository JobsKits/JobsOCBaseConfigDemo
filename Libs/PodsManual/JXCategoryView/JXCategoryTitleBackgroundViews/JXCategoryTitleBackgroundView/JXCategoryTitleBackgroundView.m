//
//  JXCategoryTitleBackgroundView.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryTitleBackgroundView.h"

@interface JXCategoryTitleBackgroundView ()

Prop_strong()NSMutableArray <JXCategoryTitleBackgroundCellModel *>*tempMutArray;

@end

@implementation JXCategoryTitleBackgroundView

- (void)initializeData {
    [super initializeData];

    self.cellWidthIncrement = 20;
    self.normalBackgroundColor = [UIColor colorWithRed:237.0 / 255.0
                                                 green:236.0 / 255.0
                                                  blue:242.0 / 255.0
                                                 alpha:1.0];
    self.normalBorderColor = UIColor.clearColor;
    self.selectedBackgroundColor = [[UIColor colorWithRed:255.0 / 255.0
                                                     green:232.0 / 255.0
                                                      blue:236.0 / 255.0
                                                     alpha:1.0] colorWithAlphaComponent:0.3];
    self.selectedBorderColor = UIColor.clearColor;
    self.borderLineWidth = 1;
    self.backgroundCornerRadius = 13;
    self.backgroundWidth = JXCategoryViewAutomaticDimension;
    self.backgroundHeight = 27;
}
//返回自定义的cell class
- (Class)preferredCellClass {
    return JXCategoryTitleBackgroundCell.class;
}

- (void)refreshDataSource {
    self.dataSource = self.tempMutArray;
}

- (void)refreshCellModel:(JXCategoryBaseCellModel *)cellModel
                   index:(NSInteger)index {
    [super refreshCellModel:cellModel index:index];

    JXCategoryTitleBackgroundCellModel *myModel = (JXCategoryTitleBackgroundCellModel *)cellModel;
    myModel.normalBackgroundColor = self.normalBackgroundColor;
    myModel.normalBorderColor = self.normalBorderColor;
    myModel.selectedBackgroundColor = self.selectedBackgroundColor;
    myModel.selectedBorderColor = self.selectedBorderColor;
    myModel.borderLineWidth = self.borderLineWidth;
    myModel.backgroundCornerRadius = self.backgroundCornerRadius;
    myModel.backgroundWidth = self.backgroundWidth;
    myModel.backgroundHeight = self.backgroundHeight;
}
#pragma mark —— LazyLoad
-(NSMutableArray<JXCategoryTitleBackgroundCellModel *> *)tempMutArray{
    if (!_tempMutArray) {
        _tempMutArray = NSMutableArray.array;
        for (int i = 0; i < self.titles.count; i++) {
            [_tempMutArray addObject:JXCategoryTitleBackgroundCellModel.new];
        }
    };return _tempMutArray;
}

@end
