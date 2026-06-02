//
//  NSNotificationCenter+JobsBlock.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月17日，星期日.
//

#ifndef JOBS_HEADER_GUARD_NSNOTIFICATIONCENTER_JOBSBLOCK_0C76B50BDA
#define JOBS_HEADER_GUARD_NSNOTIFICATIONCENTER_JOBSBLOCK_0C76B50BDA

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (JobsBlock)

Prop_copy()jobsByNotificationBlock jobsNotificationBlock;

-(jobsByIDBlock _Nonnull)remove;
-(jobsByKey_ValueBlock _Nonnull)Remove;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSNOTIFICATIONCENTER_JOBSBLOCK_0C76B50BDA */
