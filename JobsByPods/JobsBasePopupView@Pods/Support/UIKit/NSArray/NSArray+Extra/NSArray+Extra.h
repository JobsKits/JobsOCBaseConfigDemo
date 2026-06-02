//
//  NSArray+Extra.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSARRAY_EXTRA_494BED2CBF
#define JOBS_HEADER_GUARD_NSARRAY_EXTRA_494BED2CBF

#pragma once

#import <Foundation/Foundation.h>

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

@interface NSArray (Extra)
/// 数组取值（无法关联数组的泛型）
-(JobsRetIDByUIntegerBlock _Nonnull)objectAt;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSARRAY_EXTRA_494BED2CBF */
