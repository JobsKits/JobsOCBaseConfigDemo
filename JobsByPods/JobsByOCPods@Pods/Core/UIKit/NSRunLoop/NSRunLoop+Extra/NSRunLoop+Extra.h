//
//  NSRunLoop+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSRUNLOOP_EXTRA_648A3CB895
#define JOBS_HEADER_GUARD_NSRUNLOOP_EXTRA_648A3CB895

#import <Foundation/Foundation.h>

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

@interface NSRunLoop (Extra)

+(JobsRetTimerByTimerBlock _Nonnull)addTimerAtMainRunLoopByCommonModes;
+(JobsRetTimerByTimerBlock _Nonnull)addTimerAtMainRunLoopByDefaultRunLoopMode;
+(JobsRetTimerByTimerBlock _Nonnull)addTimerAtCurrentRunLoopByCommonModes;
+(JobsRetTimerByTimerBlock _Nonnull)addTimerAtCurrentRunLoopByDefaultRunLoopMode;

-(jobsByTimerBlock _Nonnull)commonModesByTimer;
-(jobsByTimerBlock _Nonnull)defaultModeByTimer;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSRUNLOOP_EXTRA_648A3CB895 */
