//
//  UIEditMenuInteraction+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIEDITMENUINTERACTION_EXTRA_4C6A8AB985
#define JOBS_HEADER_GUARD_UIEDITMENUINTERACTION_EXTRA_4C6A8AB985

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

@interface UIEditMenuInteraction (Extra)

+(JobsRetUIEditMenuInteractionByIDBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIEDITMENUINTERACTION_EXTRA_4C6A8AB985 */
