//
//  NotificationModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_NOTIFICATIONMODEL_DSL_28B0200E5BB31B8
#define JOBS_HEADER_GUARD_NOTIFICATIONMODEL_DSL_28B0200E5BB31B8

#import "JobsModel.h"
#import "JobsBlock.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NotificationModel (DSL)

-(JobsRetNotificationModelByStrBlock _Nonnull)byNotificationName;
-(JobsRetNotificationModelByDicBlock _Nonnull)byUserInfo;
-(JobsRetNotificationModelByIDBlock _Nonnull)byAnObject;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NOTIFICATIONMODEL_DSL_28B0200E5BB31B8 */
