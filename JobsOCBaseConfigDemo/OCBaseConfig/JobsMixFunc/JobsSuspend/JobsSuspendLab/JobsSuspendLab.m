//
//  JobsSuspendLab.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsSuspendLab.h"
#import "NSObject+Extra.h"
#import "NSString+Extra.h"
#import "UIView+Extra.h"
#import "UIView+Measure.h"
#import "JobsLanMgr.h"

@interface JobsSuspendLab ()

@end

@implementation JobsSuspendLab

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(self.backgroundColor ? :JobsBlackColor);

        self.text = JobsNonnullString(self.text, @"No Data".tr);
        self.internationalizationKEY = @"No Data";
        self.textAlignment = NSTextAlignmentCenter;
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.panRcognize.enabled = self.isAllowDrag;
    self.userInteractionEnabled = self.isAllowDrag;
    self.cornerCutToCircleWithCornerRadius(self.height / 2);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if(self.objBlock) self.objBlock(@1);
}

@end
