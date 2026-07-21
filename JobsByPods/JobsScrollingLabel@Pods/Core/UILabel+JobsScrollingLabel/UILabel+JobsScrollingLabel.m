//
//  UILabel+JobsScrollingLabel.m
//  JobsScrollingLabel
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#import "UILabel+JobsScrollingLabel.h"
#import "JobsLabelScrollController.h"

static void *JobsScrollingLabelControllerKey = &JobsScrollingLabelControllerKey;

@implementation UILabel (JobsScrollingLabel)

-(JobsLabelScrollController *)jobs_scrollController{
    JobsLabelScrollController *controller = objc_getAssociatedObject(self,
                                                                      JobsScrollingLabelControllerKey);
    if (!controller) {
        controller = [JobsLabelScrollController.alloc initWithLabel:self];
        objc_setAssociatedObject(self,
                                 JobsScrollingLabelControllerKey,
                                 controller,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }return controller;
}

-(instancetype)byTextScroll:(JobsLabelScrollConfiguration *)configuration{
    [self.jobs_scrollController configure:configuration];
    return self;
}

-(instancetype)byStartTextScroll{
    [self.jobs_scrollController start];
    return self;
}

-(instancetype)byPauseTextScroll{
    [self.jobs_scrollController pause];
    return self;
}

-(instancetype)byResumeTextScroll{
    [self.jobs_scrollController resume];
    return self;
}

-(instancetype)byReloadTextScroll{
    [self.jobs_scrollController reload];
    return self;
}

-(instancetype)byStopTextScroll{
    [self.jobs_scrollController stop];
    return self;
}

-(BOOL)jobs_isTextScrolling{
    return self.jobs_scrollController.isRunning;
}

@end
