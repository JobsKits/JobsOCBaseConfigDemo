//
//  NotificationModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_NOTIFICATIONMODEL_DSL_28B0200E5BB31B8
#define JOBS_HEADER_GUARD_NOTIFICATIONMODEL_DSL_28B0200E5BB31B8

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NotificationModel (DSL)

-(JobsRetNotificationModelByStrBlock _Nonnull)byNotificationName;
-(JobsRetNotificationModelByDicBlock _Nonnull)byUserInfo;
-(JobsRetNotificationModelByIDBlock _Nonnull)byAnObject;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NOTIFICATIONMODEL_DSL_28B0200E5BB31B8 */
