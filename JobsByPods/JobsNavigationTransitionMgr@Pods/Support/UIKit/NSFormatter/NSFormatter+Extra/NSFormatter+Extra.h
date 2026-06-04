//
//  NSFormatter+Extra.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSFORMATTER_EXTRA_CCD2EC5132
#define JOBS_HEADER_GUARD_NSFORMATTER_EXTRA_CCD2EC5132

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsClass/NSObject+Class.h>)
#import <JobsClass/NSObject+Class.h>
#else
#import "NSObject+Class.h"
#endif

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

@interface NSFormatter (Extra)

-(JobsRetStrByDateBlock _Nonnull)date;
-(JobsRetStrByTimeIntervalBlock _Nonnull)time;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSFORMATTER_EXTRA_CCD2EC5132 */
