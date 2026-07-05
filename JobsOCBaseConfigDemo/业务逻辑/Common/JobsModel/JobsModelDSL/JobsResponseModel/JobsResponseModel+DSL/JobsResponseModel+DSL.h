//
//  JobsResponseModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSRESPONSEMODEL_DSL_234ECBC049B89696
#define JOBS_HEADER_GUARD_JOBSRESPONSEMODEL_DSL_234ECBC049B89696

#import "JobsModel.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsResponseModel (DSL)

-(JobsRetJobsResponseModelByHTTPResponseCodeBlock _Nonnull)byCode;
-(JobsRetJobsResponseModelByStrBlock _Nonnull)byMsg;
-(JobsRetJobsResponseModelByIDBlock _Nonnull)byData;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSRESPONSEMODEL_DSL_234ECBC049B89696 */
