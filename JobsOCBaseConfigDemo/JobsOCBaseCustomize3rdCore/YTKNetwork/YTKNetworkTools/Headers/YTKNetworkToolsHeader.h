//
//  YTKNetworkToolsHeader.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef YTKNetworkToolsHeader_h
#define YTKNetworkToolsHeader_h

#import <Foundation/Foundation.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<AFNetworking/AFURLRequestSerialization.h>)
#import <AFNetworking/AFURLRequestSerialization.h>
#else
#import "AFURLRequestSerialization.h"
#endif

#import "JobsDefines.h"

#pragma mark —— 自定义封装
#import "YTKBaseRequest+Extra.h"
#import "YTKBatchRequest+Extra.h"
#import "YTKChainRequest+Extra.h"
#pragma mark —— BaseRequest
#import "BaseRequest.h"
#pragma mark —— YTKNetworkAccessory
#import "YTKChainRequest+AnimatingAccessory.h"
#import "YTKBatchRequest+AnimatingAccessory.h"
#import "YTKBaseRequest+AnimatingAccessory.h"
#import "YTKAnimatingRequestAccessory.h"
#pragma mark —— YTKUrlArgumentsFilter
#import "YTKUrlArgumentsFilter.h"

#endif /* YTKNetworkToolsHeader_h */
