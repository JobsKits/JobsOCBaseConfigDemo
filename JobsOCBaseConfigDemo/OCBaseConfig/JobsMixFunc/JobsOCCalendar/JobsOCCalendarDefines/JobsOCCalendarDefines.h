//
//  JobsOCCalendarDefines.h
//  JobsOCCalendar
//
//  Created by Jobs on 2026年7月1日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBS_OC_CALENDAR_DEFINES
#define JOBS_HEADER_GUARD_JOBS_OC_CALENDAR_DEFINES

#import <UIKit/UIKit.h>
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@class JobsOCCalendar;
@class JobsOCCalendarAppearance;
@class JobsOCCalendarDayCell;

typedef NS_ENUM(NSInteger, JobsOCCalendarMonthPosition) {
    JobsOCCalendarMonthPositionNotFound = 0,
    JobsOCCalendarMonthPositionPrevious,
    JobsOCCalendarMonthPositionCurrent,
    JobsOCCalendarMonthPositionNext
};

typedef NS_ENUM(NSInteger, JobsOCCalendarScope) {
    JobsOCCalendarScopeMonth = 0,
    JobsOCCalendarScopeWeek
};

typedef NS_ENUM(NSUInteger, JobsOCCalendarPlaceholderType) {
    JobsOCCalendarPlaceholderTypeNone = 0,
    JobsOCCalendarPlaceholderTypeFillHeadTail,
    JobsOCCalendarPlaceholderTypeFillSixRows
};

typedef NS_OPTIONS(NSUInteger, JobsOCCalendarCaseOptions) {
    JobsOCCalendarCaseOptionsHeaderUsesDefaultCase = 0,
    JobsOCCalendarCaseOptionsHeaderUsesUpperCase = 1 << 0,
    JobsOCCalendarCaseOptionsWeekdayUsesUpperCase = 1 << 1,
    JobsOCCalendarCaseOptionsWeekdayUsesSingleUpperCase = 1 << 2
};

@protocol JobsOCCalendarDataSource <NSObject>
@optional
-(nullable NSString *)calendar:(JobsOCCalendar *)calendar titleForDate:(NSDate *)date;
-(nullable NSString *)calendar:(JobsOCCalendar *)calendar subtitleForDate:(NSDate *)date;
-(nullable UIImage *)calendar:(JobsOCCalendar *)calendar imageForDate:(NSDate *)date;
-(NSDate *)minimumDateForCalendar:(JobsOCCalendar *)calendar;
-(NSDate *)maximumDateForCalendar:(JobsOCCalendar *)calendar;
-(__kindof JobsOCCalendarDayCell *)calendar:(JobsOCCalendar *)calendar
                              cellForDate:(NSDate *)date
                           atMonthPosition:(JobsOCCalendarMonthPosition)position;
-(NSInteger)calendar:(JobsOCCalendar *)calendar numberOfEventsForDate:(NSDate *)date;
@end

@protocol JobsOCCalendarDelegate <NSObject>
@optional
-(BOOL)calendar:(JobsOCCalendar *)calendar
shouldSelectDate:(NSDate *)date
atMonthPosition:(JobsOCCalendarMonthPosition)monthPosition;
-(void)calendar:(JobsOCCalendar *)calendar
  didSelectDate:(NSDate *)date
atMonthPosition:(JobsOCCalendarMonthPosition)monthPosition;
-(BOOL)calendar:(JobsOCCalendar *)calendar
shouldDeselectDate:(NSDate *)date
atMonthPosition:(JobsOCCalendarMonthPosition)monthPosition;
-(void)calendar:(JobsOCCalendar *)calendar
didDeselectDate:(NSDate *)date
atMonthPosition:(JobsOCCalendarMonthPosition)monthPosition;
-(void)calendar:(JobsOCCalendar *)calendar
boundingRectWillChange:(CGRect)bounds
       animated:(BOOL)animated;
-(void)calendar:(JobsOCCalendar *)calendar
willDisplayCell:(JobsOCCalendarDayCell *)cell
        forDate:(NSDate *)date
atMonthPosition:(JobsOCCalendarMonthPosition)monthPosition;
-(void)calendarCurrentPageDidChange:(JobsOCCalendar *)calendar;
@end

@protocol JobsOCCalendarDelegateAppearance <NSObject>
@optional
-(nullable UIColor *)calendar:(JobsOCCalendar *)calendar
                   appearance:(JobsOCCalendarAppearance *)appearance
 titleDefaultColorForDate:(NSDate *)date;
-(nullable UIColor *)calendar:(JobsOCCalendar *)calendar
                   appearance:(JobsOCCalendarAppearance *)appearance
titleSelectionColorForDate:(NSDate *)date;
-(nullable UIColor *)calendar:(JobsOCCalendar *)calendar
                   appearance:(JobsOCCalendarAppearance *)appearance
subtitleDefaultColorForDate:(NSDate *)date;
-(nullable UIColor *)calendar:(JobsOCCalendar *)calendar
                   appearance:(JobsOCCalendarAppearance *)appearance
selectionColorForDate:(NSDate *)date;
@end

typedef void(^jobsByJobsOCCalendarBlock)(__kindof JobsOCCalendar *_Nullable calendar);

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBS_OC_CALENDAR_DEFINES */
