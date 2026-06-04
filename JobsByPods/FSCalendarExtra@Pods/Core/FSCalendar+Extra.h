//
//  FSCalendar+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_FSCALENDAR_EXTRA_6F08E3F5D9
#define JOBS_HEADER_GUARD_FSCALENDAR_EXTRA_6F08E3F5D9

#import <UIKit/UIKit.h>

#if __has_include(<FSCalendar/FSCalendar.h>)
#import <FSCalendar/FSCalendar.h>
#else
#import "FSCalendar.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FSCalendar (Extra)

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FSCalendar *_Nonnull jobsMakeFSCalendar(jobsByFSCalendarBlock _Nonnull block){
    FSCalendar *data = [FSCalendar.alloc initWithFrame:CGRectZero];
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_FSCALENDAR_EXTRA_6F08E3F5D9 */
