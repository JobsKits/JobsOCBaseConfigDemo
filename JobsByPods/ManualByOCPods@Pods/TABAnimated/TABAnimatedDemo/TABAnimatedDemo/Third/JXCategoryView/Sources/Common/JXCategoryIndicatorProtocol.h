//
//  JXCategoryIndicatorProtocol.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <TABAnimated/JXCategoryViewDefines.h>
#import <TABAnimated/JXCategoryIndicatorParamsModel.h>

@protocol JXCategoryIndicatorProtocol <NSObject>

/**
 categoryView重置状态时调用

 param selectedIndex 当前选中的index
 param selectedCellFrame 当前选中的cellFrame
 @param model 数据模型
 */
- (void)jx_refreshState:(JXCategoryIndicatorParamsModel *)model;

/**
 contentScrollView在进行手势滑动时，处理指示器跟随手势变化UI逻辑；

 param selectedIndex 当前选中的index
 param leftIndex 正在过渡中的两个cell，相对位置在左边的cell的index
 param leftCellFrame 正在过渡中的两个cell，相对位置在左边的cell的frame
 param rightIndex 正在过渡中的两个cell，相对位置在右边的cell的index
 param rightCellFrame 正在过渡中的两个cell，相对位置在右边的cell的frame
 param percent 过渡百分比
 @param model 数据模型
 */
- (void)jx_contentScrollViewDidScroll:(JXCategoryIndicatorParamsModel *)model;

/**
 选中了某一个cell

 param lastSelectedIndex 之前选中的index
 param selectedIndex 选中的index
 param selectedCellFrame 选中的cellFrame
 param selectedType cell被选中类型
 @param model 数据模型
 */
- (void)jx_selectedCell:(JXCategoryIndicatorParamsModel *)model;

@end
