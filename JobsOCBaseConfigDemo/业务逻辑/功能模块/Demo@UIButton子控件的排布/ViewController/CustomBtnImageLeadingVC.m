//
//  CustomBtnImageLeadingVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "CustomBtnImageLeadingVC.h"

@implementation CustomBtnImageLeadingVC

-(NSString *)demoTitle{
    return @"image左、label右【系统默认状态】".tr;
}

-(NSString *)demoSubTitle{
    return @"图标在 leading，标题在 trailing，保持 UIButton 默认图文顺序。".tr;
}

-(NSDirectionalRectEdge)imagePlacement{
    return NSDirectionalRectEdgeLeading;
}

@end
