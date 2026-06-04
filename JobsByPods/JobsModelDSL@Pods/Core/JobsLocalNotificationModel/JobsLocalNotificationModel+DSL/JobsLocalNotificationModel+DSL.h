//
//  JobsLocalNotificationModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSLOCALNOTIFICATIONMODEL_DSL_14815635FB3AC322
#define JOBS_HEADER_GUARD_JOBSLOCALNOTIFICATIONMODEL_DSL_14815635FB3AC322

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

@interface JobsLocalNotificationModel (DSL)

-(JobsRetJobsLocalNotificationModelByStrBlock _Nonnull)byIdentifier;
-(JobsRetJobsLocalNotificationModelByStrBlock _Nonnull)byTitle;
-(JobsRetJobsLocalNotificationModelByStrBlock _Nonnull)byBody;
-(JobsRetJobsLocalNotificationModelByUNNotificationSoundPointerBlock _Nonnull)bySound;
-(JobsRetJobsLocalNotificationModelByTimeIntervalBlock _Nonnull)byTriggerWithTimeInterval;
-(JobsRetJobsLocalNotificationModelByBOOLBlock _Nonnull)byRepeats;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSLOCALNOTIFICATIONMODEL_DSL_14815635FB3AC322 */
