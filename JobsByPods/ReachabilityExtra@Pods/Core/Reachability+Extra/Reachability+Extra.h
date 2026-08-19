//
//  Reachability+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_REACHABILITY_EXTRA_6471724AE8
#define JOBS_HEADER_GUARD_REACHABILITY_EXTRA_6471724AE8

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<Reachability/Reachability.h>)
#import <Reachability/Reachability.h>
#else
#import "Reachability.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 检查联网情况
@interface Reachability (Extra)

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN Reachability
-(JobsRetReachabilityByBOOLBlock _Nonnull)byReachableOnWWAN;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END Reachability
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_REACHABILITY_EXTRA_6471724AE8 */
