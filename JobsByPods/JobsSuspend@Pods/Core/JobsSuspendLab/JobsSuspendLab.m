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
-(JobsRetUILabelByBOOLBlock _Nonnull)byAllowDrag{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.isAllowDrag = data;
        return self;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(self.backgroundColor ? :JobsBlackColor);
        self.byText(JobsNonnullString(self.text, @"No Data".jobsTr()));
        self.byInternationalizationKEY(@"No Data");
        self.byTextAlignment(NSTextAlignmentCenter);
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSuspendLab.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
        if (self.panRcognize) self.panRcognize.byEnabled(self.isAllowDrag);
        self.byUserInteractionEnabled(self.isAllowDrag);
        self.cornerCutToCircleWithCornerRadius(self.height / 2);
    };
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if(self.objBlock) self.objBlock(@1);
}

@end
