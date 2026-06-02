//
//  NSRegularExpression+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSREGULAREXPRESSION_EXTRA_508E6A1E47
#define JOBS_HEADER_GUARD_NSREGULAREXPRESSION_EXTRA_508E6A1E47

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

@interface NSRegularExpression (Extra)

+(JobsRetRegularExpressionByStrBlock _Nonnull)byString;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSREGULAREXPRESSION_EXTRA_508E6A1E47 */
