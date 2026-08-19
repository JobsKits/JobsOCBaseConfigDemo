//
//  BaseRequest.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASEREQUEST_494610730B
#define JOBS_HEADER_GUARD_BASEREQUEST_494610730B

#import <Foundation/Foundation.h>
#import <YTKNetworkExtra/YTKBaseRequest+Extra.h>

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

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

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

NS_ASSUME_NONNULL_BEGIN
@class BaseRequest;
/// 用于普通数据的交互
@interface BaseRequest <__covariant T:BaseRequest *> : YTKRequest <YTKCustomBaseRequestProtocol>

+(JobsRetYTKRequestByDictionaryBlock _Nonnull)initByBodyParameters; // 直接调用，后面不能拼byURLParameters
+(JobsRetYTKRequestByDictionaryBlock _Nonnull)initByURLParameters;  // 直接调用，后面不能拼byBodyParameters

-(JobsRetMutableDicByVoidBlock _Nonnull)jobsCustomHTTPHeader;

-(JobsRetMutableDicByVoidBlock _Nonnull)jobsParameters;

-(JobsRetMutableDicByVoidBlock _Nonnull)jobsRequestHeaderFieldValueDictionary;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASEREQUEST_494610730B */
