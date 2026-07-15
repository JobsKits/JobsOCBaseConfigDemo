//
//  NSObject+YTKNetwork.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "JobsResponseModel+YTKNetwork.h"
#import "YTKBaseRequest+Extra.h"
#import "NSData+Extra.h"
#import "NSMutableDictionary+Extra.h"
#import "NSObject+Data.h"
#import "NSObject+Extra.h"

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "JobsBaseProtocolHeader.h"
#import "JobsModelDSL.h"
#import "JobsTimeUtils.h"
#import "JobsLanMgr.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

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

@interface NSObject (YTKNetwork)<YTKNetworkProtocols,YTKChainRequestDelegate>
#pragma mark —— 示例代码
/// 普通的单个请求
-(void)loadCacheData:(jobsByResponseModelBlock _Nullable)successBlock;
/// 多请求の同步请求
-(void)sendBatchRequest:(jobsByYTKBatchRequestBlock _Nullable)successBlock;
/// 多请求の链式请求。链式请求的结果集体现在<YTKChainRequestDelegate>
-(void)sendChainRequest:(jobsByYTKChainRequestBlock _Nullable)successBlock;
#pragma mark —— 查询广告列表-支持游客：APP首页右下3Banner【GET】
-(void)getAds:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 用户登出【POST】
-(void)fm_logout:(jobsByResponseModelBlock _Nullable)successBlock;
#pragma mark —— 存款优惠活动信息【POST】
-(void)depositDiscountActivityRecordByURLParameters:(NSString *_Nullable)urlParameters
                                       successBlock:(jobsByYTKChainRequestBlock _Nullable)successBlock;
/// 上传KYC的图片@POST
-(void)uploadKYCImage:(NSData *)image
         successBlock:(jobsByResponseModelBlock _Nullable)successBlock;

@end

NS_ASSUME_NONNULL_END
