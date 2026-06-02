//
//  NSURLSessionDataTask+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSURLSESSIONDATATASK_EXTRA_1D9950D2A3
#define JOBS_HEADER_GUARD_NSURLSESSIONDATATASK_EXTRA_1D9950D2A3

#import <Foundation/Foundation.h>
#import <JobsByOCPods/NSURLRequest+Extra.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSURLSessionDataTask (Extra)
/// 打印请求体
-(JobsRetMutableURLRequestByVoidBlock _Nonnull)print;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSURLSESSIONDATATASK_EXTRA_1D9950D2A3 */
