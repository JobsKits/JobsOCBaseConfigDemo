//
//  CustomBtnImageBottomVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "CustomBtnImageBottomVC.h"

@implementation CustomBtnImageBottomVC
-(JobsRetStrByVoidBlock _Nonnull)demoTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"image下，label上".jobsTr();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoSubTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"图标在 bottom，标题在 top，用来验证上下反向排布。".jobsTr();
    };
}

-(NSDirectionalRectEdge)imagePlacement{
    return NSDirectionalRectEdgeBottom;
}

@end
