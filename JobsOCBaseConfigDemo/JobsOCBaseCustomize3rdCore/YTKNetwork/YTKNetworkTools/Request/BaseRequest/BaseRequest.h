//
//  BaseRequest.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASEREQUEST_494610730B

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

#define JOBS_HEADER_GUARD_BASEREQUEST_494610730B

#import <Foundation/Foundation.h>
#import "YTKBaseRequest+Extra.h"

#import "JobsBaseProtocolHeader.h"
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
@class BaseRequest;
/// 用于普通数据的交互
@interface BaseRequest <__covariant T:BaseRequest *> : YTKRequest <YTKCustomBaseRequestProtocol>

+(JobsRetYTKRequestByDictionaryBlock _Nonnull)initByBodyParameters; // 直接调用，后面不能拼byURLParameters
+(JobsRetYTKRequestByDictionaryBlock _Nonnull)initByURLParameters;  // 直接调用，后面不能拼byBodyParameters

-(JobsRetYTKRequestByDictionaryBlock _Nonnull)byHeaderParameters;
-(JobsRetYTKRequestByDictionaryBlock _Nonnull)byBodyParameters;
-(JobsRetYTKBaseRequestByIDBlock _Nonnull)byURLParameters;
-(JobsRetYTKBaseRequestByVoidBlock _Nonnull)handleErr;

-(JobsRetMutableDicByVoidBlock _Nonnull)jobsRequestHeaderFieldValueDictionary;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BASEREQUEST_494610730B */
