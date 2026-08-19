//
//  CustomBtnImageTrailingVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "CustomBtnImageTrailingVC.h"

@implementation CustomBtnImageTrailingVC
-(JobsRetStrByVoidBlock _Nonnull)demoTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"image右、label左".jobsTr();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoSubTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"图标放到 trailing，标题自然落在 leading。".jobsTr();
    };
}

-(NSDirectionalRectEdge)imagePlacement{
    return NSDirectionalRectEdgeTrailing;
}

@end
