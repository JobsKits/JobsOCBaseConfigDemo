//
//  JobsSuspendBtn.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsSuspendBtn.h"

#import <JobsSuspend/UIControl+Extra.h>
#import <JobsSuspend/UIView+Extra.h>

@interface JobsSuspendBtn ()

@end

@implementation JobsSuspendBtn
BaseViewProtocol_synthesize
-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(self.backgroundColor ? :JobsBlackColor);
        self.jobs_onChange(^(__kindof UIControl * _Nullable ctrl) {
            JobsLog(@"Hello Jobs");
        });
        self.cornerCutToCircleWithCornerRadius(JobsWidth(8));
    };return self;
}

-(JobsRetBtnByBOOLBlock _Nonnull)byAllowDrag{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(BOOL enabled) {
        @jobs_strongify(self)
        self.isAllowDrag = enabled;
        if (self.panRcognize) self.panRcognize.byEnabled(enabled);
        return self;
    };
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSuspendBtn.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
        if (self.panRcognize) self.panRcognize.byEnabled(self.isAllowDrag);// 关键代码
    };
}
#pragma mark —— 复写父类方法
-(void)setSelected:(BOOL)selected{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSuspendBtn.class, @selector(jobsSetSelected)))(self, @selector(jobsSetSelected));
    if (action) action(selected);
}

-(jobsByBOOLBlock _Nonnull)jobsSetSelected{
    @jobs_weakify(self)
    return ^(BOOL selected){
        @jobs_strongify(self)
        if (!self) return;
        [super setSelected:selected];
    };
}

@end
