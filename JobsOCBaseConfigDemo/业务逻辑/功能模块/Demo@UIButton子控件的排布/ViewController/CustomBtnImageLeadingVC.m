//
//  CustomBtnImageLeadingVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "CustomBtnImageLeadingVC.h"

@implementation CustomBtnImageLeadingVC
-(JobsRetStrByVoidBlock _Nonnull)demoTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"image左、label右【系统默认状态】".jobsTr();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoSubTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"图标在 leading，标题在 trailing，保持 UIButton 默认图文顺序。".jobsTr();
    };
}

-(NSDirectionalRectEdge)imagePlacement{
    return NSDirectionalRectEdgeLeading;
}

@end
