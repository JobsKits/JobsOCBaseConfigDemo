//
//  LMJDropdownMenu+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LMJDropdownMenu+Extra.h"
#import <objc/runtime.h>

@implementation LMJDropdownMenu (Extra)

-(__kindof UIButton *)great{
    Ivar ivar = class_getInstanceVariable(LMJDropdownMenu.class, "mainBtn");
    return ivar ? object_getIvar(self, ivar) : nil;
}

-(void)greatAtEmpty{
    UIButton *btn = self.great;
    [btn setImage:[UIImage imageNamed:@"空白图"] forState:UIControlStateNormal];
    if (@available(iOS 15.0, *)) {
        UIButtonConfiguration *config = btn.configuration ?: UIButtonConfiguration.plainButtonConfiguration;
        config.imagePlacement = NSDirectionalRectEdgeTrailing;
        config.imagePadding = 5.0;
        btn.configuration = config;
    }
}

@end
