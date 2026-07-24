//
//  NSObject+YTKNetwork.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+YTKNetwork.h"
#import "GetImageApi.h"
#import "GetUserInfoApi.h"
#import "GetCustomerContactApi.h"
#import "RegisterApi.h"
#import "JobsNetworkingHeader.h"
#import "YTKNetworkExtra.h"
#import "JobsMakes.h"
#import "JobsFileModel.h"

@implementation NSObject (YTKNetwork)
#pragma mark —— 示例代码
/// 普通的单个请求
-(void)loadCacheData:(jobsByResponseModelBlock _Nullable)successBlock{
    @jobs_weakify(self)
    [GetCustomerContactApi.new
        .byURLParameters(nil)
        .byBodyParameters(nil)
        .byHeaderParameters(nil)
        .handleErr()
     startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        JobsResponseModel *responseModel = JobsResponseModel.byData(request.responseObject);
        if(responseModel.code == HTTPResponseCodeSuccess){
            if(successBlock) successBlock(responseModel);
        }
    } failure:^(YTKBaseRequest *request) {
        @jobs_strongify(self)
        if(self) self.jobsHandelFailure(request);
    }];
}
/// 多请求の同步请求
-(void)sendBatchRequest:(jobsByYTKBatchRequestBlock _Nullable)successBlock{
    @jobs_weakify(self)
    [YTKBatchRequest.initByRequestArray(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof YTKRequest *>*_Nullable data) {
        data.add(GetImageApi.initByBodyParameters(nil));
        data.add(GetImageApi.initByBodyParameters(nil));
        data.add(GetImageApi.initByBodyParameters(nil));
        data.add(GetUserInfoApi.initByBodyParameters(nil));
    })) startWithCompletionBlockWithSuccess:^(YTKBatchRequest *batchRequest) {
        JobsLog(@"succeed");
        if(successBlock) successBlock(batchRequest);
        NSArray <__kindof YTKRequest *>*requests = batchRequest.requestArray;
        GetImageApi *a = (GetImageApi *)requests[0];
        GetImageApi *b = (GetImageApi *)requests[1];
        GetImageApi *c = (GetImageApi *)requests[2];
        GetUserInfoApi *user = (GetUserInfoApi *)requests[3];
        JobsLog(@"%@, %@, %@, %@", a, b, c, user);
    } failure:^(YTKBatchRequest *batchRequest) {
        @jobs_strongify(self)
        self.jobsHandelFailure(batchRequest.failedRequest);
    }];
}
/// 多请求の链式请求。链式请求的结果集体现在<YTKChainRequestDelegate>
-(void)sendChainRequest:(jobsByYTKChainRequestBlock _Nullable)successBlock{
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
            [chainRequest addRequest:GetUserInfoApi.new
             .byURLParameters(nil)
             .byBodyParameters(jobsMakeMutDic(^(__kindof NSMutableDictionary *_Nullable data) {
                 if(result.userId) [data setValue:result.userId forKey:@"KKK"];
             })) callback:nil];
        }];
        chainReq.delegate = self;
        if(successBlock) successBlock(chainReq);
        [chainReq start];
    });
}
#pragma mark —— YTKChainRequestDelegate
-(void)chainRequestFinished:(YTKChainRequest *)chainRequest{
    JobsLog(@"all requests are done");
    [self request:chainRequest.requestArray.lastObject
     successBlock:^(JobsResponseModel *_Nullable responseModel){
        JobsLog(@"");
    }];
}

-(void)chainRequestFailed:(YTKChainRequest *)chainRequest
        failedBaseRequest:(YTKBaseRequest *)request{
    JobsResponseModel *responseModel = JobsResponseModel.byData(request.responseObject);
    self.jobsHandelNoSuccess(request);
    JobsLog(@"请求失败:%@",responseModel);
}
#pragma mark —— 查询广告列表-支持游客：APP首页右下3Banner【GET】
-(void)getAds:(jobsByResponseModelBlock _Nullable)successBlock{
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
}
#pragma mark —— 用户登出【POST】
-(void)fm_logout:(jobsByResponseModelBlock _Nullable)successBlock{
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
}
#pragma mark —— 存款优惠活动信息【POST】
-(void)depositDiscountActivityRecordByURLParameters:(NSString *_Nullable)urlParameters
                                       successBlock:(jobsByYTKChainRequestBlock _Nullable)successBlock{
    FM_GetKYCInfo_api *api = FM_GetKYCInfo_api.new;
    api.byURLParameters(urlParameters);
    api.byBodyParameters(nil);
    api.byHeaderParameters(nil);
    YTKChainRequest *chainReq = YTKChainRequest.new;
    [chainReq addRequest:api
                callback:^(YTKChainRequest *chainRequest,
                           YTKBaseRequest *baseRequest) {
        FM_GetKYCInfo_api *result = (FM_GetKYCInfo_api *)baseRequest;
        [chainRequest addRequest:FM_getDepositDiscountActivityRecord_api.new.byURLParameters(@"?kyc=".add(result.kyc)).byBodyParameters(nil)
                        callback:nil];
    }];
    chainReq.delegate = self;
    if(successBlock) successBlock(chainReq);
    [chainReq start];
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
            JobsLog(@"%@",request.error);
    }];
}

#pragma mark —— 一些公有设置
/// successData传nil：对总数据源进行标准格式解析后对外返回 JobsResponseModel
/// successData传JobsSolveData(AModel)：对总数据源进行标准格式解析以后，再进行一层关于AModel的解析后对外返回
-(void)request:(YTKBaseRequest *)request                               // 总数据源
   successData:(id _Nullable)successData                               // 本层对success的解析数据
   actionBlock:(jobsByResponseModelBlock _Nullable)actionBlock         // 本层对success的解析回调
  successBlock:(jobsByResponseModelBlock _Nullable)successBlock        // 外层对success的解析回调
     failBlock:(jobsByVoidBlock _Nullable)failBlock{                   // 失败解析回调
    /// 解析+处理HTTPResponseCode
    JobsResponseModel *responseModel = JobsMapResponseModelBy(request);
    /// 打印Body参数
    JobsLog(@"%@",request.parameters.jsonString);
    if(responseModel.code == HTTPResponseCodeSuccess){
        if(successBlock) successBlock(successData ? : responseModel);
        if(actionBlock) actionBlock(responseModel);
    }else{
        /// 仅仅打印请求体：request.requestTask
        self.jobsHandelNoSuccess(request);
        if(failBlock) failBlock();
    }
}

-(void)request:(YTKBaseRequest <YTKCustomBaseRequestProtocol>*)request
  successBlock:(jobsByResponseModelBlock _Nullable)successBlock{
    [self request:request
      successData:nil
      actionBlock:nil
     successBlock:successBlock
        failBlock:nil];
}
///【请求已经成功，但是服务器抛异常】处理非HTTPResponseCodeSuccess 的 HTTPResponseCode
-(void)jobsHandelHTTPResponseCode:(HTTPResponseCode)responseCode
                      actionBlock:(jobsByNSIntegerBlock _Nullable)actionBlock{
    switch (responseCode) {
        /// 服务器异常
        case HTTPResponseCodeServeError:{
            JobsLog(@"服务器异常");
            toastBy(@"服务器异常".tr);
        }break;
        /// 令牌不能为空
        case HTTPResponseCodeNoToken:{
//            self.toLogin();
            JobsLog(@"令牌不能为空");
            toastBy(@"令牌不能为空".tr);
        }break;
        /// 登录失败：账密错误
        case HTTPResponseCodeLoginFailed:{
            JobsLog(@"登录失败：账密错误");
            toastBy(@"登录失败：账密错误".tr);
        }break;
        /// 授权失败
        case HTTPResponseCodeAuthorizationFailure:{
            JobsLog(@"授权失败");
            toastBy(@"授权失败".tr);
        }break;
        /// 限定时间内超过请求次数
        case HTTPResponseCodeLeakTime:{
            JobsLog(@"限定时间内超过请求次数");
            toastBy(@"限定时间内超过请求次数".tr);
        }break;
        /// 风险操作
        case HTTPResponseCodeRiskOperation:{
            JobsLog(@"风险操作");
            toastBy(@"风险操作".tr);
        }break;
        /// 未设置交易密码
        case HTTPResponseCodeNoSettingTransactionPassword:{
            JobsLog(@"未设置交易密码");
            toastBy(@"未设置交易密码".tr);
        }break;
        /// 账号已在其他设备登录
        case HTTPResponseCodeOffline:{
            JobsLog(@"账号已在其他设备登录");
            toastBy(@"账号已在其他设备登录".tr);
        }break;
        /// Token 过期：登录已过期，请重新登录
        case HTTPResponseCodeTokenExpire:{
            JobsLog(@"Token 过期");
//            self.tokenExpire();
            JobsLog(@"Token 过期");
            toastBy(@"Token 过期".tr);
        }break;
        /// 手机号码不存在
        case HTTPResponseCodePhoneNumberNotExist:{
            JobsLog(@"手机号码不存在");
            toastBy(@"手机号码不存在".tr);
        }break;
        /// 处理 HTTPResponseCodeAccountLocked 分支
        case HTTPResponseCodeAccountLocked:{
            JobsLog(@"账户被锁");
            toastBy(@"账户被锁，请联系系统管理员".tr);
        }break;
        /// 服务器返500可能会有很多其他的业务场景定义
        case HTTPResponseCodeNoOK:{
            if(actionBlock) actionBlock(responseCode);
        }break;
        /// 未匹配已知分支时执行兜底处理
        default:
            break;
    }
}
///【请求失败】请求失败的处理
-(JobsRetYTKBaseRequestByYTKBaseRequestBlock _Nonnull)jobsHandelFailure{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(YTKBaseRequest *request){
        @jobs_strongify(self)
        /// 解析+处理HTTPResponseCode
        JobsResponseModel *responseModel = JobsMapResponseModelBy(request);
        /// 打印请求体
        self.printURLSessionRequestMessage(request.requestTask);
        JobsLog(@"error = %@",request.error);
        JobsLog(@"responseModel = %@",responseModel);
        return request;
    };
}
/// 仅仅打印请求体：request.requestTask
-(jobsByYTKBaseRequestBlock _Nonnull)jobsHandelNoSuccess{
    @jobs_weakify(self)
    return ^(__kindof YTKBaseRequest *_Nonnull request){
        @jobs_strongify(self)
        JobsLog(@"%@",request.parameters);
        /// 打印请求体
        self.printURLSessionRequestMessage(request.requestTask);
    };
}

@end
