//
//  UNNotificationRequestModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UNNOTIFICATIONREQUESTMODEL_DSL_7CC8C06300FFEF8E
#define JOBS_HEADER_GUARD_UNNOTIFICATIONREQUESTMODEL_DSL_7CC8C06300FFEF8E

#if __has_include(<JobsModel/UNNotificationRequestModel.h>)
#import <JobsModel/UNNotificationRequestModel.h>
#else
#import "UNNotificationRequestModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UNNotificationRequestModel (DSL)

#pragma mark —— 来自 UNNotificationRequestModel
-(__kindof UNNotificationRequestModel *_Nonnull (^ _Nonnull)(NSString * data))byIdentifier;
-(__kindof UNNotificationRequestModel *_Nonnull (^ _Nonnull)(UNNotificationContent * data))byContent;
-(__kindof UNNotificationRequestModel *_Nonnull (^ _Nonnull)(UNNotificationTrigger * data))byTrigger;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UNNOTIFICATIONREQUESTMODEL_DSL_7CC8C06300FFEF8E */
