//
//  JobsOCCalendarAppearance.m
//  JobsOCCalendar
//
//  Created by Jobs on 2026年7月1日，星期三.
//

#import "JobsOCCalendarAppearance.h"

@implementation JobsOCCalendarAppearance

#define JobsOCCalendarAppearanceObjectDSL(_method_, _property_, _block_type_, _input_type_) \
-(_block_type_ _Nonnull)_method_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsOCCalendarAppearance *_Nullable(_input_type_ _Nullable value){ \
        @jobs_strongify(self) \
        self._property_ = value; \
        return self; \
    }; \
}

#define JobsOCCalendarAppearanceValueDSL(_method_, _property_, _block_type_, _input_type_) \
-(_block_type_ _Nonnull)_method_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsOCCalendarAppearance *_Nullable(_input_type_ value){ \
        @jobs_strongify(self) \
        self._property_ = value; \
        return self; \
    }; \
}

JobsOCCalendarAppearanceObjectDSL(byHeaderDateFormat, headerDateFormat, JobsRetJobsOCCalendarAppearanceByStrBlock, NSString *)
JobsOCCalendarAppearanceObjectDSL(byHeaderTitleFont, headerTitleFont, JobsRetJobsOCCalendarAppearanceByFontBlock, UIFont *)
JobsOCCalendarAppearanceObjectDSL(byHeaderTitleColor, headerTitleColor, JobsRetJobsOCCalendarAppearanceByCorBlock, UIColor *)
JobsOCCalendarAppearanceValueDSL(byHeaderTitleAlignment, headerTitleAlignment, JobsRetJobsOCCalendarAppearanceByTextAlignmentBlock, NSTextAlignment)
JobsOCCalendarAppearanceValueDSL(byHeaderTitleOffset, headerTitleOffset, JobsRetJobsOCCalendarAppearanceByCGPointBlock, CGPoint)
JobsOCCalendarAppearanceValueDSL(byHeaderHeight, headerHeight, JobsRetJobsOCCalendarAppearanceByCGFloatBlock, CGFloat)
JobsOCCalendarAppearanceValueDSL(byWeekdayHeight, weekdayHeight, JobsRetJobsOCCalendarAppearanceByCGFloatBlock, CGFloat)
JobsOCCalendarAppearanceValueDSL(byHeaderMinimumDissolvedAlpha, headerMinimumDissolvedAlpha, JobsRetJobsOCCalendarAppearanceByCGFloatBlock, CGFloat)
JobsOCCalendarAppearanceValueDSL(byCaseOptions, caseOptions, JobsRetJobsOCCalendarAppearanceByCaseOptionsBlock, JobsOCCalendarCaseOptions)
JobsOCCalendarAppearanceObjectDSL(byWeekdayFont, weekdayFont, JobsRetJobsOCCalendarAppearanceByFontBlock, UIFont *)
JobsOCCalendarAppearanceObjectDSL(byWeekdayTextColor, weekdayTextColor, JobsRetJobsOCCalendarAppearanceByCorBlock, UIColor *)
JobsOCCalendarAppearanceObjectDSL(byTitleFont, titleFont, JobsRetJobsOCCalendarAppearanceByFontBlock, UIFont *)
JobsOCCalendarAppearanceObjectDSL(bySubtitleFont, subtitleFont, JobsRetJobsOCCalendarAppearanceByFontBlock, UIFont *)
JobsOCCalendarAppearanceObjectDSL(byTitleDefaultColor, titleDefaultColor, JobsRetJobsOCCalendarAppearanceByCorBlock, UIColor *)
JobsOCCalendarAppearanceObjectDSL(byTitlePlaceholderColor, titlePlaceholderColor, JobsRetJobsOCCalendarAppearanceByCorBlock, UIColor *)
JobsOCCalendarAppearanceObjectDSL(byTitleSelectionColor, titleSelectionColor, JobsRetJobsOCCalendarAppearanceByCorBlock, UIColor *)
JobsOCCalendarAppearanceObjectDSL(byTitleTodayColor, titleTodayColor, JobsRetJobsOCCalendarAppearanceByCorBlock, UIColor *)
JobsOCCalendarAppearanceObjectDSL(bySubtitleDefaultColor, subtitleDefaultColor, JobsRetJobsOCCalendarAppearanceByCorBlock, UIColor *)
JobsOCCalendarAppearanceObjectDSL(bySubtitlePlaceholderColor, subtitlePlaceholderColor, JobsRetJobsOCCalendarAppearanceByCorBlock, UIColor *)
JobsOCCalendarAppearanceObjectDSL(bySubtitleSelectionColor, subtitleSelectionColor, JobsRetJobsOCCalendarAppearanceByCorBlock, UIColor *)
JobsOCCalendarAppearanceObjectDSL(bySelectionColor, selectionColor, JobsRetJobsOCCalendarAppearanceByCorBlock, UIColor *)
JobsOCCalendarAppearanceObjectDSL(byTodayColor, todayColor, JobsRetJobsOCCalendarAppearanceByCorBlock, UIColor *)
JobsOCCalendarAppearanceObjectDSL(byEventDefaultColor, eventDefaultColor, JobsRetJobsOCCalendarAppearanceByCorBlock, UIColor *)
JobsOCCalendarAppearanceObjectDSL(byEventSelectionColor, eventSelectionColor, JobsRetJobsOCCalendarAppearanceByCorBlock, UIColor *)

#undef JobsOCCalendarAppearanceObjectDSL
#undef JobsOCCalendarAppearanceValueDSL

-(instancetype)init{
    if (self = [super init]) {
        self
            .byHeaderDateFormat(@"yyyy年MM月")
            .byHeaderTitleFont(UIFontWeightRegularSize(22))
            .byHeaderTitleColor(JobsLabelColor)
            .byHeaderTitleAlignment(NSTextAlignmentCenter)
            .byHeaderTitleOffset(CGPointZero)
            .byHeaderHeight(56)
            .byWeekdayHeight(34)
            .byHeaderMinimumDissolvedAlpha(0)
            .byCaseOptions(JobsOCCalendarCaseOptionsHeaderUsesDefaultCase)
            .byWeekdayFont(UIFontWeightRegularSize(15))
            .byWeekdayTextColor(UIColor.systemBlueColor)
            .byTitleFont(UIFontWeightRegularSize(17))
            .bySubtitleFont(UIFontWeightRegularSize(10))
            .byTitleDefaultColor(JobsLabelColor)
            .byTitlePlaceholderColor(JobsPlaceholderTextColor)
            .byTitleSelectionColor(UIColor.whiteColor)
            .byTitleTodayColor(UIColor.whiteColor)
            .bySubtitleDefaultColor(JobsSecondaryLabelColor)
            .bySubtitlePlaceholderColor(JobsPlaceholderTextColor)
            .bySubtitleSelectionColor(UIColor.whiteColor)
            .bySelectionColor(UIColor.systemRedColor)
            .byTodayColor(UIColor.systemBlueColor)
            .byEventDefaultColor(UIColor.systemBlueColor)
            .byEventSelectionColor(UIColor.whiteColor);
    };return self;
}

@end
