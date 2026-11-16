//
//  UISwipeActionsConfiguration+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#ifndef JOBS_HEADER_GUARD_UISWIPEACTIONSCONFIGURATION_DSL_B835FC2E04
#define JOBS_HEADER_GUARD_UISWIPEACTIONSCONFIGURATION_DSL_B835FC2E04

#import <UIKit/UIKit.h>

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

API_AVAILABLE(ios(11.0))
@interface UISwipeActionsConfiguration (DSL)

-(JobsRetSwipeActionsConfigurationByBOOLBlock _Nonnull)byPerformsFirstActionWithFullSwipe;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISWIPEACTIONSCONFIGURATION_DSL_B835FC2E04 */
