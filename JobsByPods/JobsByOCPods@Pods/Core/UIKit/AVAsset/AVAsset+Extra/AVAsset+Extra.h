//
//  AVAsset+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_AVASSET_EXTRA_8D38480C36
#define JOBS_HEADER_GUARD_AVASSET_EXTRA_8D38480C36

#import <AVFoundation/AVFoundation.h>

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

@interface AVAsset (Extra)

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_AVASSET_EXTRA_8D38480C36 */
