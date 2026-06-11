//
//  JobsResponseModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSRESPONSEMODEL_DSL_CA2AAB4608DF53DA
#define JOBS_HEADER_GUARD_JOBSRESPONSEMODEL_DSL_CA2AAB4608DF53DA

#if __has_include(<JobsModel/JobsResponseModel.h>)
#import <JobsModel/JobsResponseModel.h>
#else
#import "JobsResponseModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsResponseModel (DSL)

#pragma mark —— 来自 JobsResponseModel
-(__kindof JobsResponseModel *_Nonnull (^ _Nonnull)(HTTPResponseCode data))byCode;
-(__kindof JobsResponseModel *_Nonnull (^ _Nonnull)(NSString * data))byMsg;
-(__kindof JobsResponseModel *_Nonnull (^ _Nonnull)(id data))byData;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSRESPONSEMODEL_DSL_CA2AAB4608DF53DA */
