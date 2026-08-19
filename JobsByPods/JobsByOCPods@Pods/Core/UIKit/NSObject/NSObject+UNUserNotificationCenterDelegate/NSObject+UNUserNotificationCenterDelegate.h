//
//  NSObject+UNUserNotificationCenterDelegate.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_UNUSERNOTIFICATIONCENTERDELEGATE_FCC75FBB99
#define JOBS_HEADER_GUARD_NSOBJECT_UNUSERNOTIFICATIONCENTERDELEGATE_FCC75FBB99

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h> // 提供本地通知和远程通知处理能力，是现代通知框架的统一入口。
#import <JobsByOCPods/NSString+Check.h>
#import <JobsByOCPods/NSCalendar+Extra.h>
#import <JobsByOCPods/NSObject+Extra.h>
#import <JobsByOCPods/UNCalendarNotificationTrigger+Extra.h>
#import <JobsByOCPods/UNNotificationRequest+Extra.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsTimeUtils/JobsTimeUtils.h>)
#import <JobsTimeUtils/JobsTimeUtils.h>
#else
#import "JobsTimeUtils.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (UNUserNotificationCenterDelegate)<UNUserNotificationCenterDelegate>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_UNUSERNOTIFICATIONCENTERDELEGATE_FCC75FBB99 */
