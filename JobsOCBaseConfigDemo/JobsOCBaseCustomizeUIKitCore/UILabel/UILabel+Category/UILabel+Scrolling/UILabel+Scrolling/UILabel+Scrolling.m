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

-(nullable JobsLabelScrollController *)jobs_existingScrollController;
-(JobsLabelScrollController *)jobs_scrollController;

@end

@implementation UILabel (Scrolling)

-(instancetype)byTextDisplayMode:(JobsLabelTextDisplayMode)mode{
    return [self byTextDisplayMode:mode
               minimumScaleFactor:.5f
             maximumNumberOfLines:2
              scrollConfiguration:JobsLabelScrollConfiguration.continuousConfiguration];
}

-(instancetype)byTextDisplayMode:(JobsLabelTextDisplayMode)mode
              minimumScaleFactor:(CGFloat)minimumScaleFactor
            maximumNumberOfLines:(NSInteger)maximumNumberOfLines
             scrollConfiguration:(JobsLabelScrollConfiguration *)scrollConfiguration{
    Jobs_setAssociatedRETAIN_NONATOMIC(JobsUILabelTextDisplayModeKey, @(mode))
    switch (mode) {
        /// 处理 JobsLabelTextDisplayModeScaleToFit 分支
        case JobsLabelTextDisplayModeScaleToFit:
            [self byStopTextScroll]
                .byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(YES)
                .byMinimumScaleFactor(MIN(MAX(.01f, minimumScaleFactor), 1))
                .byLineBreakMode(NSLineBreakByTruncatingTail);
            break;
        /// 处理 JobsLabelTextDisplayModeSingleLineTailTruncation 分支
        case JobsLabelTextDisplayModeSingleLineTailTruncation:
            [self byStopTextScroll]
                .byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(NO)
                .byMinimumScaleFactor(1)
                .byLineBreakMode(NSLineBreakByTruncatingTail);
            break;
        /// 处理 JobsLabelTextDisplayModeMultiLineTailTruncation 分支
        case JobsLabelTextDisplayModeMultiLineTailTruncation:
            [self byStopTextScroll]
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
            [self byTextScroll:scrollConfiguration ?: JobsLabelScrollConfiguration.continuousConfiguration];
            [self byStartTextScroll];
            break;
    }return self;
}

-(JobsLabelTextDisplayMode)jobs_textDisplayMode{
    NSNumber *value = Jobs_getAssociatedObject(JobsUILabelTextDisplayModeKey);
    return value ? value.unsignedIntegerValue : JobsLabelTextDisplayModeSingleLineTailTruncation;
}

-(JobsLabelScrollController *)jobs_scrollController{
    JobsLabelScrollController *controller = [self jobs_existingScrollController];
    if (!controller) {
        controller = [JobsLabelScrollController.alloc initWithLabel:self];
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsUILabelScrollingControllerKey, controller)
    }return controller;
}

-(JobsLabelScrollController *)jobs_existingScrollController{
    return Jobs_getAssociatedObject(JobsUILabelScrollingControllerKey);
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
    [self.jobs_existingScrollController stop];
    return self;
}

-(BOOL)jobs_isTextScrolling{
    return self.jobs_existingScrollController.isRunning;
}

@end
