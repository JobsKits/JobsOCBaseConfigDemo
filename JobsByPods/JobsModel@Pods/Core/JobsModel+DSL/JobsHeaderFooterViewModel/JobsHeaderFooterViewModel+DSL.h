//
//  JobsHeaderFooterViewModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSHEADERFOOTERVIEWMODEL_DSL_6B030D6588453B3F
#define JOBS_HEADER_GUARD_JOBSHEADERFOOTERVIEWMODEL_DSL_6B030D6588453B3F

#if __has_include(<JobsModel/JobsHeaderFooterViewModel.h>)
#import <JobsModel/JobsHeaderFooterViewModel.h>
#else
#import "JobsHeaderFooterViewModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsHeaderFooterViewModel (DSL)

#pragma mark —— 来自 JobsHeaderFooterViewModel
-(__kindof JobsHeaderFooterViewModel *_Nonnull (^ _Nonnull)(BOOL data))byUseHeaderView;
-(__kindof JobsHeaderFooterViewModel *_Nonnull (^ _Nonnull)(BOOL data))byUseFooterView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSHEADERFOOTERVIEWMODEL_DSL_6B030D6588453B3F */
