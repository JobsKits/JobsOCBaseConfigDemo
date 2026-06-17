//
//  JobsCalenderView.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 9/13/24.
//

#import "BaseView.h"
#import <EventKit/EventKit.h>
#import "NSDate+Extra.h"
#import "JobsDefineProperty.h"

#if __has_include(<FSCalendar/FSCalendar.h>)
#import <FSCalendar/FSCalendar.h>
#else
#import "FSCalendar.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsCalenderView : BaseView
<
FSCalendarDataSource
,FSCalendarDelegate
>

@end

NS_ASSUME_NONNULL_END
