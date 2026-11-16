//
//  JobsProgressBarDisplayLinkTarget.m
//  JobsProgressBar
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsProgressBarDisplayLinkTarget.h"

@implementation JobsProgressBarDisplayLinkTarget

-(JobsRetIDByIDBlock _Nonnull)byAction{
    @jobs_weakify(self)
    return ^id(jobsByCADisplayLinkBlock action) {
        @jobs_strongify(self)
        self.action = action;
        return self;
    };
}

-(void)tick:(CADisplayLink *)displayLink{
    if (_action) {
        _action(displayLink);
    }
}

@end
