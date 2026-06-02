//
//  JobsBaseApi.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBASEAPI_EF05F493DD
#define JOBS_HEADER_GUARD_JOBSBASEAPI_EF05F493DD

#import <Foundation/Foundation.h>

#if __has_include(<YTKNetworkExtra/YTKNetworkExtra.h>)
#import <YTKNetworkExtra/YTKNetworkExtra.h>
#else
#import "YTKNetworkExtra.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// JobsBaseApi >> BaseRequest >> YTKRequest >> YTKBaseRequest >> NSObject
@interface JobsBaseApi : BaseRequest

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBASEAPI_EF05F493DD */
