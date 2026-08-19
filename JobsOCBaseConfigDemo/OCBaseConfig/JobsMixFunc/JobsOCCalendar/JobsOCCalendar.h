//
//  JobsOCCalendar.h
//  JobsOCCalendar
//
//  Created by Jobs on 2026年7月1日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBS_OC_CALENDAR
#define JOBS_HEADER_GUARD_JOBS_OC_CALENDAR

#import "JobsOCCalendarDefines.h"
#import "JobsOCCalendarAppearance.h"
#import "JobsOCCalendarDayCell.h"
#import "JobsBlock.h"
#import "JobsMakes.h"
#import "JobsOCDSL.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCCalendar : UIView

Prop_weak()id<JobsOCCalendarDataSource> dataSource;
Prop_weak()id<JobsOCCalendarDelegate> delegate;
Prop_strong(readonly)JobsOCCalendarAppearance *appearance;
Prop_strong()NSCalendar *gregorian;
-(JobsRetJobsOCCalendarByCalendarBlock _Nonnull)byGregorian;
Prop_strong()NSDateFormatter *formatter;
-(JobsRetJobsOCCalendarByDateFormatterBlock _Nonnull)byFormatter;
Prop_strong(nullable)NSDate *today;
-(JobsRetJobsOCCalendarByDateBlock _Nonnull)byToday;
Prop_strong()NSDate *currentPage;
-(JobsRetJobsOCCalendarByDateBlock _Nonnull)byCurrentPage;
Prop_strong(readonly)NSDate *minimumDate;
Prop_strong(readonly)NSDate *maximumDate;
Prop_strong(readonly)NSArray<NSDate *> *selectedDates;
Prop_assign()BOOL allowsMultipleSelection;
-(JobsRetJobsOCCalendarByBOOLBlock _Nonnull)byAllowsMultipleSelection;
Prop_assign(getter=isScrollEnabled)BOOL scrollEnabled;
-(JobsRetJobsOCCalendarByBOOLBlock _Nonnull)byScrollEnabled;
Prop_assign()BOOL swipeToChooseEnabled;
-(JobsRetJobsOCCalendarByBOOLBlock _Nonnull)bySwipeToChooseEnabled;
Prop_assign()BOOL adjustsBoundingRectWhenChangingMonths;
-(JobsRetJobsOCCalendarByBOOLBlock _Nonnull)byAdjustsBoundingRectWhenChangingMonths;
Prop_assign()JobsOCCalendarScope scope;
-(JobsRetJobsOCCalendarByScopeBlock _Nonnull)byScope;
Prop_assign()JobsOCCalendarPlaceholderType placeholderType;
-(JobsRetJobsOCCalendarByPlaceholderTypeBlock _Nonnull)byPlaceholderType;
Prop_assign()BOOL jobsAutomaticallyInvalidateLayoutOnBoundsChange;
-(JobsRetJobsOCCalendarByBOOLBlock _Nonnull)byJobsAutomaticallyInvalidateLayoutOnBoundsChange;
Prop_assign()BOOL jobsReloadDataAfterBoundsChange;
-(JobsRetJobsOCCalendarByBOOLBlock _Nonnull)byJobsReloadDataAfterBoundsChange;

-(JobsRetJobsOCCalendarByDataSourceBlock _Nonnull)byDataSource;
-(JobsRetJobsOCCalendarByDelegateBlock _Nonnull)byDelegate;
-(JobsRetJobsOCCalendarByJobsOCCalendarAppearanceBlockBlock _Nonnull)byAppearanceBlock;
-(void)reloadData;
-(jobsByVoidBlock _Nonnull)jobsReloadData;
-(void)setCurrentPage:(NSDate *)currentPage animated:(BOOL)animated;
-(jobsByDateBlock _Nonnull)selectDate;
-(jobsByDateBlock _Nonnull)deselectDate;
-(JobsRetCGRectByJobsOCCalendarScopeBlock _Nonnull)boundingRectForScope;
-(jobsByVoidBlock _Nonnull)jobsInvalidateCalendarLayout;
-(jobsByVoidBlock _Nonnull)jobsReloadDataSafely;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCCalendar
-(JobsRetJobsOCCalendarByBOOLBlock _Nonnull)byJobsPendingBoundsReload;
-(JobsRetJobsOCCalendarByCGSizeBlock _Nonnull)byJobsLastStableBoundsSize;
-(JobsRetJobsOCCalendarByDateBlock _Nonnull)byMaximumDate;
-(JobsRetJobsOCCalendarByDateBlock _Nonnull)byMinimumDate;
-(JobsRetJobsOCCalendarByDateFormatterBlock _Nonnull)byJobsDayFormatter;
-(JobsRetJobsOCCalendarByJobsOCCalendarAppearanceBlock _Nonnull)byAppearance;
-(JobsRetJobsOCCalendarByNSArrayNSDateBlock _Nonnull)byJobsVisibleDates;
-(JobsRetJobsOCCalendarByNSArrayNSDateBlock _Nonnull)bySelectedDates;
-(JobsRetJobsOCCalendarByNSMutableArrayJobsOCCalendarDayCellBlock _Nonnull)byDayCells;
-(JobsRetJobsOCCalendarByNSMutableArrayNSDateBlock _Nonnull)byJobsMutableSelectedDates;
-(JobsRetJobsOCCalendarByNSMutableArrayUILabelBlock _Nonnull)byWeekdayLabels;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCCalendar
@end

NS_INLINE __kindof JobsOCCalendar *_Nonnull jobsMakeJobsOCCalendar(jobsByJobsOCCalendarBlock _Nullable block){
    JobsOCCalendar *data = [JobsOCCalendar.alloc initWithFrame:CGRectZero];
    if (block) block(data);
    return data;
}

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBS_OC_CALENDAR */
