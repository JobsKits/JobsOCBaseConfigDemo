//
//  NSObject+YTKNetwork.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <YTKNetworkExtra/JobsResponseModel+YTKNetwork.h>
#import <YTKNetworkExtra/YTKBaseRequest+Extra.h>
#import <YTKNetworkExtra/NSData+Extra.h>
#import <YTKNetworkExtra/NSObject+Extra.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsTimeUtils/JobsTimeUtils.h>)
#import <JobsTimeUtils/JobsTimeUtils.h>
#else
#import "JobsTimeUtils.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

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

#ifndef JOBS_PRINT_URL_REQUEST_INLINE
#define JOBS_PRINT_URL_REQUEST_INLINE

NS_INLINE void JobsPrintURLRequest(NSURLRequest *_Nullable request) {
#ifndef DEBUG
    return;
#endif
    if (!request) return;
    JobsLog(@"请求URL:%@\n", request.URL);
    JobsLog(@"请求方式:%@\n", request.HTTPMethod);
    JobsLog(@"请求头信息:%@\n", request.allHTTPHeaderFields);
    JobsLog(@"请求正文信息:%@\n", request.HTTPBody.stringByUTF8Encoding);
    JobsLog(@"请求响应时间:%@\n", request.currentTimestampString(nil));
    JobsLog(@"\n请求URL:%@\n请求方式:%@\n请求头信息:%@\n请求正文信息:%@\n请求响应时间:%@\n",
            request.URL,
            request.HTTPMethod,
            request.allHTTPHeaderFields,
            request.HTTPBody.stringByUTF8Encoding,
            request.currentTimestampString(nil));
}
#endif /* JOBS_PRINT_URL_REQUEST_INLINE */
/// 后端接口返回数据按照标准格式（msg、code、data）进行解析，取出有用字段（data）
NS_INLINE JobsResponseModel *_Nullable JobsMapResponseModelBy(YTKBaseRequest *_Nonnull request){
    JobsPrintURLRequest(request.originalRequest);
    return JobsResponseModel.byData(request.responseObject);
}

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YTKNetwork)<YTKNetworkProtocols>

@end

NS_ASSUME_NONNULL_END
