//
//  JobsLocalNotificationModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSLOCALNOTIFICATIONMODEL_DSL_3A8F0FFFA0C36BF8
#define JOBS_HEADER_GUARD_JOBSLOCALNOTIFICATIONMODEL_DSL_3A8F0FFFA0C36BF8

#if __has_include(<JobsModel/JobsLocalNotificationModel.h>)
#import <JobsModel/JobsLocalNotificationModel.h>
#else
#import "JobsLocalNotificationModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsLocalNotificationModel (DSL)

#pragma mark —— 来自 JobsLocalNotificationModel
-(__kindof JobsLocalNotificationModel *_Nonnull (^ _Nonnull)(NSString * data))byIdentifier;
-(__kindof JobsLocalNotificationModel *_Nonnull (^ _Nonnull)(NSString * data))byTitle;
-(__kindof JobsLocalNotificationModel *_Nonnull (^ _Nonnull)(NSString * data))byBody;
-(__kindof JobsLocalNotificationModel *_Nonnull (^ _Nonnull)(UNNotificationSound * data))bySound;
-(__kindof JobsLocalNotificationModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTriggerWithTimeInterval;
-(__kindof JobsLocalNotificationModel *_Nonnull (^ _Nonnull)(BOOL data))byRepeats;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSLOCALNOTIFICATIONMODEL_DSL_3A8F0FFFA0C36BF8 */
