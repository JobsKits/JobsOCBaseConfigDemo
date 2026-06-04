//
//  PhilippinesIDTypeModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_PHILIPPINESIDTYPEMODEL_DSL_32BBA2B8ECAED4B2
#define JOBS_HEADER_GUARD_PHILIPPINESIDTYPEMODEL_DSL_32BBA2B8ECAED4B2

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

NS_ASSUME_NONNULL_BEGIN

@interface PhilippinesIDTypeModel (DSL)

-(JobsRetPhilippinesIDTypeModelByNSIntegerBlock _Nonnull)byID;
-(JobsRetPhilippinesIDTypeModelByStrBlock _Nonnull)byName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_PHILIPPINESIDTYPEMODEL_DSL_32BBA2B8ECAED4B2 */
