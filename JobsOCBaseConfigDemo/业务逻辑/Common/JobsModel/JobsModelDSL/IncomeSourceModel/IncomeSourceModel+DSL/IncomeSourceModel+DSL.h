//
//  IncomeSourceModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_INCOMESOURCEMODEL_DSL_2BC821EBBA19637A
#define JOBS_HEADER_GUARD_INCOMESOURCEMODEL_DSL_2BC821EBBA19637A

#import "JobsModel.h"
#import "JobsBlock.h"

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
