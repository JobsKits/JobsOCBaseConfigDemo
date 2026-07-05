//
//  JobsCalendarDayCell.h
//  JobsCalendar
//
//  Created by Jobs on 2026年7月1日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBS_CALENDAR_DAY_CELL
#define JOBS_HEADER_GUARD_JOBS_CALENDAR_DAY_CELL

#import "JobsCalendarAppearance.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsCalendarDayCell : UIControl

Prop_strong(nullable)NSDate *date;
Prop_assign()JobsCalendarMonthPosition monthPosition;
Prop_strong(readonly)UILabel *titleLabel;
Prop_strong(readonly)UILabel *subtitleLabel;
Prop_strong(readonly)UIImageView *imageView;
Prop_strong(readonly)UIView *eventDotView;

-(void)jobsConfigureByTitle:(nullable NSString *)title
                   subtitle:(nullable NSString *)subtitle
                      image:(nullable UIImage *)image
                 appearance:(JobsCalendarAppearance *)appearance
              monthPosition:(JobsCalendarMonthPosition)monthPosition
                    enabled:(BOOL)enabled
                   selected:(BOOL)selected
                      today:(BOOL)today
                eventsCount:(NSInteger)eventsCount;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBS_CALENDAR_DAY_CELL */
