//
//  CustomBtnImageTopVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "CustomBtnImageTopVC.h"

@implementation CustomBtnImageTopVC

-(NSString *)demoTitle{
    return @"image上，label下".tr;
}

-(NSString *)demoSubTitle{
    return @"图标在 top，标题在 bottom，适合垂直按钮入口。".tr;
}

-(NSDirectionalRectEdge)imagePlacement{
    return NSDirectionalRectEdgeTop;
}

@end
