//
//  CalendarVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Admin on 20/11/2024.
//

#import "BaseViewController.h"
#import <EventKit/EventKit.h>
#import "JobsDefineProperty.h"

#if __has_include(<FSCalendar/FSCalendar.h>)
#import <FSCalendar/FSCalendar.h>
#else
#import "FSCalendar.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface CalendarVC : BaseViewController
<
FSCalendarDataSource
,FSCalendarDelegate
,FSCalendarDelegateAppearance
>

@end

NS_ASSUME_NONNULL_END
