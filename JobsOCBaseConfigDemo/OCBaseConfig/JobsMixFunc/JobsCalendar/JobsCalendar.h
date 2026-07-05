//
//  JobsCalendar.h
//  JobsCalendar
//
//  Created by Jobs on 2026年7月1日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBS_CALENDAR
#define JOBS_HEADER_GUARD_JOBS_CALENDAR

#import "JobsCalendarDefines.h"
#import "JobsCalendarAppearance.h"
#import "JobsCalendarDayCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsCalendar : UIView

Prop_weak()id<JobsCalendarDataSource> dataSource;
Prop_weak()id<JobsCalendarDelegate> delegate;
Prop_strong(readonly)JobsCalendarAppearance *appearance;
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
Prop_assign()JobsCalendarScope scope;
Prop_assign()JobsCalendarPlaceholderType placeholderType;
Prop_assign()BOOL jobsAutomaticallyInvalidateLayoutOnBoundsChange;
Prop_assign()BOOL jobsReloadDataAfterBoundsChange;

-(void)reloadData;
-(void)setCurrentPage:(NSDate *)currentPage animated:(BOOL)animated;
-(void)selectDate:(nullable NSDate *)date;
-(void)deselectDate:(nullable NSDate *)date;
-(CGRect)boundingRectForScope:(JobsCalendarScope)scope;
-(void)jobsInvalidateCalendarLayout;
-(void)jobsReloadDataSafely;

@end

NS_INLINE __kindof JobsCalendar *_Nonnull jobsMakeJobsCalendar(jobsByJobsCalendarBlock _Nullable block){
    JobsCalendar *data = [JobsCalendar.alloc initWithFrame:CGRectZero];
    if (block) block(data);
    return data;
}

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBS_CALENDAR */
