//
//  JobsSuspendView.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsSuspendView.h"
#import "NSObject+Extra.h"
#import "NSString+Extra.h"
#import "UIView+Extra.h"

@interface JobsSuspendView ()

@end

@implementation JobsSuspendView
-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(self.backgroundColor ? :JobsBlackColor);
        self.cornerCutToCircleWithCornerRadius(8);
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.panRcognize.enabled = self.isAllowDrag;
}

-(void)actionSuspendViewBlock:(jobsByIDBlock _Nullable)suspendViewBlock{
    self.suspendViewBlock = suspendViewBlock;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if (self.suspendViewBlock) {
        self.suspendViewBlock(@1);
    }
}

@end
