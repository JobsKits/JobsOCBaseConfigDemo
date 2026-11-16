//
//  NSTextCheckingResult+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSTEXTCHECKINGRESULT_EXTRA_59E8EB345F
#define JOBS_HEADER_GUARD_NSTEXTCHECKINGRESULT_EXTRA_59E8EB345F

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSTextCheckingResult (Extra)

-(JobsRetRangeByIntegerBlock _Nonnull)rangeAtIndex;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSTEXTCHECKINGRESULT_EXTRA_59E8EB345F */
