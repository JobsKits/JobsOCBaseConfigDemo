//
//  JobsAppDoorModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORMODEL_DSL_F3623A17C8508B6C
#define JOBS_HEADER_GUARD_JOBSAPPDOORMODEL_DSL_F3623A17C8508B6C

#if __has_include(<JobsModel/JobsAppDoorModel.h>)
#import <JobsModel/JobsAppDoorModel.h>
#else
#import "JobsAppDoorModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorModel (DSL)

#pragma mark —— 来自 JobsAppDoorModel
-(__kindof JobsAppDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byUserName;
-(__kindof JobsAppDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byPassword;
-(__kindof JobsAppDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byConfirmPassword;
-(__kindof JobsAppDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byTel;
-(__kindof JobsAppDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byVerificationCode;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORMODEL_DSL_F3623A17C8508B6C */
