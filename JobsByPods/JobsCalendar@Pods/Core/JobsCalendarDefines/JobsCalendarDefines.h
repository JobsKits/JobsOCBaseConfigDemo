//
//  JobsCalendarDefines.h
//  JobsCalendar
//
//  Created by Jobs on 2026年7月1日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBS_CALENDAR_DEFINES
#define JOBS_HEADER_GUARD_JOBS_CALENDAR_DEFINES

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class JobsCalendar;
@class JobsCalendarAppearance;
@class JobsCalendarDayCell;

typedef NS_ENUM(NSInteger, JobsCalendarMonthPosition) {
    JobsCalendarMonthPositionNotFound = 0,
    JobsCalendarMonthPositionPrevious,
    JobsCalendarMonthPositionCurrent,
    JobsCalendarMonthPositionNext
};

typedef NS_ENUM(NSInteger, JobsCalendarScope) {
    JobsCalendarScopeMonth = 0,
    JobsCalendarScopeWeek
};

typedef NS_ENUM(NSUInteger, JobsCalendarPlaceholderType) {
    JobsCalendarPlaceholderTypeNone = 0,
    JobsCalendarPlaceholderTypeFillHeadTail,
    JobsCalendarPlaceholderTypeFillSixRows
};

typedef NS_OPTIONS(NSUInteger, JobsCalendarCaseOptions) {
    JobsCalendarCaseOptionsHeaderUsesDefaultCase = 0,
    JobsCalendarCaseOptionsHeaderUsesUpperCase = 1 << 0,
    JobsCalendarCaseOptionsWeekdayUsesUpperCase = 1 << 1,
    JobsCalendarCaseOptionsWeekdayUsesSingleUpperCase = 1 << 2
};

@protocol JobsCalendarDataSource <NSObject>
@optional
-(nullable NSString *)calendar:(JobsCalendar *)calendar titleForDate:(NSDate *)date;
-(nullable NSString *)calendar:(JobsCalendar *)calendar subtitleForDate:(NSDate *)date;
-(nullable UIImage *)calendar:(JobsCalendar *)calendar imageForDate:(NSDate *)date;
-(NSDate *)minimumDateForCalendar:(JobsCalendar *)calendar;
-(NSDate *)maximumDateForCalendar:(JobsCalendar *)calendar;
-(__kindof JobsCalendarDayCell *)calendar:(JobsCalendar *)calendar
                              cellForDate:(NSDate *)date
                           atMonthPosition:(JobsCalendarMonthPosition)position;
-(NSInteger)calendar:(JobsCalendar *)calendar numberOfEventsForDate:(NSDate *)date;
@end

@protocol JobsCalendarDelegate <NSObject>
@optional
-(BOOL)calendar:(JobsCalendar *)calendar
shouldSelectDate:(NSDate *)date
atMonthPosition:(JobsCalendarMonthPosition)monthPosition;
-(void)calendar:(JobsCalendar *)calendar
  didSelectDate:(NSDate *)date
atMonthPosition:(JobsCalendarMonthPosition)monthPosition;
-(BOOL)calendar:(JobsCalendar *)calendar
shouldDeselectDate:(NSDate *)date
atMonthPosition:(JobsCalendarMonthPosition)monthPosition;
-(void)calendar:(JobsCalendar *)calendar
didDeselectDate:(NSDate *)date
atMonthPosition:(JobsCalendarMonthPosition)monthPosition;
-(void)calendar:(JobsCalendar *)calendar
boundingRectWillChange:(CGRect)bounds
       animated:(BOOL)animated;
-(void)calendar:(JobsCalendar *)calendar
willDisplayCell:(JobsCalendarDayCell *)cell
        forDate:(NSDate *)date
atMonthPosition:(JobsCalendarMonthPosition)monthPosition;
-(void)calendarCurrentPageDidChange:(JobsCalendar *)calendar;
@end

@protocol JobsCalendarDelegateAppearance <NSObject>
@optional
-(nullable UIColor *)calendar:(JobsCalendar *)calendar
                   appearance:(JobsCalendarAppearance *)appearance
 titleDefaultColorForDate:(NSDate *)date;
-(nullable UIColor *)calendar:(JobsCalendar *)calendar
                   appearance:(JobsCalendarAppearance *)appearance
titleSelectionColorForDate:(NSDate *)date;
-(nullable UIColor *)calendar:(JobsCalendar *)calendar
                   appearance:(JobsCalendarAppearance *)appearance
subtitleDefaultColorForDate:(NSDate *)date;
-(nullable UIColor *)calendar:(JobsCalendar *)calendar
                   appearance:(JobsCalendarAppearance *)appearance
selectionColorForDate:(NSDate *)date;
@end

typedef void(^jobsByJobsCalendarBlock)(__kindof JobsCalendar *_Nullable calendar);

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBS_CALENDAR_DEFINES */
