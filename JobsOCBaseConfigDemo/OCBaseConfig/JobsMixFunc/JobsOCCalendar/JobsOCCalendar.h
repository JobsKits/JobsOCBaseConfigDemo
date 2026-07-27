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

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCCalendar : UIView

Prop_weak()id<JobsOCCalendarDataSource> dataSource;
Prop_weak()id<JobsOCCalendarDelegate> delegate;
Prop_strong(readonly)JobsOCCalendarAppearance *appearance;
Prop_strong()NSCalendar *gregorian;
Prop_strong()NSDateFormatter *formatter;
Prop_strong(nullable)NSDate *today;
Prop_strong()NSDate *currentPage;
Prop_strong(readonly)NSDate *minimumDate;
Prop_strong(readonly)NSDate *maximumDate;
Prop_strong(readonly)NSArray<NSDate *> *selectedDates;
Prop_assign()BOOL allowsMultipleSelection;
Prop_assign(getter=isScrollEnabled)BOOL scrollEnabled;
Prop_assign()BOOL swipeToChooseEnabled;
Prop_assign()BOOL adjustsBoundingRectWhenChangingMonths;
Prop_assign()JobsOCCalendarScope scope;
Prop_assign()JobsOCCalendarPlaceholderType placeholderType;
Prop_assign()BOOL jobsAutomaticallyInvalidateLayoutOnBoundsChange;
Prop_assign()BOOL jobsReloadDataAfterBoundsChange;

-(JobsRetJobsOCCalendarByDataSourceBlock _Nonnull)byDataSource;
-(JobsRetJobsOCCalendarByDelegateBlock _Nonnull)byDelegate;
-(void)reloadData;
-(void)setCurrentPage:(NSDate *)currentPage animated:(BOOL)animated;
-(void)selectDate:(nullable NSDate *)date;
-(void)deselectDate:(nullable NSDate *)date;
-(CGRect)boundingRectForScope:(JobsOCCalendarScope)scope;
-(void)jobsInvalidateCalendarLayout;
-(void)jobsReloadDataSafely;

@end

NS_INLINE __kindof JobsOCCalendar *_Nonnull jobsMakeJobsOCCalendar(jobsByJobsOCCalendarBlock _Nullable block){
    JobsOCCalendar *data = [JobsOCCalendar.alloc initWithFrame:CGRectZero];
    if (block) block(data);
    return data;
}

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBS_OC_CALENDAR */
