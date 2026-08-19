//
//  JobsAppDoorModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORMODEL_DSL_14F4386B6A15E35D
#define JOBS_HEADER_GUARD_JOBSAPPDOORMODEL_DSL_14F4386B6A15E35D

#import "JobsModel.h"
#import "JobsBlock.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorModel (DSL)

-(JobsRetJobsAppDoorModelByStrBlock _Nonnull)byUserName;
-(JobsRetJobsAppDoorModelByStrBlock _Nonnull)byPassword;
-(JobsRetJobsAppDoorModelByStrBlock _Nonnull)byConfirmPassword;
-(JobsRetJobsAppDoorModelByStrBlock _Nonnull)byTel;
-(JobsRetJobsAppDoorModelByStrBlock _Nonnull)byVerificationCode;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORMODEL_DSL_14F4386B6A15E35D */
