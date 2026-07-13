//
//  JobsOCCalendarAppearance.h
//  JobsOCCalendar
//
//  Created by Jobs on 2026年7月1日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBS_OC_CALENDAR_APPEARANCE
#define JOBS_HEADER_GUARD_JOBS_OC_CALENDAR_APPEARANCE

#import "JobsOCCalendarDefines.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCCalendarAppearance : NSObject

Prop_copy()NSString *headerDateFormat;
Prop_strong()UIFont *headerTitleFont;
Prop_strong()UIColor *headerTitleColor;
Prop_assign()NSTextAlignment headerTitleAlignment;
Prop_assign()CGPoint headerTitleOffset;
Prop_assign()CGFloat headerHeight;
Prop_assign()CGFloat weekdayHeight;
Prop_assign()CGFloat headerMinimumDissolvedAlpha;
Prop_assign()JobsOCCalendarCaseOptions caseOptions;
Prop_strong()UIFont *weekdayFont;
Prop_strong()UIColor *weekdayTextColor;
Prop_strong()UIFont *titleFont;
Prop_strong()UIFont *subtitleFont;
Prop_strong()UIColor *titleDefaultColor;
Prop_strong()UIColor *titlePlaceholderColor;
Prop_strong()UIColor *titleSelectionColor;
Prop_strong()UIColor *titleTodayColor;
Prop_strong()UIColor *subtitleDefaultColor;
Prop_strong()UIColor *subtitlePlaceholderColor;
Prop_strong()UIColor *subtitleSelectionColor;
Prop_strong()UIColor *selectionColor;
Prop_strong()UIColor *todayColor;
Prop_strong()UIColor *eventDefaultColor;
Prop_strong()UIColor *eventSelectionColor;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBS_OC_CALENDAR_APPEARANCE */
