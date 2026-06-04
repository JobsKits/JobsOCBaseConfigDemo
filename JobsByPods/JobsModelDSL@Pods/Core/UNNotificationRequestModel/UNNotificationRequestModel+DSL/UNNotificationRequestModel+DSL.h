//
//  UNNotificationRequestModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UNNOTIFICATIONREQUESTMODEL_DSL_1192E47F5387FB89
#define JOBS_HEADER_GUARD_UNNOTIFICATIONREQUESTMODEL_DSL_1192E47F5387FB89

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

@interface UNNotificationRequestModel (DSL)

-(JobsRetUNNotificationRequestModelByStrBlock _Nonnull)byIdentifier;
-(JobsRetUNNotificationRequestModelByUNNotificationContentPointerBlock _Nonnull)byContent;
-(JobsRetUNNotificationRequestModelByUNNotificationTriggerPointerBlock _Nonnull)byTrigger;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UNNOTIFICATIONREQUESTMODEL_DSL_1192E47F5387FB89 */
