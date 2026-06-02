//
//  UIViewController+JXCategoryListContentViewDelegate.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+JXCategoryListContentViewDelegate.h"

@implementation UIViewController (JXCategoryListContentViewDelegate)
/**
 如果列表是VC，就返回VC.view
 如果列表是View，就返回View自己

 @return 返回列表视图
 */
- (UIView *)listView{
    return self.view;
}

@end
