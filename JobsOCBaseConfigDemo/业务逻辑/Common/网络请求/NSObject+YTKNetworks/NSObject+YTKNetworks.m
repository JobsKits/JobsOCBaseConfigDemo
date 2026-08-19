//
//  NSObject+YTKNetworks.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+YTKNetworks.h"

@implementation NSObject (YTKNetworks)
#pragma mark —— 示例代码
/// 普通的单个请求
-(jobsByjobsByResponseModelBlockBlock _Nonnull)loadCacheData{
    @jobs_weakify(self)
    return ^(jobsByResponseModelBlock _Nullable successBlock){
        @jobs_strongify(self)
        if (!self) return;
        // self.tipsByApi(self);
        @jobs_weakify(self)
        [GetCustomerContactApi.new
            .byURLParameters(nil)    // 添加URL参数
            .byBodyParameters(nil)   // 添加Body参数
            .byHeaderParameters(nil) // 添加Header参数
            .handleErr()
         startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
            /// 以下是我们需要的值
            JobsResponseModel *responseModel = JobsResponseModel.byData(request.responseObject);
            if(responseModel.code == HTTPResponseCodeSuccess){
                if(successBlock) successBlock(responseModel);
            }
        } failure:^(YTKBaseRequest *request) {
            @jobs_strongify(self)
            if(self) self.jobsHandelFailure(request);
        }];
    };
}
/// 多请求の同步请求
-(jobsByjobsByYTKBatchRequestBlockBlock _Nonnull)sendBatchRequest{
    @jobs_weakify(self)
    return ^(jobsByYTKBatchRequestBlock _Nullable successBlock){
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        [YTKBatchRequest.initByRequestArray(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof YTKRequest *>*_Nullable data) {
            data
                .add(GetImageApi.initByBodyParameters(nil))
                .add(GetImageApi.initByBodyParameters(nil))
                .add(GetImageApi.initByBodyParameters(nil))
                .add(GetUserInfoApi.initByBodyParameters(nil));
        })) startWithCompletionBlockWithSuccess:^(YTKBatchRequest *batchRequest) {
            JobsLog(@"succeed");
            if(successBlock) successBlock(batchRequest);
            NSArray <__kindof YTKRequest *>*requests = batchRequest.requestArray;
            GetImageApi *a = (GetImageApi *)requests[0];
            GetImageApi *b = (GetImageApi *)requests[1];
            GetImageApi *c = (GetImageApi *)requests[2];
            GetUserInfoApi *user = (GetUserInfoApi *)requests[3];
            ///deal with requests result ...
            JobsLog(@"%@, %@, %@, %@", a, b, c, user);
            /// 以下是我们需要的值
    //        a.responseObject;
    //        b.responseObject;
    //        c.responseObject;
    //        user.responseObject;
        } failure:^(YTKBatchRequest *batchRequest) {
            @jobs_strongify(self)
            self.jobsHandelFailure(batchRequest.failedRequest);
        }];
    };
}
/// 多请求の链式请求。链式请求的结果集体现在<YTKChainRequestDelegate>
-(jobsByjobsByYTKChainRequestBlockBlock _Nonnull)sendChainRequest{
    @jobs_weakify(self)
    return ^(jobsByYTKChainRequestBlock _Nullable successBlock){
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        jobsMakeYTKChainRequest(^(YTKChainRequest * _Nullable chainReq) {
            @jobs_strongify(self)
            [chainReq addRequest:RegisterApi.new
                .byURLParameters(nil)
                .byBodyParameters(nil)
                .byHeaderParameters(nil)
                        callback:^(YTKChainRequest *chainRequest,
                                   YTKBaseRequest *baseRequest) {
                RegisterApi *result = (RegisterApi *)baseRequest;
                /// 在链式请求中，下一个请求的参数来源于上一个请求的结果
                [chainRequest addRequest:GetUserInfoApi.new
                 .byURLParameters(nil)
                 .byBodyParameters(jobsMakeMutDic(^(__kindof NSMutableDictionary *_Nullable data) {
                     if(result.userId()) [data setValue:result.userId() forKey:@"KKK"];
                 })) callback:nil];
            }];
            chainReq.byDelegate(self);
            if(successBlock) successBlock(chainReq);
            chainReq.start;// start to send request
        });
    };
}
#pragma mark —— YTKChainRequestDelegate
-(void)chainRequestFinished:(YTKChainRequest *)chainRequest{
    ((((JobsYTKChainSuccessBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(chainRequestFinished)))(self, @selector(chainRequestFinished))))(chainRequest);
}
-(JobsYTKChainSuccessBlock _Nonnull)chainRequestFinished{
    @jobs_weakify(self)
    return ^(YTKChainRequest * chainRequest){
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"all requests are done");
    //    chainRequest.requestArray;
    //    chainRequest.requestAccessories;
        [self request:chainRequest.requestArray.lastObject
         successBlock:^(JobsResponseModel *_Nullable responseModel){
            JobsLog(@"");
        }];
    };
}

-(void)chainRequestFailed:(YTKChainRequest *)chainRequest
        failedBaseRequest:(YTKBaseRequest *)request{
    JobsResponseModel *responseModel = JobsResponseModel.byData(request.responseObject);
    self.jobsHandelNoSuccess(request);
    JobsLog(@"请求失败");
}
#pragma mark —— 查询广告列表-支持游客：APP首页右下3Banner【GET】
-(jobsByjobsByResponseModelBlockBlock _Nonnull)getAds{
    @jobs_weakify(self)
    return ^(jobsByResponseModelBlock _Nullable successBlock){
        @jobs_strongify(self)
        if (!self) return;
        // self.tipsByApi(self);
        @jobs_weakify(self)
        [FM_promotion_advertise_api.new
            .byURLParameters(nil)
            .byBodyParameters(nil)
            .byHeaderParameters(nil)
            .handleErr() startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
            @jobs_strongify(self)
            [self request:request successBlock:successBlock];
        } failure:^(YTKBaseRequest *request) {
            @jobs_strongify(self)
            if(self) self.jobsHandelFailure(request);
        }];
    };
}
#pragma mark —— 用户登出【POST】
-(jobsByjobsByResponseModelBlockBlock _Nonnull)fm_logout{
    @jobs_weakify(self)
    return ^(jobsByResponseModelBlock _Nullable successBlock){
        @jobs_strongify(self)
        if (!self) return;
        // self.tipsByApi(self);
        @jobs_weakify(self)
        [FM_user_logout_api.new
            .byURLParameters(nil)
            .byBodyParameters(nil)
            .byHeaderParameters(nil)
            .handleErr() startWithCompletionBlockWithSuccess:^(YTKBaseRequest <YTKCustomBaseRequestProtocol>*request) {
            @jobs_strongify(self)
            [self request:request successBlock:successBlock];
        } failure:^(YTKBaseRequest *request) {
            @jobs_strongify(self)
            if(self) self.jobsHandelFailure(request);
        }];
    };
}
#pragma mark —— 存款优惠活动信息【POST】
-(void)depositDiscountActivityRecordByURLParameters:(NSString *_Nullable)urlParameters
                                       successBlock:(jobsByYTKChainRequestBlock _Nullable)successBlock{
    FM_GetKYCInfo_api *api = FM_GetKYCInfo_api.new;
    api.byURLParameters(urlParameters);/// 添加URL参数
    api.byBodyParameters(nil); /// 添加Body参数
    api.byHeaderParameters(nil); /// 添加Header参数
    YTKChainRequest *chainReq = YTKChainRequest.new;
    [chainReq addRequest:api
                callback:^(YTKChainRequest *chainRequest,
                           YTKBaseRequest *baseRequest) {
        FM_GetKYCInfo_api *result = (FM_GetKYCInfo_api *)baseRequest;
        /// 在链式请求中，下一个请求的参数来源于上一个请求的结果
        [chainRequest addRequest:FM_getDepositDiscountActivityRecord_api.new.byURLParameters(@"?kyc=".add(result.kyc())).byBodyParameters(nil)
                        callback:nil];
    }];
    chainReq.byDelegate(self);
    if(successBlock) successBlock(chainReq);
    chainReq.start;// start to send request
}
/// 上传KYC的图片@POST
-(void)uploadKYCImage:(NSData *)image
         successBlock:(jobsByResponseModelBlock _Nullable)successBlock{
    @jobs_weakify(self)
    [FM_kyc_image_upload_api.new
        .initBy(jobsMakeFileModel(^(__kindof JobsFileModel * _Nullable model) {
            model.byFile(image);
        })).handleErr() startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            @jobs_strongify(self)
            JobsResponseModel *responseModel = JobsMapResponseModelBy(request);
            JobsLog(@"");
            if(successBlock) successBlock(responseModel);
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            @jobs_strongify(self)
            JobsLog(@"");
    }];
}

@end
