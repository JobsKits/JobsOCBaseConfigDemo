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

-(JobsRetURLRequestByVoidBlock _Nonnull)jobsBuildCustomUrlRequest;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsBaseApi
-(JobsRetJobsBaseApiByNSStringBlock _Nonnull)byAnimatingText;
-(JobsRetJobsBaseApiByUIViewBlock _Nonnull)byAnimatingView;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsBaseApi
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBASEAPI_EF05F493DD */
