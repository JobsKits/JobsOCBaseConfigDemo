//
//  CustomBtnImageBottomVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "CustomBtnImageBottomVC.h"

@implementation CustomBtnImageBottomVC
-(NSString *)demoTitle{
    return @"image下，label上".tr;
}

-(NSString *)demoSubTitle{
    return @"图标在 bottom，标题在 top，用来验证上下反向排布。".tr;
}

-(NSDirectionalRectEdge)imagePlacement{
    return NSDirectionalRectEdgeBottom;
}

@end
