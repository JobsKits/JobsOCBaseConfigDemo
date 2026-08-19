//
//  JobsCorModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSCORMODEL_DSL_1FED031720ACA95
#define JOBS_HEADER_GUARD_JOBSCORMODEL_DSL_1FED031720ACA95

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

@interface JobsCorModel (DSL)

-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)byRed;
-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)byGreen;
-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)byBlue;
-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)byAlpha;
-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)byHue;
-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)bySaturation;
-(JobsRetJobsCorModelByCGFloatBlock _Nonnull)byBrightness;
-(JobsRetJobsCorModelByStrBlock _Nonnull)byCorStr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSCORMODEL_DSL_1FED031720ACA95 */
