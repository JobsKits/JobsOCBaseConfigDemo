//
//  JobsDecorationModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSDECORATIONMODEL_DSL_2EBDF5801243A831
#define JOBS_HEADER_GUARD_JOBSDECORATIONMODEL_DSL_2EBDF5801243A831

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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsDecorationModel (DSL)

-(JobsRetJobsDecorationModelByClsBlock _Nonnull)byCls;
-(JobsRetJobsDecorationModelByStrBlock _Nonnull)byTitle;
-(JobsRetJobsDecorationModelByStrBlock _Nonnull)bySubTitle;
-(JobsRetJobsDecorationModelByIDBlock _Nonnull)byRequestParams;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSDECORATIONMODEL_DSL_2EBDF5801243A831 */
