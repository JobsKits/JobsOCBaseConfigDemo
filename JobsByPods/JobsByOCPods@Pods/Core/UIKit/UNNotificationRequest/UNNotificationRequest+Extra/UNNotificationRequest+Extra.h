//
//  UNNotificationRequest+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UNNOTIFICATIONREQUEST_EXTRA_693480784E
#define JOBS_HEADER_GUARD_UNNOTIFICATIONREQUEST_EXTRA_693480784E

#import <UserNotifications/UserNotifications.h> // 提供本地通知和远程通知处理能力，是现代通知框架的统一入口。

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

@interface UNNotificationRequest (Extra)

+(JobsReturnUNNotificationRequestByModelBlock)initBy;
-(jobsByErrBlocks _Nonnull)notificationRequestCompletionHandlerBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UNNOTIFICATIONREQUEST_EXTRA_693480784E */
