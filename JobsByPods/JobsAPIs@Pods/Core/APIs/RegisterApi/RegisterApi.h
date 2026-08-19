//
//  RegisterApi.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_REGISTERAPI_B562C8CC27
#define JOBS_HEADER_GUARD_REGISTERAPI_B562C8CC27

#import <JobsAPIs/JobsBaseApi.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<YTKNetworkExtra/YTKNetworkExtra.h>)
#import <YTKNetworkExtra/YTKNetworkExtra.h>
#else
#import "YTKNetworkExtra.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@interface RegisterApi : JobsBaseApi

-(JobsRetStrByVoidBlock _Nonnull)userId; // 在链式请求中，下一个请求的参数来源于上一个请求的结果

@end
#endif /* JOBS_HEADER_GUARD_REGISTERAPI_B562C8CC27 */
