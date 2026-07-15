//
//  JobsSuspendLab.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsSuspendLab.h"
#import <JobsSuspend/NSObject+Extra.h>
#import <JobsSuspend/NSString+Extra.h>
#import <JobsSuspend/UIView+Extra.h>
#import <JobsSuspend/UIView+Measure.h>
#import <JobsLanMgr/JobsLanMgr.h>

@interface JobsSuspendLab ()

@end

@implementation JobsSuspendLab
-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(self.backgroundColor ? :JobsBlackColor);
        self.byText(JobsNonnullString(self.text, @"No Data".tr));
        self.internationalizationKEY = @"No Data";
        self.textAlignment = NSTextAlignmentCenter;
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.panRcognize.byEnabled(self.isAllowDrag);
    self.userInteractionEnabled = self.isAllowDrag;
    self.cornerCutToCircleWithCornerRadius(self.height / 2);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if(self.objBlock) self.objBlock(@1);
}

@end
