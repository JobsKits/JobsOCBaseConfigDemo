//
//  JobsOCCalendarDayCell.h
//  JobsOCCalendar
//
//  Created by Jobs on 2026年7月1日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBS_OC_CALENDAR_DAY_CELL
#define JOBS_HEADER_GUARD_JOBS_OC_CALENDAR_DAY_CELL

#import "JobsOCCalendarAppearance.h"

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCCalendarDayCell : UIControl

Prop_strong(nullable)NSDate *date;
Prop_assign()JobsOCCalendarMonthPosition monthPosition;
Prop_strong(readonly)UILabel *titleLabel;
Prop_strong(readonly)UILabel *subtitleLabel;
Prop_strong(readonly)UIImageView *imageView;
Prop_strong(readonly)UIView *eventDotView;

-(void)jobsConfigureByTitle:(nullable NSString *)title
                   subtitle:(nullable NSString *)subtitle
                      image:(nullable UIImage *)image
                 appearance:(JobsOCCalendarAppearance *)appearance
              monthPosition:(JobsOCCalendarMonthPosition)monthPosition
                    enabled:(BOOL)enabled
                   selected:(BOOL)selected
                      today:(BOOL)today
                eventsCount:(NSInteger)eventsCount;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBS_OC_CALENDAR_DAY_CELL */
