//
//  CustomBtnImageTopVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "CustomBtnImageTopVC.h"

@implementation CustomBtnImageTopVC
-(JobsRetStrByVoidBlock _Nonnull)demoTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"image上，label下".jobsTr();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoSubTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"图标在 top，标题在 bottom，适合垂直按钮入口。".jobsTr();
    };
}

-(NSDirectionalRectEdge)imagePlacement{
    return NSDirectionalRectEdgeTop;
}

@end
