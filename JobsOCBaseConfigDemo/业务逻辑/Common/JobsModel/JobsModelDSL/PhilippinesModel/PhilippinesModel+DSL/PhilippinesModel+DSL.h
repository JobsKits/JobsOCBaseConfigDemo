//
//  PhilippinesModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_PHILIPPINESMODEL_DSL_3D7DEEC7629440F7
#define JOBS_HEADER_GUARD_PHILIPPINESMODEL_DSL_3D7DEEC7629440F7

#import "JobsModel.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhilippinesModel (DSL)

-(JobsRetPhilippinesModelByNSIntegerBlock _Nonnull)byState_id;
-(JobsRetPhilippinesModelByStrBlock _Nonnull)byState_name;
-(JobsRetPhilippinesModelByStrBlock _Nonnull)byID;
-(JobsRetPhilippinesModelByStrBlock _Nonnull)byName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_PHILIPPINESMODEL_DSL_3D7DEEC7629440F7 */
