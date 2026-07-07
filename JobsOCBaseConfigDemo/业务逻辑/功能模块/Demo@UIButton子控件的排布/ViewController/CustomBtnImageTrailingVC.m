//
//  CustomBtnImageTrailingVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "CustomBtnImageTrailingVC.h"

@implementation CustomBtnImageTrailingVC

-(NSString *)demoTitle{
    return @"image右、label左".tr;
}

-(NSString *)demoSubTitle{
    return @"图标放到 trailing，标题自然落在 leading。".tr;
}

-(NSDirectionalRectEdge)imagePlacement{
    return NSDirectionalRectEdgeTrailing;
}

@end
