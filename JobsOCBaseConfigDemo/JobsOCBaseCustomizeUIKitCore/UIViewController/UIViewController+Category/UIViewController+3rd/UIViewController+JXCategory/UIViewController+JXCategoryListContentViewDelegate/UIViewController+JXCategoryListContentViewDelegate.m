//
//  UIViewController+JXCategoryListContentViewDelegate.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2020/10/12.
//

#import "UIViewController+JXCategoryListContentViewDelegate.h"

@implementation UIViewController (JXCategoryListContentViewDelegate)
/**
 如果列表是VC，就返回VC.view
 如果列表是View，就返回View自己

 @return 返回列表视图
 */
-(UIView *)listView{
    JobsRetViewByVoidBlock action = ((JobsRetViewByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIViewController.class, @selector(jobsListView)))(self, @selector(jobsListView));
    return action ? action() : nil;
}

@end
