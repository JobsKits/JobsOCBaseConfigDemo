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
        self.headerTitleFont = UIFontWeightRegularSize(22);
        self.headerTitleColor = UIColor.blackColor;
        self.headerTitleAlignment = NSTextAlignmentCenter;
        self.headerTitleOffset = CGPointZero;
        self.headerHeight = 56;
        self.weekdayHeight = 34;
        self.headerMinimumDissolvedAlpha = 0;
        self.caseOptions = JobsOCCalendarCaseOptionsHeaderUsesDefaultCase;
        self.weekdayFont = UIFontWeightRegularSize(15);
        self.weekdayTextColor = UIColor.systemBlueColor;
        self.titleFont = UIFontWeightRegularSize(17);
        self.subtitleFont = UIFontWeightRegularSize(10);
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
