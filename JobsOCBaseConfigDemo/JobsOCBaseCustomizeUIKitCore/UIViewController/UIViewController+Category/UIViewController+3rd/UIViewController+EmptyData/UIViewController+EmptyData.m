//
//  UIViewController+EmptyData.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+EmptyData.h"

@implementation UIViewController (EmptyData)
-(void)ifEmptyData{
    [self.view ifEmptyData];
    self.view.tipsLab.byText(self.view.tipsTitle.add(@"\n").add(ReuseIdentifier));
}

@end
