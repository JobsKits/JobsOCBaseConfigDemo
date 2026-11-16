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
#import "NSString+Check.h"
#import "NSCalendar+Extra.h"
#import "NSObject+Extra.h"
#import "UNCalendarNotificationTrigger+Extra.h"
#import "UNNotificationRequest+Extra.h"
#import "JobsMakes.h"
#import "JobsTimeUtils.h"
#import "JobsLanMgr.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (UNUserNotificationCenterDelegate)<UNUserNotificationCenterDelegate>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_UNUSERNOTIFICATIONCENTERDELEGATE_FCC75FBB99 */
