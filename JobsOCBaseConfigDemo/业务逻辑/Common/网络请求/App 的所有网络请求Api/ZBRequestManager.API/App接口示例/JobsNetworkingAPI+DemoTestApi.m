//
//  JobsNetworkingAPI+DemoTestApi.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsNetworkingAPI+DemoTestApi.h"

@implementation ZBURLRequest (JobsNetworkingDSL)

#define JOBS_ZB_REQUEST_DSL(_selector_, _property_, _type_, _blockType_) \
-(_blockType_ _Nonnull)_selector_{ \
    @jobs_weakify(self) \
    return ^__kindof ZBURLRequest *_Nullable(_type_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JOBS_ZB_REQUEST_DSL(byServer, server, NSString *_Nullable, JobsRetZBURLRequestByStrBlock)
JOBS_ZB_REQUEST_DSL(byUrl, url, NSString *_Nullable, JobsRetZBURLRequestByStrBlock)
JOBS_ZB_REQUEST_DSL(byMethodType, methodType, NSInteger, JobsRetZBURLRequestByNSIntegerBlock)
JOBS_ZB_REQUEST_DSL(byApiType, apiType, NSInteger, JobsRetZBURLRequestByNSIntegerBlock)
JOBS_ZB_REQUEST_DSL(byParameters, parameters, id _Nullable, JobsRetZBURLRequestByIDBlock)
JOBS_ZB_REQUEST_DSL(byRetryCount, retryCount, NSUInteger, JobsRetZBURLRequestByNSUIntegerBlock)
JOBS_ZB_REQUEST_DSL(byTimeoutInterval, timeoutInterval, NSTimeInterval, JobsRetZBURLRequestByTimeIntervalBlock)
JOBS_ZB_REQUEST_DSL(byUserInfo, userInfo, id _Nullable, JobsRetZBURLRequestByIDBlock)

#undef JOBS_ZB_REQUEST_DSL

@end

@implementation JobsNetworkingAPI (DemoTestApi)
NSString *appInterfaceTesting;
+(void)appInterfaceTesting:(id)parameters
              successBlock:(jobsByIDBlock _Nullable)successBlock
              failureBlock:(jobsByIDBlock _Nullable)failureBlock{
//    NSDictionary *parameterss = @{};
//    NSDictionary *headers = @{};
    [ZBRequestManager requestWithConfig:^(ZBURLRequest * _Nullable request) {
        request
            .byServer(This.jobsBaseUrl())
            .byUrl(request.server.add(This.jobs_appInterfaceTesting().url))
            .byMethodType(ZBMethodTypeGET)
            .byApiType(ZBRequestTypeRefresh)
            .byParameters(parameters)
            .byRetryCount(1)
            .byTimeoutInterval(10);
        JobsLog(@"request.URLString = %@",request.url);
//        request.headers = headers;//与公共配置 Headers 兼容
        if (isValue(DataManager.sharedManager.tag)) {
            request.byUserInfo(@{@"info":DataManager.sharedManager.tag});
        };//与公共配置 UserInfo 不兼容 优先级大于 公共配置
        {
//            request.filtrationCacheKey = @[@"".jobsTr()];//与公共配置 filtrationCacheKey 兼容
//            request.requestSerializer = ZBJSONRequestSerializer; //单次请求设置 请求格式 默认JSON，优先级大于 公共配置，不影响其他请求设置
//            request.responseSerializer = ZBJSONResponseSerializer; //单次请求设置 响应格式 默认JSON，优先级大于 公共配置,不影响其他请求设置
            /**
             多次请求同一个接口 保留第一次或最后一次请求结果 只在请求时有用  读取缓存无效果。默认ZBResponseKeepNone 什么都不做
             使用场景是在 重复点击造成的 多次请求，如发帖，评论，搜索等业务
             */
//            request.keepType=ZBResponseKeepNone;
        }//一些临时的其他的配置
    }progress:^(NSProgress * _Nullable progress){
        JobsLog(@"进度 = %f",progress.fractionCompleted * 100);
    }success:^(id  _Nullable responseObject,
               ZBURLRequest * _Nullable request){
        [JobsNetworkingAPI networkingSuccessHandleWithData:responseObject
                                                 request:request
                                            successBlock:successBlock
                                            failureBlock:failureBlock];
    }failure:^(NSError * _Nullable error){
        JobsLog(@"error = %@",error);
        if (failureBlock) {
            failureBlock(error);
        }
    }finished:^(id  _Nullable responseObject,
                NSError * _Nullable error,
                ZBURLRequest * _Nullable request){
        JobsLog(@"请求完成 userInfo:%@",request.userInfo);
    }];
}

@end
