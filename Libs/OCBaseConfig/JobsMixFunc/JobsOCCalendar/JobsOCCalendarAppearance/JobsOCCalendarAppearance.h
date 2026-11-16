//
//  JobsOCCalendarAppearance.h
//  JobsOCCalendar
//
//  Created by Jobs on 2026年7月1日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBS_OC_CALENDAR_APPEARANCE
#define JOBS_HEADER_GUARD_JOBS_OC_CALENDAR_APPEARANCE

#import "JobsOCCalendarDefines.h"

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCCalendarAppearance : NSObject

Prop_copy()NSString *headerDateFormat;
-(JobsRetJobsOCCalendarAppearanceByStrBlock _Nonnull)byHeaderDateFormat;
Prop_strong()UIFont *headerTitleFont;
-(JobsRetJobsOCCalendarAppearanceByFontBlock _Nonnull)byHeaderTitleFont;
Prop_strong()UIColor *headerTitleColor;
-(JobsRetJobsOCCalendarAppearanceByCorBlock _Nonnull)byHeaderTitleColor;
Prop_assign()NSTextAlignment headerTitleAlignment;
-(JobsRetJobsOCCalendarAppearanceByTextAlignmentBlock _Nonnull)byHeaderTitleAlignment;
Prop_assign()CGPoint headerTitleOffset;
-(JobsRetJobsOCCalendarAppearanceByCGPointBlock _Nonnull)byHeaderTitleOffset;
Prop_assign()CGFloat headerHeight;
-(JobsRetJobsOCCalendarAppearanceByCGFloatBlock _Nonnull)byHeaderHeight;
Prop_assign()CGFloat weekdayHeight;
-(JobsRetJobsOCCalendarAppearanceByCGFloatBlock _Nonnull)byWeekdayHeight;
Prop_assign()CGFloat headerMinimumDissolvedAlpha;
-(JobsRetJobsOCCalendarAppearanceByCGFloatBlock _Nonnull)byHeaderMinimumDissolvedAlpha;
Prop_assign()JobsOCCalendarCaseOptions caseOptions;
-(JobsRetJobsOCCalendarAppearanceByCaseOptionsBlock _Nonnull)byCaseOptions;
Prop_strong()UIFont *weekdayFont;
-(JobsRetJobsOCCalendarAppearanceByFontBlock _Nonnull)byWeekdayFont;
Prop_strong()UIColor *weekdayTextColor;
-(JobsRetJobsOCCalendarAppearanceByCorBlock _Nonnull)byWeekdayTextColor;
Prop_strong()UIFont *titleFont;
-(JobsRetJobsOCCalendarAppearanceByFontBlock _Nonnull)byTitleFont;
Prop_strong()UIFont *subtitleFont;
-(JobsRetJobsOCCalendarAppearanceByFontBlock _Nonnull)bySubtitleFont;
Prop_strong()UIColor *titleDefaultColor;
-(JobsRetJobsOCCalendarAppearanceByCorBlock _Nonnull)byTitleDefaultColor;
Prop_strong()UIColor *titlePlaceholderColor;
-(JobsRetJobsOCCalendarAppearanceByCorBlock _Nonnull)byTitlePlaceholderColor;
Prop_strong()UIColor *titleSelectionColor;
-(JobsRetJobsOCCalendarAppearanceByCorBlock _Nonnull)byTitleSelectionColor;
Prop_strong()UIColor *titleTodayColor;
-(JobsRetJobsOCCalendarAppearanceByCorBlock _Nonnull)byTitleTodayColor;
Prop_strong()UIColor *subtitleDefaultColor;
-(JobsRetJobsOCCalendarAppearanceByCorBlock _Nonnull)bySubtitleDefaultColor;
Prop_strong()UIColor *subtitlePlaceholderColor;
-(JobsRetJobsOCCalendarAppearanceByCorBlock _Nonnull)bySubtitlePlaceholderColor;
Prop_strong()UIColor *subtitleSelectionColor;
-(JobsRetJobsOCCalendarAppearanceByCorBlock _Nonnull)bySubtitleSelectionColor;
Prop_strong()UIColor *selectionColor;
-(JobsRetJobsOCCalendarAppearanceByCorBlock _Nonnull)bySelectionColor;
Prop_strong()UIColor *todayColor;
-(JobsRetJobsOCCalendarAppearanceByCorBlock _Nonnull)byTodayColor;
Prop_strong()UIColor *eventDefaultColor;
-(JobsRetJobsOCCalendarAppearanceByCorBlock _Nonnull)byEventDefaultColor;
Prop_strong()UIColor *eventSelectionColor;
-(JobsRetJobsOCCalendarAppearanceByCorBlock _Nonnull)byEventSelectionColor;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBS_OC_CALENDAR_APPEARANCE */
