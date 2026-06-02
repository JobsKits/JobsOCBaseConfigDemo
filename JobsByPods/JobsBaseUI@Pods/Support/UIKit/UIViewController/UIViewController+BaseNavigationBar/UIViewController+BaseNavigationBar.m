//
//  UIViewController+BaseNavigationBar.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+BaseNavigationBar.h"

@implementation UIViewController (BaseNavigationBar)
#pragma mark —— Prop_assign()BOOL isHiddenNavigationBar
JobsKey(_isHiddenNavigationBar)
@dynamic isHiddenNavigationBar;
-(BOOL)isHiddenNavigationBar{//默认不显示
    return [Jobs_getAssociatedObject(_isHiddenNavigationBar) boolValue];
}

-(void)setIsHiddenNavigationBar:(BOOL)isHiddenNavigationBar{
    [self.navigationController setNavigationBarHidden:isHiddenNavigationBar animated:true];
    Jobs_setAssociatedRETAIN_NONATOMIC(_isHiddenNavigationBar, @(isHiddenNavigationBar))
}

@end
