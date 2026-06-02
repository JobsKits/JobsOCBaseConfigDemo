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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#pragma mark —— 自定义封装
#import <YTKNetworkExtra/YTKBaseRequest+Extra.h>
#import <YTKNetworkExtra/YTKBatchRequest+Extra.h>
#import <YTKNetworkExtra/YTKChainRequest+Extra.h>
#pragma mark —— BaseRequest
#import <YTKNetworkExtra/BaseRequest.h>
#pragma mark —— YTKNetworkAccessory
#import <YTKNetworkExtra/YTKChainRequest+AnimatingAccessory.h>
#import <YTKNetworkExtra/YTKBatchRequest+AnimatingAccessory.h>
#import <YTKNetworkExtra/YTKBaseRequest+AnimatingAccessory.h>
#import <YTKNetworkExtra/YTKAnimatingRequestAccessory.h>
#pragma mark —— YTKUrlArgumentsFilter
#import <YTKNetworkExtra/YTKUrlArgumentsFilter.h>

#endif /* YTKNetworkToolsHeader_h */
