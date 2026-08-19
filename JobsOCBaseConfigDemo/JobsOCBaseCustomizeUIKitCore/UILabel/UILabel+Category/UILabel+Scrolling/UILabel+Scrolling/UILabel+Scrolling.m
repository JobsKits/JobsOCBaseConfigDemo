//
//  UILabel+Scrolling.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#import "UILabel+Scrolling.h"

#import "JobsLabelScrollController.h"

JobsKey(JobsUILabelScrollingControllerKey)
JobsKey(JobsUILabelTextDisplayModeKey)

@interface UILabel (ScrollingPrivate)

-(JobsRetJobsLabelScrollControllerByVoidBlock _Nonnull)jobs_existingScrollController;
-(JobsRetJobsLabelScrollControllerByVoidBlock _Nonnull)jobs_scrollController;

@end

@implementation UILabel (Scrolling)

-(JobsRetIDByJobsLabelTextDisplayModeBlock _Nonnull)byTextDisplayMode{
    @jobs_weakify(self)
    return ^id(JobsLabelTextDisplayMode mode){
        @jobs_strongify(self)
        if (!self) return nil;
        return [self byTextDisplayMode:mode
                   minimumScaleFactor:.5f
                 maximumNumberOfLines:2
                  scrollConfiguration:JobsLabelScrollConfiguration.continuousConfiguration()];
    };
}

-(instancetype)byTextDisplayMode:(JobsLabelTextDisplayMode)mode
              minimumScaleFactor:(CGFloat)minimumScaleFactor
            maximumNumberOfLines:(NSInteger)maximumNumberOfLines
             scrollConfiguration:(JobsLabelScrollConfiguration *)scrollConfiguration{
    Jobs_setAssociatedRETAIN_NONATOMIC(JobsUILabelTextDisplayModeKey, @(mode))
    switch (mode) {
        /// 处理 JobsLabelTextDisplayModeScaleToFit 分支
        case JobsLabelTextDisplayModeScaleToFit:
            self.byStopTextScroll()
                .byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(YES)
                .byMinimumScaleFactor(MIN(MAX(.01f, minimumScaleFactor), 1))
                .byLineBreakMode(NSLineBreakByTruncatingTail);
            break;
        /// 处理 JobsLabelTextDisplayModeSingleLineTailTruncation 分支
        case JobsLabelTextDisplayModeSingleLineTailTruncation:
            self.byStopTextScroll()
                .byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(NO)
                .byMinimumScaleFactor(1)
                .byLineBreakMode(NSLineBreakByTruncatingTail);
            break;
        /// 处理 JobsLabelTextDisplayModeMultiLineTailTruncation 分支
        case JobsLabelTextDisplayModeMultiLineTailTruncation:
            self.byStopTextScroll()
                .byNumberOfLines(MAX(2, maximumNumberOfLines))
                .byAdjustsFontSizeToFitWidth(NO)
                .byMinimumScaleFactor(1)
                .byLineBreakMode(NSLineBreakByTruncatingTail);
            break;
        /// 处理 JobsLabelTextDisplayModeScrolling 分支
        case JobsLabelTextDisplayModeScrolling:
            self.byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(NO)
                .byMinimumScaleFactor(1)
                .byLineBreakMode(NSLineBreakByClipping);
            self.byTextScroll(scrollConfiguration ?: JobsLabelScrollConfiguration.continuousConfiguration());
            self.byStartTextScroll();
            break;
    }return self;
}

-(JobsRetJobsLabelTextDisplayModeByVoidBlock _Nonnull)jobs_textDisplayMode{
    @jobs_weakify(self)
    return ^JobsLabelTextDisplayMode{
        @jobs_strongify(self)
        if (!self) return (JobsLabelTextDisplayMode){0};
        NSNumber *value = Jobs_getAssociatedObject(JobsUILabelTextDisplayModeKey);
        return value ? value.unsignedIntegerValue : JobsLabelTextDisplayModeSingleLineTailTruncation;
    };
}

-(JobsRetJobsLabelScrollControllerByVoidBlock _Nonnull)jobs_scrollController{
    @jobs_weakify(self)
    return ^JobsLabelScrollController *{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsLabelScrollController *controller = self.jobs_existingScrollController();
        if (!controller) {
            controller = [JobsLabelScrollController.alloc initWithLabel:self];
            Jobs_setAssociatedRETAIN_NONATOMIC(JobsUILabelScrollingControllerKey, controller)
        }return controller;
    };
}

-(JobsRetJobsLabelScrollControllerByVoidBlock _Nonnull)jobs_existingScrollController{
    @jobs_weakify(self)
    return ^JobsLabelScrollController *{
        @jobs_strongify(self)
        if (!self) return nil;
        return Jobs_getAssociatedObject(JobsUILabelScrollingControllerKey);
    };
}

-(JobsRetIDByJobsLabelScrollConfigurationBlock _Nonnull)byTextScroll{
    @jobs_weakify(self)
    return ^id(JobsLabelScrollConfiguration * configuration){
        @jobs_strongify(self)
        if (!self) return nil;
        (self.jobs_scrollController()).configure(configuration);
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byStartTextScroll{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        (self.jobs_scrollController()).start();
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byPauseTextScroll{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        (self.jobs_scrollController()).pause();
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byResumeTextScroll{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        (self.jobs_scrollController()).resume();
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byReloadTextScroll{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        [self.jobs_scrollController() reload];
        return self;
    };
}

-(JobsRetLabelByVoidBlock _Nonnull)byStopTextScroll{
    @jobs_weakify(self)
    return ^__kindof UILabel *{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsLabelScrollController *controller = self.jobs_existingScrollController();
        if (controller) controller.jobsStop();
        return self;
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)jobs_isTextScrolling{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.jobs_existingScrollController().isRunning;
    };
}

@end
