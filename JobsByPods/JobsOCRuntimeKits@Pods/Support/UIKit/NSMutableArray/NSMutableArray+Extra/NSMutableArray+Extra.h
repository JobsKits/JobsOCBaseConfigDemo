//
//  NSMutableArray+Extra.h
//  BRPickerViewExtra
//
//  Created by Jobs on 2026/5/13.
//

#ifndef JOBS_HEADER_GUARD_NSMUTABLEARRAY_EXTRA_88E018C253
#define JOBS_HEADER_GUARD_NSMUTABLEARRAY_EXTRA_88E018C253

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

@interface NSMutableArray (Extra)
/// 阻止向可变数组添加空元素
-(JobsRetMutableArrayByIDBlock _Nonnull)add;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSMUTABLEARRAY_EXTRA_88E018C253 */
