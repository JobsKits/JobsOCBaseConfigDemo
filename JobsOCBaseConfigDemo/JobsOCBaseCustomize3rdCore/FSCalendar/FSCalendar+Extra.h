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

#import "JobsBlock.h"

#import "JobsDefines.h"

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
