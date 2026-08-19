//
//  IncomeSourceModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_INCOMESOURCEMODEL_DSL_2BC821EBBA19637A
#define JOBS_HEADER_GUARD_INCOMESOURCEMODEL_DSL_2BC821EBBA19637A

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

@interface IncomeSourceModel (DSL)

-(JobsRetIncomeSourceModelByStrBlock _Nonnull)byID;
-(JobsRetIncomeSourceModelByStrBlock _Nonnull)byName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_INCOMESOURCEMODEL_DSL_2BC821EBBA19637A */
