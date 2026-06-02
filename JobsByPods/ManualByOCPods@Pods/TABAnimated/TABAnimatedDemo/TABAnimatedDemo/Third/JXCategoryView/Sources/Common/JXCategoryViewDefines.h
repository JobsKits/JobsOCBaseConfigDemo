//
//  JXCategoryViewDefines.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static const CGFloat JXCategoryViewAutomaticDimension = -1;

typedef void(^JXCategoryCellSelectedAnimationBlock)(CGFloat percent);

typedef NS_ENUM(NSUInteger, JXCategoryComponentPosition) {
    JXCategoryComponentPosition_Bottom,
    JXCategoryComponentPosition_Top,
};

// cell被选中的类型
typedef NS_ENUM(NSUInteger, JXCategoryCellSelectedType) {
    JXCategoryCellSelectedTypeUnknown,          //未知，不是选中（cellForRow方法里面、两个cell过渡时）
    JXCategoryCellSelectedTypeClick,            //点击选中
    JXCategoryCellSelectedTypeCode,             //调用方法`- (void)selectItemAtIndex:(NSInteger)index`选中
    JXCategoryCellSelectedTypeScroll            //通过滚动到某个cell选中
};

typedef NS_ENUM(NSUInteger, JXCategoryTitleLabelAnchorPointStyle) {
    JXCategoryTitleLabelAnchorPointStyleCenter,
    JXCategoryTitleLabelAnchorPointStyleTop,
    JXCategoryTitleLabelAnchorPointStyleBottom,
};

#define JXCategoryViewDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)
