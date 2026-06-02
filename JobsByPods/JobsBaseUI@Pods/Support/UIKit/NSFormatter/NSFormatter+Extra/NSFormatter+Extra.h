//
//  NSFormatter+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSFORMATTER_EXTRA_1BE01992A3
#define JOBS_HEADER_GUARD_NSFORMATTER_EXTRA_1BE01992A3

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsClass/JobsClass.h>)
#import <JobsClass/JobsClass.h>
#else
#import "JobsClass.h"
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
#endif /* JOBS_HEADER_GUARD_NSFORMATTER_EXTRA_1BE01992A3 */
