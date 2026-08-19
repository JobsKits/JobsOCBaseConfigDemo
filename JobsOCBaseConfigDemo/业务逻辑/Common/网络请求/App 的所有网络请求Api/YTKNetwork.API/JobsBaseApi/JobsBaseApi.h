//
//  JobsBaseApi.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBASEAPI_EF05F493DD
#define JOBS_HEADER_GUARD_JOBSBASEAPI_EF05F493DD

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "YTKNetworkExtra.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// JobsBaseApi >> BaseRequest >> YTKRequest >> YTKBaseRequest >> NSObject
@interface JobsBaseApi : BaseRequest

-(JobsRetURLRequestByVoidBlock _Nonnull)jobsBuildCustomUrlRequest;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBASEAPI_EF05F493DD */
