//
//  YTKUrlArgumentsFilter.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_YTKURLARGUMENTSFILTER_0C3F89949E
#define JOBS_HEADER_GUARD_YTKURLARGUMENTSFILTER_0C3F89949E

#import <Foundation/Foundation.h>

#if __has_include(<YTKNetwork/YTKBaseRequest.h>)
#import <YTKNetwork/YTKBaseRequest.h>
#else
#import "YTKBaseRequest.h"
#endif

#if __has_include(<YTKNetwork/YTKNetworkConfig.h>)
#import <YTKNetwork/YTKNetworkConfig.h>
#else
#import "YTKNetworkConfig.h"
#endif

#if __has_include(<AFNetworking/AFURLRequestSerialization.h>)
#import <AFNetworking/AFURLRequestSerialization.h>
#else
#import "AFURLRequestSerialization.h"
#endif

/// 给url追加arguments，用于全局参数，比如AppVersion, ApiVersion等
@interface YTKUrlArgumentsFilter : NSObject <YTKUrlFilterProtocol>

+(YTKUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments;

-(NSString *)filterUrl:(NSString *)originUrl
           withRequest:(YTKBaseRequest *)request;

@end
#endif /* JOBS_HEADER_GUARD_YTKURLARGUMENTSFILTER_0C3F89949E */
