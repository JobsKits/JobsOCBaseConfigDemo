//
//  NSMutableSet+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSMUTABLESET_EXTRA_6690B13831
#define JOBS_HEADER_GUARD_NSMUTABLESET_EXTRA_6690B13831

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

@interface NSMutableSet (Extra)
/// 阻止向可变集合添加空元素
-(JobsRetMutableSetByIDBlock _Nonnull)add;
-(JobsRetBOOLByIDBlock _Nonnull)containsObject;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSMUTABLESET_EXTRA_6690B13831 */
