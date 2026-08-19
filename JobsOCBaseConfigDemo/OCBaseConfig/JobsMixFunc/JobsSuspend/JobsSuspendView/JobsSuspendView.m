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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsSuspendView
@interface JobsSuspendView (JobsPropertyDSLSetterAutogen_a635a94f50)
-(void)setSuspendViewBlock:(jobsByIDBlock)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsSuspendView

@implementation JobsSuspendView
-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(self.backgroundColor ? :JobsBlackColor);
        self.cornerCutToCircleWithCornerRadius(8);
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSuspendView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
        if (self.panRcognize) self.panRcognize.byEnabled(self.isAllowDrag);
    };
}

-(jobsByjobsByIDBlockBlock _Nonnull)actionSuspendViewBlock{
    @jobs_weakify(self)
    return ^(jobsByIDBlock _Nullable suspendViewBlock){
        @jobs_strongify(self)
        if (!self) return;
        self.bySuspendViewBlock(suspendViewBlock);
    };
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if (self.suspendViewBlock) {
        self.suspendViewBlock(@1);
    }
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsSuspendView
-(JobsRetJobsSuspendViewByjobsByIDBlockBlock _Nonnull)bySuspendViewBlock{
    @jobs_weakify(self)
    return ^__kindof JobsSuspendView * _Nullable(jobsByIDBlock data){
        @jobs_strongify(self)
        [self setSuspendViewBlock:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsSuspendView
@end
