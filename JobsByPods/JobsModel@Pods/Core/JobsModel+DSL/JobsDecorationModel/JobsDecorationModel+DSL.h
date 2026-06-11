//
//  JobsDecorationModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSDECORATIONMODEL_DSL_4CEAEC25746E0C3C
#define JOBS_HEADER_GUARD_JOBSDECORATIONMODEL_DSL_4CEAEC25746E0C3C

#if __has_include(<JobsModel/JobsDecorationModel.h>)
#import <JobsModel/JobsDecorationModel.h>
#else
#import "JobsDecorationModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsDecorationModel (DSL)

#pragma mark —— 来自 JobsDecorationModel
-(__kindof JobsDecorationModel *_Nonnull (^ _Nonnull)(Class data))byCls;
-(__kindof JobsDecorationModel *_Nonnull (^ _Nonnull)(NSString * data))byTitle;
-(__kindof JobsDecorationModel *_Nonnull (^ _Nonnull)(NSString * data))bySubTitle;
-(__kindof JobsDecorationModel *_Nonnull (^ _Nonnull)(id data))byRequestParams;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSDECORATIONMODEL_DSL_4CEAEC25746E0C3C */
