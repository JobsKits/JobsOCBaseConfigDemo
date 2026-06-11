//
//  PhilippinesModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_PHILIPPINESMODEL_DSL_71267F5A3C2EB37C
#define JOBS_HEADER_GUARD_PHILIPPINESMODEL_DSL_71267F5A3C2EB37C

#if __has_include(<JobsModel/PhilippinesModel.h>)
#import <JobsModel/PhilippinesModel.h>
#else
#import "PhilippinesModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface PhilippinesModel (DSL)

#pragma mark —— 来自 PhilippinesModel
-(__kindof PhilippinesModel *_Nonnull (^ _Nonnull)(NSInteger data))byState_id;
-(__kindof PhilippinesModel *_Nonnull (^ _Nonnull)(NSString * data))byState_name;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_PHILIPPINESMODEL_DSL_71267F5A3C2EB37C */
