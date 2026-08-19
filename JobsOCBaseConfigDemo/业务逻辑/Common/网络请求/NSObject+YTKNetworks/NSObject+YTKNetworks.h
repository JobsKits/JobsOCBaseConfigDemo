//
//  NSObject+YTKNetworks.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "GetImageApi.h"
#import "GetUserInfoApi.h"
#import "GetCustomerContactApi.h"
#import "JobsNetworkingHeader.h"    // Api

#if __has_include(<AFNetworking/AFURLRequestSerialization.h>)
#import <AFNetworking/AFURLRequestSerialization.h>
#else
#import "AFURLRequestSerialization.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<YTKNetworkExtra/YTKNetworkExtra.h>)
#import <YTKNetworkExtra/YTKNetworkExtra.h>
#else
#import "YTKNetworkExtra.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsAPIs/JobsAPIs.h>)
#import <JobsAPIs/JobsAPIs.h>
#else
#import "JobsAPIs.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YTKNetworks)<YTKChainRequestDelegate>
#pragma mark —— 示例代码
/// 普通的单个请求
-(jobsByjobsByResponseModelBlockBlock _Nonnull)loadCacheData;
/// 多请求の同步请求
-(jobsByjobsByYTKBatchRequestBlockBlock _Nonnull)sendBatchRequest;
/// 多请求の链式请求。链式请求的结果集体现在<YTKChainRequestDelegate>
-(jobsByjobsByYTKChainRequestBlockBlock _Nonnull)sendChainRequest;
#pragma mark —— 查询广告列表-支持游客：APP首页右下3Banner【GET】
-(jobsByjobsByResponseModelBlockBlock _Nonnull)getAds;
#pragma mark —— 用户登出【POST】
-(jobsByjobsByResponseModelBlockBlock _Nonnull)fm_logout;
#pragma mark —— 存款优惠活动信息【POST】
-(void)depositDiscountActivityRecordByURLParameters:(NSString *_Nullable)urlParameters
                                       successBlock:(jobsByYTKChainRequestBlock _Nullable)successBlock;
/// 上传KYC的图片@POST
-(void)uploadKYCImage:(NSData *)image
         successBlock:(jobsByResponseModelBlock _Nullable)successBlock;
@end

NS_ASSUME_NONNULL_END
