//
//  PhilippinesIDTypeModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_PHILIPPINESIDTYPEMODEL_DSL_F0399FBAB585D352
#define JOBS_HEADER_GUARD_PHILIPPINESIDTYPEMODEL_DSL_F0399FBAB585D352

#if __has_include(<JobsModel/PhilippinesIDTypeModel.h>)
#import <JobsModel/PhilippinesIDTypeModel.h>
#else
#import "PhilippinesIDTypeModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface PhilippinesIDTypeModel (DSL)

#pragma mark —— 来自 PhilippinesIDTypeModel
-(__kindof PhilippinesIDTypeModel *_Nonnull (^ _Nonnull)(NSInteger data))byID;
-(__kindof PhilippinesIDTypeModel *_Nonnull (^ _Nonnull)(NSString * data))byName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_PHILIPPINESIDTYPEMODEL_DSL_F0399FBAB585D352 */
