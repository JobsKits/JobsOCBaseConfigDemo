//
//  UIViewController+JXCategoryListContentViewDelegate.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_JXCATEGORYLISTCONTENTVIEWDELEGATE_C81A8E79DF
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_JXCATEGORYLISTCONTENTVIEWDELEGATE_C81A8E79DF

#import <UIKit/UIKit.h>

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JXCategoryListContentViewDelegate)
<
JXCategoryListContentViewDelegate
>
/**
 如果列表是VC，就返回VC.view
 如果列表是View，就返回View自己

 @return 返回列表视图
 */
- (UIView *)listView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_JXCATEGORYLISTCONTENTVIEWDELEGATE_C81A8E79DF */
