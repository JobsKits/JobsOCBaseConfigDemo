//
//  IncomeSourceModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_INCOMESOURCEMODEL_DSL_B99C22C5D1753059
#define JOBS_HEADER_GUARD_INCOMESOURCEMODEL_DSL_B99C22C5D1753059

#if __has_include(<JobsModel/IncomeSourceModel.h>)
#import <JobsModel/IncomeSourceModel.h>
#else
#import "IncomeSourceModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface IncomeSourceModel (DSL)

#pragma mark —— 来自 IncomeSourceModel
-(__kindof IncomeSourceModel *_Nonnull (^ _Nonnull)(NSString * data))byID;
-(__kindof IncomeSourceModel *_Nonnull (^ _Nonnull)(NSString * data))byName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_INCOMESOURCEMODEL_DSL_B99C22C5D1753059 */
