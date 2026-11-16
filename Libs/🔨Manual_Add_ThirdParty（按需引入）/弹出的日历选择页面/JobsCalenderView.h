//
//  JobsCalenderView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSCALENDERVIEW_6DB204C99D
#define JOBS_HEADER_GUARD_JOBSCALENDERVIEW_6DB204C99D

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h> // 用来读取，修改和创建日历上的事件

#if __has_include(<FSCalendar/FSCalendar.h>)
#import <FSCalendar/FSCalendar.h>
#else
#import "FSCalendar.h"
#endif

#import "FSCalendarExtra.h"

#import "JobsBaseUI.h"

#import "JobsByOCPods.h"

#import "JobsAppToolsHeader.h"

#import "JobsLanMgr.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsCalenderView : BaseView
<
FSCalendarDataSource
,FSCalendarDelegate
>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSCALENDERVIEW_6DB204C99D */
