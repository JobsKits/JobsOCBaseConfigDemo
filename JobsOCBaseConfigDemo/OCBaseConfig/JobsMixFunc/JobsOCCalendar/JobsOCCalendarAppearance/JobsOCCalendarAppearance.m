//
//  JobsOCCalendarAppearance.m
//  JobsOCCalendar
//
//  Created by Jobs on 2026年7月1日，星期三.
//

#import "JobsOCCalendarAppearance.h"

@implementation JobsOCCalendarAppearance
-(instancetype)init{
    if (self = [super init]) {
        self.headerDateFormat = @"yyyy年MM月";
        self.headerTitleFont = [UIFont systemFontOfSize:22 weight:UIFontWeightRegular];
        self.headerTitleColor = UIColor.blackColor;
        self.headerTitleAlignment = NSTextAlignmentCenter;
        self.headerTitleOffset = CGPointZero;
        self.headerHeight = 56;
        self.weekdayHeight = 34;
        self.headerMinimumDissolvedAlpha = 0;
        self.caseOptions = JobsOCCalendarCaseOptionsHeaderUsesDefaultCase;
        self.weekdayFont = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
        self.weekdayTextColor = UIColor.systemBlueColor;
        self.titleFont = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
        self.subtitleFont = [UIFont systemFontOfSize:10 weight:UIFontWeightRegular];
        self.titleDefaultColor = UIColor.blackColor;
        self.titlePlaceholderColor = UIColor.lightGrayColor;
        self.titleSelectionColor = UIColor.whiteColor;
        self.titleTodayColor = UIColor.whiteColor;
        self.subtitleDefaultColor = UIColor.darkGrayColor;
        self.subtitlePlaceholderColor = UIColor.lightGrayColor;
        self.subtitleSelectionColor = UIColor.whiteColor;
        self.selectionColor = UIColor.systemRedColor;
        self.todayColor = UIColor.systemBlueColor;
        self.eventDefaultColor = UIColor.systemBlueColor;
        self.eventSelectionColor = UIColor.whiteColor;
    };return self;
}

@end
