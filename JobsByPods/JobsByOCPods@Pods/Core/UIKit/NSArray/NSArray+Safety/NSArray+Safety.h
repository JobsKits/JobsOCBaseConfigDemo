//
//  NSArray+Safety.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSARRAY_SAFETY_BCE5BA78B1
#define JOBS_HEADER_GUARD_NSARRAY_SAFETY_BCE5BA78B1

#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import <JobsByOCPods/NSObject+Extra.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 数组防崩
@interface NSArray (Safety)

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSARRAY_SAFETY_BCE5BA78B1 */
