//
//  PhilippinesIDTypeModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_PHILIPPINESIDTYPEMODEL_DSL_32BBA2B8ECAED4B2
#define JOBS_HEADER_GUARD_PHILIPPINESIDTYPEMODEL_DSL_32BBA2B8ECAED4B2

#import "JobsModel.h"
#import "JobsBlock.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface PhilippinesIDTypeModel (DSL)

-(JobsRetPhilippinesIDTypeModelByNSIntegerBlock _Nonnull)byID;
-(JobsRetPhilippinesIDTypeModelByStrBlock _Nonnull)byName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_PHILIPPINESIDTYPEMODEL_DSL_32BBA2B8ECAED4B2 */
