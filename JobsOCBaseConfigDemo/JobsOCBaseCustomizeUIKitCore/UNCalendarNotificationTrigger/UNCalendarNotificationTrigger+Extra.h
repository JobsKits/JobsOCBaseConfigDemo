//
//  UNCalendarNotificationTrigger+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UNCALENDARNOTIFICATIONTRIGGER_EXTRA_64B2501F77
#define JOBS_HEADER_GUARD_UNCALENDARNOTIFICATIONTRIGGER_EXTRA_64B2501F77

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h> // 提供本地通知和远程通知处理能力，是现代通知框架的统一入口。
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UNCalendarNotificationTrigger (Extra)
/// 创建一个不重复触发的日历通知触发器
+(JobsRetCalendarNotificationTriggerByComponentsBlock _Nonnull)initByNORepeats;
/// 创建一个重复触发的日历通知触发器
+(JobsRetCalendarNotificationTriggerByComponentsBlock _Nonnull)initByRepeats;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UNCALENDARNOTIFICATIONTRIGGER_EXTRA_64B2501F77 */
