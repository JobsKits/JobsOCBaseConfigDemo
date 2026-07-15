//
//  JobsAlertModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSALERTMODEL_DSL_291EF776AAC5E1D1
#define JOBS_HEADER_GUARD_JOBSALERTMODEL_DSL_291EF776AAC5E1D1

#import "JobsModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAlertModel (DSL)

-(JobsRetJobsAlertModelByStrBlock _Nonnull)byAlertControllerTitle;
-(JobsRetJobsAlertModelByStrBlock _Nonnull)byMessage;
-(JobsRetJobsAlertModelByUIAlertControllerStyleBlock _Nonnull)byPreferredStyle;
-(JobsRetJobsAlertModelByStrBlock _Nonnull)byAlertActionTitle;
-(JobsRetJobsAlertModelByUIAlertActionStyleBlock _Nonnull)byAlertActionStyle;
-(JobsRetJobsAlertModelByJobsByAlertActionBlockBlock _Nonnull)byAlertActionBlock;
-(JobsRetJobsAlertModelByStrBlock _Nonnull)byCancelAlertActionTitle;
-(JobsRetJobsAlertModelByUIAlertActionStyleBlock _Nonnull)byCancelAlertActionStyle;
-(JobsRetJobsAlertModelByJobsByAlertActionBlockBlock _Nonnull)byCancelAlertActionBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSALERTMODEL_DSL_291EF776AAC5E1D1 */
