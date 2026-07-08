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

#if __has_include(<FSCalendarExtra/FSCalendarExtra.h>)
#import <FSCalendarExtra/FSCalendarExtra.h>
#else
#import "FSCalendarExtra.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsAppTools/JobsAppToolsHeader.h>)
#import <JobsAppTools/JobsAppToolsHeader.h>
#else
#import "JobsAppToolsHeader.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsCalenderView : BaseView
<
FSCalendarDataSource
,FSCalendarDelegate
>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSCALENDERVIEW_6DB204C99D */
