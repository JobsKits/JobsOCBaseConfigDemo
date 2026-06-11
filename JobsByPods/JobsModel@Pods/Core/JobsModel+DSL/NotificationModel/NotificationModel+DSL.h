//
//  NotificationModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_NOTIFICATIONMODEL_DSL_A4CD757490B820DF
#define JOBS_HEADER_GUARD_NOTIFICATIONMODEL_DSL_A4CD757490B820DF

#if __has_include(<JobsModel/NotificationModel.h>)
#import <JobsModel/NotificationModel.h>
#else
#import "NotificationModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NotificationModel (DSL)

#pragma mark —— 来自 NotificationModel
-(__kindof NotificationModel *_Nonnull (^ _Nonnull)(NSString * data))byNotificationName;
-(__kindof NotificationModel *_Nonnull (^ _Nonnull)(NSDictionary * data))byUserInfo;
-(__kindof NotificationModel *_Nonnull (^ _Nonnull)(id data))byAnObject;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NOTIFICATIONMODEL_DSL_A4CD757490B820DF */
