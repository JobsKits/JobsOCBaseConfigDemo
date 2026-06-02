//
//  NSSet+Extra.h
//  WHToastExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSET_EXTRA_EF2A7450E5
#define JOBS_HEADER_GUARD_NSSET_EXTRA_EF2A7450E5

#pragma once

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

@interface NSSet (Extra)
/// 对系统方法 setWithArray 的二次封装
+(JobsRetSetByArrBlock _Nonnull)initByArr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSET_EXTRA_EF2A7450E5 */
