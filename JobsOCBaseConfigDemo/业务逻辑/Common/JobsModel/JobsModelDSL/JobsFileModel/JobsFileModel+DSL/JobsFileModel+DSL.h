//
//  JobsFileModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSFILEMODEL_DSL_38A5EEF3458C0052
#define JOBS_HEADER_GUARD_JOBSFILEMODEL_DSL_38A5EEF3458C0052

#import "JobsModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsFileModel (DSL)

-(JobsRetJobsFileModelByNSIntegerBlock _Nonnull)byID;
-(JobsRetJobsFileModelByStrBlock _Nonnull)byFileName;
-(JobsRetJobsFileModelByDataBlock _Nonnull)byFile;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSFILEMODEL_DSL_38A5EEF3458C0052 */
