//
//  UNUserNotificationCenter+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#ifndef JOBS_HEADER_GUARD_UNUSERNOTIFICATIONCENTER_DSL_8C10444A0D
#define JOBS_HEADER_GUARD_UNUSERNOTIFICATIONCENTER_DSL_8C10444A0D

#import <UserNotifications/UserNotifications.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UNUserNotificationCenter (DSL)

-(JobsRetUNUserNotificationCenterByDelegateBlock _Nonnull)byDelegate API_AVAILABLE(ios(10.0));

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UNUSERNOTIFICATIONCENTER_DSL_8C10444A0D */
